
import SwiftUI

struct ContentView: View {
   var body: some View {
      VStack(spacing: 10) {
         Button(action: {
            print("Delete item")
         }, label: {
            HStack {
               Image(systemName: "mail")
                  .imageScale(.large)
               Text("Send")
            }
         })
         .buttonStyle(.borderedProminent)
         .font(.largeTitle)
         .controlSize(.large)
         Spacer()
      }.padding()
   }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView()
   }
}

