
import SwiftUI

struct DetailView: View {
   @Environment(\.horizontalSizeClass) var horizontal
   @Binding var path: NavigationPath
   let book: BookViewModel

   var body: some View {
      Group {
         if horizontal == .regular {
            DetailLarge(path: $path, book: book)
         } else {
            DetailSmall(path: $path, book: book)
         }
      }.padding()
      .navigationTitle(Text("Information"))
      .navigationDestination(for: String.self, destination: { _ in
         PictureView(book: book)
      })
   }
}
struct DetailLarge: View {
   @Binding var path: NavigationPath
   let book: BookViewModel

   var body: some View {
      HStack {
         VStack {
            Button(action: {
               path.append("Picture View")
            }, label: {
               Image(book.cover)
                  .resizable()
                  .scaledToFit()
                  .frame(maxWidth: 300)
            })
            Spacer()
         }
         VStack(alignment: .leading, spacing: 4) {
            Text(book.title)
               .font(.title)
            Text(book.author)
            Text(book.year)
            Spacer()
         }.frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
         Spacer()
      }
   }
}
struct DetailSmall: View {
   @Binding var path: NavigationPath
   let book: BookViewModel

   var body: some View {
      VStack {
         Text(book.title)
            .font(.title)
         Text(book.author)
         Text(book.year)
            .font(.caption)
         Button(action: {
            path.append("Picture View")
         }, label: {
            Image(book.cover)
               .resizable()
               .scaledToFit()
               .frame(maxWidth: 300)
         })
      }.multilineTextAlignment(.center)
   }
}
struct DetailView_Previews: PreviewProvider {
   static var previews: some View {
      DetailView(path: .constant(NavigationPath()), book: ApplicationData().userData[1])
   }
}

