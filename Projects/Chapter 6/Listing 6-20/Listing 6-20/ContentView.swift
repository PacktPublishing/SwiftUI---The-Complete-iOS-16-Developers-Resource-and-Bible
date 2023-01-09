
import SwiftUI

class ContentViewData: ObservableObject {
   @Published var titleInput: String = ""
}
struct ContentView: View {
   @ObservedObject var contentData = ContentViewData()
   @EnvironmentObject var appData: ApplicationData

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
      .onAppear(perform: {
         contentData.titleInput = appData.title
      })
   }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView()
         .environmentObject(ApplicationData())
   }
}

