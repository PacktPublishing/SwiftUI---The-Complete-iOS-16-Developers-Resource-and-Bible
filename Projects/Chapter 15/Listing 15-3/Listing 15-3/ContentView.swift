
import SwiftUI

struct ContentView: View {
   @EnvironmentObject var appData: ApplicationData
   @State private var openSheet: Bool = false

   var body: some View {
      NavigationStack {
         VStack {
            HStack {
               Text("Name:")
               Text(appData.userInfo.name)
               Spacer()
            }
            HStack {
               Text("Address:")
               Text(appData.userInfo.address)
               Spacer()
            }
            HStack {
               Text("City:")
               Text(appData.userInfo.city)
               Spacer()
            }
            Spacer()
         }.padding()
         .navigationBarTitle("Personal Info")
         .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
               Button("Change") {
                  openSheet = true
               }
            }
         }
         .sheet(isPresented: $openSheet) {
            InsertInfoView(openSheet: $openSheet)
         }
         .task {
            await appData.valueReceived()
         }
      }
   }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView().environmentObject(ApplicationData())
   }
}
