
import SwiftUI

struct ContentView: View {
   @State private var myquote: String = "Undefined"

   var body: some View {
      VStack {
         Text(myquote)
            .padding()
         Spacer()
      }
      .onAppear {
         let manager = FileManager.default
         let documents = manager.urls(for: .documentDirectory, in: .userDomainMask)
         let docURL = documents.first!

         let fileURL = docURL.appendingPathComponent("quotes.dat")
         let filePath = fileURL.path
         if manager.fileExists(atPath: filePath) {
            if let content = manager.contents(atPath: filePath) {
               if let result = try? NSKeyedUnarchiver.unarchivedObject(ofClass: NSString.self, from: content) as String? {
                  myquote = result
               }
            }
         } else {
            let quote = "Fiction is the truth inside the lie"
            if let fileData = try? NSKeyedArchiver.archivedData(withRootObject: quote, requiringSecureCoding: false) {
               manager.createFile(atPath: filePath, contents: fileData, attributes: nil)
            }
         }
      }
   }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView()
   }
}

