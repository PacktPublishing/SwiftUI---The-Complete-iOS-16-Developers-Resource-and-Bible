
import SwiftUI

struct ContentView: View {
   var body: some View {
      Canvas { context, size in
         let imageFrame = CGRect(x: 60, y: 75, width: 215, height: 288)
         context.draw(Image("spot1"), in: imageFrame)

         let circleFrame = CGRect(x: 20, y: 50, width: 60, height: 60)
         context.fill(Circle().path(in: circleFrame), with: .color(.yellow))

         let rectFrame = CGRect(x: 50, y: 60, width: 250, height: 40)
         context.fill(RoundedRectangle(cornerRadius: 25).path(in: rectFrame), with: .color(.yellow))
         
         let textPos = CGPoint(x: 80, y: 80)
         context.draw(Text("My Picture").font(.title.bold()), at: textPos, anchor: .leading)
      }.ignoresSafeArea()
   }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView()
   }
}

