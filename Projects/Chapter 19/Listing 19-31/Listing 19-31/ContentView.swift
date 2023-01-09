
import SwiftUI

struct ContentView: View {
   @EnvironmentObject var appData: ApplicationData
   @SceneStorage("selection") var selection: Int = 0

   var body: some View {
      VStack {
         HStack(alignment: .top, spacing: 20) {
            Picker("Select", selection: $selection) {
               ForEach(appData.picturesList.indices, id: \.self) { index in
                  Button(appData.picturesList[index].capitalized, action: {
                     selection = index
                  }).tag(index)
               }
            }.frame(width: 200, height: 150, alignment: .top)
            Image(appData.picturesList[selection])
               .resizable()
               .scaledToFit()
               .frame(width: 200, height: 150)
         }
      }.padding(20)
   }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView().environmentObject(ApplicationData())
   }
}

