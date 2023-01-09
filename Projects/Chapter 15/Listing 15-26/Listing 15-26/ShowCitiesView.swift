
import SwiftUI
import CloudKit

struct ShowCitiesView: View {
   @EnvironmentObject var appData: ApplicationData
   @State private var openSheet: Bool = false
   let selectedCountry: CountryViewModel

   var body: some View {
      VStack {
         List {
            ForEach(appData.listCities) { city in
               Text(city.cityName)
            }
         }
      }
      .navigationBarTitle(selectedCountry.countryName)
      .toolbar {
         ToolbarItem(placement: .navigationBarTrailing) {
            Button("Add City") {
               openSheet = true
            }
         }
      }
      .sheet(isPresented: $openSheet) {
         InsertCityView(country: selectedCountry.id)
      }
      .task {
         await appData.readCities(country: selectedCountry.id)
      }
   }
}
struct ShowCitiesView_Previews: PreviewProvider {
   static var previews: some View {
      ShowCitiesView(selectedCountry: CountryViewModel(id: CKRecord.ID(recordName: "Test"), country: Country(name: "Test", record: CKRecord(recordType: "Cities", recordID: CKRecord.ID(recordName: "Test")))))
         .environmentObject(ApplicationData())
   }
}

