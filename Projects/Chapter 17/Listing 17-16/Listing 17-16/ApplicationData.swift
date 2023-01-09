
import SwiftUI

class ApplicationData: ObservableObject {
   @Published var webContent: String = ""
   @Published var buttonDisabled: Bool = false

   func loadWeb() async {
      buttonDisabled = true

      let session = URLSession.shared
      let webURL = URL(string: "https://www.yahoo.com")
      do {
         let (data, response) = try await session.data(from: webURL!)
         if let resp = response as? HTTPURLResponse {
            let status = resp.statusCode
            if status == 200 {
               if let content = String(data: data, encoding: String.Encoding.ascii) {
                  await MainActor.run {
                     webContent = content
                     buttonDisabled = false
                  }
                  print(content)
               }
            } else {
               print("Error: \(status)")
            }
         }
      } catch {
         print("Error: \(error)")
      }
   }
}

