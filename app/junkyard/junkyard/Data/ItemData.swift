//
//  ItemData.swift
//  junkyard
//
//  Created by Olivia McCallum on 27/05/2023.
//

import Foundation
import Combine

struct Item: Identifiable {
    var id: Int
    var imageLabel: String
    var sheetTitle: String
    var fullName: String
    var username: String
    var description: String
    var location: String
    var views: String
    var saves: String
    var posted: String
}

var itemsData = [
    Item(id: 0, imageLabel: "oil-paints", sheetTitle: "Winsor & Newton Oil Paints", fullName: "Ridhwan Nordin", username: "@ridzjcob", description: "i bought this 8 set a few months ago, but they're mostly full except for the white. the paintbrushes haven't seen much love either.", location: "Peckham, London", views: "9 views", saves: "4 saves", posted: "posted 2 hours ago"),
    Item(id: 1, imageLabel: "yarn", sheetTitle: "Recycled Cotton Yarn", fullName: "Meg Negrescu", username: "@meggyweggy", description: "This yarn was handmade by yours truly! I have about 15 but I don't need to part with them all at once. Message me for the colour options too :)", location: "Nunhead, London", views: "25 views", saves: "17 saves", posted: "posted 1 day ago"),
    Item(id: 2, imageLabel: "arduino", sheetTitle: "Brand New Arduino", fullName: "Lindsey Heikki", username: "@he1kk1", description: "an arduino leonardo that has only been used once. if your offer is good i can throw in some LEDs too", location: "Camberwell, London", views: "16 views", saves: "9 saves", posted: "posted 2 days ago"),
    Item(id: 3, imageLabel: "clay", sheetTitle: "Repurposed Clay", fullName: "Rudo Faust", username: "@lilrudo", description: "I've worked these clay scraps back into something usable! You'll need to use within the next 3 days before they dry out again so swap soon", location: "Vauxhall, London", views: "4 views", saves: "1 save", posted: "posted 10 hours ago"),
    Item(id: 4, imageLabel: "paintbrushes", sheetTitle: "Gently Used Paintbrushes", fullName: "Abessa Kumar", username: "@flwrpwr", description: "i was trying to learn watercolours but gave up pretty fast. i'm not looking for a swap for these, you can just pick them up.", location: "Waterloo, London", views: "31 views", saves: "24 saves", posted: "posted 2 days ago"),
    Item(id: 5, imageLabel: "cardboard", sheetTitle: "Cardboard Boxes!!!", fullName: "Dominik Hayter", username: "@domhayt_r", description: "so so many cardboard boxes that you can sculpt with. i've just moved and have nowhere to store them so come collect them fast!", location: "Peckham, London", views: "10 views", saves: "4 saves", posted: "posted 1 hour ago")
]

class ItemData: ObservableObject {
    @Published var items: [Item]
    
    init() {
        self.items = itemsData
    }
}
