//
//  HomeView.swift
//  junkyard
//
//  Created by Olivia McCallum on 06/05/2023.
//

import SwiftUI

struct HomeView: View {
    @State private var showingSheet0 = false
    @State private var showingSheet1 = false
    @State private var showingSheet2 = false
    
    var body : some View {
            NavigationStack {
                ZStack {
                    CustomColor.olive
                        .ignoresSafeArea()
                    ScrollView {
                        // rare
                        ScrollView(.horizontal) {
                            Text("rare")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                            // aligns text to the left
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.bottom, -5)
                            
                            Image(systemName: "star.fill")
                                .font(.system(size: 30))
                                .foregroundColor(.white)
                                .position(x: 90, y: -23)
                                .padding(.bottom, -400)

                            }
                            HStack(spacing: 20) {
                                Button {
                                    showingSheet0.toggle()
                                } label: {
                                    Image("oil-paints")
                                        .resizable()
                                        .frame(width: 300, height: 300)
                                        .clipped()
                                        .cornerRadius(10)
                                        .overlay(RoundedRectangle(cornerRadius: 5)
                                        .stroke(Color.white, lineWidth: 4))
                                }
                                // do this dynamically so each sheet isn't hardcoded...ForEach img blah blah
                                .sheet(isPresented: $showingSheet0) {
                                    SheetView0()
                                }

                                Button {
                                    showingSheet1.toggle()
                                } label: {
                                    Image("yarn")
                                        .resizable()
                                        .frame(width: 300, height: 300)
                                        .clipped()
                                        .cornerRadius(10)
                                        .overlay(RoundedRectangle(cornerRadius: 5)
                                        .stroke(Color.white, lineWidth: 4))
                                }
                                // do this dynamically so each sheet isn't hardcoded...ForEach img blah blah
                                .sheet(isPresented: $showingSheet1) {
                                    SheetView1()
                                }

                                Button {
                                    showingSheet2.toggle()
                                } label: {
                                    Image("arduino")
                                        .resizable()
                                        .frame(width: 300, height: 300)
                                        .clipped()
                                        .cornerRadius(10)
                                        .overlay(RoundedRectangle(cornerRadius: 5)
                                        .stroke(Color.white, lineWidth: 4))
                                }
                                // do this dynamically so each sheet isn't hardcoded...ForEach img blah blah
                                .sheet(isPresented: $showingSheet2) {
                                    SheetView2()
                                }
                            }
                        }
                        // feed
                        Text("feed")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        // aligns text to the left
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.bottom, -0.1)
                        
                        VStack(spacing: 40) {
                            Image("clay")
                                .resizable()
                                .frame(width: 350, height: 300)
                                .clipped()
                                .cornerRadius(10)
                                .overlay(RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.white, lineWidth: 4))
                            
                            Image("paintbrushes")
                                .resizable()
                                .frame(width: 350, height: 300)
                                .clipped()
                                .cornerRadius(10)
                                .overlay(RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.white, lineWidth: 4))
                            
                            Image("cardboard")
                                .resizable()
                                .frame(width: 350, height: 300)
                                .clipped()
                                .cornerRadius(10)
                                .overlay(RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.white, lineWidth: 4))
                        }
                    }
                }
            }
        }
    
    struct SheetView0: View {
        // for controlling buttons
        @State private var isStarFilled = false
        @State private var isSwapped = false
        @State private var isFollowing = false
        @Environment(\.dismiss) var dismiss
        
        // for timing fake message being received
        @State private var isTimerRunning = false
        
        var body: some View {
            ZStack{
                Image("oil-paints")
                    .resizable()
                    .scaledToFill()
                    .aspectRatio(contentMode: .fill)
                
                Button("x") {
                    dismiss()
                }
                .font(.system(size: 50))
                .foregroundColor(CustomColor.olive)
                .position(x: 560, y: 35)
                
                Button {
                    isStarFilled.toggle()
                } label: {
                    Image(systemName: isStarFilled ? "star.fill" : "star")
                        .font(.system(size: 50))
                        .foregroundColor(CustomColor.olive)
                        .position(x: 260, y: 40)
                }
                .buttonStyle(PlainButtonStyle())
                
                VStack{
                    Spacer()
                    
                    Rectangle()
                        .foregroundColor(.black)
                        .opacity(0.5)
                        .frame(width: UIScreen.main.bounds.width + 40, height: 400)
                        .alignmentGuide(.bottom) { _ in
                            UIScreen.main.bounds.height - 100
                        }
                        .overlay(
                            
                            VStack(alignment: .leading) {
                                VStack (alignment: .leading){
                                    Text("Winsor & Newton Oil Paints")
                                        .font(.system(size: 45))
                                        .foregroundColor(.white)
                                        .fixedSize(horizontal: false, vertical: true)
                                    
                                    Text("Ridhwan Nordin")
                                        .font(.system(size: 15))
                                        .foregroundColor(.white)
                                        .padding(.horizontal, 75)
                                    
                                    Text("@ridzjcob")
                                        .font(.system(size: 15))
                                        .foregroundColor(.white)
                                        .padding(.horizontal, 75)
                                    
                                    Spacer()
                                    Spacer()
                                    
                                    Text("i bought this 8 set a few months ago, but they're mostly full except for the white. the paintbrushes haven't seen much love either.")
                                        .font(.system(size: 20))
                                        .foregroundColor(.white)
                                        .fixedSize(horizontal: false, vertical: true)
                                }
                                .frame(maxWidth: UIScreen.main.bounds.width)
                                
                                VStack(alignment: .leading) {
                                    Spacer()
                                    Spacer()
                                    Text("Nunhead, London")
                                        .font(.system(size: 20))
                                        .foregroundColor(.white)
                                    
                                    Text("25 views")
                                        .font(.system(size: 20))
                                        .foregroundColor(.white)
                                    
                                    Text("4 saves")
                                        .font(.system(size: 20))
                                        .foregroundColor(.white)
                                    
                                    Text("posted 2hrs ago")
                                        .font(.system(size: 20))
                                        .foregroundColor(.white)
                                }
                                .padding(.leading, 10)
                                
                                
                                VStack(alignment: .trailing, spacing: 30) {
                                    
                                    Button {
                                        isSwapped.toggle()
                                        // trigger a timer that makes you "receive" a message from Ridhwan Nordin, the offerer
                                        /* how to:
                                         - after time is up...
                                         - change messages icon to icon with notif sign
                                         - if the user taps it, change back to normal
                                         - show new message from Ridhwan Bot*/
                                        isTimerRunning = true
                                        
                                        Timer.scheduledTimer(withTimeInterval: 30.0, repeats: false) { timer in
                                            isTimerRunning = false
                                            print("timer done")
                                            // send this data to ContentView so it knows when to change the message icon
                                        }
                                    } label: {
                                        Text(isSwapped ? "PENDING" : "SWAP")
                                            .foregroundColor(.black)
                                            .frame(width: 110, height: 30)
                                            .background(CustomColor.olive)
                                            .cornerRadius(10)
                                    }
                                    
                                    Button {
                                        isFollowing.toggle()
                                    } label: {
                                        Text(isFollowing ? "FOLLOWING" : "FOLLOW")
                                            .foregroundColor(.black)
                                            .frame(width: 110, height: 30)
                                            .background(CustomColor.olive)
                                            .cornerRadius(10)
                                    }
                                    
                                }
                                .frame(maxWidth: UIScreen.main.bounds.width - 40, alignment: .trailing)
                                .position(x: 200, y: -60)
                            }
                            
                        )
                }
            }
            .edgesIgnoringSafeArea(.all)
        }
}
    


struct SheetView1: View {
    // for controlling buttons
    @State private var isStarFilled = false
    @State private var isSwapped = false
    @State private var isFollowing = false
    @Environment(\.dismiss) var dismiss
    
    // for timing fake message being received
    @State private var isTimerRunning = false
    
    var body: some View {
            ZStack{
                Image("yarn")
                    .resizable()
                    .scaledToFill()
                    .aspectRatio(contentMode: .fill)
                
                Button("x") {
                    dismiss()
                }
                .font(.system(size: 50))
                .foregroundColor(.white)
                .position(x: 530, y: 35)
                
                Button {
                    isStarFilled.toggle()
                } label: {
                    Image(systemName: isStarFilled ? "star.fill" : "star")
                        .font(.system(size: 50))
                        .foregroundColor(.white)
                        .position(x: 230, y: 40)
                }
                .buttonStyle(PlainButtonStyle())
                
                VStack{
                    Spacer()
                    
                    Rectangle()
                        .foregroundColor(.black)
                        .opacity(0.5)
                        .frame(width: UIScreen.main.bounds.width + 40, height: 400)
                        .alignmentGuide(.bottom) { _ in
                            UIScreen.main.bounds.height - 100
                        }
                        .overlay(
                            
                            VStack(alignment: .leading) {
                                VStack (alignment: .leading){
                                    Text("Recycled Cotton Yarn")
                                        .font(.system(size: 45))
                                        .foregroundColor(.white)
                                        .fixedSize(horizontal: false, vertical: true)
                                    
                                    Text("Meg Negrescu")
                                        .font(.system(size: 15))
                                        .foregroundColor(.white)
                                        .padding(.horizontal, 75)
                                    
                                    Text("@meggyweggy")
                                        .font(.system(size: 15))
                                        .foregroundColor(.white)
                                        .padding(.horizontal, 75)
                                    
                                    Spacer()
                                    Spacer()
                                    
                                    Text("This yarn was handmade by yours truly! I have about 15 but I don't need to part with them all at once. Message me for the colour options too :)")
                                        .font(.system(size: 20))
                                        .foregroundColor(.white)
                                        .fixedSize(horizontal: false, vertical: true)
                                }
                                .frame(maxWidth: UIScreen.main.bounds.width)
                        
                                VStack(alignment: .leading) {
                                    Spacer()
                                    Spacer()
                                    Text("Nunhead, London")
                                        .font(.system(size: 20))
                                        .foregroundColor(.white)
                                    
                                    Text("25 views")
                                        .font(.system(size: 20))
                                        .foregroundColor(.white)
                                    
                                    Text("17 saves")
                                        .font(.system(size: 20))
                                        .foregroundColor(.white)
                                    
                                    Text("posted 1 day ago")
                                        .font(.system(size: 20))
                                        .foregroundColor(.white)
                                }
                                .padding(.leading, 10)
                                
                                
                                VStack(alignment: .trailing, spacing: 30) {
                                    
                                    Button {
                                        isSwapped.toggle()
                                        // trigger a timer that makes you "receive" a message from Ridhwan Nordin, the offerer
                                        /* how to:
                                            - after time is up...
                                            - change messages icon to icon with notif sign
                                            - if the user taps it, change back to normal
                                            - show new message from Ridhwan Bot*/
                                        isTimerRunning = true
                                        
                                        Timer.scheduledTimer(withTimeInterval: 30.0, repeats: false) { timer in
                                            isTimerRunning = false
                                            print("timer done")
                                            // send this data to ContentView so it knows when to change the message icon
                                        }
                                    } label: {
                                        Text(isSwapped ? "PENDING" : "SWAP")
                                            .foregroundColor(.black)
                                            .frame(width: 110, height: 30)
                                            .background(CustomColor.olive)
                                            .cornerRadius(10)
                                    }
                                                    
                                    Button {
                                        isFollowing.toggle()
                                    } label: {
                                        Text(isFollowing ? "FOLLOWING" : "FOLLOW")
                                            .foregroundColor(.black)
                                            .frame(width: 110, height: 30)
                                            .background(CustomColor.olive)
                                            .cornerRadius(10)
                                    }
                                    
                                }
                                .frame(maxWidth: UIScreen.main.bounds.width - 40, alignment: .trailing)
                                .position(x: 200, y: -60)
                            }
                            
                        )
                }
            }
            .edgesIgnoringSafeArea(.all)
    }
}


struct SheetView2: View {
    // for controlling buttons
    @State private var isStarFilled = false
    @State private var isSwapped = false
    @State private var isFollowing = false
    @Environment(\.dismiss) var dismiss
    
    // for timing fake message being received
    @State private var isTimerRunning = false
    
    var body: some View {
            ZStack{
                Image("arduino")
                    .resizable()
                    .scaledToFill()
                    .aspectRatio(contentMode: .fill)
                
                Button("x") {
                    dismiss()
                }
                .font(.system(size: 50))
                .foregroundColor(CustomColor.olive)
                .position(x: 650, y: 35)
                
                Button {
                    isStarFilled.toggle()
                } label: {
                    Image(systemName: isStarFilled ? "star.fill" : "star")
                        .font(.system(size: 50))
                        .foregroundColor(CustomColor.olive)
                        .position(x: 360, y: 40)
                }
                .buttonStyle(PlainButtonStyle())
                
                VStack{
                    Spacer()
                    
                    Rectangle()
                        .foregroundColor(.black)
                        .opacity(0.5)
                        .frame(width: UIScreen.main.bounds.width + 50, height: 400)
                        .alignmentGuide(.bottom) { _ in
                            UIScreen.main.bounds.height - 100
                        }
                        .overlay(
                            
                            VStack(alignment: .leading) {
                                VStack (alignment: .leading){
                                    Text("Brand New Arduino")
                                        .font(.system(size: 45))
                                        .foregroundColor(.white)
                                        .fixedSize(horizontal: false, vertical: true)
                                    
                                    Text("Lindsey Heikki")
                                        .font(.system(size: 15))
                                        .foregroundColor(.white)
                                        .padding(.horizontal, 75)
                                    
                                    Text("@he1kk1")
                                        .font(.system(size: 15))
                                        .foregroundColor(.white)
                                        .padding(.horizontal, 75)
                                    
                                    Spacer()
                                    Spacer()
                                    
                                    Text("an arduino leonardo that has only been used once. if your offer is good i can throw in some LEDs too")
                                        .font(.system(size: 20))
                                        .foregroundColor(.white)
                                        .fixedSize(horizontal: false, vertical: true)
                                }
                                .frame(maxWidth: UIScreen.main.bounds.width)
                        
                                VStack(alignment: .leading) {
                                    Spacer()
                                    Spacer()
                                    Text("Camberwell, London")
                                        .font(.system(size: 20))
                                        .foregroundColor(.white)
                                    
                                    Text("16 views")
                                        .font(.system(size: 20))
                                        .foregroundColor(.white)
                                    
                                    Text("9 saves")
                                        .font(.system(size: 20))
                                        .foregroundColor(.white)
                                    
                                    Text("posted 2 days ago")
                                        .font(.system(size: 20))
                                        .foregroundColor(.white)
                                }
                                .padding(.leading, 10)
                                
                                
                                VStack(alignment: .trailing, spacing: 30) {
                                    
                                    Button {
                                        isSwapped.toggle()
                                        // trigger a timer that makes you "receive" a message from Ridhwan Nordin, the offerer
                                        /* how to:
                                            - after time is up...
                                            - change messages icon to icon with notif sign
                                            - if the user taps it, change back to normal
                                            - show new message from Ridhwan Bot*/
                                        isTimerRunning = true
                                        
                                        Timer.scheduledTimer(withTimeInterval: 30.0, repeats: false) { timer in
                                            isTimerRunning = false
                                            print("timer done")
                                            // send this data to ContentView so it knows when to change the message icon
                                        }
                                    } label: {
                                        Text(isSwapped ? "PENDING" : "SWAP")
                                            .foregroundColor(.black)
                                            .frame(width: 110, height: 30)
                                            .background(CustomColor.olive)
                                            .cornerRadius(10)
                                    }
                                                    
                                    Button {
                                        isFollowing.toggle()
                                    } label: {
                                        Text(isFollowing ? "FOLLOWING" : "FOLLOW")
                                            .foregroundColor(.black)
                                            .frame(width: 110, height: 30)
                                            .background(CustomColor.olive)
                                            .cornerRadius(10)
                                    }
                                    
                                }
                                .frame(maxWidth: UIScreen.main.bounds.width - 40, alignment: .trailing)
                                .position(x: 200, y: -60)
                            }
                            
                        )
                }
            }
            .edgesIgnoringSafeArea(.all)
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
