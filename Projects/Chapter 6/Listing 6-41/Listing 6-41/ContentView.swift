
import SwiftUI

class ContentViewData: ObservableObject {
   @Published var title: String = "Default Name"
   @Published var numberInput: String = ""
   var currentNumber = ""
}
struct ContentView: View {
   @ObservedObject var contentData = ContentViewData()

   var body: some View {
      VStack(spacing: 10) {
         Text(contentData.title)
            .padding()
            .background(Color.yellow)
         TextField("Insert Number", text: $contentData.numberInput)
            .textFieldStyle(.roundedBorder)
            .padding(4)
            .keyboardType(.numbersAndPunctuation)
            .onChange(of: contentData.numberInput) { value in
               if !value.isEmpty {
                  if Int(value) != nil {
                     contentData.currentNumber = contentData.numberInput
                  } else {
                     contentData.numberInput = contentData.currentNumber
                  }
               } else {
                  contentData.currentNumber = ""
               }
            }
         HStack {
            Spacer()
            Button("Save") {
               contentData.title = contentData.numberInput
               contentData.numberInput = ""
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

