//
//  CustomDivider.swift
//  Hello Chat
//
//  Created by leeesangheee on 2021/07/29.
//

import SwiftUI

struct CustomDivider: View {
    let leadingSpace: CGFloat
    
    var body: some View {
        Divider()
            .background(Color(.systemGray6))
            .padding(.leading, leadingSpace)
    }
}
