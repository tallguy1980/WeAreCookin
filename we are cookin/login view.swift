//
//  loginview.swift
//  we are cookin
//
//  Created by DUJUAN PUGH on 3/25/25.
//

import SwiftUI
import AVFoundation

struct LoginView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var isLoggedIn = false
    @State private var showError = false
    
    var body: some View {
        if isLoggedIn {
            ContentView() // Redirect to main content after login
        } else {
            VStack(spacing: 40) {
                Text("We're Cookin'")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.yellow)
                
                VStack(spacing: 20) {
                    TextField("Username", text: $username)
                        .padding()
                        .frame(width: 600, height: 60)
                        .background(Color.gray.opacity(0.3))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .textInputAutocapitalization(.never)
                        .disableAutocorrection(true)
                        
                    SecureField("Password", text: $password)
                        .padding()
                        .frame(width: 600, height: 60)
                        .background(Color.gray.opacity(0.3))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .textInputAutocapitalization(.never)
                        .disableAutocorrection(true)
                        
                    if showError {
                        Text("Invalid username or password.")
                            .foregroundColor(.red)
                            .bold()
                    }
                    
                    Button(action: {
                        authenticateUser()
                    }) {
                        Text("Login")
                            .font(.title2)
                            .bold()
                            .frame(width: 300, height: 70)
                            .background(Color.red)
                            .foregroundColor(.white)
                            .cornerRadius(15)
                    }
                    .buttonStyle(PlainButtonStyle())
                }
                .frame(width: 700)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.black.edgesIgnoringSafeArea(.all))
        }
    }
    
    private func authenticateUser() {
        // Dummy authentication logic (replace with real authentication)
        if username.lowercased() == "admin" && password == "1234" {
            isLoggedIn = true
        } else {
            showError = true
        }
    }
}

#Preview {
    LoginView()
}
