//
//  CreateChannelViewModel.swift
//  Hello Chat
//
//  Created by leeesangheee on 2021/08/19.
//

import UIKit

class CreateChannelViewModel: ObservableObject {
    let users: [User]
    @Published var didCreateChannel = false
    
    init(_ selectableUsers: [SelectableUser]) {
        self.users = selectableUsers.map({ $0.user })
        
        print(users)
    }
    
    func createChannel(name: String, image: UIImage?) {
        guard let currentUser = AuthViewModel.shared.currentUser else { return }
        guard let currentUId = currentUser.id else { return }
        
        var uids = users.compactMap({ $0.id })
        uids.append(currentUId)
        
        var data: [String: Any] = ["name": name,
                                   "uids": uids,
                                   "lastMessage": "\(currentUser.fullname) created a channel"]
        
        if let image = image {
            ImageUploader.uploadImage(image: image) { imageUrl in
                data["imageUrl"] = imageUrl
            }
        }
        
        COLLECTION_CHANNELS.document().setData(data) { error in
            print("DEBUG: Successly upload channel")
            self.didCreateChannel = true
        }
    }
}
