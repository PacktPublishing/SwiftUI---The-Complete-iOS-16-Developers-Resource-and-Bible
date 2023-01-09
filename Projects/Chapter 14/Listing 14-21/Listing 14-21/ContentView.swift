
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
      let center = UNUserNotificationCenter.current()
      let groupID = "Group One"
      let totalMessages = 3

      let summaryFormat = "\(totalMessages) messages"
      let category = UNNotificationCategory(identifier: groupID, actions: [], intentIdentifiers: [], hiddenPreviewsBodyPlaceholder: nil, categorySummaryFormat: summaryFormat, options: [])
      center.setNotificationCategories([category])

      for index in 1...totalMessages {
         let content = UNMutableNotificationContent()
         content.title = "Reminder"
         content.body = "\(index) - \(inputMessage)"
         content.threadIdentifier = groupID

         let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)
         let id = "reminder-\(UUID())"
         let request = UNNotificationRequest(identifier: id, content: content, trigger: trigger)
         do {
            try await center.add(request)
         } catch {
            print("Error: \(error)")
         }
      }
      await MainActor.run {
         inputMessage = ""
      }
   }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView()
   }
}

