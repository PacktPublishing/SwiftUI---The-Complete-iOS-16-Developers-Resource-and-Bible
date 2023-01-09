import SwiftUI

struct CustomCameraView: View {
   @EnvironmentObject var appData: ApplicationData

   var body: some View {
      ZStack {
         appData.cameraView
         VStack {
            Spacer()
            HStack {
               Button("Cancel") {
                  appData.path = NavigationPath()
               }
               Spacer()
               Button("Take Picture") {
                  appData.takePicture()
               }
            }.padding()
            .frame(height: 80)
            .background(Color(red: 0.9, green: 0.9, blue: 0.9, opacity: 0.8))
         }
      }
      .edgesIgnoringSafeArea(.all)
      .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
      .navigationBarHidden(true)
      .onAppear {
         let device = UIDevice.current
         device.beginGeneratingDeviceOrientationNotifications()

         Task(priority: .high) {
            await appData.getAuthorization()
         }
      }
      .onDisappear {
         let device = UIDevice.current
         device.endGeneratingDeviceOrientationNotifications()
      }
   }
}

