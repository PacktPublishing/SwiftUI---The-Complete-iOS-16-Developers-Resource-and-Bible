
import SwiftUI

struct ContentView: View {
   @EnvironmentObject var appData: ApplicationData

   var body: some View {
      NavigationStack {
         List(appData.userData) { book in
            VStack {
               HStack(alignment: .top) {
                  if appData.showCover {
                     Image(book.cover)
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(appData.cornerSize)
                        .frame(width: 80, height: 100)
                  }
                  VStack(alignment: .leading, spacing: 2) {
                     Text(book.title).bold()
                     Text(book.author)
                     if appData.showYear {
                        Text(book.year).font(.caption)
                     }
                  }.padding(.top, 5)
                  Spacer()
               }.padding([.leading, .trailing], 10)
               .padding([.top, .bottom], 5)
            }
         }
         .navigationBarTitle("Books")
         .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
               NavigationLink("Settings", destination: {
                  SettingsView()
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

