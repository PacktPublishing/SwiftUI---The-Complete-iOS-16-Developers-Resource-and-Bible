
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
               .alignmentGuide(.alignBus) { dimension in dimension[VerticalAlignment.center] - 40 }
            }
            VStack(alignment: .leading) {
               Text("Transportation")
               Text("Bus")
                  .font(.largeTitle)
                  .alignmentGuide(.alignBus) { dimension in dimension[VerticalAlignment.center] }
         }
      }.border(Color.blue, width: 2)
   }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView()
   }
}

