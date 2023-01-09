
import SwiftUI

struct ContentView: View {
   @EnvironmentObject var appData: ApplicationData
   @State private var openSheet: Bool = false

   var body: some View {
      VStack {
         Image(uiImage: appData.imageInFile ?? UIImage(named: "nopicture")!)
            .resizable()
            .scaledToFill()
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            .onTapGesture {
               openSheet = true
            }
      }.edgesIgnoringSafeArea(.all)
      .sheet(isPresented: $openSheet) {
         SelectPictureView()
      }
   }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView().environmentObject(ApplicationData())
   }
}

