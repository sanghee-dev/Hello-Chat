//
//  ConversationView.swift
//  Hello Chat
//
//  Created by leeesangheee on 2021/08/02.
//

import SwiftUI

struct ConversationView: View {
    @State private var text = ""
    
    var body: some View {
        VStack {
            ScrollView {
                VStack(spacing: 16) {
                    ForEach((0...5), id: \.self) { _ in
                        ConversationCell(isFromCurrentUser: false)
                        ConversationCell(isFromCurrentUser: true)
                    }
                }
            }
            
            Divider()
            
            HStack {
                TextField("Messages...", text: $text)
                
                Button(action: {}, label: {
                    Image(systemName: "paperplane")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                })
            }
            .padding()
        }
        .navigationTitle("Sanghee")
        .navigationBarTitleDisplayMode(.inline)
        .padding(.vertical)
    }
}

struct ConversationView_Previews: PreviewProvider {
    static var previews: some View {
        ConversationView()
    }
}
