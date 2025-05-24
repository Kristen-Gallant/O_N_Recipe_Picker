//
//  RecipeItems.swift
//  O_N_Recipe_Picker
//
//  Created by Nnamani Christian on 23/05/2025.
//

import SwiftUI

struct RecipeItems: View {
    var itemName : String
    var image : String
    var estimatedTime : String
    var recipes : [String]
    

    var body: some View {
        HStack{
            VStack{
                Image(image)
                    .resizable()
                    .frame(width: 90 , height: 90)
                    .fixedSize()
                    .cornerRadius(10)
                    
                Spacer()
                
            }
            
           
            VStack(alignment: .leading){
                Text(itemName)
                    .font(.headline.bold())
                    .lineLimit(1)
                       .truncationMode(.tail) 
                
               
                   
                Text("\(recipes.count) ingridents")
                    .padding(.vertical , 1)
                    .foregroundStyle(.secondary)

                
                Text(estimatedTime)
                 
                    .foregroundStyle(.secondary)

            

                Spacer()
            }
            .padding(.bottom , 5)
            Spacer()
            
        }
    }
}

#Preview {
    RecipeItems(itemName: "Pizza" , image: "Pancake" , estimatedTime: "", recipes: [""])
}
