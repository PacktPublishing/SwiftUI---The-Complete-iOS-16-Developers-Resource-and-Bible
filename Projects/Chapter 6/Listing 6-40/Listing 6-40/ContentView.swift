
import SwiftUI

enum FocusName: Hashable {
   case name
   case surname
}
struct ContentView: View {
   @FocusState var focusName: FocusName?
   @State private var title: String = "Default Name"
   @State private var nameInput: String = ""
   @State private var surnameInput: String = ""

   var body: some View {
      VStack(spacing: 10) {
         Text(title)
            .lineLimit(1)
            .padding()
            .background(Color.yellow)
         TextField("Insert Name", text: $nameInput)
            .textFieldStyle(.roundedBorder)
            .padding(4)
            .background(focusName == .name ? Color(white: 0.9) : .white)
            .focused($focusName, equals: .name)
            .onChange(of: nameInput) { value in
               if value.count > 10 {
                  nameInput = String(value.prefix(10))
               }
            }
         TextField("Insert Surname", text: $surnameInput)
            .textFieldStyle(.roundedBorder)
            .padding(4)
            .background(focusName == .surname ? Color(white: 0.9) : .white)
            .focused($focusName, equals: .surname)
            .onChange(of: surnameInput) { value in
               if value.count > 15 {
                  surnameInput = String(value.prefix(15))
               }
            }
         HStack {
            Spacer()
            Button("Save") {
               title = nameInput + " " + surnameInput
            }
         }
         Spacer()
      }.padding()
   }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView()
   }
}

