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
                Text(repository.ownerName)
                    .font(.largeTitle)
                Text(repository.repositoryName)
                        .font(.title)
                Text(repository.updatedAt)
            }
        }
    }
}


struct RepositoryRow_Previews: PreviewProvider {
    static var previews: some View {
        RepositoryRow(repository: Model.instance.repositoryDefault)
    }
}
