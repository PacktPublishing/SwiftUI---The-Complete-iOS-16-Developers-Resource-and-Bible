
import SwiftUI
import AVKit

struct ContentView: View {
   @EnvironmentObject var appData: ApplicationData

   var body: some View {
      if appData.player != nil {
         VideoPlayer(player: appData.player)
            .ignoresSafeArea()
      } else {
         Text("Video not available")
      }
   }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView().environmentObject(ApplicationData())
   }
}

