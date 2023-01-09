
import SwiftUI

struct ContentView: View {
   @State private var selected: Bool = false

   var body: some View {
      VStack {
         HStack(alignment: .top) {
            Image("spot1")
               .resizable()
               .scaledToFit()
               .frame(width: 80, height: 100)
               .border(selected ? Color.yellow : Color.clear, width: 5)
            VStack(alignment: .leading, spacing: 2) {
               Text("Balmy Beach").bold()
               Text("Toronto")
               Text("2020").font(.caption)
               Spacer()
            }
            Spacer()
         }.frame(height: 100)
         .padding(5)
         .border(.gray, width: 1)
         .contentShape(Rectangle())
         .onTapGesture {
            selected.toggle()
         }
         Spacer()
      }
   }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView()
   }
}

