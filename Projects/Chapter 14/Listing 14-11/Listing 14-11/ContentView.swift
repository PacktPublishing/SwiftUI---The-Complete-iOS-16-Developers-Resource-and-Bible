
import SwiftUI

struct ContentView: View {
   @EnvironmentObject var appData: ApplicationData

   var body: some View {
      Group {
         if !appData.isLandscape {
            VStack(spacing: 0) {
               HeaderView(isCompact: true)
               BodyView()
            }
         } else {
            HStack(spacing: 0) {
               HeaderView(isCompact: false)
               BodyView()
            }
         }
      }.ignoresSafeArea()
      .onAppear {
         let device = UIDevice.current
         device.beginGeneratingDeviceOrientationNotifications()
      }
      .onDisappear {
         let device = UIDevice.current
         device.endGeneratingDeviceOrientationNotifications()
      }
   }
}
struct HeaderView: View {
   let isCompact: Bool

   var body: some View {
      Text("Food Menu")
         .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: isCompact ? 150 : .infinity)
         .background(Color.yellow)
   }
}
struct BodyView: View {
   var body: some View {
      Text("Content Title")
         .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
         .background(Color.gray)
   }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView().environmentObject(ApplicationData())
   }
}

