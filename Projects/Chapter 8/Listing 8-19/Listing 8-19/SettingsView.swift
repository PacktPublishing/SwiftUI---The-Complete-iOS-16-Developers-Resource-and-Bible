
import SwiftUI

struct SettingsView: View {
   @State private var showPictures: Bool = true
   @State private var showYear: Bool = true
   
   var body: some View {
      Form {
         Toggle("Show Pictures", isOn: $showPictures)
         Toggle("Show Year", isOn: $showYear)
      }.navigationTitle("Settings")
   }
}
struct SettingsView_Previews: PreviewProvider {
   static var previews: some View {
      NavigationStack {
         SettingsView()
      }
   }
}

