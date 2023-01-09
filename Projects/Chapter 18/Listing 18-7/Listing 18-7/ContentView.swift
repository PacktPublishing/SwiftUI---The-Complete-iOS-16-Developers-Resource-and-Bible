
import SwiftUI

class ContentData: NSObject, ObservableObject {
   @Published var path = NavigationPath()
   @Published var picture: UIImage?
}
struct ContentView: View {
   @ObservedObject var contentData = ContentData()
   var ImagePickerView: ImagePicker!

   init() {
      ImagePickerView = ImagePicker(path: $contentData.path, picture: $contentData.picture)
   }
   var body: some View {
      NavigationStack(path: $contentData.path) {
         VStack {
            HStack {
               if let picture = contentData.picture {
                  let photo = Image(uiImage: picture)
                  ShareLink("Share Picture", item: photo, preview: SharePreview("Photo", image: photo))
               }
               Spacer()
               NavigationLink("Get Picture", value: "Open Picker")
            }.navigationDestination(for: String.self, destination: { _ in
               ImagePickerView
            })
            Image(uiImage: contentData.picture ?? UIImage(named: "nopicture")!)
               .resizable()
               .scaledToFill()
               .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
               .clipped()
            Spacer()
         }.padding()
      }.statusBarHidden()
   }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView()
   }
}

