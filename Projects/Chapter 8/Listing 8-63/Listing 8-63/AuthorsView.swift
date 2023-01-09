
import SwiftUI

struct AuthorsView: View {
   @EnvironmentObject var appData: ApplicationData
   @Binding var selectedAuthor: String?

   var body: some View {
      List(appData.listAuthors, id: \.self, selection: $selectedAuthor) { author in
         NavigationLink(value: author, label: {
            Text(author)
         })
      }
      .listStyle(.sidebar)
      .navigationTitle("Authors")
   }
}
struct AuthorsView_Previews: PreviewProvider {
   static var previews: some View {
      AuthorsView(selectedAuthor: .constant(nil))
         .environmentObject(ApplicationData())
   }
}

