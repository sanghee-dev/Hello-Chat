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
    @State var profileImage: Image?

    var body: some View {
        HStack(spacing: 16) {
            VStack(alignment: .center) {
                Button {
                    showImagePicker.toggle()
                } label: {
                    if let profileImage = profileImage {
                        profileImage
                            .resizable()
                            .scaledToFill()
                            .frame(width: 200, height: 200)
                            .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
                    } else {
                        KFImage(URL(string: viewModel.user.profileImageUrl))
                            .resizable()
                            .scaledToFill()
                            .frame(width: 200, height: 200)
                            .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
                    }
                }.sheet(isPresented: $showImagePicker, onDismiss: loadImage) { ImagePicker(image: $selectedImage) }
            }.padding(44)
        }
    }
    
    func loadImage() {
        guard let selectedImage = selectedImage else { return }
        profileImage = Image(uiImage: selectedImage)
    }
}

