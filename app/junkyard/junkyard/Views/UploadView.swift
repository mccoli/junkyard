//
//  UploadView.swift
//  junkyard
//
//  Created by Olivia McCallum on 06/05/2023.
//

import SwiftUI

struct UploadView: View {
    // empty fields to hold item information
    @State private var title = ""
    @State private var description = ""
    @State private var uploaded = false
    
    // for uploading image
    @State var changeImage = false
    @State var openCameraRoll = false
    @State var imageSelected = UIImage()
    
    var body: some View {
        ZStack(alignment: .top) {
            ZStack(alignment: .center) {
                Button {
                    changeImage = true
                    openCameraRoll = true
                } label : {
                    if changeImage {
                        Rectangle()
                            .overlay{
                                Image(uiImage: imageSelected)
                                    .resizable()
                            }
                            .frame(maxWidth: .infinity, maxHeight: 250)
                            
                    } else {
                        Rectangle()
                            .foregroundColor(.black)
                            .opacity(0.5)
                            .overlay{
                                ZStack {
                                    Image(systemName: "camera")
                                        .font(.system(size: 60))
                                        .foregroundColor(.black)
                                        .alignmentGuide(HorizontalAlignment.center) { _ in
                                                25
                                            }
                                    Image(systemName: "plus.circle")
                                        .font(.system(size: 32))
                                        .foregroundColor(.black)
                                        .alignmentGuide(HorizontalAlignment.center) { _ in
                                            0.5
                                            }
                                    
                                }
                            }
                        
                        }
                    }
                    .frame(maxWidth: .infinity, maxHeight: 250)
                    
            }.sheet(isPresented: $openCameraRoll) {
                ImagePicker(selectedImage: $imageSelected, sourceType: .photoLibrary)
            }
                
                VStack {
                    Spacer()
                    TextField("Title", text: $title)
                        .padding()
                        .frame(width: UIScreen.main.bounds.width, height: 75)
                        .background(Color.black.opacity(0.05))
                    TextField("Description", text: $description)
                        .padding()
                        .frame(width: UIScreen.main.bounds.width, height: 200)
                        .background(Color.black.opacity(0.05))
                    
                        .padding()
                    Button("**UPLOAD**") {
                        uploaded = true
                    }
                    .foregroundColor(CustomColor.olive)
                    .frame(width: UIScreen.main.bounds.width - 50, height: 50)
                    .background(Color.black)
                    .cornerRadius(10)
                    .overlay(RoundedRectangle(cornerRadius: 5)
                        .stroke(Color.black, lineWidth: 4))
                    
                    .navigationDestination(isPresented: $uploaded) {
                        ContentView()
                            .navigationBarBackButtonHidden(true)
                    }
                }
                .padding(.top, 200)
            }
            
        }
    }

struct UploadView_Previews: PreviewProvider {
    static var previews: some View {
        UploadView()
    }
}
