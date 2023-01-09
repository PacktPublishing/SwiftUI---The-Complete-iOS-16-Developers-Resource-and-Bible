
import SwiftUI

@main
struct Listing_19_30App: App {
   var body: some Scene {
      WindowGroup {
         ContentView()
      }
      #if os(macOS)
      MenuBarExtra("My Menu", systemImage: "phone") {
         VStack {
            HStack {
               Spacer()
               Button(action: {
                  NSApplication.shared.terminate(nil)
               }, label: {
                  Image(systemName: "xmark.circle")
               })
            }.padding()
            Button("Option 1") {
               print("Option 1")
            }.buttonStyle(.borderedProminent)
            Button("Option 2") {
               print("Option 2")
            }.buttonStyle(.borderedProminent)
            Spacer()
         }.frame(width: 200, height: 180)
      }.menuBarExtraStyle(.window)
      #endif
   }
}

