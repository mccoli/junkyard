//
//  RegisterView.swift
//  junkyard
//
//  Created by Olivia McCallum on 04/05/2023.
//

import SwiftUI

struct RegisterView: View {
    // empty field for user to input
    @State private var email = ""
    @State private var password = ""
    
    // value will change based on whether user inputs valid address
    @State private var invalidEmail = 0
    
    // for navigating between screens
    @State private var showingRegisterScreen = false
    @State private var showingLoginScreen = false
    
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
                    
                    // holding email address in a variable
                    TextField("email", text: $email)
                        .textInputAutocapitalization(.never)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        // change the border to white if the invalidEmail value changes
                        .border(.white, width: CGFloat(invalidEmail))
                    
                    // securefield hides characters with dots
                    SecureField("password", text: $password)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                    
                    // only go next if the email is proven valid by the function
                    Button("next") {
                        isValidEmail(email)
                    }
                    .foregroundColor(.white)
                    .frame(width: 300, height: 50)
                    .background(CustomColor.olive)
                    .cornerRadius(10)
                    
                    // hide current register screen and move to the final one
                    .navigationDestination(isPresented: $showingRegisterScreen) {
                        RegisterFinalView()
                        .navigationBarBackButtonHidden(true)
                    }
                    
                    // takes user back to login
                    Button("go back") {
                        showingLoginScreen = true
                    }
                    
                    .foregroundColor(.white)
                    .frame(width: 300, height: 50)
                    .background(Color.black)
                    .cornerRadius(10)
                    
                    // hide current register screen and move to login view
                    .navigationDestination(isPresented: $showingLoginScreen) {
                        LoginView()
                        .navigationBarBackButtonHidden(true)
                    }
                }
            }
            .navigationBarHidden(true)
    }
    // modified from https://stackoverflow.com/questions/25471114/how-to-validate-an-e-mail-address-in-swift from Maxim Shoustin and Zandor Smith
    func isValidEmail(_ email: String) {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        let result = emailPred.evaluate(with: email)
        
        // if the email matches the conditions allow the user to proceed
        if result == true {
            invalidEmail = 0
            showingRegisterScreen = true
          // else change the value which triggers the white border
        } else {
           invalidEmail = 2
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
