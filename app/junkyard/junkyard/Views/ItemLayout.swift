//
//  ItemLayout.swift
//  junkyard
//
//  Created by Olivia McCallum on 27/05/2023.
//

import SwiftUI

struct ItemLayout: View {
    var item: Item
    
    @State var selectedItem: Item? = nil
    @State var showingSheet = false
    
    var body: some View {
        NavigationStack {
            Button {
                selectedItem = item
                showingSheet.toggle()
            } label: {
                Image(item.imageLabel)
                    .resizable()
                    .frame(width: 300, height: 300)
                    .clipped()
                    .cornerRadius(10)
                    .overlay(RoundedRectangle(cornerRadius: 5)
                        .stroke(Color.white, lineWidth: 4))
            }
        }
        .sheet(item: $selectedItem) { selectedItem in
            ItemSheet(item: selectedItem)
        }
    }
}

struct ItemLayout_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(itemsData) { item in
            ItemLayout(item: item)
        }
    }
}
