
import SwiftUI

struct DetailView: View {
   @Binding var path: NavigationPath
   let book: BookViewModel

   var body: some View {
      VStack {
         Text(book.title)
            .font(.title)
         Text(book.author)

         NavigationLink(value: "Picture View", label: {
            Image(book.cover)
               .resizable()
               .scaledToFit()
         })
      }.padding()
      .navigationTitle(Text("Book"))
      .navigationBarTitleDisplayMode(.inline)
      .navigationBarBackButtonHidden(true)
      .toolbar {
         ToolbarItem(placement: .navigationBarLeading) {
            Button("Go Back") {
               path.removeLast()
            }
         }
      }
      .navigationDestination(for: String.self, destination: { _ in
         PictureView(path: $path, book: book)
      })
   }
}
struct DetailView_Previews: PreviewProvider {
   static var previews: some View {
      NavigationStack {
         DetailView(path: .constant(NavigationPath()), book: ApplicationData().userData[0])
      }
   }
}
