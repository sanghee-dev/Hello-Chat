//
//  EditProfileViewModel.swift
//  Hello Chat
//
//  Created by leeesangheee on 2021/08/21.
//

import UIKit
import Firebase

class EditProfileViewModel: ObservableObject {
    @Published var user: User
    @Published var showErrorAlert = false
    @Published var errorMessage = ""
    
    init(_ user: User) {
        self.user = user
    }
    
    func getButtonLabel(image: UIImage?, username: String) -> String {
        if (image != nil || username != user.username && username != "") {
            return "Done"
        }
        return ""
    }
    
    func updateProfile(image: UIImage?, username: String) {
        if let image = image {
            updateProfileImage(image)
            
        }
        if (username != "" && username != user.username) {
            updateUsername(username)
        }
    }
        
    func updateProfileImage(_ image: UIImage) {
        guard let uid = user.id else { return }
        let storagePath = Storage.storage().reference(forURL: user.profileImageUrl)
        storagePath.delete { error in
            if let errorMessage = error?.localizedDescription {
                self.showErrorAlert = true
                self.errorMessage = errorMessage
                return
            }
        }
        
        ImageUploader.uploadImage(image: image, folderName: FOLDER_PROFILE_IMAGES) { imageUrl in
            let data: [String: Any] = [KEY_PROFILE_IMAGE_URL: imageUrl]
            COLLECTION_USERS.document(uid).updateData(data) { error in
                if let errorMessage = error?.localizedDescription {
                    self.showErrorAlert = true
                    self.errorMessage = errorMessage
                    return
                }
                self.user.profileImageUrl = imageUrl
            }
        }
    }
    
    func updateUsername(_ username: String) {
        guard let uid = user.id else { return }
        let data: [String: Any] = [KEY_USERNAME: username]
        
        COLLECTION_USERS.document(uid).updateData(data) { error in
            if let errorMessage = error?.localizedDescription {
                self.showErrorAlert = true
                self.errorMessage = errorMessage
                return
            }
        }
    }
    
    func updateStatus(_ status: Status) {
        guard let uid = user.id else { return }
        let data: [String: Any] = [KEY_STATUS: status.rawValue]
        
        COLLECTION_USERS.document(uid).updateData(data) { error in
            if let errorMessage = error?.localizedDescription {
                self.showErrorAlert = true
                self.errorMessage = errorMessage
                return
            }
            self.user.status = status
        }
    }
}
