
import SwiftUI

struct ContentView: View {
   @ObservedObject var appData: ApplicationData

   var body: some View {
      VStack(spacing: 8) {
         Text(appData.title)
            .padding(10)
         TextField("Insert Title", text: $appData.titleInput)
            .textFieldStyle(.roundedBorder)
         Button(action: {
            appData.title = appData.titleInput
         }, label: { Text("Save") })
         Spacer()
      }.padding()
   }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView(appData: ApplicationData())
   }
}

