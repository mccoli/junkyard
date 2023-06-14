//
//  MessagesView.swift
//  junkyard
//
//  Created by Olivia McCallum on 30/05/2023.
//

import SwiftUI

struct MessagesView: View {
    @State private var showChat = false
    
    var body: some View {
        ScrollView {
            Text("chats")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(CustomColor.olive)
            // aligns text to the left
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Divider()
            Rectangle()
                .foregroundColor(.white)
                .frame(width: UIScreen.main.bounds.width, height: 150)
                .overlay{
                    VStack(alignment: .leading) {
                        HStack {
                            // user img placeholder
                            Image(systemName: "person.circle")
                                .font(.system(size: 40))
                            
                            Spacer()
                            
                            VStack(alignment: .leading) {
                                Spacer()
                                Text("**Ridhwan Nordin**")
                                
                                Spacer()
                                
                                Text("**yo yo**")
                                Spacer()
                                Spacer()
                                Spacer()
                                }
                            
                            Spacer()
                            Spacer()
                            Spacer()
                            
                            Button {
                                showChat = true
                            } label: {
                                Image(systemName: "paperplane")
                            }
                            .font(.system(size: 26))
                            .foregroundColor(CustomColor.olive)
                            .navigationDestination(isPresented: $showChat) {
                                ChatView()
                                    .navigationBarBackButtonHidden(true)
                            }
                            Spacer()
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
            Divider()
            
            Rectangle()
                .foregroundColor(.white)
                .frame(width: UIScreen.main.bounds.width, height: 150)
                .overlay{
                    VStack(alignment: .leading) {
                        HStack {
                            // user img placeholder
                            Image(systemName: "person.circle")
                                .font(.system(size: 40))
                            
                            VStack(alignment: .leading) {
                                Spacer()
                                Text("**Matthew Peterson**")
                                
                                Spacer()
                                
                                Text("do you have any 0.5mm knitting needles?")
                                Spacer()
                                Spacer()
                                Spacer()
                            }
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
            Divider()
            
            Rectangle()
                .foregroundColor(.white)
                .frame(width: UIScreen.main.bounds.width, height: 150)
                .overlay{
                    VStack(alignment: .leading) {
                        HStack {
                            // user img placeholder
                            Image(systemName: "person.circle")
                                .font(.system(size: 40))
                            
                            VStack(alignment: .leading) {
                                Spacer()
                                Text("**Ellen Hafner**")
                                
                                Spacer()
                                
                                Text("I actually go to a crochet club on Wednesday nights, you should come! x")
                                Spacer()
                                Spacer()
                                Spacer()
                            }
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
            Divider()
        }
    }
}

struct MessagesView_Previews: PreviewProvider {
    static var previews: some View {
        MessagesView()
    }
}
