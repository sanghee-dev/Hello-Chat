//
//  AuthViewModel.swift
//  Hello Chat
//
//  Created by leeesangheee on 2021/08/02.
//

import UIKit
import Firebase

class AuthViewModel: NSObject, ObservableObject {
    @Published var didAuthenticateUser = false
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    private var tempCurrentUser: Firebase.User? // registration에서 프로필 사진 올리기 전 유저
    
    static let shared = AuthViewModel()
    
    override init() {
        super.init()
        
        userSession = Auth.auth().currentUser
        
        fetchUser()
    }
    
    func login(withEmail email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print("DEBUG: Failed to login with error \(error.localizedDescription)")
                return
            }
            
            guard let user = result?.user else { return }
            self.userSession = user
            self.fetchUser()
        }
    }
    
    func register(withEmail email: String, username: String, fullname: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print("DEBUG: Failed to register with error \(error.localizedDescription)")
                return
            }
            
            guard let user = result?.user else { return }
            self.tempCurrentUser = user
            self.userSession = self.tempCurrentUser
            
            let data: [String: Any] = ["email": email,
                                       "username": username,
                                       "fullname": fullname,
                                       "status": Status.notConfigured.title]
            
            COLLECTION_USERS.document(user.uid).setData(data) { error in
                if let error = error {
                    print("DEBUG: Failed to set user info with error \(error.localizedDescription)")
                    return
                }
                self.didAuthenticateUser = true
            }
        }
    }
    
    func signOut() {
        self.currentUser = nil
        self.userSession = nil
        try? Auth.auth().signOut()
    }
    
    func fetchUser() {
        guard let uid = userSession?.uid else { return }
        
        COLLECTION_USERS.document(uid).getDocument { snapshot, error in
            guard let user = try? snapshot?.data(as: User.self) else { return }
            self.currentUser = user
        }
    }
    
    func uploadProfileImage(_ image: UIImage) {
        guard let uid = tempCurrentUser?.uid else { return }

        ImageUploader.uploadImage(image: image) { imageUrl in
            COLLECTION_USERS.document(uid).updateData(["profileImageUrl" : imageUrl]) { error in
                if let error = error {
                    print("DEBUG: Failed to upload user profile with error \(error.localizedDescription)")
                    return
                }
            }
            print(imageUrl)
            print("DEBUG: Successfully update profile")
            
            self.currentUser?.profileImageUrl = imageUrl
        }
    }
    
    func updateStatus(_ status: Status) {
        guard let uid = userSession?.uid else { return }
        
        COLLECTION_USERS.document(uid).updateData(["status": status.title]) { error in
            if let error = error {
                print("DEBUG: Failed to update status with error \(error.localizedDescription)")
                return
            }
            print("DEBUG: Successfully update status")
        }
        
        currentUser?.status = status.title
    }
    
    func updateUsername(_ username: String) {
        guard let uid = userSession?.uid else { return }
        
        COLLECTION_USERS.document(uid).updateData(["username" : username]) { error in
            if let error = error {
                print("DEBUG: Failed to update status with error \(error.localizedDescription)")
                return
            }
            
            self.currentUser?.username = username
        }
    }
}

