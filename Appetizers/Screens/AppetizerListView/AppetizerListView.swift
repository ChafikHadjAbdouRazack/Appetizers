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
        ZStack{
            NavigationView {
                List(viewModel.appetizers){ appetizer in
                    AppetizerListCell(appetizer: appetizer)
                }.navigationTitle("🍟 Appetizer")
            }.onAppear{
                viewModel.getAppetizers()
            }
            
            if viewModel.isLoading {
                LoadingView()
            }

        }.alert(item: $viewModel.alertItem) { item in
            Alert(title: item.title, message: item.message, dismissButton: item.dismissButton)
        }
    }
    
 
}

#Preview {
    AppetizerListView()
}
