
import SwiftUI
import MapKit
import CoreLocationUI

struct ContentView: View {
   @EnvironmentObject var appData: ApplicationData

   var body: some View {
      VStack {
         LocationButton(.currentLocation) {
            appData.manager.requestLocation()
         }.padding()
         Map(coordinateRegion: $appData.region, showsUserLocation: true)
            .ignoresSafeArea()
      }
   }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView().environmentObject(ApplicationData())
   }
}

