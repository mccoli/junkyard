//
//  HomeView.swift
//  junkyard
//
//  Created by Olivia McCallum on 06/05/2023.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var data: ItemData
    
    var body : some View {
        NavigationStack {
            ZStack {
                CustomColor.olive
                    .ignoresSafeArea()
                ScrollView {
                    // rare
                    ScrollView(.horizontal) {
                        Text("rare")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        // aligns text to the left
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.bottom, -0.1)
                        Divider()
                        
//                        Image(systemName: "star.fill")
//                            .font(.system(size: 30))
//                            .foregroundColor(.white)
                        
                        HStack(spacing: 20) {
                            ForEach(data.items.filter { (0...2).contains($0.id) } ) { item in
                                ItemLayout(item: item)
                            }
                        }
                    }
                    
                    // feed
                    Text("feed")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    // aligns text to the left
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.bottom, -0.1)
                    Divider()
                    
                    VStack(spacing: 20) {
                        ForEach(data.items.filter { (3...5).contains($0.id) } ) { item in
                            ItemLayout(item: item)
                        }
                    }
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(ItemData())
    }
}
