
import SwiftUI

struct ContentView: View {
   @EnvironmentObject var appData: ApplicationData

   var body: some View {
      NavigationStack {
         VStack {
            HStack {
               Text("Total Books:")
               Text("\(appData.total)")
                  .font(.largeTitle)
            }
            Spacer()
         }.padding()
         .navigationTitle("Books")
         .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
               NavigationLink("Add Book", destination: {
                  AddBook()
               })
            }
         }
      }
   }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView().environmentObject(ApplicationData())
   }
}

