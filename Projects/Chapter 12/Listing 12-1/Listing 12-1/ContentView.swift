
import SwiftUI

struct ContentView: View {
   @State private var expand: Bool = false

   var body: some View {
      Image("spot1")
         .resizable()
         .scaledToFit()
         .frame(width: 160, height: 200)
         .onTapGesture { location in
            expand = true
            print("Location: \(location)")
         }
         .sheet(isPresented: $expand) {
            ShowImage()
         }
   }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView()
   }
}

