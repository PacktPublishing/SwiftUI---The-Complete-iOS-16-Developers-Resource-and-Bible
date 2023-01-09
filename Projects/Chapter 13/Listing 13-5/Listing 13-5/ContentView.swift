
import SwiftUI
import MapKit

struct ContentView: View {
   @EnvironmentObject var appData: ApplicationData

   var body: some View {
      Map(coordinateRegion: $appData.region, annotationItems: appData.annotations, annotationContent: { place in
         MapMarker(coordinate: place.location, tint: .red)
      })
      .ignoresSafeArea()
   }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView().environmentObject(ApplicationData())
   }
}

