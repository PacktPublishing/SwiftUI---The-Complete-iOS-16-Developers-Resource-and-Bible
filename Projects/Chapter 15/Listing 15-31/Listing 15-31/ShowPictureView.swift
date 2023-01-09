
import SwiftUI
import CloudKit

struct ShowPictureView: View {
   @EnvironmentObject var appData: ApplicationData
   let selectedCity: CityViewModel

   var body: some View {
      VStack {
         Image(uiImage: selectedCity.cityPicture)
            .resizable()
            .scaledToFit()
         Spacer()
      }.navigationBarTitle(selectedCity.cityName)
   }
}
struct ShowPictureView_Previews: PreviewProvider {
   static var previews: some View {
      ShowPictureView(selectedCity: CityViewModel(id: CKRecord.ID(recordName: "Test"), city: City(name: "Test", record: CKRecord(recordType: "Cities", recordID: CKRecord.ID(recordName: "Test")))))
         .environmentObject(ApplicationData())
   }
}

