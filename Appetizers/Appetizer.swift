//
//  Appetizer.swift
//  Appetizers
//
//  Created by Chafik HADJ ABDOU RAZACK on 15/01/2025.
//

import Foundation


struct Appetizer: Decodable, Identifiable {
       let description: String
       let name: String
       let protein: Int
       let imageURL: String
       let id: Int
       let carbs: Int
       let price: Double
       let calories: Int
}


struct AppetizerResponse: Decodable {
    let request: [Appetizer]
}


struct MockData{
    
    static let sampleAppetizer = Appetizer(description: "Description", name: "Salad", protein: 10, imageURL: "", id: 0001, carbs: 10, price: 10.99, calories: 10)
    
    static let appetizers = [sampleAppetizer, sampleAppetizer, sampleAppetizer, sampleAppetizer, sampleAppetizer, sampleAppetizer, sampleAppetizer]
}
