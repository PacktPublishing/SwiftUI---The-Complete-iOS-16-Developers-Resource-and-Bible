
import SwiftUI

class ApplicationData: ObservableObject {
   @Published var maintext: String
   
   static let shared = ApplicationData()
   
   private init() {
      maintext = "Welcome"
   }
}

