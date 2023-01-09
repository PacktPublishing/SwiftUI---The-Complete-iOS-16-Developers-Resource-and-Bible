
import SwiftUI

class ApplicationData: ObservableObject {
   var document: MyDocument!
   var metaData: NSMetadataQuery!

   init() {
      metaData = NSMetadataQuery()
      metaData.predicate = NSPredicate(format: "%K == %@", NSMetadataItemFSNameKey, "myfile.dat")
      metaData.searchScopes = [NSMetadataQueryUbiquitousDocumentsScope]

      Task(priority: .high) {
         let center = NotificationCenter.default
         let name = NSNotification.Name.NSMetadataQueryDidFinishGathering
         for await notification in center.notifications(named: name, object: metaData) {
            if notification.name == name {
               await createFile()
            }
         }
      }
      metaData.start()
   }
   @MainActor
   func createFile() async {
      if metaData.resultCount > 0 {
         let file = metaData.result(at: 0) as! NSMetadataItem
         let fileURL = file.value(forAttribute: NSMetadataItemURLKey) as! URL
         document = MyDocument(fileURL: fileURL)
      } else {
         let manager = FileManager.default
         if let fileURL = manager.url(forUbiquityContainerIdentifier: nil) {
            let documentURL = fileURL.appendingPathComponent("Documents/myfile.dat")

            document = MyDocument(fileURL: documentURL)
            document.fileContent = Data()
            if manager.fileExists(atPath: documentURL.path) {
               let _ = await document.save(to: documentURL, for: .forOverwriting)
            } else {
               let _ = await document.save(to: documentURL, for: .forCreating)
            }
         }
      }
   }
   @MainActor
   func openDocument() async -> String {
      let manager = FileManager.default
      if let fileURL = manager.url(forUbiquityContainerIdentifier: nil) {
         let documentURL = fileURL.appendingPathComponent("Documents/myfile.dat")
         document = MyDocument(fileURL: documentURL)
         let success = await document.open()
         if success {
            if let data = document.fileContent {
               return String(data: data, encoding: .utf8) ?? ""
            }
         }
      }
      return ""
   }
   @MainActor
   func saveDocument(text: String) async {
      let manager = FileManager.default
      if let fileURL = manager.url(forUbiquityContainerIdentifier: nil) {
         let documentURL = fileURL.appendingPathComponent("Documents/myfile.dat")

         if let data = text.data(using: .utf8) {
            document.fileContent = data
            let _ = await document.save(to: documentURL, for: .forOverwriting)
         }
      }
   }
   @MainActor
   func closeDocument() async {
      let _ = await document.close()
   }
}

