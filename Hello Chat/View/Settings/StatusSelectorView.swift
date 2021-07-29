//
//  StatusSelectorView.swift
//  Hello Chat
//
//  Created by leeesangheee on 2021/07/29.
//

import SwiftUI

struct StatusSelectorView: View {
    @State var statusIndex: Int = 0
    
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
                        
                        StatusCell(viewModel: StatusViewModel(rawValue: statusIndex)!)
                    }
                    .padding(.top, 32)

                    
                    VStack(alignment: .leading) {
                        Text("SELECT YOUR STATUS")
                            .font(.system(size: 14))
                            .padding(.leading)
                            .foregroundColor(Color(.systemGray2))
                        
                        VStack(spacing: 1) {
                            CustomDivider(leadingSpace: 0)
                            
                            ForEach(StatusViewModel.allCases
                                        .filter({ $0 != .notConfigured}), id: \.self) { viewModel in
                                Button(action: {}, label: {
                                    StatusCell(viewModel: viewModel)
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

