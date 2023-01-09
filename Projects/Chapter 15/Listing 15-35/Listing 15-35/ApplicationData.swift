
import SwiftUI
import CloudKit

struct Country {
   var name: String?
   var record: CKRecord
}
struct City {
   var name: String?
   var record: CKRecord
}
struct CountryViewModel: Identifiable {
   var id: CKRecord.ID
   var country: Country
    
   var countryName: String {
      return country.name ?? "Undefined"
   }
}
struct CityViewModel: Identifiable {
   let id: CKRecord.ID
   let city: City

   var cityName: String {
      return city.name ?? "Undefined"
   }
   var cityPicture: UIImage {
      if let asset = city.record["picture"] as? CKAsset, let fileURL = asset.fileURL {
         if let picture = UIImage(contentsOfFile: fileURL.path) {
            return picture
         }
      }
      return UIImage(named: "nopicture")!
   }
}
class ApplicationData: ObservableObject {
   @AppStorage("subscriptionSaved") var subscriptionSaved: Bool = false
   @AppStorage("zoneCreated") var zoneCreated: Bool = false
   @AppStorage("databaseToken") var databaseToken: Data = Data()
   @AppStorage("zoneToken") var zoneToken: Data = Data()

   @Published var listCountries: [CountryViewModel] = []
   @Published var listCities: [CityViewModel] = []
   var database: CKDatabase!

   static let shared = ApplicationData()

   private init() {
      let container = CKContainer.default()

// If the name of your container is different from the bundle, load the container by name
//      let container = CKContainer(identifier: "iCloud.ca.invid.AnotherTest")

      database = container.privateCloudDatabase
      
      Task(priority: .high) {
         await readCountries()
      }
   }
   func configureDatabase() async {
      if !subscriptionSaved {
         let newSubscription = CKDatabaseSubscription(subscriptionID: "updatesDatabase")
         let info = CKSubscription.NotificationInfo()
         info.shouldSendContentAvailable = true
         newSubscription.notificationInfo = info

         do {
            try await database.save(newSubscription)
            await MainActor.run {
               subscriptionSaved = true
            }
         } catch {
            print("Error: \(error)")
         }
      }
      if !zoneCreated {
         let newZone = CKRecordZone(zoneName: "listPlaces")
         do {
            try await database.save(newZone)
            await MainActor.run {
               zoneCreated = true
            }
         } catch {
            print("Error: \(error)")
         }
      }
   }
   func checkUpdates(finishClosure: @escaping (UIBackgroundFetchResult) -> Void) {
      Task(priority: .high) {
         await configureDatabase()
         downloadUpdates(finishClosure: finishClosure)
      }
   }
   func downloadUpdates(finishClosure: @escaping (UIBackgroundFetchResult) -> Void) {
      var changeToken: CKServerChangeToken!
      var changeZoneToken: CKServerChangeToken!
      if let token = try? NSKeyedUnarchiver.unarchivedObject(ofClass: CKServerChangeToken.self, from: databaseToken) {
         changeToken = token
      }
      if let token = try? NSKeyedUnarchiver.unarchivedObject(ofClass: CKServerChangeToken.self, from: zoneToken) {
         changeZoneToken = token
      }
      var zonesIDs: [CKRecordZone.ID] = []
      let operation = CKFetchDatabaseChangesOperation(previousServerChangeToken: changeToken)
      operation.recordZoneWithIDChangedBlock = { zoneID in
         zonesIDs.append(zoneID)
      }
      operation.changeTokenUpdatedBlock = { token in
         changeToken = token
      }
      operation.fetchDatabaseChangesResultBlock = { result in
         guard let values = try? result.get() else {
            finishClosure(UIBackgroundFetchResult.failed)
            return
         }
         if zonesIDs.isEmpty {
            finishClosure(UIBackgroundFetchResult.noData)
         } else {
            changeToken = values.serverChangeToken

            let configuration = CKFetchRecordZoneChangesOperation.ZoneConfiguration()
            configuration.previousServerChangeToken = changeZoneToken
            let fetchOperation = CKFetchRecordZoneChangesOperation(recordZoneIDs: zonesIDs, configurationsByRecordZoneID: [zonesIDs[0]: configuration])

            fetchOperation.recordWasChangedBlock = { recordID, result in
               guard let record = try? result.get() else {
                  print("Error")
                  return
               }
               if record.recordType == "Countries" {
                  Task(priority: .high) {
                     let index = self.listCountries.firstIndex(where: { item in
                        return item.id == record.recordID
                     })
                     await MainActor.run {
                        let newCountry = Country(name: record["name"], record: record)
                        let newItem = CountryViewModel(id: record.recordID, country: newCountry)
                        if index != nil {
                           self.listCountries[index!] = newItem
                        } else {
                           self.listCountries.append(newItem)
                        }
                        self.listCountries.sort(by: { $0.countryName < $1.countryName })
                     }
                  }
               }
            }
            fetchOperation.recordWithIDWasDeletedBlock = { recordID, recordType in
               if recordType == "Countries" {
                  Task(priority: .high) {
                     let index = self.listCountries.firstIndex(where: {(item) in
                        return item.id == recordID
                     })
                     await MainActor.run {
                        if index != nil {
                           self.listCountries.remove(at: index!)
                        }
                        self.listCountries.sort(by: { $0.countryName < $1.countryName })
                     }
                  }
               }
            }
            fetchOperation.recordZoneChangeTokensUpdatedBlock = { zoneID, token, data in
               changeZoneToken = token
            }
            fetchOperation.recordZoneFetchResultBlock = { zoneID, result in
               guard let values = try? result.get() else {
                  print("Error")
                  return
               }
               changeZoneToken = values.serverChangeToken
            }
            fetchOperation.fetchRecordZoneChangesResultBlock = { result in
               switch result {
                  case .failure(_):
                     finishClosure(UIBackgroundFetchResult.failed)
                     return
                  default:
                     break
               }
               if changeToken != nil {
                  if let data = try? NSKeyedArchiver.archivedData(withRootObject: changeToken!, requiringSecureCoding: false) {
                     Task(priority: .high) {
                        await MainActor.run {
                           self.databaseToken = data
                        }
                     }
                  }
               }
               if changeZoneToken != nil {
                  if let data = try? NSKeyedArchiver.archivedData(withRootObject: changeZoneToken!, requiringSecureCoding: false) {
                     Task(priority: .high) {
                        await MainActor.run {
                           self.zoneToken = data
                        }
                     }
                  }
               }
               finishClosure(UIBackgroundFetchResult.newData)
            }
            self.database.add(fetchOperation)
         }
      }
      database.add(operation)
   }
   func insertCountry(name: String) async {
      await configureDatabase()

      let text = name.trimmingCharacters(in: .whitespaces)
      if !text.isEmpty {
         let zone = CKRecordZone(zoneName: "listPlaces")
         let id = CKRecord.ID(recordName: "idcountry-\(UUID())", zoneID: zone.zoneID)
         let record = CKRecord(recordType: "Countries", recordID: id)
         record.setObject(text as NSString, forKey: "name")

         do {
            try await database.save(record)
            await MainActor.run {
               let newCountry = Country(name: record["name"], record: record)
               let newItem = CountryViewModel(id: record.recordID, country: newCountry)
               listCountries.append(newItem)
               listCountries.sort(by: { $0.countryName < $1.countryName })
            }
         } catch {
            print("Error: \(error)")
         }
      }
   }
   func insertCity(name: String, country: CKRecord.ID) async {
      await configureDatabase()

      let text = name.trimmingCharacters(in: .whitespaces)
      if !text.isEmpty {
         let zone = CKRecordZone(zoneName: "listPlaces")
         let id = CKRecord.ID(recordName: "idcity-\(UUID())", zoneID: zone.zoneID)
         let record = CKRecord(recordType: "Cities", recordID: id)
         record.setObject(text as NSString, forKey: "name")

         let reference = CKRecord.Reference(recordID: country, action: .deleteSelf)
         record.setObject(reference, forKey: "country")

         let bundle = Bundle.main
         if let fileURL = bundle.url(forResource: "Toronto", withExtension: "jpg") {
            let asset = CKAsset(fileURL: fileURL)
            record.setObject(asset, forKey: "picture")
         }
         do {
            try await database.save(record)
            await MainActor.run {
               let newCity = City(name: record["name"], record: record)
               let newItem = CityViewModel(id: record.recordID, city: newCity)
               listCities.append(newItem)
               listCities.sort(by: { $0.cityName < $1.cityName })
            }
         } catch {
            print("Error: \(error)")
         }
      }
   }
   func readCountries() async {
      let predicate = NSPredicate(format: "TRUEPREDICATE")
      let query = CKQuery(recordType: "Countries", predicate: predicate)

      do {
         let list = try await database.records(matching: query, inZoneWith: nil, desiredKeys: nil, resultsLimit: 0)

         await MainActor.run {
            listCountries = []
            for (_, result) in list.matchResults {
               if let record = try? result.get() {
                  let newCountry = Country(name: record["name"], record: record)
                  let newItem = CountryViewModel(id: record.recordID, country: newCountry)
                  listCountries.append(newItem)
               }
            }
            listCountries.sort(by: { $0.countryName < $1.countryName })
         }
      } catch {
         print("Error: \(error)")
      }
   }
   func readCities(country: CKRecord.ID) async {
      let predicate = NSPredicate(format: "country = %@", country)
      let query = CKQuery(recordType: "Cities", predicate: predicate)

      do {
         let list = try await database.records(matching: query, inZoneWith: nil, desiredKeys: nil, resultsLimit: 0)

         await MainActor.run {
            listCities = []
            for (_, result) in list.matchResults {
               if let record = try? result.get() {
                  let newCity = City(name: record["name"], record: record)
                  let newItem = CityViewModel(id: record.recordID, city: newCity)
                  listCities.append(newItem)
               }
            }
            listCities.sort(by: { $0.cityName < $1.cityName })
         }
      } catch {
         print("Error: \(error)")
      }
   }
}

