
import SwiftUI

struct ContentView: View {
   @State private var pattern: UIImage?
   let newPicture = NewPictureView()

   var body: some View {
      VStack {
         newPicture
         Button("Export Image") {
            let renderer = ImageRenderer(content: newPicture)
            if let img = renderer.uiImage {
               pattern = img.preparingThumbnail(of: CGSize(width: 25, height: 25))
            }
         }
         if let pattern {
            Rectangle()
               .fill(.image(Image(uiImage: pattern)))
               .frame(width: 200, height: 200)
         }
         Spacer()
      }
   }
}
struct NewPictureView: View {
   var body: some View {
      Image("spot1")
         .resizable()
         .scaledToFit()
         .frame(width: 150, height: 200)
         .clipShape(Circle())
   }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView()
   }
}

