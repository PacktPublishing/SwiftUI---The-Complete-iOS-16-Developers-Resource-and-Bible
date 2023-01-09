
import SwiftUI

struct ContentView: View {
   let listCities: [String] = ["Paris", "Toronto", "Dublin"]

   var body: some View {
      VStack {
         ForEach(listCities, id: \.self) { value in
            VStack {
               Text(value)
               Divider()
            }
         }
         Spacer()
      }
   }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView()
   }
}

