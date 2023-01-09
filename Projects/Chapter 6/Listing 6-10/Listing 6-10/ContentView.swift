
import SwiftUI

struct ContentView: View {
   @State private var title: String = "Default Title"
   @State private var titleInput: String = ""

   var body: some View {
      VStack {
         HeaderView(title: $title)
         TextField("Insert Title", text: $titleInput)
            .textFieldStyle(.roundedBorder)
         Button(action: {
            title = titleInput
            titleInput = ""
         }, label: { Text("Change Title") })
         Spacer()
      }.padding()
   }
}
struct HeaderView: View {
   @Binding var title: String
   let counter: Int

   init(title: Binding<String>) {
      _title = title

      let sentence = _title.wrappedValue
      counter = sentence.count
   }
   var body: some View {
      Text("\(title) (\(counter))")
         .padding(10)
   }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView()
   }
}
struct HeaderView_Previews: PreviewProvider {
   static var previews: some View {
      let constantValue = Binding<String>(
         get: { return "My Preview Title"},
         set: { value in
            print(value)
         })
      return HeaderView(title: constantValue)
   }
}
