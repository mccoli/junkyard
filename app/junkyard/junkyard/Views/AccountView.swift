//
//  AccountView.swift
//  junkyard
//
//  Created by Olivia McCallum on 30/05/2023.
//

import SwiftUI

struct AccountView: View {
    @EnvironmentObject var accData: AccountData
    private var imageGrid = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        VStack(alignment: .trailing) {
            HStack {
                // user img placeholder
                Image(systemName: "person.circle")
                    .font(.system(size: 60))
                    .foregroundColor(.black)
                    .frame(maxWidth: 50, maxHeight: 50, alignment: .leading)
                    .padding()
                
                VStack(alignment: .leading) {
                    Text("Lennie Dufort")
                        .font(.largeTitle)
                        .foregroundColor(.black)
                    
                    Text("CAMBERWELL, LONDON")
                        .font(.system(size: 15))
                        .foregroundColor(.black)
                }
                .padding()
                Spacer()
            }
            .padding()
            Divider()
            
            HStack {
                VStack(alignment: .leading) {
                    Text("Mostly giving away knitting yarn from unravelled projects, looking for crochet thread and maybe someone to help me learn :)")
                        .padding(.leading)
                    Divider()
                    
                    ScrollView {
                        LazyVGrid(columns: imageGrid) {
                            ForEach(accData.accountItems) { accountItem in
                                AccountGrid(accountItem: accountItem)
                            }
                        }
                    }
                    
                }
                Spacer()
            }
            Spacer()
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
            .environmentObject(AccountData())
    }
}
