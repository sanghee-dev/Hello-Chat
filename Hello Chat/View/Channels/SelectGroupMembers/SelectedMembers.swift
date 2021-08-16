//
//  SelectedMembers.swift
//  Hello Chat
//
//  Created by leeesangheee on 2021/08/16.
//

import SwiftUI

struct SelectedMembers: View {
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(0...5, id: \.self) { _ in
                    ZStack(alignment: .topTrailing) {
                        VStack {
                            Image("profile")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 60, height: 60)
                                .clipShape(Circle())
                                .shadow(color: Color(.systemGray4), radius: 6, x: 0.0, y: 0.0)
                            
                            Text("Username")
                                .font(.system(size: 11, weight: .semibold))
                                .multilineTextAlignment(.center)
                        }.frame(width: 64)
                        
                        Button(action: {
                            print("Deselect user...")
                        }, label: {
                            Image(systemName: "xmark")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 10, height: 10)
                                .padding(4)
                                .foregroundColor(.white)
                                .background(Color(.gray))
                                .clipShape(Circle())
                        })
                    }
                }
            }
        }
        .animation(.spring())
        .padding()
    }
}

struct SelectedMembers_Previews: PreviewProvider {
    static var previews: some View {
        SelectedMembers()
    }
}
