
import SwiftUI

struct ContentView: View {
   @EnvironmentObject var appData: ApplicationData
   @State private var inputText: String = ""

   var body: some View {
      GroupBox("Editor") {
         TextEditor(text: $appData.textInFile)
            .cornerRadius(10)
      }.padding()
   }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView().environmentObject(ApplicationData())
   }
}

