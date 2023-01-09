
import SwiftUI

struct ContentView: View {
   var body: some View {
      VStack {
         ScrollView(.horizontal, showsIndicators: true) {
            HStack {
               Triangle()
                  .fill(Color.blue)
                  .frame(width: 120, height: 50)
               Triangle()
                  .fill(Color.green)
                  .frame(width: 120, height: 100)
               Triangle()
                  .fill(Color.yellow)
                  .frame(width: 120, height: 80)
               Triangle()
                  .fill(Color.red)
                  .frame(width: 50, height: 50)
            }
         }.padding()
         Spacer()
      }
   }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView()
   }
}

