//
//  SearchView.swift
//  junkyard
//
//  Created by Olivia McCallum on 11/05/2023.
//

import SwiftUI

struct SearchView: View {
    @State var searchText = ""
    private var items: [String] {
         let lcItems = allItems.map{ $0.lowercased() }
         return searchText.isEmpty ? lcItems : lcItems.filter { $0.contains(searchText.lowercased()) }
     }
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(items, id: \.self) { item in
                    HStack {
                        Text(item.capitalized)
                        Spacer()
                    }
                }
            }
            .searchable(text: $searchText)            
        }
    }
}


struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
