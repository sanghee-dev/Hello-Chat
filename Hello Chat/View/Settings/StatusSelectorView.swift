//
//  StatusSelectorView.swift
//  Hello Chat
//
//  Created by leeesangheee on 2021/07/29.
//

import SwiftUI

struct StatusSelectorView: View {
    @State var status: String = "Available"
    
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
                        
                        VStack(spacing: 1) {
                            HStack {
                                Text("Available")
                                
                                Spacer()
                            }
                            .padding()
                            
                            CustomDivider(leadingSpace: 16)
                        }
                        .background(Color.white)
                    }
                    .padding(.top, 32)
                    
                    VStack(alignment: .leading) {
                        Text("SELECT YOUR STATUS")
                            .font(.system(size: 14))
                            .padding(.leading)
                            .foregroundColor(Color(.systemGray2))
                        
                        VStack(spacing: 1) {
                            CustomDivider(leadingSpace: 0)
                            
                            ForEach((0...10), id: \.self) { _status in
                                VStack(spacing: 1) {
                                    HStack {
                                        Text("Available")
                                        
                                        Spacer()
                                    }
                                    .padding()
                                    
                                    CustomDivider(leadingSpace: 16)
                                }
                                .background(Color.white)
                            }
                            //
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
