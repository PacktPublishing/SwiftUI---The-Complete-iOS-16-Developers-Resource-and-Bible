
import SwiftUI

struct ContentView: View {
   @State private var selectedValue: String = "No Value"
   let listCities: [String] = ["Paris", "Toronto", "Dublin"]

   var body: some View {
      VStack {
         Text(selectedValue)
         Picker("Cities:", selection: $selectedValue) {
            ForEach(listCities, id: \.self) { value in
               Text(value)
            }
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

