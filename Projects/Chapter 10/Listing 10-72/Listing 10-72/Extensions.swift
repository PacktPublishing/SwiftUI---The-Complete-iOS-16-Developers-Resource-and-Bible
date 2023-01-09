
import SwiftUI

extension Books {
   var showTitle: String {
      return title ?? "Undefined"
   }
   var showYear: String {
      return String(year)
   }
   var showAuthor: String {
      return author?.name ?? "Undefined"
   }
   var showCover: UIImage {
      if let data = cover, let image = UIImage(data: data) {
         return image
      } else {
         return UIImage(named: "nopicture")!
      }
   }
   var showThumbnail: UIImage {
      if let data = thumbnail, let image = UIImage(data: data) {
         return image
      } else {
         return UIImage(named: "nopicture")!
      }
   }
}
extension Authors {
   var showName: String {
      return name ?? "Undefined"
   }
}

