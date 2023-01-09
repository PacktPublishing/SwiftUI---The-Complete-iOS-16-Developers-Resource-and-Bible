
import SwiftUI

struct ContentView: View {
   @EnvironmentObject var appData: ApplicationData

   var body: some View {
      NavigationStack(path: $appData.path) {
         VStack {
            HStack {
               Spacer()
               NavigationLink("Take Picture", value: "Open Camera")
            }
            .navigationDestination(for: String.self, destination: { _ in
               CustomCameraView()
            })
            Image(uiImage: appData.picture ?? UIImage(named: "nopicture")!)
               .resizable()
               .scaledToFit()
               .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
               .clipped()
            Spacer()
         }.padding()
         .navigationBarHidden(true)
      }.statusBar(hidden: true)
   }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView().environmentObject(ApplicationData())
   }
}

