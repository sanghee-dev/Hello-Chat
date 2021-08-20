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
    
    init(_ user: User) {
        self.user = user
    }
    
    func updateProfileImage(_ image: UIImage) {
        guard let uid = user.id else { return }
        let storagePath = Storage.storage().reference(forURL: user.profileImageUrl)
        storagePath.delete { error in
            if let error = error {
                print("DEBUG: Failed to delete user profile image \(error.localizedDescription)")
                return
            }
        }
        
        ImageUploader.uploadImage(image: image, folderName: FOLDER_PROFILE_IMAGES) { imageUrl in
            let data: [String: Any] = [KEY_PROFILE_IMAGE_URL: imageUrl]
            COLLECTION_USERS.document(uid).updateData(data) { error in
                if let error = error {
                    print("DEBUG: Failed to upload user profile image \(error.localizedDescription)")
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
            if let error = error {
                print("DEBUG: Failed to update username \(error.localizedDescription)")
                return
            }
        }
    }
    
    func updateStatus(_ status: Status) {
        guard let uid = user.id else { return }
        let data: [String: Any] = [KEY_STATUS: status.rawValue]
        
        COLLECTION_USERS.document(uid).updateData(data) { error in
            if let error = error {
                print("DEBUG: Failed to update status \(error.localizedDescription)")
                return
            }
            
            self.user.status = status
        }
    }
}
