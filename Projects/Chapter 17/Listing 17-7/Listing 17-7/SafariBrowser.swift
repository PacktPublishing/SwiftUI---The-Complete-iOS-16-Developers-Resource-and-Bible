
import SwiftUI
import SafariServices

struct SafariBrowser: UIViewControllerRepresentable {
   @Binding var searchURL: URL

   func makeUIViewController(context: Context) -> SFSafariViewController {
      let config = SFSafariViewController.Configuration()
      config.barCollapsingEnabled = false
      let safari = SFSafariViewController(url: searchURL, configuration: config)
      return safari
   }
   func updateUIViewController(_ uiViewController: SFSafariViewController, context: Context) {}
}
