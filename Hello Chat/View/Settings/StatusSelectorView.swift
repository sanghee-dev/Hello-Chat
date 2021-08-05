//
//  StatusSelectorView.swift
//  Hello Chat
//
//  Created by leeesangheee on 2021/07/29.
//

import SwiftUI

struct StatusSelectorView: View {
    @ObservedObject var viewModel = StatusViewModel()
    @EnvironmentObject var authViewModel: AuthViewModel
    @Environment(\.presentationMode) var mode
    
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
                        
                        if let statusTitle = authViewModel.currentUser?.status {
                            StatusCell(status: viewModel.getStatus(statusTitle), isSelected: false)
                        }
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
                                    authViewModel.updateStatus(status)
                                    mode.wrappedValue.dismiss()
                                }, label: {
                                    if let statusTitle = authViewModel.currentUser?.status {
                                        StatusCell(status: status, isSelected: status == viewModel.getStatus(statusTitle))
                                    } else {
                                        StatusCell(status: status, isSelected: false)
                                    }
                                })
                            }
                        }
                        
                    }
                    .padding(.top)
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Select Status")
    }
}

struct StatusSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        StatusSelectorView()
    }
}

