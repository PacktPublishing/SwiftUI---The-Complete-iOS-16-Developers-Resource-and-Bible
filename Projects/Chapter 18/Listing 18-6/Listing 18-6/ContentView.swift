
import SwiftUI

class ContentData: NSObject, ObservableObject {
   @Published var path = NavigationPath()
   @Published var picture: UIImage?
}
struct ContentView: View {
   @ObservedObject var contentData = ContentData()
   @State private var showAlert: Bool = false
   var ImagePickerView: ImagePicker!

   init() {
      ImagePickerView = ImagePicker(path: $contentData.path, picture: $contentData.picture)
   }
   var body: some View {
      NavigationStack(path: $contentData.path) {
         VStack {
            HStack {
               Button("Share Picture") {
                  showAlert = true
               }.disabled(contentData.picture == nil ? true : false)
               Spacer()
               NavigationLink("Get Picture", value: "Open Picker")
            }.navigationDestination(for: String.self, destination: { _ in
               ImagePickerView
            })
            .alert("Save Picture", isPresented: $showAlert, actions: {
               Button("Cancel", role: .cancel, action: {
                  showAlert = false
               })
               Button("YES", role: .none, action: {
                  if let picture = contentData.picture {
                     UIImageWriteToSavedPhotosAlbum(picture, nil, nil, nil)
                  }
               })
            }, message: { Text("Do you want to store the picture in the Photo Library?") })

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

