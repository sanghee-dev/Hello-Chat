//
//  EditProfileView.swift
//  Hello Chat
//
//  Created by leeesangheee on 2021/07/29.
//

import SwiftUI

struct EditProfileView: View {
    @State private var fullname = "Cat"
    @State private var showImagePicker = false
    @State private var selectedImage: UIImage?
    
    var body: some View {
        ZStack {
            Color(.systemGroupedBackground)
                .ignoresSafeArea()
            
            VStack(spacing: 44) {
                VStack(spacing: 1) {
                    VStack {
                        HStack(spacing: 16) {
                            VStack(alignment: .center) {
                                Image("profile")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 48, height: 48)
                                    .clipShape(Circle())
                                
                                Button(action: {
                                    showImagePicker.toggle()
                                }, label: {
                                    Text("Edit")
                                })
                                .sheet(isPresented: $showImagePicker, onDismiss: nil) {
                                    ImagePicker(image: $selectedImage)
                                }
                            }
                            .padding(.top)
                            
                            Text("Enter your name or change your profile photo")
                                .foregroundColor(Color(.systemGray3))
                        }
                        
                        CustomDivider(leadingSpace: 16)
                    }
                    
                    VStack {
                        HStack {
                            TextField("", text: $fullname)
                                .padding(.vertical, 8)
                            
                            Spacer()
                        }
                        .padding([.horizontal])
                        
                        CustomDivider(leadingSpace: 16)
                    }
                    .background(Color.white)
                }
                .background(Color.white)
                
                VStack(alignment: .leading, spacing: 1) {
                    Text("Status")
                        .padding([.leading, .bottom])
                        .foregroundColor(Color(.systemGray))
                    
                    NavigationLink(
                        destination: StatusSelectorView(),
                        label: {
                            EditProfileCell(text: "Available")
                        }
                    )
                }
                
                Spacer()
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Edit Profile")
    }
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView()
    }
}
