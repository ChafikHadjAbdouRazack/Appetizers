//
//  ContentView.swift
//  Appetizers
//
//  Created by Chafik HADJ ABDOU RAZACK on 15/01/2025.
//

import SwiftUI

struct AppetizerTabView: View {
    var body: some View {
      
        TabView{
            AppetizerListView().tabItem {
                Image(systemName: "house")
                Text("Home")
            }
            
            AccountView().tabItem {
                Image(systemName: "person")
                Text("Account")
            }
            
            OrderView().tabItem {
                Image(systemName: "bag")
                Text("Order")
            }
        }.accentColor(Color(.brandPrimary))
    }
}

#Preview {
    AppetizerTabView()
}
