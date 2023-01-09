
import SwiftUI

struct ContentView: View {
   @State private var title: String = "Default Title"
   @State private var titleInput: String = ""

   var body: some View {
      VStack {
         Text(_title.wrappedValue)
            .padding(10)
         TextField("Insert Title", text: _titleInput.projectedValue)
            .textFieldStyle(.roundedBorder)
         Button(action: {
            _title.wrappedValue = _titleInput.wrappedValue
            _titleInput.wrappedValue = ""
         }, label: { Text("Change Title") })
         Spacer()
      }.padding()
   }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView()
   }
}

