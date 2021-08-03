//
//  ProfilePhotoSelectorView.swift
//  Hello Chat
//
//  Created by leeesangheee on 2021/08/03.
//

import SwiftUI

struct ProfilePhotoSelectorView: View {
    @State private var imagePickerPresented = false
    @State private var selectedImage: UIImage?
    @State private var profileImage: Image?
    @ObservedObject var viewModel = AuthViewModel()
    
    var body: some View {
        VStack {
            Button(action: { imagePickerPresented.toggle() }, label: {
                if let profileImage = profileImage {
                    profileImage
                        .resizable()
                        .scaledToFill()
                        .frame(width: 180, height: 180)
                        .clipShape(Circle())
                } else {
                    Image("plus_photo")
                        .resizable()
                        .renderingMode(.template)
                        .scaledToFill()
                        .frame(width: 180, height: 180)
                        .clipped()
                        .padding(.top, 44)
                        .foregroundColor(.black)
                }
            })
            .sheet(isPresented: $imagePickerPresented, onDismiss: loadImage, content: {
                ImagePicker(image: $selectedImage)
            })
            
            Text(profileImage == nil ?
                    "Select a profile photo" :
                    "Tab below to continue")
                .font(.system(size: 16, weight: .semibold))
            
            if profileImage != nil {
                Button(action: {
                    viewModel.uploadProfileImage()
                }, label: {
                    Text("Continue")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 330, height: 50)
                        .background(Color.blue)
                        .clipShape(Capsule())
                        .padding()
                })
                .padding()
                .shadow(color: Color(.systemGray6), radius: 6, x: 0.0, y: 0.0)
            }
            
            Spacer()
        }
        .navigationBarHidden(true)
    }
    
    func loadImage() {
        guard let selectedImage = selectedImage else { return }
        profileImage = Image(uiImage: selectedImage)
    }
}

struct ProfilePhotoSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePhotoSelectorView()
    }
}
