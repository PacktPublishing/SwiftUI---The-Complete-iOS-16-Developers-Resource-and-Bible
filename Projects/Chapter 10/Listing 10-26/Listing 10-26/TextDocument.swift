
import SwiftUI
import UniformTypeIdentifiers

struct TextDocument: FileDocument {
   static var readableContentTypes: [UTType] = [.plainText]

   var documentText: String
   init() {
      documentText = ""
   }
   init(configuration: ReadConfiguration) throws {
      if let data = configuration.file.regularFileContents {
         if let text = String(data: data, encoding: .utf8) {
            documentText = text
         } else {
            throw CocoaError(.fileReadCorruptFile)
         }
      } else {
         throw CocoaError(.fileReadCorruptFile)
      }
   }
   func fileWrapper(configuration: WriteConfiguration) throws -> FileWrapper {
      let data = documentText.data(using: .utf8)
      let wrapper = FileWrapper(regularFileWithContents: data!)
      return wrapper
   }
}

