
import SwiftUI
import MapKit

struct ContentView: View {
   @EnvironmentObject var appData: ApplicationData

   var body: some View {
      Map(coordinateRegion: $appData.region, annotationItems: appData.annotations, annotationContent: { place in
         MapAnnotation(coordinate: place.location) {
            Circle()
               .fill(Color.blue)
               .frame(width: 40, height: 40)
         }
      }).ignoresSafeArea()
   }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView().environmentObject(ApplicationData())
   }
}

