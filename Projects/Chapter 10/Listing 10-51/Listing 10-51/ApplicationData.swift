
import SwiftUI
import CoreData

class ApplicationData: ObservableObject {
   let container: NSPersistentContainer

   init() {
      container = NSPersistentContainer(name: "books")
      container.viewContext.automaticallyMergesChangesFromParent = true
      container.loadPersistentStores(completionHandler: { storeDescription, error in
         if let error = error as NSError? {
            fatalError("Unresolved error \(error), \(error.userInfo)")
         }
      })
   }
}

