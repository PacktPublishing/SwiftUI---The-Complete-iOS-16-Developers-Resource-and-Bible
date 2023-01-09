
import SwiftUI

struct File: Identifiable {
   let id: UUID = UUID()
   var name: String
}
class ApplicationData: ObservableObject {
   @Published var listOfFiles: [Int:[File]] = [:]
   @Published var currentDirectory: Int

   var manager: FileManager
   var docURL: URL
   let directories = ["original", "archived"]

   init() {
      listOfFiles = [0: [], 1: []]
      currentDirectory = 0
      manager = FileManager.default
      docURL = manager.urls(for: .documentDirectory, in: .userDomainMask).first!

      for (index, directory) in directories.enumerated() {
         let newDirectoryURL = docURL.appendingPathComponent(directory)
         let path = newDirectoryURL.path
         do {
            try manager.createDirectory(atPath: path, withIntermediateDirectories: false, attributes: nil)
         } catch {
            print("The directory already exists")
         }
         if let list = try? manager.contentsOfDirectory(atPath: path) {
            for name in list {
               let newFile = File(name: name)
               listOfFiles[index]?.append(newFile)
            }
         }
      }
   }
   func saveFile(name: String) {
      let newFileURL = docURL.appendingPathComponent("\(directories[0])/\(name)")
      let path = newFileURL.path
      manager.createFile(atPath: path, contents: nil, attributes: nil)

      if let exists = listOfFiles[0]?.contains(where: { $0.name == name }) {
         if !exists {
            let newFile = File(name: name)
            listOfFiles[0]?.append(newFile)
         }
      }
   }
}

