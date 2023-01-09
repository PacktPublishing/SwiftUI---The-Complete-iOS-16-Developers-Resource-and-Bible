
import SwiftUI
import MapKit

class ApplicationData: NSObject, ObservableObject, CLLocationManagerDelegate {
   @Published var region: MKCoordinateRegion = MKCoordinateRegion()
   let manager = CLLocationManager()

   override init() {
      super.init()
      manager.delegate = self
      manager.desiredAccuracy = 100
   }
   func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
      if let coordinates = locations.first?.coordinate {
         region = MKCoordinateRegion(center: coordinates, latitudinalMeters: 1000, longitudinalMeters: 1000)
      }
   }
   func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
      print("Error")
   }
}

