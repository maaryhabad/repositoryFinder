//
//  RepositoryRow.swift
//  repositoryFinder
//
//  Created by Mariana Beilune Abad on 05/07/20.
//  Copyright © 2020 Mariana Beilune Abad. All rights reserved.
//

import SwiftUI


struct RepositoryRow: View {
    let repository: Repository
    
    
    var body: some View {
        HStack {
            Image(repository.urlToImage)
                .frame(width: 100, height: 100, alignment: .center)
                .scaledToFit()
                .clipped()
            VStack(alignment: .leading) {
                Text(repository.repositoryName)
                    .font(.largeTitle)
                Text(repository.ownerName)
                        .font(.title)
                Text(repository.updatedAt)
            }
        }
    }
}


struct RepositoryRow_Previews: PreviewProvider {
    static var previews: some View {
        RepositoryRow(repository: Model.instance.repositories[0])
    }
}
