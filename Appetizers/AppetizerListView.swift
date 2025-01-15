//
//  AppetizerListView.swift
//  Appetizers
//
//  Created by Chafik HADJ ABDOU RAZACK on 15/01/2025.
//

import SwiftUI

struct AppetizerListView: View {
    
    @StateObject var viewModel = AppetizerListViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.appetizers){ appetizer in
                AppetizerListCell(appetizer: appetizer)
            }.navigationTitle("🍟 Appetizer")
        }.onAppear{
            viewModel.getAppetizers()
        }
    }
    
 
}

#Preview {
    AppetizerListView()
}
