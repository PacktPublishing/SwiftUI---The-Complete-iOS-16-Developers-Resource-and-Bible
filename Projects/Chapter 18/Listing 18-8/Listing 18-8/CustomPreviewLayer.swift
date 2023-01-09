
import SwiftUI

struct CustomPreviewLayer: UIViewRepresentable {
   let view = UIView()

   func makeUIView(context: Context) -> UIView {
      return view
   }
   func updateUIView(_ uiView: UIView, context: Context) { }
}

