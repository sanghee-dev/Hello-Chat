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
    
    func showErrorMessage(_ errorMessage: String) {
        self.showErrorAlert = true
        self.errorMessage = errorMessage
    }
    
    func updateProfileImage(_ image: UIImage) {
        guard let uid = user.id else { return }
        let storagePath = Storage.storage().reference(forURL: user.profileImageUrl)
        storagePath.delete { error in
            if let errorMessage = error?.localizedDescription {
                self.showErrorMessage(errorMessage)
                return
            }
        }
        
        ImageUploader.uploadImage(image: image, folderName: FOLDER_PROFILE_IMAGES) { imageUrl in
            let data: [String: Any] = [KEY_PROFILE_IMAGE_URL: imageUrl]
            COLLECTION_USERS.document(uid).updateData(data) { error in
                if let errorMessage = error?.localizedDescription {
                    self.showErrorMessage(errorMessage)
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
                self.showErrorMessage(errorMessage)
                return
            }
        }
    }
    
    func updateStatus(_ status: Status) {
        guard let uid = user.id else { return }
        let data: [String: Any] = [KEY_STATUS: status.rawValue]
        
        COLLECTION_USERS.document(uid).updateData(data) { error in
            if let errorMessage = error?.localizedDescription {
                self.showErrorMessage(errorMessage)
                return
            }
            self.user.status = status
        }
    }
}
