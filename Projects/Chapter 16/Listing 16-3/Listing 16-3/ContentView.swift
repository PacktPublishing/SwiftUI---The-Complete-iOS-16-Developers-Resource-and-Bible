
import SwiftUI

struct ContentView: View {
   @State private var inputText: String = "Initial text"

   var body: some View {
      VStack {
         HStack {
            Text(inputText)
            Spacer()
            Button("Clear") {
               inputText = ""
            }
         }
         TextView(input: $inputText)
      }.padding()
   }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView()
   }
}

