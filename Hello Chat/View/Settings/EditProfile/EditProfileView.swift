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
    @State private var username = ""
    @State private var showImagePicker = false
    @State private var selectedImage: UIImage?
        
    init(_ viewModel: EditProfileViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ZStack {
            Color(.systemGroupedBackground)
                .ignoresSafeArea()
            
            VStack(spacing: 44) {
                VStack(spacing: 1) {
                    EditProfileCell(viewModel: viewModel,
                                    showImagePicker: $showImagePicker,
                                    selectedImage: $selectedImage)
                    
                    CustomDivider(leadingSpace: 16)
                    
                    EditUsernameCell(viewModel: viewModel,
                                     username: $username)
                }
                .background(Color.white)
                
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
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Edit Profile")
        .modifier(ErrorAlertModifier(showAlert: $viewModel.showingErrorAlert,
                                             message: viewModel.errorMessage))
    }
}
