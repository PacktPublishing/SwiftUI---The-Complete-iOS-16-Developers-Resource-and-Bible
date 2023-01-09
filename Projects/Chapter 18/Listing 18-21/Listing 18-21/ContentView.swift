
import SwiftUI
import AVKit

struct ContentView: View {
   @EnvironmentObject var appData: ApplicationData

   var body: some View {
      if appData.player != nil {
         VideoPlayer(player: appData.player, videoOverlay: {
            VStack {
               Text("Title: Trees at the park")
                  .font(.title)
                  .padding([.top, .bottom], 8)
                  .padding([.leading, .trailing], 16)
                  .foregroundColor(.black)
                  .background(.ultraThinMaterial)
                  .cornerRadius(10)
                  .padding(.top, 8)
               Spacer()
            }
         })
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

