//
//  IntroParagraph.swift
//  Hello Chat
//
//  Created by leeesangheee on 2021/07/28.
//

import SwiftUI

struct IntroParagraph: View {
    let title1: String
    let title2: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack { Spacer() }
            
            Text(title1)
                .font(.largeTitle)
                .bold()
            
            Text(title2)
                .font(.largeTitle)
                .bold()
                .foregroundColor(.blue)
        }
        .padding(.leading)
    }
}
