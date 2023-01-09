
import SwiftUI

struct ContentView: View {
   @State private var selectedDate: Date = Date()

   var body: some View {
      VStack {
         DatePicker("Date:", selection: $selectedDate)
         Spacer()
      }.padding()
   }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView()
   }
}

