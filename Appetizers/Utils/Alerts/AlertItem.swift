//
//  AlertItem.swift
//  Appetizers
//
//  Created by Chafik HADJ ABDOU RAZACK on 16/01/2025.
//

import SwiftUI


struct AlertItem: Identifiable {
    let id = UUID()
    let title: Text
    let message: Text
    let dismissButton: Alert.Button
}


struct AlertContext {
    static let invalidData = AlertItem(
        title: Text("Server Error"),
        message: Text("The data received from the server is invalid"),
        dismissButton: .default(Text("OK"))
    )
    
    static let invalidResponse = AlertItem(
        title: Text("Invalid Response"),
        message: Text("Please try again later"),
        dismissButton: .default(Text("OK"))
    )
    
    static let invalidUrl = AlertItem(
        title: Text("Invalid URL"),
        message: Text("Please enter a valid URL"),
        dismissButton: .default(Text("OK"))
    )
    
    static let unableToComplete = AlertItem(
        title: Text("Unable to Complete"),
        message: Text("Please try again later"),
        dismissButton: .default(Text("OK"))
    )
}
