//
//  ImageUploader.swift
//  Hello Chat
//
//  Created by leeesangheee on 2021/08/03.
//

import UIKit
import Firebase

struct ImageUploader {
    static func uploadImage(image: UIImage, folderName: String, completion: @escaping(String) -> Void) {
        guard let imageData = image.jpegData(compressionQuality: 0.0001) else { return }

        let filename = NSUUID().uuidString
        let ref = Storage.storage().reference(withPath: "/\(folderName)/\(filename)")
                
        ref.putData(imageData, metadata: nil) { _, error in
            ref.downloadURL { url, error in
                guard let imageUrl = url?.absoluteString else { return }
                completion(imageUrl)
            }
        }
    }
}
