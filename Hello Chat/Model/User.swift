//
//  User.swift
//  Hello Chat
//
//  Created by leeesangheee on 2021/08/04.
//

import FirebaseFirestoreSwift

struct User: Identifiable, Decodable {
    @DocumentID var id: String?
    let email: String
    let username: String
    let fullname: String
    let profileImageUrl: String
    let status: String
}

let MOCK_USER = User(id: "000000",
                     email: "test@gmail.com",
                     username: "Username",
                     fullname: "Fullname",
                     profileImageUrl: "Profile Url",
                     status: "Status")
