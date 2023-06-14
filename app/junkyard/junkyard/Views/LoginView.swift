//
//  LoginView.swift
//  junkyard
//
//  Created by Olivia McCallum on 03/05/2023.
//

import SwiftUI

struct LoginView: View {
    // empty fields to hold user input
    @State private var username = ""
    @State private var password = ""
    
    // values will change based on whether they put in the correct credentials
    @State private var wrongUsername = 0
    @State private var wrongPassword = 0
    
    // for changing between views
    @State private var showingLoginScreen = false
    @State private var showingRegisterScreen = false
    
    var body: some View {
        NavigationStack {
                VStack {
                    Image(systemName: "gearshape")
                        .font(.system(size: 40))
                        .foregroundColor(.black)
                    Text("login")
                        .font(.largeTitle)
                        .bold()
                        .padding()
                    
                    // holding username in a variable
                    TextField("username", text: $username)
                        .textInputAutocapitalization(.never)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        // change border to white if the wrongUsername variable changes value
                        .border(.white, width: CGFloat(wrongUsername))
                    
                    // securefield hides characters and is holding password in a variable
                    SecureField("password", text: $password)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        // change border to white if the wrongPassword variable changes value
                        .border(.white, width: CGFloat(wrongPassword))
                    
                    Button("login") {
                        // ! get rid of back button once ur logged in
                        authenticateUser(username: username, password: password)
                    }
                    
                    .foregroundColor(.white)
                    .frame(width: 300, height: 50)
                    .background(CustomColor.olive)
                    .cornerRadius(10)
                    
                    // once logged in, take you to contentView
                    .navigationDestination(isPresented: $showingLoginScreen) {
                        ContentView()
                        .navigationBarBackButtonHidden(true)
                    }
                    
                    // change value and go to registerView, hide loginView
                    Button("register") {
                        showingRegisterScreen = true
                    }
                    
                    .foregroundColor(.white)
                    .frame(width: 300, height: 50)
                    .background(CustomColor.olive)
                    .cornerRadius(10)
                    
                    .navigationDestination(isPresented: $showingRegisterScreen) {
                        RegisterView()
                        .navigationBarBackButtonHidden(true)
                    }
                }
                
            }
            .navigationBarHidden(true)
            
        }
        
    
    func authenticateUser(username: String, password: String) {
        //insert database here
        if username.lowercased() == "olivia" {
            wrongUsername = 0
            if password.lowercased() == "123" {
                wrongPassword = 0
                showingLoginScreen = true
            } else {
                wrongPassword = 2
            }
        } else {
            wrongUsername = 2
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
