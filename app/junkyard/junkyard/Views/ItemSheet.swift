//
//  ItemSheetView.swift
//  junkyard
//
//  Created by Olivia McCallum on 27/05/2023.
//

import SwiftUI
//import UserNotifications

struct ItemSheet: View {
    var item: Item
    
    // for controlling buttons
    @State private var isStarFilled = false
    @State private var isSwapped = false
    @State private var isFollowing = false
    @Environment(\.dismiss) var dismiss
    
    // for timing fake message being received
    @State private var isTimerRunning = false
    
    //@StateObject private var notifications = Notifications()
    
    
    var body: some View {
        ZStack{
            Image(item.imageLabel)
                .resizable()
                .scaledToFill()
                .aspectRatio(contentMode: .fill)
            
            VStack(alignment: .leading) {
                VStack(alignment: .leading) {
                    HStack{
                        Button {
                            isStarFilled.toggle()
                        } label: {
                            Image(systemName: isStarFilled ? "star.fill" : "star")
                                .font(.system(size: 50))
                                .foregroundColor(.white)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                    Spacer()
                }
                Spacer()
                    .frame(maxWidth: UIScreen.main.bounds.width - 30)
            }
            
            VStack{
                Spacer()
                
                Rectangle()
                    .foregroundColor(.black)
                    .opacity(0.5)
                    .frame(width: UIScreen.main.bounds.width, height: 400)
                    .alignmentGuide(.bottom) { _ in
                        UIScreen.main.bounds.height - 100
                    }
                    .overlay(
                        
                        VStack(alignment: .leading) {
                            VStack (alignment: .leading) {
                                Text(item.sheetTitle)
                                    .font(.system(size: 45))
                                    .foregroundColor(.white)
                                    .fixedSize(horizontal: false, vertical: true)
                                
                                HStack {
                                    // user img placeholder
                                    Image(systemName: "person.circle")
                                        .font(.system(size: 40))
                                        .foregroundColor(.white)
                                        .frame(maxWidth: 50, maxHeight: 50, alignment: .leading)
                                    VStack(alignment: .leading) {
                                        Text(item.fullName)
                                            .font(.system(size: 15))
                                            .foregroundColor(.white)
                                        
                                        Text(item.username)
                                            .font(.system(size: 15))
                                            .foregroundColor(.white)
                                    }
                                }
                                
                                Spacer()
                                Spacer()
                                
                                Text(item.description)
                                    .font(.system(size: 20))
                                    .foregroundColor(.white)
                                    .fixedSize(horizontal: false, vertical: true)
                            }
                            .frame(maxWidth: UIScreen.main.bounds.width)
                            
                            VStack(alignment: .leading) {
                                Spacer()
                                Spacer()
                                Text(item.location)
                                    .font(.system(size: 20))
                                    .foregroundColor(.white)
                                
                                Text(item.views)
                                    .font(.system(size: 20))
                                    .foregroundColor(.white)
                                
                                Text(item.saves)
                                    .font(.system(size: 20))
                                    .foregroundColor(.white)
                                
                                Text(item.posted)
                                    .font(.system(size: 20))
                                    .foregroundColor(.white)
                            }
                            .frame(maxWidth: UIScreen.main.bounds.width, alignment: .leading)
                            
                            
                            VStack(alignment: .trailing, spacing: 30) {
                                Button {
                                    print("button pressed")
                                    isSwapped.toggle()
                                    // trigger a timer that makes you "receive" a message from Ridhwan Nordin, the offerer
                                    /* how to:
                                     - after time is up...
                                     - add drop down notif alert */
//                                    isTimerRunning = true
                                    
                                    Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { timer in
//                                        notifications.isScheduled = true
//                                        ContentView(notifications: $notifications)
//                                        print("notif is scheduled")
                                        
//                                        isTimerRunning = false
//                                        print("timer done")
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
        .frame(maxWidth: UIScreen.main.bounds.width)
        .edgesIgnoringSafeArea(.all)
    }
}

struct ItemSheet_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(itemsData) { item in
            ItemSheet(item: item)
        }
    }
}
