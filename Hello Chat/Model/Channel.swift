//
//  Channel.swift
//  Hello Chat
//
//  Created by leeesangheee on 2021/08/19.
//

import FirebaseFirestoreSwift

struct Channel: Identifiable, Decodable {
    @DocumentID var id: String?
    let name: String
    let imageUrl: String?
    let uids: [String]
    var lastMessage: String
}
