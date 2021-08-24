//
//  AuthViewModel.swift
//  Hello Chat
//
//  Created by leeesangheee on 2021/08/02.
//

import SwiftUI
import Firebase

class AuthViewModel: NSObject, ObservableObject {
    @Published var didAuthenticateUser = false
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    private var tempCurrentUser: Firebase.User? // registration에서 프로필 사진 올리기 전 유저
    var tempCurrentUsername = ""
    @Published var showErrorAlert = false
    @Published var errorMessage = ""

    static let shared = AuthViewModel()
    
    override init() {
        super.init()
        userSession = Auth.auth().currentUser
        fetchUser()
    }
    
    func fetchUser() {
        guard let uid = userSession?.uid else { return }
        
        COLLECTION_USERS.document(uid).getDocument { snapshot, error in
            if let (errorMessage) = error?.localizedDescription {
                self.showErrorAlert = true
                self.errorMessage = errorMessage
                return
            }
            
            guard let user = try? snapshot?.data(as: User.self) else { return }
            self.currentUser = user
        }
    }
    
    func login(withEmail email: String, password: String) {
        self.errorMessage = ""
        
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let (errorMessage) = error?.localizedDescription {
                self.showErrorAlert = true
                self.errorMessage = errorMessage
                return
            }
                        
            guard let user = result?.user else { return }
            self.userSession = user
            self.fetchUser()
        }
    }
    
    func register(withEmail email: String, username: String, fullname: String, password: String) {
        self.errorMessage = ""
        
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let (errorMessage) = error?.localizedDescription {
                self.showErrorAlert = true
                self.errorMessage = errorMessage
                return
            }
            
            guard let user = result?.user else { return }
            self.tempCurrentUser = user
            self.tempCurrentUsername = username
            
            let data: [String: Any] = [KEY_EMAIL: email,
                                       KEY_USERNAME: username,
                                       KEY_FULLNAME: fullname,
                                       KEY_STATUS: Status.available.rawValue]
            
            COLLECTION_USERS.document(user.uid).setData(data) { error in
                if let errorMessage = error?.localizedDescription {
                    self.showErrorAlert = true
                    self.errorMessage = errorMessage
                    return
                }
                self.didAuthenticateUser = true
            }
        }
    }
    
    func uploadProfileImage(_ image: UIImage) {
        guard let uid = tempCurrentUser?.uid else { return }

        ImageUploader.uploadImage(image: image, folderName: FOLDER_PROFILE_IMAGES) { imageUrl in
            let data: [String: Any] = [KEY_PROFILE_IMAGE_URL : imageUrl]
            COLLECTION_USERS.document(uid).updateData(data) { error in
                if let errorMessage = error?.localizedDescription {
                    self.showErrorAlert = true
                    self.errorMessage = errorMessage
                    return
                }
            }
            
            self.currentUser?.profileImageUrl = imageUrl
            self.userSession = Auth.auth().currentUser
            self.fetchUser()
        }
    }
    
    func signOut() {
        self.didAuthenticateUser = false
        self.currentUser = nil
        self.userSession = nil
        self.tempCurrentUser = nil
        try? Auth.auth().signOut()
    }
    
    func forgotPassword(withEmail email: String) {
        if email == "" {
            self.showErrorAlert = true
            self.errorMessage = "Please enter your email and proceed"
            return
        }
        
        Auth.auth().sendPasswordReset(withEmail: email) { error in
            if let errorMessage = error?.localizedDescription {
                self.showErrorAlert = true
                self.errorMessage = errorMessage
                return
            }
            
            self.showErrorAlert = true
            self.errorMessage = "Check your email and reset password"
        }
    }
}

