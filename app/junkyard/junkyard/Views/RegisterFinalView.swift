//
//  RegisterFinalView.swift
//  junkyard
//
//  Created by Olivia McCallum on 04/05/2023.
//

import SwiftUI

struct RegisterFinalView: View {
    // empty field to input username
    @State private var username = ""
    
    // value will change based whether user inputs allowed username
    @State private var invalidUsername = 0
    
    // for navigating between screens 
    @State private var showingRFinalScreen = false
    
    var body: some View {
        NavigationStack {
                VStack {
                    Image(systemName: "gearshape.fill")
                        .font(.system(size: 40))
                        .foregroundColor(CustomColor.olive)
                    Text("register")
                        .font(.largeTitle)
                        .bold()
                        .padding()
                    
                    // holding username in a variable
                    TextField("@username", text: $username)
                        .textInputAutocapitalization(.never)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        // change border to white if the invalidUsername variable changes value
                        .border(.white, width: CGFloat(invalidUsername))
                    
                    // only allow sign up if the username is validated by function
                    Button("sign up") {
                        isValidUser(username: username)
                    }
                    .foregroundColor(.white)
                    .frame(width: 300, height: 50)
                    .background(CustomColor.olive)
                    .cornerRadius(10)
                    
                    // once "registered" move to content view
                    .navigationDestination(isPresented: $showingRFinalScreen) {
                        ContentView()
                        .navigationBarBackButtonHidden(true)
                    }
                }
            }
            .navigationBarHidden(true)
    }
    // testing function with "olivia" as the only valid username
    func isValidUser(username: String) {
        if username.lowercased() == "olivia" {
            invalidUsername = 0
            showingRFinalScreen = true
        } else {
            invalidUsername = 2
        }
    }
}

struct RegisterFinalView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterFinalView()
    }
}
