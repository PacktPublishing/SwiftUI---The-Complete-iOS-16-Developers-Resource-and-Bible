
import SwiftUI

struct AddressKey : FocusedValueKey {
   typealias Value = String
}
extension FocusedValues {
   var address: AddressKey.Value? {
      get { self[AddressKey.self] }
      set { self[AddressKey.self] = newValue }
   }
}
class ApplicationData: ObservableObject {
   @Published var inputMessage: String = ""
   @Published var inputAddress: String = ""
}

