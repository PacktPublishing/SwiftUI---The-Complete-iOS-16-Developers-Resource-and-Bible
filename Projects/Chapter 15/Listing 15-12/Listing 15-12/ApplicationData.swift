
import SwiftUI

struct NotificationWrapper: @unchecked Sendable {
   let value: Notification
}
struct FileInfo: Identifiable {
   let id: UUID = UUID()
   var name: String
   var url: URL
}
class ApplicationData: ObservableObject {
   @Published var listOfFiles: [FileInfo] = []
   var document: MyDocument!
   var metaData: NSMetadataQuery!

   init() {
      metaData = NSMetadataQuery()
      metaData.searchScopes = [NSMetadataQueryUbiquitousDocumentsScope]

      Task(priority: .high) {
         let center = NotificationCenter.default
         let name = NSNotification.Name.NSMetadataQueryDidFinishGathering
         for await notification in center.notifications(named: name, object: metaData) {
            if notification.name == name {
               await getFiles()
            }
         }
      }
      Task(priority: .high) {
         let center = NotificationCenter.default
         let name = NSNotification.Name.NSMetadataQueryDidUpdate
         for await notification in center.notifications(named: name, object: metaData) {
            if notification.name == name {
               let wrapper = NotificationWrapper(value: notification)
               await updateFiles(notification: wrapper)
            }
         }
      }
      metaData.start()
   }
   @MainActor
   func getFiles() {
      if metaData.resultCount > 0 {
         let files = metaData.results as! [NSMetadataItem]
         for item in files {
            let fileName = item.value(forAttribute: NSMetadataItemFSNameKey) as! String
            if !listOfFiles.contains(where: { $0.name == fileName }) {
               let documentURL = item.value(forAttribute: NSMetadataItemURLKey) as! URL
               listOfFiles.append(FileInfo(name: fileName, url: documentURL))
            }
         }
         listOfFiles.sort(by: { $0.name < $1.name })
      }
   }
   @MainActor
   func updateFiles(notification: NotificationWrapper) {
      metaData.disableUpdates()

      let manager = FileManager.default
      if let modifications = notification.value.userInfo {
         if let removed = modifications[NSMetadataQueryUpdateRemovedItemsKey] as? [NSMetadataItem] {
            for item in removed {
               let name = item.value(forAttribute: NSMetadataItemFSNameKey) as! String
               if let index = listOfFiles.firstIndex(where: { $0.name == name }) {
                  listOfFiles.remove(at: index)
               }
            }
         }
         if let added = modifications[NSMetadataQueryUpdateAddedItemsKey] as? [NSMetadataItem] {
            for item in added {
               let name = item.value(forAttribute: NSMetadataItemFSNameKey) as! String
               if !listOfFiles.contains(where: { $0.name == name }) {
                  if let fileURL = manager.url(forUbiquityContainerIdentifier: nil) {
                     let documentURL = fileURL.appendingPathComponent("Documents/\(name)")
                     listOfFiles.append(FileInfo(name: name, url: documentURL))
                  }
               }
            }
            listOfFiles.sort(by: { $0.name < $1.name })
         }
      }
      metaData.enableUpdates()
   }
   @MainActor
   func createFile(name: String) async {
      let manager = FileManager.default
      if let fileURL = manager.url(forUbiquityContainerIdentifier: nil) {
         let documentURL = fileURL.appendingPathComponent("Documents/\(name)")
         let document = MyDocument(fileURL: documentURL)
         document.fileContent = Data()
         let _ = await document.save(to: documentURL, for: .forCreating)
      }
   }
   func removeFiles(indexes: IndexSet) async {
      let manager = FileManager.default
      for index in indexes {
         let fileURL = listOfFiles[index].url
         do {
            try manager.removeItem(atPath: fileURL.path)
            await MainActor.run {
               let _ = listOfFiles.remove(at: index)
            }
         } catch {
            print("Error deleting file: \(error)")
         }
      }
   }
   @MainActor
   func openDocument(url: URL) async -> String {
      document = MyDocument(fileURL: url)
      let success = await document.open()
      if success {
         if let data = document.fileContent {
            return String(data: data, encoding: .utf8) ?? ""
         }
      }
      return ""
   }
   @MainActor
   func saveDocument(url: URL, content: String) async {
      if let data = content.data(using: .utf8) {
         document.fileContent = data
         let _ = await document.save(to: url, for: .forOverwriting)
      }
   }
   @MainActor
   func closeDocument() async {
      let _ = await document.close()
   }
}

