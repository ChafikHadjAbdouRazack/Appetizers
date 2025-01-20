//
//  AppetizerDetailView.swift
//  Appetizers
//
//  Created by Chafik HADJ ABDOU RAZACK on 20/01/2025.
//

import SwiftUI

struct AppetizerDetailView: View {
    let appetizer: Appetizer
    @Binding var isShowingDetailView: Bool
    
    var body: some View {
        VStack {
            AppetizerRemoteImage(urlString: appetizer.imageURL).aspectRatio(contentMode: .fit).frame(width: 300,height: 225)
            VStack{
                Text(appetizer.name).font(.title).fontWeight(.semibold)
                
                Text(appetizer.description).multilineTextAlignment(.center).font(.body).padding()
                
                HStack(spacing: 40){
                    VStack{
                        Text("Calories").bold().font(.caption)
                        Text("\(appetizer.calories)").foregroundColor(.secondary).fontWeight(.semibold).italic()
                    }
                    
                    VStack{
                        Text("Carbs").bold().font(.caption)
                        Text("\(appetizer.carbs)").foregroundColor(.secondary).fontWeight(.semibold).italic()
                    }
                    
                    VStack{
                        Text("Protein").bold().font(.caption)
                        Text("\(appetizer.protein)").foregroundColor(.secondary).fontWeight(.semibold).italic()
                    }
                }
                
            }
            Spacer()
            
            Button("$\(appetizer.price,specifier: "%.2f") - Add to Order") {
                
                
            }.font(.title3).fontWeight(.semibold).frame(width: 260, height: 50).background(Color(.brandPrimary)).foregroundColor(.white).cornerRadius(10).padding(.bottom, 30)
                .padding(.bottom, 30)
            
        }.frame(width: 300, height: 525).background(Color(.systemBackground)).cornerRadius(10)
            .shadow(radius: 40).overlay(Button{
                isShowingDetailView = false
                
            }label:{
                ZStack{
                    Circle().frame(width: 30, height: 30).foregroundColor(.white).opacity(0.6)
                    Image(systemName: "xmark").imageScale(.small).frame(width: 44, height: 44).foregroundColor(.black)
                }
            }, alignment: .topTrailing)
    }
    
}

#Preview {
    AppetizerDetailView(appetizer: MockData.sampleAppetizer,isShowingDetailView: .constant(true))
}
