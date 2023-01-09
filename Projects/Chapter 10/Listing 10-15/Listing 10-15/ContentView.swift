
import SwiftUI

struct ContentView: View {
   @EnvironmentObject var appData: ApplicationData
   @State private var openSheet: Bool = false

   var body: some View {
      NavigationStack {
         VStack {
            Picker("", selection: $appData.currentDirectory) {
               ForEach(0..<appData.directories.count, id: \.self) { index in
                  Text(appData.directories[index]).tag(index)
               }
            }.pickerStyle(.segmented)
            List {
               ForEach(appData.listOfFiles[appData.currentDirectory] ?? []) { file in
                  NavigationLink(destination: {
                     FileDetailsView(file: file.id)
                  } , label: {
                     RowFile(file: file)
                  })
               }
            }.listStyle(.plain)
         }
         .navigationBarTitle("Files")
         .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
               Button("Add File") {
                  openSheet = true
               }.disabled(appData.currentDirectory != 0 ? true : false)
            }
         }
         .sheet(isPresented: $openSheet) {
            AddFileView()
         }
      }
   }
}
struct RowFile: View {
   @EnvironmentObject var appData: ApplicationData
   let file: File

   var body: some View {
      HStack {
         Text(file.name)
         Spacer()
         if appData.currentDirectory == 0 {
            Button(action: {
               appData.moveToArchived(name: file.name)
            }, label: {
               Image(systemName: "folder")
                  .font(.body)
                  .foregroundColor(Color.green)
            }).buttonStyle(.plain)
         }
         Button(action: {
            appData.deleteFile(name: file.name)
         }, label: {
            Image(systemName: "trash")
               .font(.body)
               .foregroundColor(Color.red)
         }).buttonStyle(.plain)
      }
   }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView().environmentObject(ApplicationData())
   }
}

