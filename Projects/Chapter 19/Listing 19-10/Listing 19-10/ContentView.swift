
import SwiftUI

#if os(macOS)
struct ImageRepresentation: Transferable {
   let image: NSImage

   static var transferRepresentation: some TransferRepresentation {
      DataRepresentation(importedContentType: .jpeg, importing: { data in
         if let newImage = NSImage(data: data) {
            return ImageRepresentation(image: newImage)
         } else {
            return ImageRepresentation(image: NSImage(named: "nopicture")!)
         }
      })
   }
}
#endif

struct ContentView: View {
   @State private var MyPicture = Image("nopicture")

   var body: some View {
      VStack {
         MyPicture
            .resizable()
            .scaledToFit()
      }.frame(width: 500, height: 350)
      #if os(macOS)
      .importableFromServices(for: ImageRepresentation.self, action: { elements in
         if let value = elements.first {
            MyPicture = Image(nsImage: value.image)
            return true
         }
         return false
      })
      #endif
   }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView()
   }
}

