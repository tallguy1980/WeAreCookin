//
//  reciopedetailview.swift
//  we are cookin
//
//  Created by DUJUAN PUGH on 3/25/25.
//

import SwiftUI
import Foundation

struct Recipe: Identifiable {
    let id = UUID()
    let name: String
    let ingredients: [String]
    let instructions: String
    let imageName: String
}

struct RecipeSheetView: View {
    let recipe: Recipe
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Image(recipe.imageName)
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity)
                .cornerRadius(15)
            
            Text("Ingredients")
                .font(.title)
                .bold()
                .foregroundColor(.yellow)
            
            ForEach(recipe.ingredients, id: \.self) { ingredient in
                Text("- \(ingredient)")
                    .font(.title3)
                    .foregroundColor(.white)
                    .padding(.vertical, 2)
            }
            
            Text("Instructions")
                .font(.title)
                .bold()
                .foregroundColor(.yellow)
            
            Text(recipe.instructions)
                .font(.body)
                .foregroundColor(.white)
                .padding(.bottom)
            
            Spacer()
        }
        .padding()
        .background(Color.black.edgesIgnoringSafeArea(.all))
    }
}

#Preview {
    RecipeSheetView(recipe: Recipe(
        name: "Example Dish",
        ingredients: ["Ingredient 1", "Ingredient 2"],
        instructions: "Mix everything together and cook.",
        imageName: "example_image"
    ))
}


struct RecipeDetailView: View {
    let recipe: Recipe
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 15) {
                Image(recipe.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity)
                    .cornerRadius(15)
                
                Text("Ingredients")
                    .font(.title)
                    .bold()
                    .foregroundColor(.yellow)
                
                ForEach(recipe.ingredients, id: \.self) { ingredient in
                    Text("- \(ingredient)")
                        .font(.title3)
                        .foregroundColor(.white)
                        .padding(.vertical, 2)
                }
                
                Text("Instructions")
                    .font(.title)
                    .bold()
                    .foregroundColor(.yellow)
                
                Text(recipe.instructions)
                    .font(.body)
                    .foregroundColor(.white)
                    .padding(.bottom)
            }
            .padding()
        }
        .background(Color.black.edgesIgnoringSafeArea(.all))
        .navigationTitle(recipe.name)
    }
}

#Preview {
    RecipeDetailView(recipe: Recipe(
        name: "Example Dish",
        ingredients: ["Ingredient 1", "Ingredient 2"],
        instructions: "Mix everything together and cook.",
        imageName: "example_image"
    ))
}
