
import SwiftUI

@main
struct Listing_10_26App: App {
   var body: some Scene {
      DocumentGroup(newDocument: TextDocument(), editor: { config in
         ContentView(document: config.$document)
      })
   }
}

