//
//  ChatView.swift
//  junkyard
//
//  Created by Olivia McCallum on 11/05/2023.
//

import SwiftUI

struct ChatView: View {
    @State private var showingAllChats = false
    @State private var messageText = ""
    let userMessages = userResponses
    @State private var currentIndex = 0
    @State var messages: [String] = ["yo yo"]
    @State private var swapped = false
    
    
    var body: some View {
        VStack {
            HStack(alignment: .center) {
                Button {
                    showingAllChats = true
                } label: {
                    Image(systemName: "chevron.left")
                }
                .font(.system(size: 26))
                .foregroundColor(CustomColor.olive)
                .navigationDestination(isPresented: $showingAllChats) {
                    //selectedIndex = 3
                    ContentView()
                        .navigationBarBackButtonHidden(true)
                }
                
                HStack(alignment: .center) {
                    // make this centred
                    Text("Ridhwan Nordin")
                        .font(.system(size: 24))
                    
                    // placeholder for user img
                    Image(systemName: "person")
                        .font(.system(size: 26))
                        .foregroundColor(CustomColor.olive)
                }
                .frame(maxWidth: .infinity, alignment: .center)
            }
            Rectangle()
                .foregroundColor(.white)
                .overlay{
                    HStack {
                        Image("oil-paints")
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(10)
                            .overlay(RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.black, lineWidth: 4))
                            .frame(width: 150, height: 300)
                            .clipped()
                        
                        Spacer()
                    }
                    
                    HStack {
                        Image(systemName: "arrow.left.and.right")
                            .font(.system(size: 40))
                            .foregroundColor(CustomColor.olive)
                    }
                    
                    HStack {
                        Spacer()
                        //!! change img
                        Image("yarn")
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(10)
                            .overlay(RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.black, lineWidth: 4))
                            .frame(width: 150, height: 300)
                            .clipped()
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: 250)
            Divider()
            
            ScrollView {
                ForEach(messages, id: \.self) { message in
                    if message.contains("[USER]") {
                        let newMessage = message.replacingOccurrences(of: "[USER]", with: "")
                        
                        HStack {
                            Spacer()
                            Text(newMessage)
                                .padding()
                                .foregroundColor(.white)
                                .background(CustomColor.olive.opacity(0.8))
                                .cornerRadius(10)
                                .padding(.horizontal, 16)
                                .padding(.bottom, 10)
                        }
                    } else {
                        HStack {
                            Text(message)
                                .padding()
                                .background(.gray.opacity(0.15))
                                .cornerRadius(10)
                                .padding(.horizontal, 16)
                                .padding(.bottom, 10)
                            Spacer()
                        }
                    }
                }.rotationEffect(.degrees(180))
            }.rotationEffect(.degrees(180))
            
            HStack {
                VStack {
                    HStack {
   
                        TextField(userMessages[currentIndex], text: $messageText)
                            .padding()
                            .foregroundColor(.black.opacity(0.5))
                            .background(Color.gray.opacity(0.08))
                            .cornerRadius(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.black, lineWidth: 1)
                            )
//                            .onSubmit {
//
//                            }
                        Button {
                            // index only increases once
                            // placeholder text only changes once
                            sendMessage(message: messageText)
                            currentIndex = (currentIndex + 1) % userMessages.count // when you get to the end wrap around to the beginning
                            messageText = userMessages[currentIndex]
                            print("current index:  \(currentIndex)")
                            print("message text:  \(messageText)")
                        } label: {
                            Image(systemName: "paperplane.fill")
                        }
                        .font(.system(size: 26))
                        .foregroundColor(CustomColor.olive)
                        .padding(.horizontal, 10)
                    }
                    
                    Button("**CONFIRM SWAP**") {
                        swapped.toggle()
                    }
                    .foregroundColor(CustomColor.olive)
                    .frame(width: 200, height: 30)
                    .background(Color.black)
                    .cornerRadius(10)
                    .overlay(RoundedRectangle(cornerRadius: 5)
                        .stroke(Color.black, lineWidth: 4))
                    
                }
                .sheet(isPresented: $swapped) {
                    Rectangle()
                        .overlay{
                            ItemSheet(item: itemsData[0])
                            
                            Rectangle()
                                .foregroundColor(.black)
                                .opacity(0.6)
                                .ignoresSafeArea()
                            
                            Image(systemName: "checkmark.message")
                                .font(.system(size: 150))
                                .foregroundColor(CustomColor.olive)
                        }
                }
                .padding()
            }
        }
    }
    
        func sendMessage(message: String) {
            withAnimation {
                messages.append("[USER]" + message)
                self.messageText = ""
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                withAnimation {
                    messages.append(getBotResponse(message: message))
                }
            }
        }
    }


struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
