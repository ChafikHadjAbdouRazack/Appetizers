//
//  AppetizerListView.swift
//  Appetizers
//
//  Created by Chafik HADJ ABDOU RAZACK on 15/01/2025.
//

import SwiftUI

struct AppetizerListView: View {
    
    @StateObject var viewModel = AppetizerListViewModel()
    @State private var isShowingDetailView = false
    @State private var selectedAppetizer: Appetizer?
    var body: some View {
        ZStack{
            NavigationView {
                List(viewModel.appetizers){ appetizer in
                    AppetizerListCell(appetizer: appetizer).onTapGesture{
                        isShowingDetailView = true
                        selectedAppetizer = appetizer
                    }
                    
                }.navigationTitle("🍟 Appetizer").disabled(isShowingDetailView)
            }.onAppear{
                viewModel.getAppetizers()
            }.blur(radius: isShowingDetailView ? 20 : 0)
            
            if isShowingDetailView {
                AppetizerDetailView(appetizer: selectedAppetizer!,isShowingDetailView: $isShowingDetailView)
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
