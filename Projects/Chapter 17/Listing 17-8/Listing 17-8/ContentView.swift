
import SwiftUI

struct ContentView: View {
   @State private var searchURL: URL = URL(string: "https://www.formasterminds.com")!
   @State private var openSheet: Bool = false
   @State private var disableButton: Bool = false

   var body: some View {
      VStack {
         Button("Open Browser") {
            openSheet = true
         }.buttonStyle(.borderedProminent)
         .disabled(disableButton)
         Spacer()
      }.padding()
      .sheet(isPresented: $openSheet) {
         SafariBrowser(disable: $disableButton, searchURL: $searchURL)
      }
   }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
        ContentView()
    }
}
