//
//  AppetizerListCell.swift
//  Appetizers
//
//  Created by Chafik HADJ ABDOU RAZACK on 15/01/2025.
//

import SwiftUI

struct AppetizerListCell: View {
    let appetizer: Appetizer
    var body: some View {
        HStack {
            Image("asian-flank-steak").resizable().aspectRatio(contentMode: .fit).frame(width: 100, height: 90).cornerRadius(10)
            VStack(alignment: .leading, spacing: 5) {
                Text(appetizer.name).font(.title).fontWeight(.medium)
                Text("$\(appetizer.price, specifier: "%.2f")").foregroundColor(.secondary).fontWeight(.semibold)
            }.padding(.leading)
        }
    }
}

#Preview {
    AppetizerListCell(appetizer: MockData.sampleAppetizer)
}
