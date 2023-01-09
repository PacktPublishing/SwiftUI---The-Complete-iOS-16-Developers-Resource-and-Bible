
import SwiftUI

struct ContentView: View {
   let website = URL(string: "http://www.formasterminds.com/images/coveruikit4big.png")

   var body: some View {
      VStack {
         AsyncImage(url: website, content: { image in
            image
               .resizable()
               .scaledToFit()
         }, placeholder: {
            Image("nopicture")
         })
         Spacer()
      }.padding()
   }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView()
   }
}

