//
//  AccountData.swift
//  junkyard
//
//  Created by Olivia McCallum on 30/05/2023.
//

import Foundation
import Combine

struct AccountItem: Identifiable {
    var id: Int
    var imageLabel: String
}

var allAccountItems = [
    AccountItem(id: 0, imageLabel: "felt-wool"),
    AccountItem(id: 1, imageLabel: "ceramic-bowl"),
    AccountItem(id: 2, imageLabel: "scrap-yarns"),
    
    AccountItem(id: 3, imageLabel: "knit-bunny"),
    AccountItem(id: 4, imageLabel: "knit-rabbit"),
    AccountItem(id: 5, imageLabel: "blue-unraveled"),
    
    AccountItem(id: 6, imageLabel: "green-rug"),
    AccountItem(id: 7, imageLabel: "ceramic-mug"),
    AccountItem(id: 8, imageLabel: "wobbly-ceramic")
]

class AccountData: ObservableObject {
    @Published var accountItems: [AccountItem]
    
    init() {
        self.accountItems = allAccountItems
    }
}
