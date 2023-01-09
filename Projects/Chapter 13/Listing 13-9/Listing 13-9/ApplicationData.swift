
import SwiftUI
import MapKit

struct PlaceAnnotation: Identifiable {
   let id = UUID()
   var selected: Bool = false
   var name: String
   var location: CLLocationCoordinate2D

   init(name: String, location: CLLocationCoordinate2D) {
      self.name = name
      self.location = location
   }
}
class ApplicationData: ObservableObject {
   @Published var region: MKCoordinateRegion
   @Published var annotations: [PlaceAnnotation] = []

   init() {
      let coordinates = CLLocationCoordinate2D(latitude: 40.7637825011971, longitude: -73.9731328627541)
      region = MKCoordinateRegion(center: coordinates, latitudinalMeters: 1000, longitudinalMeters: 1000)

      let location = CLLocationCoordinate2D(latitude: 40.7637825011971, longitude: -73.9731328627541)
      annotations.append(PlaceAnnotation(name: "Apple Store", location: location))
   }
}

