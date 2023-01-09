
import SwiftUI

class ContentData: ObservableObject {
   @Published var inputURL: String = ""
   @Published var backDisabled: Bool = true
   @Published var forwardDisabled: Bool = true
}
struct ContentView: View {
   @ObservedObject var contentData = ContentData()
   var webView: WebView!
    
   init() {
      webView = WebView(inputURL: $contentData.inputURL, backDisabled: $contentData.backDisabled, forwardDisabled: $contentData.forwardDisabled)
   }
   var body: some View {
      VStack {
         HStack {
            TextField("Insert URL", text: $contentData.inputURL)
            Button("Load") {
               let text = contentData.inputURL.trimmingCharacters(in: .whitespaces)
               if !text.isEmpty {
                  webView.loadWeb(web: text)
               }
            }
         }.padding(5)

         HStack {
            Button(action: {
               webView.goBack()
            }, label: {
               Image(systemName: "arrow.left.circle")
                  .font(.title)
            }).disabled(contentData.backDisabled)
            Button(action: {
               webView.goForward()
            }, label: {
               Image(systemName: "arrow.right.circle")
                  .font(.title)
            }).disabled(contentData.forwardDisabled)
            Spacer()
            Button(action: {
               webView.refresh()
            }, label: {
               Image(systemName: "arrow.clockwise.circle")
                  .font(.title)
            })
         }.padding(5)
         webView
      }
   }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView()
   }
}

