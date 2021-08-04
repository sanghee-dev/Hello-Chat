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
    var username: String
    var fullname: String
    var profileImageUrl: String
    var status: String
}
