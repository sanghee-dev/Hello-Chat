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
            IntroParagraph(title1: profileImage == nil ?
                           "Hello. \(viewModel.tempCurrentUsername)!" :
                           "Great!",
                           title2: profileImage == nil ?
                            "Select your profile image" :
                            "Tab below to continue")
            
            Button(action: { imagePickerPresented.toggle() }, label: {
                if let profileImage = profileImage {
                    profileImage
                        .resizable()
                        .scaledToFill()
                        .frame(width: 240, height: 240)
                        .clipShape(Circle())
                } else {
                    Text("Click here!")
                        .font(.system(size: 18, weight: .semibold))
                        .frame(width: 240, height: 240)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(style: StrokeStyle(lineWidth: 2, dash: [5])))
                }
            })
            .padding(.top, 56)
            .padding(.bottom)
            .sheet(isPresented: $imagePickerPresented, onDismiss: loadImage, content: {
                ImagePicker(image: $selectedImage)
            })
            
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
