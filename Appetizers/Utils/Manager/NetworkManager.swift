//
//  NetworkManager.swift
//  Appetizers
//
//  Created by Chafik HADJ ABDOU RAZACK on 15/01/2025.
//

import UIKit


enum AppError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
    case unableToComplete
}


final class NetworkManager {
    static let shared = NetworkManager()
    
    static let baseURL = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals"
    
    private let appetizersURL = baseURL + "/appetizers"
    
    private let cache = NSCache<NSString, UIImage>()
    
    
    private init() {
        
    }
    
    func fetchAppetizers(completed: @escaping (Result<[Appetizer], AppError>) -> Void) {
        
        guard let url = URL(string: appetizersURL) else {
            
            completed(.failure(.invalidURL))
            return
            
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            
            
            if let _ = error{
                completed(.failure(.unableToComplete))
                return
            }
            
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            
            do {
                let decoder = JSONDecoder()
                let decodedResponse = try decoder.decode(AppetizerResponse.self, from: data)
                completed(.success(decodedResponse.request))
            }catch {
                completed(.failure(.invalidData))
            }
            
            
            
        }
        
        task.resume()
        
    }
    
    
    func downloadImage(fromURLString: String, completed: @escaping (UIImage?) -> Void){
        
         let cacheKey = NSString(string: fromURLString)
        
        if let image = cache.object(forKey: cacheKey) {
            completed(image)
            return
        }
        
        guard let url = URL(string: fromURLString) else {
            completed(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let data = data, let image = UIImage(data: data) else {
                completed(nil)
                return
            }
            
            self.cache.setObject(image, forKey: cacheKey)
            
            completed(image)
            
        }
        task.resume()
    }
}
