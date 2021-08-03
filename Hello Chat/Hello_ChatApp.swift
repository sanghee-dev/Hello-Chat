//
//  Hello_ChatApp.swift
//  Hello Chat
//
//  Created by leeesangheee on 2021/07/28.
//

import SwiftUI
import Firebase

@main
struct Hello_ChatApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            LoginView().environmentObject(AuthViewModel())
        }
    }
}
