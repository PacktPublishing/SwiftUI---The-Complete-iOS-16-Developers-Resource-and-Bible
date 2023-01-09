
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
   func deleteFile(name: String) {
      let fileURL = docURL.appendingPathComponent("\(directories[currentDirectory])/\(name)")
      do {
         try manager.removeItem(atPath: fileURL.path)
         listOfFiles[currentDirectory]?.removeAll(where: { $0.name == name} )
      } catch {
         print("File was not removed")
      }
   }
   func moveToArchived(name: String) {
      let origin = docURL.appendingPathComponent("\(directories[0])/\(name)")
      let destination = docURL.appendingPathComponent("\(directories[1])/\(name)")
      if !manager.fileExists(atPath: destination.path) {
         do {
            try manager.moveItem(atPath: origin.path, toPath: destination.path)
            listOfFiles[0]?.removeAll(where: { $0.name == name} )
            listOfFiles[1]?.append(File(name: name))
         } catch {
            print("File was not moved")
         }
      }
   }
   func getDetails(file: UUID) -> (String, String, String, String) {
      var values = ("", "", "", "")
      if let file = listOfFiles[currentDirectory]?.first(where: { $0.id == file }) {
         let fileURL = docURL.appendingPathComponent("\(directories[currentDirectory])/\(file.name)")
         let filePath = fileURL.path

         if manager.fileExists(atPath: filePath) {
            if let attributes = try? manager.attributesOfItem(atPath: filePath) {
               let type = attributes[.type] as! FileAttributeType
               let size = attributes[.size] as! Int
               let date = attributes[.creationDate] as! Date
               if type != FileAttributeType.typeDirectory {
                  values.0 = file.name
                  values.1 = fileURL.pathExtension
                  values.2 = String(size)
                  values.3 = date.formatted(date: .abbreviated, time: .omitted)
               }
            }
         }
      }
      return values
   }
}

