
import SwiftUI

struct ContentView: View {
   @State private var selectedDates: Set<DateComponents> = []
   @State private var mydates: String = ""

   var body: some View {
      VStack {
         MultiDatePicker("Dates:", selection: $selectedDates)
         Spacer()
         Text(mydates)
      }.padding()
      .onChange(of: selectedDates) { values in
         let days = values.map({ value in String(value.day!) })
         mydates = days.joined(separator: ",")
      }
   }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView()
   }
}

