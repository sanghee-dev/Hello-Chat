//
//  SettingsView.swift
//  Hello Chat
//
//  Created by leeesangheee on 2021/07/29.
//

import SwiftUI

struct SettingsView: View {
    @ObservedObject var viewModel: EditProfileViewModel
    @State private var showSheet = false
    
    init(_ user: User) {
        self.viewModel = EditProfileViewModel(user)
    }
        
    var body: some View {
        ZStack {
            Color(.systemGroupedBackground)
                .ignoresSafeArea()
            
            VStack(spacing: 32) {
                NavigationLink(
                    destination: EditProfileView(viewModel),
                    label: { SettingsProfile(viewModel.user) })
                
                VStack(spacing: 1) {                    
                    ForEach(SettingsCellViewModel.allCases, id: \.self) { viewModel in
                        Button(action: {}, label: {
                            SettingsCell(viewModel: viewModel)
                        })
                    }
                }
                
                Button(action: { self.showSheet = true },
                       label: { Text("Log Out") }
                )
                .foregroundColor(.red)
                .font(.system(size: 16, weight: .semibold))
                .frame(width: UIScreen.main.bounds.width, height: 50)
                .background(Color.white)
                .actionSheet(isPresented: $showSheet) {
                    ActionSheet(title: Text("Log out"),
                                message: Text("Are you sure you want to log out?"),
                                buttons: [
                                    .destructive( Text("Log Out"), action: { AuthViewModel.shared.signOut() } ),
                                    .cancel( Text("Cancel") )
                                ])
                }
                
                Spacer()
            }
        }
        .modifier(ErrorAlertModifier(showAlert: $viewModel.showErrorAlert,
                                             message: viewModel.errorMessage))
    }
}
