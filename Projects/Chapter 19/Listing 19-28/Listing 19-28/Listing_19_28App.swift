
import SwiftUI

@main
struct Listing_19_28App: App {
   @AppStorage("totalItems") var totalItems: Int = 0
   
   var body: some Scene {
      WindowGroup {
         ContentView()
      }
      Settings {
         HStack {
            Stepper("Total Items", value: $totalItems)
            Text(String(totalItems))
               .font(.title.bold())
         }.frame(width: 200, height: 150)
      }
   }
}

