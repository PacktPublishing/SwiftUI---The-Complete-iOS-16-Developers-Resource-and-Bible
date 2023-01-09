
import SwiftUI

struct ContentView: View {
   @EnvironmentObject var appData: ApplicationData

   var body: some View {
      VStack {
         List {
            ForEach(appData.listOfPosts) { post in
               VStack(alignment: .leading) {
                  Text(post.title).bold()
                  Text(post.body)
               }.padding(5)
            }
         }.listStyle(.plain)
      }.padding()
   }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView().environmentObject(ApplicationData())
   }
}

