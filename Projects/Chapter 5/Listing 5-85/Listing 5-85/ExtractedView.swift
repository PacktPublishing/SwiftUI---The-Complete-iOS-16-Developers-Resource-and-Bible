//
//  ExtractedView.swift
//  Listing 5-85
//
//  Created by Stephen DeStefano on 9/22/22.
//

import SwiftUI

struct ExtractedView: View {
   var body: some View {
      Grid(alignment: .leading) {
         GridRow {
            Text("My Name")
         }
         GridRow {
            Text("My Number")
         }
      }
   }
}

struct ExtractedView_Previews: PreviewProvider {
    static var previews: some View {
        ExtractedView()
    }
}
