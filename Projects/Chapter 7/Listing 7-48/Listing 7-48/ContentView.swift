
import SwiftUI

struct ContentView: View {
   @State private var selectedDate: Date = Date()

   var body: some View {
      VStack {
         DatePicker("Date:", selection: $selectedDate, in: Date()..., displayedComponents: .date)
         Spacer()
      }.padding()
   }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView()
   }
}

