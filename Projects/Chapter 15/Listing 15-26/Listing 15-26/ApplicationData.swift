
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
   var id: CKRecord.ID
   var city: City
    
   var cityName: String {
      return city.name ?? "Undefined"
   }
}
class ApplicationData: ObservableObject {
   @Published var listCountries: [CountryViewModel] = []
   @Published var listCities: [CityViewModel] = []
   var database: CKDatabase!

   init() {
      let container = CKContainer.default()

// If the name of your container is different from the bundle, load the container by name
//      let container = CKContainer(identifier: "iCloud.ca.invid.AnotherTest")
      
      database = container.privateCloudDatabase
      
      Task(priority: .high) {
         await readCountries()
      }
   }
   func insertCountry(name: String) async {
      let id = CKRecord.ID(recordName: "idcountry-\(UUID())")
      let record = CKRecord(recordType: "Countries", recordID: id)
      record.setObject(name as NSString, forKey: "name")

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
   func insertCity(name: String, country: CKRecord.ID) async {
      let id = CKRecord.ID(recordName: "idcity-\(UUID())")
      let record = CKRecord(recordType: "Cities", recordID: id)
      record.setObject(name as NSString, forKey: "name")

      let reference = CKRecord.Reference(recordID: country, action: .deleteSelf)
      record.setObject(reference, forKey: "country")

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

