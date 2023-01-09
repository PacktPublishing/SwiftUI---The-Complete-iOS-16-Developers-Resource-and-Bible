
import SwiftUI

@main
struct Listing_10_31App: App {
   @StateObject var appData = ApplicationData()

   var body: some Scene {
      WindowGroup {
         ContentView()
            .environmentObject(appData)
            .fileExporter(isPresented: $appData.openExporter, document: appData.document, contentType: .plainText, defaultFilename: appData.selectedFile.name, onCompletion: { result in
               print("Document saved")
            })
      }
   }
}

