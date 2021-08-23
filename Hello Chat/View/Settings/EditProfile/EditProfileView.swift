//
//  EditProfileView.swift
//  Hello Chat
//
//  Created by leeesangheee on 2021/07/29.
//

import SwiftUI
import Kingfisher

struct EditProfileView: View {
    @ObservedObject var viewModel: EditProfileViewModel
    @Environment(\.presentationMode) var mode
    @State private var showImagePicker = false
    @State private var selectedImage: UIImage?
    @State private var username = AuthViewModel.shared.currentUser?.username ?? ""
        
    init(_ viewModel: EditProfileViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ZStack {
            Color(.systemGroupedBackground).ignoresSafeArea()
            
            VStack(spacing: 44) {
                VStack(spacing: 1) {
                    EditProfileCell(viewModel: viewModel,
                                    showImagePicker: $showImagePicker,
                                    selectedImage: $selectedImage)
                    
                    CustomDivider(leadingSpace: 16)
                    
                    EditUsernameCell(viewModel: viewModel,
                                     username: $username)
                }.background(Color.white)
                
                VStack(alignment: .leading, spacing: 1) {
                    Text("Status")
                        .padding([.leading, .bottom])
                        .foregroundColor(Color(.systemGray))
                    
                    NavigationLink(
                        destination: StatusSelectorView(viewModel),
                        label: {
                            EditStatusCell(text: viewModel.user.status.title)
                        }
                    )
                }
                
                Spacer()
            }
        }
        .showErrorMessage(showAlert: $viewModel.showErrorAlert, message: viewModel.errorMessage)
        .navigationBarItems(trailing: DoneButton)
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Edit Profile")
    }

    var DoneButton: some View {
        Button {
            viewModel.updateProfile(image: selectedImage, username: username)
            mode.wrappedValue.dismiss()
        } label: {
            Text(viewModel.getButtonLabel(image: selectedImage, username: username))
                .font(.system(size: 16, weight: .semibold))
        }
    }
}
