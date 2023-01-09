
import SwiftUI

struct File: Identifiable {
   let id: UUID = UUID()
   var name: String
}
class ApplicationData: ObservableObject {
   @Published var listOfFiles: [File] = []

   var manager: FileManager
   var docURL: URL

   init() {
      manager = FileManager.default
      let documents = manager.urls(for: .documentDirectory, in: .userDomainMask)
      docURL = documents.first!

      if let list = try? manager.contentsOfDirectory(atPath: docURL.path) {
         for name in list {
            let newFile = File(name: name)
            listOfFiles.append(newFile)
         }
      }
   }
   func saveFile(name: String) {
      let newFileURL = docURL.appendingPathComponent(name)
      let path = newFileURL.path
      manager.createFile(atPath: path, contents: nil, attributes: nil)
      if !listOfFiles.contains(where: { $0.name == name}) {
         listOfFiles.append(File(name: name))
      }
   }
}

