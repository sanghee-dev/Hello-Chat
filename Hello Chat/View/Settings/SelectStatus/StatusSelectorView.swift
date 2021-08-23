//
//  StatusSelectorView.swift
//  Hello Chat
//
//  Created by leeesangheee on 2021/07/29.
//

import SwiftUI

struct StatusSelectorView: View {
    @ObservedObject var viewModel: EditProfileViewModel
    
    init(_ viewModel: EditProfileViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ZStack {
            Color(.systemGroupedBackground)
                .ignoresSafeArea()
            
            ScrollView {
                VStack(spacing: 32){
                    VStack(alignment: .leading) {
                        Text("CURRENTLY SET TO")
                            .font(.system(size: 14))
                            .padding(.leading)
                            .foregroundColor(Color(.systemGray2))
                        
                        StatusCell(status: viewModel.user.status, isSelected: false)
                    }
                    .padding(.top, 32)

                    
                    VStack(alignment: .leading) {
                        Text("SELECT YOUR STATUS")
                            .font(.system(size: 14))
                            .padding(.leading)
                            .foregroundColor(Color(.systemGray2))
                        
                        VStack(spacing: 1) {
                            CustomDivider(leadingSpace: 0)
                            
                            ForEach(Status.allCases, id: \.self) { status in
                                Button(action: {
                                    viewModel.updateStatus(status)
                                }, label: {
                                    StatusCell(status: status,
                                               isSelected: viewModel.user.status == status)
                                })
                            }
                        }
                        
                    }
                    .padding(.top)
                }
            }
        }
        .showErrorMessage(showAlert: $viewModel.showErrorAlert, message: viewModel.errorMessage)
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Select Status")
    }
}
