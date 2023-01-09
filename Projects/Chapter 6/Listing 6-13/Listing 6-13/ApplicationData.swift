
import SwiftUI

class ApplicationData: ObservableObject {
   @Published var title: String = "Default Title"
   @Published var titleInput: String = ""
}

