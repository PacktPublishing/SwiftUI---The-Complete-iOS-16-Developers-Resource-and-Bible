
import SwiftUI

struct ContentView: View {
   @EnvironmentObject var appData: ApplicationData
   @State private var openSheet: Bool = false

   var body: some View {
      NavigationStack {
         VStack(alignment: .leading) {
            Text("Title: \(appData.bookInFile.title)")
            Text("Author: \(appData.bookInFile.author)")
            Text("Year: \(appData.bookInFile.year)")
            Image(uiImage: appData.bookInFile.cover)
               .resizable()
               .scaledToFit()
         }.padding()
         .frame(minWidth: 0, maxWidth: .infinity)
         .navigationBarTitle("Book")
         .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
               Button(action: {
                  openSheet = true
               }, label: {
                  Image(systemName: "plus")
               })
            }
         }
         .sheet(isPresented: $openSheet) {
            InsertBookView()
         }
      }
   }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView().environmentObject(ApplicationData())
   }
}

