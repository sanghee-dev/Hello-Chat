//
//  ChatBubble.swift
//  Hello Chat
//
//  Created by leeesangheee on 2021/08/02.
//

import SwiftUI

struct MessageBubble: Shape {
    var isFromCurrentUser: Bool
    var isBubble: Bool
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect,
                                byRoundingCorners: isBubble ? [isFromCurrentUser ? .topLeft : .topRight, .bottomLeft, .bottomRight] :
                                                              [.topLeft, .topRight, .bottomLeft, .bottomRight],
                                cornerRadii: CGSize(width: 12, height: 12))
        
        return Path(path.cgPath)
    }
}
