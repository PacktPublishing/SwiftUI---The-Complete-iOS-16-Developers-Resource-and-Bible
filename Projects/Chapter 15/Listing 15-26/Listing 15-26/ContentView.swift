
import SwiftUI

struct ContentView: View {
   @EnvironmentObject var appData: ApplicationData
   @State private var openSheet: Bool = false

   var body: some View {
      NavigationStack {
         List {
            ForEach(appData.listCountries) { country in
               NavigationLink(destination: ShowCitiesView(selectedCountry: country)) {
                  Text(country.countryName)
               }
            }
         }
         .navigationBarTitle("Countries")
         .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
               Button("Add Country") {
                  openSheet = true
               }
            }
         }
         .sheet(isPresented: $openSheet) {
            InsertCountryView()
         }
      }
   }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView().environmentObject(ApplicationData())
   }
}

