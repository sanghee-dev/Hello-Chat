//
//  ChannelsViewModel.swift
//  Hello Chat
//
//  Created by leeesangheee on 2021/08/19.
//

import Foundation

class ChannelsViewModel: ObservableObject {
    @Published var channels = [Channel]()
    
    init() {
        fetchChannels()
    }
    
    func fetchChannels() {
        guard let uid = AuthViewModel.shared.currentUser?.id else { return }
        
        COLLECTION_CHANNELS.whereField("uids", arrayContains: uid).getDocuments { snapshot, error in
            guard let documents = snapshot?.documents else { return }
            self.channels = documents.compactMap({ try? $0.data(as: Channel.self) })
        }
    }
}
