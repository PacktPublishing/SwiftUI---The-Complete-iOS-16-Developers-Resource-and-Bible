
import SwiftUI

extension VerticalAlignment {
   enum BusAlignment: AlignmentID {
      static func defaultValue(in dimension: ViewDimensions) -> CGFloat {
         return dimension[VerticalAlignment.center]
      }
   }
   static let alignBus = VerticalAlignment(BusAlignment.self)
}
struct ContentView: View {
   var body: some View {
      HStack(alignment: .alignBus) {
         VStack {
            Image("signbus")
         }
         VStack(alignment: .leading) {
            Text("Transportation")
            Text("Bus")
               .font(.largeTitle)
         }
      }.border(Color.blue, width: 2)
   }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView()
   }
}

