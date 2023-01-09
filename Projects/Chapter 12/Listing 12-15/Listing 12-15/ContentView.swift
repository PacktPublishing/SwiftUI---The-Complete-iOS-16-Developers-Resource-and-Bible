
import SwiftUI

struct ContentView: View {
   @State private var picture: Image = Image("nopicture")
   @State private var didEnter: Bool = false

   var body: some View {
      VStack {
         picture
            .resizable()
            .scaledToFit()
            .frame(minWidth: 0, maxWidth: .infinity)
            .frame(height: 400)
            .overlay(didEnter ? Color.green.opacity(0.2) : Color.clear)
            .dropDestination(for: Data.self, action: { elements, location in
               if let data = elements.first, let image = UIImage(data: data) {
                  picture = Image(uiImage: image)
                  return true
               }
               return false
            }, isTargeted: { value in
               didEnter = value
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

