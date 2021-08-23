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
    @State private var isIndicatorAnimating = false
    @EnvironmentObject var viewModel: AuthViewModel
        
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
                    Image(systemName: "person.circle")
                        .resizable()
                        .renderingMode(.template)
                        .scaledToFill()
                        .frame(width: 100, height: 100)
                        .padding(40)
                        .clipped()
                        .foregroundColor(Color(.systemGray4))
                }
            })
            .padding(.top, 56)
            .padding(.bottom)
            .sheet(isPresented: $imagePickerPresented, onDismiss: loadImage, content: {
                ImagePicker(image: $selectedImage)
            })
            
            Text(profileImage == nil ?
                    "Select a profile photo" :
                    "Tab below to continue")
                .font(.system(size: 16, weight: .semibold))
            
            CapsuleButton(text: "Continue",
                          disabled: profileImage == nil,
                          isAnimating: isIndicatorAnimating,
                          action: {
                            isIndicatorAnimating = true
                            viewModel.uploadProfileImage(selectedImage!)
                          }
            )
            
            Spacer()
        }
        .navigationBarBackButtonHidden(true)
        .showErrorMessage(showAlert: $viewModel.showErrorAlert, message: viewModel.errorMessage)
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
