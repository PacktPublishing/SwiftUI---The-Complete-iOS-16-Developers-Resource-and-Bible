
import SwiftUI

struct ContentView: View {
   @State private var name: String = ""
   @State private var openAlert: Bool = false

   var body: some View {
      VStack(spacing: 10) {
         TextField("Insert your Name", text: $name)
            .textFieldStyle(.roundedBorder)
         HStack {
            Spacer()
            Button("Save") {
               openAlert = name.isEmpty
            }
         }
         Spacer()
      }.padding()
      .alert("Error", isPresented: $openAlert, actions: {
         Button("Cancel", role: .cancel, action: {})
         Button("Delete", role: .destructive, action: {
            name = ""
         })
         Button("Save Anyway", role: .none, action: {
            print("Save value")
         })
      }, message: { Text("Insert your name") })
   }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView()
   }
}

