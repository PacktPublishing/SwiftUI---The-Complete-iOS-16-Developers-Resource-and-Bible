
import SwiftUI

class MyDocument: UIDocument {
   var fileContent: Data?

   override func contents(forType typeName: String) throws -> Any {
      return fileContent ?? Data()
   }
   override func load(fromContents contents: Any, ofType typeName: String?) throws {
      if let data = contents as? Data, !data.isEmpty {
         fileContent = data
      }
   }
}

