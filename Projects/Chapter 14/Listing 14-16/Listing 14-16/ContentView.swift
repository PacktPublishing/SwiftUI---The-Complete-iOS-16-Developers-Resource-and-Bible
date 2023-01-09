
import SwiftUI
import UserNotifications

struct ContentView: View {
   @State private var inputMessage: String = ""
   @State private var isButtonDisabled: Bool = false

   var body: some View {
      VStack(spacing: 12) {
         HStack {
            Text("Message:")
            TextField("Insert Message", text: $inputMessage)
               .textFieldStyle(.roundedBorder)
         }
         HStack {
            Spacer()
            Button("Post Notification") {
               let message = inputMessage.trimmingCharacters(in: .whitespaces)
               if !message.isEmpty {
                  Task(priority: .background) {
                     let center = UNUserNotificationCenter.current()
                     let authorization = await center.notificationSettings()
                     if authorization.authorizationStatus == .authorized {
                        await sendNotification()
                     }
                  }
               }
            }.disabled(isButtonDisabled)
         }
         Spacer()
      }.padding()
      .task(priority: .background) {
         do {
            let center = UNUserNotificationCenter.current()
            let authorized = try await center.requestAuthorization(options: [.alert, .sound])
            await MainActor.run {
               isButtonDisabled = !authorized
            }
         } catch {
            print("Error: \(error)")
         }
      }
   }
   func sendNotification() async {
      let content = UNMutableNotificationContent()
      content.title = "Reminder"
      content.body = inputMessage

      let idImage = "attach-\(UUID())"
      if let urlImage = await getThumbnail(id: idImage) {
         if let attachment = try? UNNotificationAttachment(identifier: idImage, url: urlImage, options: nil) {
            content.attachments = [attachment]
         }
      }
      let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)

      let id = "reminder-\(UUID())"
      let request = UNNotificationRequest(identifier: id, content: content, trigger: trigger)
      do {
         let center = UNUserNotificationCenter.current()
         try await center.add(request)
         await MainActor.run {
            inputMessage = ""
         }
      } catch {
         print("Error: \(error)")
      }
   }
   func getThumbnail(id: String) async -> URL? {
      let manager = FileManager.default
      if let docURL = manager.urls(for: .documentDirectory, in: .userDomainMask).first {
         let fileURL = docURL.appendingPathComponent("\(id).png")
         if let image = UIImage(named: "husky") {
            if let thumbnail = await image.byPreparingThumbnail(ofSize: CGSize(width: 100, height: 100)) {
               if let imageData = thumbnail.pngData() {
                  if let _ = try? imageData.write(to: fileURL) {
                     return fileURL
                  }
               }
            }
         }
      }
      return nil
   }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView()
   }
}

