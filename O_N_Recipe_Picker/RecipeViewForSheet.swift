//
//  RecipeViewForSheet.swift
//  O_N_Recipe_Picker
//
//  Created by Nnamani Christian on 23/05/2025.
//

import SwiftUI

struct RecipeViewForSheet: View {
    let foodModel : FoodModel
    var body: some View {
        VStack{
            VStack{
                Text(foodModel.food)
                    .font(.headline)
   
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.gray.opacity(0.5))
            .cornerRadius(10)
            VStack{
                Image(foodModel.image)
                    .resizable()
                    .frame(maxWidth: .infinity , maxHeight: 350)
   
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.gray.opacity(0.5))
            .cornerRadius(10)
            
            VStack{
                Text("Recipe")
                    .font(Font.headline.weight(.bold))
                    .frame(maxWidth: .infinity , alignment: .leading)
                
                ForEach(foodModel.recipes , id: \.self){ items in
                    Text(items)
                        .frame(maxWidth: .infinity , alignment: .leading)
                }
   
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.gray.opacity(0.5))
            .cornerRadius(10)
          
          
            
            Spacer()
            
            
        }
        .padding()
    }
}

#Preview {
    RecipeViewForSheet(foodModel: FoodModel(food: "Spagetti", image: "spagetti" , estimatedTime: "" , recipes: []))
}
