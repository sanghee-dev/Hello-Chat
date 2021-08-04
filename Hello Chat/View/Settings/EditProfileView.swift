//
//  EditProfileView.swift
//  Hello Chat
//
//  Created by leeesangheee on 2021/07/29.
//

import SwiftUI
import Kingfisher

struct EditProfileView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    @State private var username = ""
    
    @State private var showImagePicker = false
    @State private var selectedImage: UIImage?
    @State private var profileImage: Image?
    
    var body: some View {
        ZStack {
            Color(.systemGroupedBackground)
                .ignoresSafeArea()
            
            VStack(spacing: 44) {
                VStack(spacing: 1) {
                    VStack {
                        HStack(spacing: 16) {
                            VStack(alignment: .center) {
                                KFImage(URL(string: viewModel.currentUser?.profileImageUrl ?? ""))
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 48, height: 48)
                                    .clipShape(Circle())
                                
                                Button(action: {
                                    showImagePicker.toggle()
                                }, label: {
                                    Text("Edit")
                                })
                                .sheet(isPresented: $showImagePicker, onDismiss: loadImage) {
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
                            TextField(viewModel.currentUser?.username ?? "Username", text: $username)
                                .padding(.top, 8)
                                                        
                            Spacer()
                            
                            Button(action: {
                                viewModel.updateUsername(username)
                            }, label: {
                                Text("Edit")
                            })
                            .disabled(username.count < 2)
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
                            EditProfileCell(text: viewModel.currentUser?.status ?? "Available")
                        }
                    )
                }
                
                Spacer()
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Edit Profile")
    }
    
    func loadImage() {
        guard let selectedImage = self.selectedImage else { return }
        profileImage = Image(uiImage: selectedImage)
    }
}
