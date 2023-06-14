//
//  splashScreenView.swift
//  junkyard
//
//  Created by Olivia McCallum on 03/05/2023.
//

import SwiftUI

struct SplashScreenView: View {
    // function for executing animation
    @State private var isActive = false
    
    // values that change with the animation
    @State private var size = 0.8
    @State private var opacity = 0.5
    
    var body: some View {
        // after animation is complete, automatically go to login page
        if isActive {
            LoginView()
        } else {
            // background color
            ZStack {
                CustomColor.olive
                    // pushes color to the edges of the screen
                    .ignoresSafeArea()
                VStack {
                    // logo and title of app
                    VStack {
                        Image(systemName: "gearshape.circle.fill")
                            .font(.system(size: 90))
                            .foregroundColor(.black)
                        Text("junkyard")
                            .font(.custom("Lacquer-Regular", size: 54))
                            .foregroundColor(.black.opacity(0.8))
                    }
                    // altering size and opacity for 1.2secs to create animation
                    .scaleEffect(size)
                    .opacity(opacity)
                    .onAppear {
                        withAnimation(.easeIn(duration: 1.2)) {
                            self.size = 0.9
                            self.opacity = 1.0
                        }
                    }
                }
                // adds action to perform before this splashScreenView appears
                .onAppear {
                    // immediately schedules isActive to change to true after 2 seconds
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                        self.isActive = true
                    }
                }
                
            }
        }
        
    }
    
}

struct splashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}

struct CustomColor {
    static let olive = Color("olive")
    // Add more here...
}
