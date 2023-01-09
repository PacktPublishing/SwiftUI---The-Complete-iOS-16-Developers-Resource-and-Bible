
import SwiftUI

struct ContentView: View {
   @AppStorage("interval") var interval = Date.timeIntervalSinceReferenceDate
   @State private var message: String = ""

   var body: some View {
      HStack {
         Text("\(message)")
            .lineLimit(nil)
      }.onAppear {
         let calendar = Calendar.current
         let lastDate = Date(timeIntervalSinceReferenceDate: interval)
         let components = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: lastDate, to: Date())
         message = "You haven't use this app in \(components.year!) years, \(components.month!) months, \(components.day!) days, \(components.hour!) hours, \(components.minute!) minutes, \(components.second!) seconds"
         interval = Date.timeIntervalSinceReferenceDate
      }
   }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView()
   }
}

