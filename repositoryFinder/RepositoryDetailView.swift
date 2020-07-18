//
//  RepositoryDetailView.swift
//  repositoryFinder
//
//  Created by Mariana Beilune Abad on 17/07/20.
//  Copyright © 2020 Mariana Beilune Abad. All rights reserved.
//

import SwiftUI
import URLImage

struct RepositoryDetailView: View {
    
    let repository: Repository
    
    
    var body: some View {
        NavigationView {
            VStack {
                CircleImage(urlToImage: repository.urlToImage)
                HStack {
                    Text(repository.description)
                        .font(.largeTitle)
                        Spacer()
                        Text(repository.ownerName)
                            .font(.subheadline)
                }.padding()
                
            }.navigationBarTitle(repository.repositoryName)
                .navigationBarItems(trailing:
                    Button(action: {
                    // FIXME: salva no Firebase
                    }) {
                        Text("Save")
                })
        }
        
    }
}

struct RepositoryDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RepositoryDetailView(repository: Model.instance.defaultRepo[0])
    }
}
