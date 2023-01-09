
import SwiftUI

class ApplicationData: ObservableObject {
   func saveFile(name: String) {
      let manager = FileManager.default
      let documents = manager.urls(for: .documentDirectory, in: .userDomainMask)
      let docURL = documents.first!

      let newFileURL = docURL.appendingPathComponent(name)
      let path = newFileURL.path
      manager.createFile(atPath: path, contents: nil, attributes: nil)
   }
}

