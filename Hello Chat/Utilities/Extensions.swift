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

extension View {
    func showErrorMessage(showAlert: Binding<Bool>, message: String) -> some View {
        self.modifier(ErrorAlertModifier(isPresented: showAlert, message: message))
    }
}

struct ErrorAlertModifier: ViewModifier {
    var isPresented: Binding<Bool>
    let message: String

    func body(content: Content) -> some View {
        content.alert(isPresented: isPresented) {
            Alert(title: Text("Error"),
                  message: Text(message),
                  dismissButton: .cancel(Text("OK")))
        }
    }
}

extension String {
    var isSingleEmoji: Bool {
        if unicodeScalars.count > 2 {
            return false
        }
        
        for scalar in unicodeScalars {
            switch scalar.value {
            case 0x1F600...0x1F64F, // Emoticons
                 0x1F300...0x1F5FF, // Misc Symbols and Pictographs
                 0x1F680...0x1F6FF, // Transport and Map
                 0x2600...0x26FF,   // Misc symbols
                 0x2700...0x27BF,   // Dingbats
                 0xFE00...0xFE0F:   // Variation Selectors
                return true
            default:
                continue
            }
        }
        return false
    }
}

