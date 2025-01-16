//
//  LodingView.swift
//  Appetizers
//
//  Created by Chafik HADJ ABDOU RAZACK on 16/01/2025.
//

import SwiftUI


struct ActivityIndicator: UIViewRepresentable {
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let activityIndicatorView = UIActivityIndicatorView(style: .large)
        activityIndicatorView.color = UIColor(.brandPrimary)
        activityIndicatorView.startAnimating()
        return activityIndicatorView
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
  
    }
    
    
}

struct LoadingView: View {
    var body: some View {
       ZStack{
           Color(.systemBackground).edgesIgnoringSafeArea(.all)
            ActivityIndicator()
        }
    }
}
