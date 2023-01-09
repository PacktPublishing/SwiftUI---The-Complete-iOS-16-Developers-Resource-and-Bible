
import SwiftUI

struct SettingsView: View {
   @EnvironmentObject var appData: ApplicationData

   var body: some View {
      Form {
         Section(header: Text("Settings"), footer: Text("Select what you want to see")) {
            Toggle("Show Pictures", isOn: $appData.showPictures)
            Toggle("Show Year", isOn: $appData.showYear)
         }
      }
   }
}
struct SettingsView_Previews: PreviewProvider {
   static var previews: some View {
      SettingsView()
         .environmentObject(ApplicationData())
   }
}

