//
//  AccountGrid.swift
//  junkyard
//
//  Created by Olivia McCallum on 30/05/2023.
//

import SwiftUI

struct AccountGrid: View {
    var accountItem: AccountItem
    
    var body: some View {
        Image(accountItem.imageLabel)
            .resizable()
            .frame(maxWidth: 300, maxHeight: 300)
            .clipped()
            .scaledToFit()
            .cornerRadius(10)
            .overlay(RoundedRectangle(cornerRadius: 5)
                .stroke(Color.black, lineWidth: 2))
    }
}

struct AccountGrid_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(allAccountItems) { accountItem in
            AccountGrid(accountItem: accountItem)
        }
    }
}
