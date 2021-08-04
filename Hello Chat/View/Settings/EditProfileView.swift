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
    private let user: User
    
    init(user: User) {
        self.user = user
    }
    
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
                                KFImage(URL(string: user.profileImageUrl))
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
                            TextField("", text: .constant(user.username))
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
                            if user.status != Status.notConfigured.title {
                                EditProfileCell(text: user.status)
                            } else {
                                EditProfileCell(text: user.status)
                            }
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
