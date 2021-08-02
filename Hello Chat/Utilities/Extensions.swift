//
//  Extensions.swift
//  Hello Chat
//
//  Created by leeesangheee on 2021/08/02.
//

import SwiftUI

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
