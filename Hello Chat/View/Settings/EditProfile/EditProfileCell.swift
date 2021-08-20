//
//  EditProfileCell.swift
//  Hello Chat
//
//  Created by leeesangheee on 2021/08/20.
//

import SwiftUI
import Kingfisher

struct EditProfileCell: View {
    @ObservedObject var viewModel: EditProfileViewModel
    @Binding var showImagePicker: Bool
    @Binding var selectedImage: UIImage?

    var body: some View {
        HStack(spacing: 16) {
            VStack(alignment: .center) {
                KFImage(URL(string: viewModel.user.profileImageUrl))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 48, height: 48)
                    .clipShape(Circle())
                
                Button(action: {
                    showImagePicker.toggle()
                }, label: {
                    Text("Edit")
                        .padding(.bottom, 4)
                })
                .sheet(isPresented: $showImagePicker, onDismiss: loadImage) {
                    ImagePicker(image: $selectedImage)
                }
            }
            .padding(.top)
            
            Text("Enter your name or change your profile photo")
                .foregroundColor(Color(.systemGray3))
        }
    }
    
    func loadImage() {
        //guard let selectedImage = self.selectedImage else { return }
        //
    }
}

