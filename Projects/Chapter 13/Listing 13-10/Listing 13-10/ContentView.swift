
import SwiftUI
import MapKit

struct ContentView: View {
   @EnvironmentObject var appData: ApplicationData

   var body: some View {
      Map(coordinateRegion: $appData.region, annotationItems: appData.annotations, annotationContent: { place in
         MapAnnotation(coordinate: place.location) {
            VStack(spacing: 0) {
               Image("iconmap")
                  .resizable()
                  .frame(width: 40, height: 40)
               Text(place.name)
                  .font(.caption)
                  .padding(3)
                  .background(RoundedRectangle(cornerRadius: 4).foregroundStyle(.thickMaterial))
            }
         }
      }).ignoresSafeArea()
      .task(priority: .background) {
         await setAnnotations()
      }
   }
   func setAnnotations() async {
      let request = MKLocalSearch.Request()
      request.naturalLanguageQuery = "Pizza"
      request.region = appData.region

      let search = MKLocalSearch(request: request)
      if let results = try? await search.start() {
         let items = results.mapItems

         await MainActor.run {
            appData.annotations = []
            for item in items {
               if let location = item.placemark.location?.coordinate {
                  let place = PlaceAnnotation(name: item.name ?? "Undefined", location: location)
                  appData.annotations.append(place)
               }
            }
         }
      }
   }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView().environmentObject(ApplicationData())
   }
}

