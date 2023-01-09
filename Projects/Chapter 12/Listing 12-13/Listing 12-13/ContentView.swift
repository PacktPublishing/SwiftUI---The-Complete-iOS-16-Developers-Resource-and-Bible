
import SwiftUI

struct ContentView: View {
   var body: some View {
      VStack {
         Image("husky")
            .resizable()
            .scaledToFit()
            .frame(width: 300, height: 400)
            .draggable(Image("husky"), preview: {
               Image(systemName: "scope")
                  .font(.system(size: 50))
            })
         Spacer()
      }
   }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView()
   }
}

