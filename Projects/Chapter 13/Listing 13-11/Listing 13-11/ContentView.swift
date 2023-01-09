
import SwiftUI
import MapKit

struct ContentView: View {
   @EnvironmentObject var appData: ApplicationData

   var body: some View {
      VStack {
         Button("My Location") {
            appData.manager.requestLocation()
         }.padding()
         Map(coordinateRegion: $appData.region, showsUserLocation: true)
            .ignoresSafeArea()
      }
      .onAppear {
         appData.manager.requestWhenInUseAuthorization()
      }
   }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView().environmentObject(ApplicationData())
   }
}

