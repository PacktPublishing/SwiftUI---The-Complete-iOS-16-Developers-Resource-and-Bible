
import SwiftUI

struct ContentView: View {
   @State private var pass: String = ""

   var body: some View {
      VStack(spacing: 15) {
         Text(pass)
            .padding()
         SecureField("Insert Password", text: $pass)
            .textFieldStyle(.roundedBorder)
         Spacer()
      }.padding()
   }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView()
   }
}

