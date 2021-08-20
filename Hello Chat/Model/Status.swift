//
//  Status.swift
//  Hello Chat
//
//  Created by leeesangheee on 2021/08/04.
//

import Foundation

enum Status: Int, CaseIterable, Codable {
    case available
    case busy
    case urgentCallsOnly
    case batteryLow
    case school
    case work
    case meeting
    case gym
    case movies
    case sleeping
    case coding

    
    var title: String {
        switch self {
        case .available: return "Available"
        case .busy: return "Busy"
        case .urgentCallsOnly: return "Urgent calls only"
        case .batteryLow: return "Battery just to die"
        case .school: return "At school"
        case .work: return "At work"
        case .meeting: return "In a meeting"
        case .gym: return "At the gym"
        case .movies: return "Wating Movies"
        case .sleeping: return "Sleeping"
        case .coding: return "Coding"
        }
    }
}

