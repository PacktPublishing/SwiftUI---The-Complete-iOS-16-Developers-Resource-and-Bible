
import SwiftUI

struct DetailView: View {
   var body: some View {
      VStack {
         Text("Details")
      }
      .toolbar {
         ToolbarItem(placement: .automatic) {
            Button(action: {
               print("Adding Book")
            }, label: {
               Label("Add Book", systemImage: "plus")
            })
            .help("Press this button to add a book")
         }
      }
      .navigationTitle("My Title")
      #if os(macOS)
      .navigationSubtitle("My Subtitle")
      #endif
   }
}
struct DetailView_Previews: PreviewProvider {
   static var previews: some View {
      DetailView()
   }
}

