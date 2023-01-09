
import SwiftUI
import MapKit

class ApplicationData: ObservableObject {
   @Published var region: MKCoordinateRegion

   init() {
      let coordinates = CLLocationCoordinate2D(latitude: 40.7637825011971, longitude: -73.9731328627541)
      region = MKCoordinateRegion(center: coordinates, latitudinalMeters: 1000, longitudinalMeters: 1000)
   }
}

