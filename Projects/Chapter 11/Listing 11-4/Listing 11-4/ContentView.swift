
import SwiftUI

struct ContentView: View {
   let lineStyle = StrokeStyle(lineWidth: 15, lineCap: .round, lineJoin: .round, miterLimit: 0, dash: [20], dashPhase: 0)

   var body: some View {
      RoundedRectangle(cornerRadius: 25)
         .stroke(Color.red, style: lineStyle)
         .frame(width: 100, height: 100)
   }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView()
   }
}

