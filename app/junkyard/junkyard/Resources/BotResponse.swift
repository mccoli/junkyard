//
//  BotResponse.swift
//  junkyard
//
//  Created by Olivia McCallum on 11/05/2023.
//

import Foundation

func getBotResponse(message: String) -> String {
    let tempMessage = message.lowercased()
    
    if tempMessage.contains("hi") {
        return "hey"
    } else if tempMessage.contains("interested") {
        return "i've also been looking for some yarn!"
    } else if tempMessage.contains("live") {
        return "should we meet at peckham rye tomorrow at noon?"
    } else if tempMessage.contains("confirm") {
        return "cool see you tomorrow"
    } else if tempMessage.contains("soon"){
        return "bye :)"
    } else {
        return "that's cool"
    }
}
