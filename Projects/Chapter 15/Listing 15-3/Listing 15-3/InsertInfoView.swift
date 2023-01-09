
import SwiftUI

struct InsertInfoView: View {
   @EnvironmentObject var appData: ApplicationData
   @Binding var openSheet: Bool

   @State private var inputName: String = ""
   @State private var inputAddress: String = ""
   @State private var inputCity: String = ""

   var body: some View {
      VStack(spacing: 10) {
         TextField("Insert Name", text: $inputName)
            .textFieldStyle(.roundedBorder)
         TextField("Insert Address", text: $inputAddress)
            .textFieldStyle(.roundedBorder)
         TextField("Insert City", text: $inputCity)
            .textFieldStyle(.roundedBorder)
         HStack {
            Spacer()
            Button("Save") {
               appData.userInfo = PersonalInfo(name: inputName, address: inputAddress, city: inputCity)
               appData.setInfo()
               openSheet = false
            }
         }
         Spacer()
      }.padding()
      .onAppear {
         inputName = appData.userInfo.name
         inputAddress = appData.userInfo.address
         inputCity = appData.userInfo.city
      }
   }
}
struct InsertInfoView_Previews: PreviewProvider {
   static var previews: some View {
      InsertInfoView(openSheet: .constant(false))
         .environmentObject(ApplicationData())
   }
}

