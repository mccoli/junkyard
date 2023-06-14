//
//  ContentView.swift
//  junkyard
//
//  Created by Olivia McCallum on 04/05/2023.
//

import SwiftUI

struct TabItem {
    // put icons in here ? or maybe an enum with the cases
}

struct ContentView: View {
    // keep track of what the user has clicked on and what is showing
    @State var selectedIndex = 0
    @EnvironmentObject var data: ItemData
    @EnvironmentObject var accData: AccountData
    
    //@Binding var notifications: Notifications
    
    // SF icons values
    let icons = [
        "house",
        "magnifyingglass",
        "plus",
        "message",
        "person"
    ]
    
    var body: some View {
        VStack(spacing: 0) {
            // Content
            ZStack {
                // using the icons as cases to go to different views
                switch selectedIndex {
                case 0:
                    HomeView()
                        .environmentObject(ItemData())
                case 1:
                    SearchView()
                case 2:
                    UploadView()
                case 3:
                    MessagesView()
                default:
                    AccountView()
                        .environmentObject(AccountData())
                }
            }
            
            // the lil grey line :3
            Divider()
            // added because in dark mode the spacing was kind of off
                .padding(.bottom, 20)
            // from Tab Bar tutorial https://www.youtube.com/watch?v=zdSBVQwIRr0
            HStack(spacing: 0){
                // from 0 up to 5, (length of icons array) set a unique identifier, and iterate
                ForEach(0..<5, id: \.self) { number in
                    Spacer()
                    Button {
                        // change the index to whatever is the current number to switch between cases
                        self.selectedIndex = number
                        // sets images by going through the icons array via the ForEach loop
                    } label : {
                        if number == 2 {
                            // different look for upload button
                            Image(systemName: icons[number])
                                .font(.system(size: 25,
                                              weight: .regular,
                                              design: .default))
                                .foregroundColor(.white)
                                .frame(width: 50, height: 20)
                                .padding()
                                .background(CustomColor.olive)
                                .cornerRadius(20)
                            /* trying to:
                                - if notif status is true
                                - change message icon to message.badge
                                ! can't check if working because any print inside the if statement throws an error*/
//                            if notifications.isScheduled == true && number == 3 {
//                                    Image(systemName: "message.badge")
//                                        .font(.system(size: 25,
//                                                      weight: .regular,
//                                                      design: .default))
//                                        .foregroundColor(.white)
//                                        .frame(width: 50, height: 20)
//                                        .padding()
//                                        .background(CustomColor.olive)
//                                        .cornerRadius(20)
//                            }
                        }
                        else {
                            Image(systemName: icons[number])
                                .font(.system(size: 25,
                                              weight: .regular,
                                              design: .default))
                            // if index and current number are equal, give icon dynamic color, otherside use light gray to show it is not selected
                                .foregroundColor(selectedIndex == number ? Color(.label) : Color(UIColor.lightGray))
                        }
                    }
                    Spacer()
                }
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            //.environmentObject(Notifications())
            .environmentObject(ItemData())
            .environmentObject(AccountData())
    }
}
