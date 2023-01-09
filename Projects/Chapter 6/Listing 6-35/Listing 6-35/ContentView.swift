
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
            .submitLabel(.continue)
            .onSubmit {
               assignTitle()
            }
        HStack {
            Spacer()
            Button("Save") {
               assignTitle()
            }
         }
         Spacer()
      }.padding()
   }
   func assignTitle() {
      title = titleInput
      titleInput = ""
   }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView()
   }
}

