//
//  Model.swift
//  repositoryFinder
//
//  Created by Mariana Beilune Abad on 05/07/20.
//  Copyright © 2020 Mariana Beilune Abad. All rights reserved.
//

import Foundation
import Combine
import SwiftUI

class Model: ObservableObject {
    static let instance = Model()
    
    private init() {
        
    }
    
    var defaultRepo = [Repository(repositoryName: "repositoryFinder", description: "App for search in GitHub API", url: "https://api.github.com/repos/maaryhabad/repositoryFinder", ownerName: "maaryhabad", urlToImage: URL(string: "https://avatars0.githubusercontent.com/u/12502572?v=4")!, updatedAt: "2020-07-06T22:20:54Z", stargazersCount: 2, watchersCount: 2)]
    
    @Published var repositories: [Repository] = [
       
    ]
}
