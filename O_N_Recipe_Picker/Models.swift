//
//  Models.swift
//  O_N_Recipe_Picker
//
//  Created by Nnamani Christian on 23/05/2025.
//
import Foundation

struct FoodModel : Identifiable {
    var id = UUID()
    let food : String
    let image : String
    let estimatedTime : String
    let recipes : [String]
}
