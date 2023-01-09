
import SwiftUI

struct ContentView: View {
   @State private var selectedDate: Date = Date()

   var body: some View {
      VStack {
         Text("Date: \(selectedDate.formatted(.dateTime.day().month()))")
         DatePicker("Date:", selection: $selectedDate, displayedComponents: .date)
            .labelsHidden()
            .datePickerStyle(.wheel)
         Spacer()
      }.padding()
   }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView()
   }
}

