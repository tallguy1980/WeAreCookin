//
//  ContentView.swift
//  we are cookin
//
//  Created by DUJUAN PUGH on 3/25/25.
//

import SwiftUI

struct ContentView: View {
    let recipes: [Recipe] = [
        Recipe(name: "Greek Salad",
               ingredients: ["Cucumber", "Tomato", "Feta Cheese", "Olives", "Olive Oil", "Oregano"],
               //
               instructions: "Chop all vegetables. Mix in a bowl. Add feta, olives, and drizzle with olive oil. Sprinkle oregano on top.",
               imageName: "greeksalad"),
        
        Recipe(name: "Hummus",
               ingredients: ["Chickpeas", "Tahini", "Garlic", "Lemon Juice", "Olive Oil", "Salt"],
               instructions: "Blend all ingredients until smooth. Serve with pita bread.",
               imageName: "hummus"),
        
        Recipe(name: "Shakshuka",
               ingredients: ["Eggs", "Tomatoes", "Onions", "Garlic", "Bell Peppers", "Paprika", "Cumin"],
               instructions: "Sauté onions, garlic, and bell peppers. Add tomatoes and spices. Simmer. Crack eggs and cook until set.",
               imageName: "shakshuka"),
        
        Recipe(name: "Sushi Rolls",
               ingredients: ["Sushi Rice", "Nori", "Fresh Fish", "Cucumber", "Avocado", "Soy Sauce"],
               instructions: "Spread rice on nori. Add fillings. Roll tightly. Slice and serve with soy sauce.",
               imageName: "sushi"),
        
        Recipe(name: "Chicken Tikka Masala",
               ingredients: ["Chicken", "Yogurt", "Tomato Sauce", "Garlic", "Ginger", "Spices"],
               instructions: "Marinate chicken in yogurt and spices. Cook with tomato sauce until tender. Serve with rice or naan.",
               imageName: "tikka_masala"),
        
        Recipe(name: "Tacos Al Pastor",
               ingredients: ["Pork", "Pineapple", "Onions", "Cilantro", "Tortillas", "Chili Peppers"],
               instructions: "Marinate pork with spices and pineapple. Grill and serve in tortillas with onions and cilantro.",
               imageName: "tacos"),
        
        Recipe(name: "Margherita Pizza",
               ingredients: ["Pizza Dough", "Tomato Sauce", "Mozzarella", "Basil", "Olive Oil"],
               instructions: "Spread sauce on dough. Add mozzarella and basil. Bake at high heat until crispy.",
               imageName: "margherita_pizza")
    ]
    
    @State private var selectedRecipe: Recipe?
    @State private var isShowingSheet = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    ForEach(recipes) { recipe in
                        Button(action: {
                            selectedRecipe = recipe
                            isShowingSheet = true
                        }) {
                            HStack(spacing: 20) {
                                Image(recipe.imageName)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 250, height: 250)
                                    .cornerRadius(15)
                                Text(recipe.name)
                                    .font(.largeTitle)
                                    .bold()
                                    .foregroundColor(.white)
                                    .padding()
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(Color.red.opacity(0.7))
                            .cornerRadius(15)
                            .padding(.horizontal)
                        }
                    }
                }
                .padding(.top)
            }
            .navigationTitle("World Recipes")
            .background(Color.black.edgesIgnoringSafeArea(.all))
            .sheet(isPresented: $isShowingSheet) {
                if let recipe = selectedRecipe {
                    RecipeSheetView(recipe: recipe)
                }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

#Preview {
    ContentView()
}


