//
//  ContentView.swift
//  O_N_Recipe_Picker
//
//  Created by Nnamani Christian on 23/05/2025.
//

import SwiftUI
import CoreData

import SwiftUI

struct ContentView: View {
    @State private var searchText = ""
    
    let food : [FoodModel] = [FoodModel(food: "Spaghetti Bolognese", image: "spagetti" , estimatedTime: "45-60 minutes" , recipes: ["Ground Beef (or plant-based alternative)" , "Spaghetti pasta" , "Canned crushed tomatoes (or diced tomatoes)" , "Onion" , "Garlic" , "Carrots" , "Celery" , "Beef broth (or vegetable broth)" , "Olive oil" , "Herbs (e.g., oregano, basil)" , "Salt, Pepper"]) , FoodModel(food: "Pancakes", image: "pancake" , estimatedTime: "20-30 minutes" , recipes: ["All-Purpose Flour" , "Baking Powder" , "Sugar" , "Salt"  , "Eggs" , "Milk" , "Butter (melted)" , "Maple syrup, fruit, or other toppings (for serving)"]) , FoodModel(food: "Scrambled Eggs", image: "scambledEggs" , estimatedTime: "5-7 minutes", recipes: ["2 large eggs" , "1 tbsp milk or cream (optional)" , "Salt and black pepper to taste" , "1 tsp butter or oil"]) , FoodModel(food: "Classic Grilled Cheese Sandwich", image: "sandWich", estimatedTime: " 8-10 minutes", recipes: ["2 slices of bread (white or sourdough work well)" , "2 slices of cheese (cheddar, American, or Gruyere)" , "1-2 tbsp butter or mayonnaise"]) , FoodModel(food: "Simple Pasta with Marinara Sauce", image: "pasta", estimatedTime: "15-20 minutes", recipes: ["200g (about 2 cups) pasta (spaghetti, penne, or fusilli)" , "1 tbsp olive oil" , "1 clove garlic, minced (optional)" , "400g (14 oz) can crushed tomatoes or jarred marinara sauce" , "Salt and black pepper to taste" , "Fresh basil leaves or grated Parmesan cheese for garnish (optional)"]) , FoodModel(food: "Tuna Salad Sandwich", image: "tunaSalad", estimatedTime: "7 minutes", recipes: ["1 can (about 140g/5 oz) tuna, drained" , "2-3 tbsp mayonnaise (or Greek yogurt for a healthier option)" , "1 stalk celery, finely chopped (optional)", "1/4 small red onion, finely diced (optional)" , "Salt and black pepper to taste" , "2 slices of bread (or lettuce wraps)"]) , FoodModel(food: "Quick Chicken Stir-fry", image: "chickenStirFry", estimatedTime: "25-27 minutes", recipes: ["200g (about 1 chicken breast) boneless, skinless chicken, cut into thin strips" , "1 tbsp soy sauce" , "1 tsp cornstarch" , "1 tbsp vegetable oil" , "1 cup mixed stir-fry vegetables (broccoli florets, bell peppers, carrots, snap peas)" , "2 tbsp stir-fry sauce (store-bought or homemade with soy sauce, ginger, garlic, and a touch of sugar)" , "Cooked rice or noodles for serving"])]
    
    @State private var showSheet = false
    @State private var selectedItem: FoodModel? = nil

    var filteredItems: [FoodModel] {
        if searchText.isEmpty {
            return food
        } else {
            return food.filter { item in
                item.food.lowercased().contains(searchText.lowercased())
            }
        }
    }

    var body: some View {
        NavigationView {
            VStack{
                ScrollView(.vertical , showsIndicators: false){
                    VStack{
                        Text("What are we cooking today 🍳😉")
                            .font(.system(size: 21).bold())
                    }
                    .padding(.bottom , 30)
                    ForEach(filteredItems) { item in
                        Button {
                               selectedItem = item
                               showSheet = true
                            
                                 }label: {
                                     RecipeItems(itemName: item.food, image: item.image , estimatedTime: item.estimatedTime ,recipes: item.recipes )
                         }
                         .buttonStyle(.plain)
                        }
                  
                    .searchable(text: $searchText, prompt: "Search items...")
                }
            }
            .padding()
            .sheet(isPresented: $showSheet) {
                if let item = selectedItem {
                    RecipeViewForSheet(foodModel: item)
                    
                }
           }
        }
    }
}

#Preview {
    ContentView()
}
