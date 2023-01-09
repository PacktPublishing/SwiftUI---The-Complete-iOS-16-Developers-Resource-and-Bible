
import SwiftUI

struct ContentView: View {
   var body: some View {
      Text("Hello World")
         .font(.largeTitle)
         .padding(20)
         .background(Color.gray)
         .cornerRadius(20)
         .overlay(
            Color(red: 1, green: 1, blue: 0.3, opacity: 0.2)
               .frame(width: 160, height: 40)
         )
   }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView()
   }
}

