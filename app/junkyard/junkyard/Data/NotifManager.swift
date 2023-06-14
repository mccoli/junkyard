//
//  NotifManager.swift
//  junkyard
//
//  Created by Olivia McCallum on 30/05/2023.
//

import Foundation
import Combine

class Notifications: ObservableObject {
    @Published var isScheduled = false
    
    init() {
        self.isScheduled = isScheduled
    }
}
