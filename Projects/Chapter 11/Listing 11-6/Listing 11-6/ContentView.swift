
import SwiftUI

struct ContentView: View {
   @State private var setActive: Bool = true

   var body: some View {
      VStack {
         Button(action: {
            setActive.toggle()
         }, label: {
            Text(setActive ? "Active" : "Inactive")
               .font(.title)
               .foregroundColor(Color.white)
               .padding(.horizontal, 30)
               .padding(.vertical, 10)
         })
         .background(setActive ? Color.green : Color.red, in: Capsule())
         Spacer()
      }.padding()
   }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView()
   }
}

