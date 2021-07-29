//
//  EditProfileView.swift
//  Hello Chat
//
//  Created by leeesangheee on 2021/07/29.
//

import SwiftUI

struct EditProfileView: View {
    var body: some View {
        ZStack {
            Color(.systemGroupedBackground)
                .ignoresSafeArea()
            
            VStack(alignment: .leading) {
                VStack {
                    VStack {
                        HStack {
                            VStack(alignment: .center) {
                                Image("profile")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 48, height: 48)
                                    .clipShape(Circle())
                                
                                Button(action: {}, label: {
                                    Text("Edit")
                                })
                            }
                            .padding(.leading)
                            
                            Text("Enter your name or change your profile photo")
                        }
                        
                        Divider()
                            .padding(.leading, 56)
                    }

                    VStack {
                        HStack {
                            Text("Block")
                                .font(.system(size: 16))
                            
                            Spacer()
                        }
                        .padding([.top, .horizontal])
                        
                        Divider()
                            .padding(.leading, 56)
                    }
                    .background(Color.white)
                    
                }
                .background(Color.white)
                
                Text("Status")
                
                VStack {
                    HStack {
                        Text("Available")
                            .font(.system(size: 16))
                            .foregroundColor(.blue)
                        
                        Spacer()
                        
                        Button(action: {}, label: {
                            Image(systemName: "chevron.forward")
                        })
                        .foregroundColor(Color(.systemGray4))
                    }
                    .padding([.top, .horizontal])
                    
                    Divider()
                        .padding(.leading, 56)
                }
                .background(Color.white)
                
                Spacer()
            }
        }
    }
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView()
    }
}
