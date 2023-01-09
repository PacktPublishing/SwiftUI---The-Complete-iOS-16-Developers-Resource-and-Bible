
import SwiftUI

class ContentViewData: ObservableObject {
   @Published var titleInput: String = ""
}
struct ContentView: View {
   @ObservedObject var contentData = ContentViewData()
   @ObservedObject var appData: ApplicationData

   init(appData: ApplicationData) {
      self.appData = appData
      contentData.titleInput = self.appData.title
   }
   var body: some View {
      VStack(spacing: 8) {
         Text(appData.title)
            .padding(10)
         TextField("Insert Title", text: $contentData.titleInput)
            .textFieldStyle(.roundedBorder)
        Button(action: {
            appData.title = contentData.titleInput
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

