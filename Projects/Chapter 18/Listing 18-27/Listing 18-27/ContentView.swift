
import SwiftUI

struct ContentView: View {
   @EnvironmentObject var appData: ApplicationData
   
   var body: some View {
      ZStack {
         appData.customVideoView
            .ignoresSafeArea()
         VStack {
            Spacer()
            HStack {
               Button(appData.playing ? "Pause" : "Play") {
                  appData.playVideo()
               }.frame(width: 70)
               .foregroundColor(.black)
               GeometryReader { geometry in
                  HStack {
                     Rectangle()
                        .fill(Color(red: 0, green: 0.4, blue: 0.8, opacity: 0.8))
                        .frame(width: geometry.size.width * appData.progress, height: 20)
                     Spacer()
                  }
               }.padding(.top, 15)
            }
            .padding([.leading, .trailing])
            .frame(height: 50)
            .background(Color(red: 0.9, green: 0.9, blue: 0.9, opacity: 0.8))
         }
      }
   }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView().environmentObject(ApplicationData())
   }
}

