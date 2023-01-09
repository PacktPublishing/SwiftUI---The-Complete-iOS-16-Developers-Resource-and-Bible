
import SwiftUI

struct ContentView: View {
   @State private var title: String = "Default Title"
   @State private var titleInput: String = ""

   var body: some View {
      VStack(spacing: 15) {
         Text(title)
            .lineLimit(1)
            .padding()
            .background(Color.yellow)
         TextField("Insert Title", text: $titleInput)
            .textFieldStyle(.roundedBorder)
            .textInputAutocapitalization(.words)
         Button("Save") {
            title = titleInput
            titleInput = ""
         }
         Spacer()
      }.padding()
   }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView()
   }
}

