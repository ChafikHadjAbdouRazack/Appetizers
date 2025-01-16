//
//  RemoteImage.swift
//  Appetizers
//
//  Created by Chafik HADJ ABDOU RAZACK on 16/01/2025.
//

import SwiftUI



final class ImageLoader: ObservableObject {
    @Published var image: Image? = nil
    
    
    func load(url: String) {
        
        NetworkManager.shared.downloadImage(fromURLString: url){ result in
            
            guard let uiImage = result else { return }
            
            DispatchQueue.main.async {
                self.image = Image(uiImage: uiImage)
            }
            
            
        }
        
    }
}


struct RemoteImage: View {
    var image: Image?
    
    var body: some View {
        image?.resizable() ?? Image("food-placeholder")
    }
}



struct AppetizerRemoteImage: View {
    
    @StateObject var imageLoader = ImageLoader()
    
    let urlString: String
    
    var body: some View {
        RemoteImage(image: imageLoader.image).onAppear {
            imageLoader.load(url: urlString)
        }
    }
}
