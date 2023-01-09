
import SwiftUI

struct SettingsView: View {
   @Environment(\.dismiss) var dismiss
   @State private var showPictures: Bool = true
   @State private var showYear: Bool = true

   var body: some View {
      Form {
         Toggle("Show Pictures", isOn: $showPictures)
         Toggle("Show Year", isOn: $showYear)
      }.navigationTitle("Settings")
      .navigationBarBackButtonHidden(true)
      .toolbar {
         ToolbarItem(placement: .navigationBarLeading) {
            Button("Go Back") {
               dismiss()
            }
         }
      }
   }
}
struct SettingsView_Previews: PreviewProvider {
   static var previews: some View {
      NavigationStack {
         SettingsView()
      }
   }
}

