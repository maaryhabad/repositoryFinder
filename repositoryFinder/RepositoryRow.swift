//
//  RepositoryRow.swift
//  repositoryFinder
//
//  Created by Mariana Beilune Abad on 05/07/20.
//  Copyright © 2020 Mariana Beilune Abad. All rights reserved.
//

import SwiftUI
import Combine
import UIKit
import URLImage

struct RepositoryRow: View {
    let repository: Repository
    
    
    var body: some View {
        HStack {
            URLImage(repository.urlToImage,
                     processors: [ Resize(size: CGSize(width: 30, height: 30), scale: UIScreen.main.scale)])
                .aspectRatio(contentMode: .fit)
            
            VStack(alignment: .leading) {
                Text(repository.repositoryName)
                    .font(.title)
                Text(repository.ownerName)
                Text("Último update: ")
                    .font(.caption)
                + Text(repository.updatedAt)
                    .font(.caption)
            }
        }
    }
}


struct RepositoryRow_Previews: PreviewProvider {
    static var previews: some View {
        RepositoryRow(repository: Model.instance.repositories[0])
    }
}
