
import SwiftUI

class ApplicationData: ObservableObject {
   @Published var textInFile: String = "" {
      didSet {
         if let textData = textInFile.data(using: .utf8, allowLossyConversion: true) {
            let fileURL = docURL.appendingPathComponent("textdata.dat")
            let filePath = fileURL.path
            manager.createFile(atPath: filePath, contents: textData, attributes: nil)
         }
      }
   }
   var manager: FileManager
   var docURL: URL

   init() {
      manager = FileManager.default
      docURL = manager.urls(for: .documentDirectory, in: .userDomainMask).first!

      let fileURL = docURL.appendingPathComponent("textdata.dat")
      let filePath = fileURL.path
      if manager.fileExists(atPath: filePath) {
         if let content = manager.contents(atPath: filePath) {
            if let text = String(data: content, encoding: .utf8) {
               textInFile = text
            }
         }
      }
   }
}

