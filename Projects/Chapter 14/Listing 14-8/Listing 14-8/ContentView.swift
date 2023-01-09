
import SwiftUI

struct ContentView: View {
   @FocusState var focusTitle: Bool
   @State private var inputTitle: String = ""

   var body: some View {
      ScrollView {
         VStack {
            Image("spot1")
               .resizable()
               .scaledToFit()
            HStack {
               TextField("Insert Title", text: $inputTitle)
                  .textFieldStyle(.roundedBorder)
                  .focused($focusTitle)
               Button("Save") {
                  focusTitle = false
               }
            }
            Spacer()
         }.padding()
      }
   }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView()
   }
}

