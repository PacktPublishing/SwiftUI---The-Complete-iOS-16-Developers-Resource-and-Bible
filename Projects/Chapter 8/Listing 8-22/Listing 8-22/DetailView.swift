
import SwiftUI

struct DetailView: View {
   let book: BookViewModel

   var body: some View {
      VStack {
         Text(book.title)
            .font(.title)
         Text(book.author)
         Image(book.cover)
            .resizable()
            .scaledToFit()
      }.padding()
      .navigationTitle("Book")
      .navigationBarTitleDisplayMode(.inline)
   }
}
struct DetailView_Previews: PreviewProvider {
   static var previews: some View {
      NavigationStack {
         DetailView(book: ApplicationData().userData[0])
      }
   }
}

