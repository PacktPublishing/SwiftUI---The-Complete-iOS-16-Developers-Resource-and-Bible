
import SwiftUI
import CoreData

struct ContentView: View {
   @Environment(\.managedObjectContext) var dbContext
   @FetchRequest(sortDescriptors: [SortDescriptor(\Countries.name, order: .forward)]) var listCountries: FetchedResults<Countries>
   @State private var openSheet: Bool = false

   var body: some View {
      NavigationStack {
         List {
            ForEach(listCountries) { country in
               NavigationLink(destination: ShowCitiesView(selectedCountry: country)) {
                  Text(country.name ?? "Undefined")
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
      ContentView()
         .environment(\.managedObjectContext, ApplicationData.preview.container.viewContext)
   }
}

