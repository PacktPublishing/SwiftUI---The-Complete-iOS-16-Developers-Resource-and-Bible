
import SwiftUI
import MapKit

struct ContentView: View {
   @EnvironmentObject var appData: ApplicationData

   var body: some View {
      VStack {
         Map(coordinateRegion: $appData.region)
            .ignoresSafeArea()
         HStack {
            Text(String(appData.region.center.latitude))
            Text(String(appData.region.center.longitude))
         }.padding(10)
         .font(.caption)
      }
   }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView().environmentObject(ApplicationData())
   }
}

