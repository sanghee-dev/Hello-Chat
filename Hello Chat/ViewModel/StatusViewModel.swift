//
//  StatusViewModel.swift
//  Hello Chat
//
//  Created by leeesangheee on 2021/07/29.
//

import Foundation

class StatusViewModel: ObservableObject {
    @Published var status: Status = .notConfigured
    
    func updateStatus(_ status: Status) {
        self.status = status
    }
    
    func getStatus(_ title: String) -> Status {
        switch title {
        case Status.notConfigured.title: return Status.notConfigured
        case Status.available.title: return Status.available
        case Status.busy.title: return Status.busy
        case Status.urgentCallsOnly.title: return Status.urgentCallsOnly
        case Status.batteryLow.title: return Status.batteryLow
        case Status.school.title: return Status.school
        case Status.work.title: return Status.work
        case Status.meeting.title: return Status.meeting
        case Status.gym.title: return Status.gym
        case Status.movies.title: return Status.movies
        case Status.sleeping.title: return Status.sleeping
        case Status.coding.title: return Status.coding
        default: return Status.notConfigured
        }
    }
}
