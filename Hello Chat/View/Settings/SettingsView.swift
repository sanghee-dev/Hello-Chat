//
//  SettingsView.swift
//  Hello Chat
//
//  Created by leeesangheee on 2021/07/29.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var viewModel: AuthViewModel
        
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
                
                Button(action: {
                    viewModel.signOut()
                }, label: {
                    Text("Log Out")
                })
                .foregroundColor(.red)
                .font(.system(size: 16, weight: .semibold))
                .frame(width: UIScreen.main.bounds.width, height: 50)
                .background(Color.white)
                
                Spacer()
            }
        }
        
    }
}
