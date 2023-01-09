
import SwiftUI

class ApplicationData: ObservableObject {
   @Published var textInFile: String = ""

   init() {
      let manager = FileManager.default
      let bundle = Bundle.main
      if let path = bundle.path(forResource: "quote", ofType: "txt") {
         if let data = manager.contents(atPath: path) {
            if let message = String(data: data, encoding: .utf8) {
               textInFile = message
            }
         }
      } else {
         textInFile = "File Not Found"
      }
   }
}

