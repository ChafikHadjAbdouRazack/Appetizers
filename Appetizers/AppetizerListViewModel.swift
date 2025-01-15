//
//  AppetizerListViewModel.swift
//  Appetizers
//
//  Created by Chafik HADJ ABDOU RAZACK on 15/01/2025.
//

import SwiftUI

final class AppetizerListViewModel: ObservableObject {
    @Published var appetizers: [Appetizer] = []
    
    func getAppetizers() {
        NetworkManager.shared.fetchAppetizers { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let appetizers):
                    self.appetizers = appetizers
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
}
