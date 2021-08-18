//
//  SettingsView.swift
//  Hello Chat
//
//  Created by leeesangheee on 2021/07/29.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    @State private var showSheet = false
        
    var body: some View {
        ZStack {
            Color(.systemGroupedBackground)
                .ignoresSafeArea()
            
            VStack(spacing: 32) {
                NavigationLink(
                    destination: EditProfileView(),
                    label: { SettingsProfile() })
                
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
                    ActionSheet(title: Text("Log Out"),
                                message: Text("Are you sure you want to log out?"),
                                buttons: [
                                    .destructive( Text("Log Out"), action: { viewModel.signOut() } ),
                                    .cancel( Text("Cancel") )
                                        
                                ])
                }
                
                Spacer()
            }
        }
        
    }
}
