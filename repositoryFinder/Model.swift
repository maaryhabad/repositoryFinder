//
//  Model.swift
//  repositoryFinder
//
//  Created by Mariana Beilune Abad on 05/07/20.
//  Copyright © 2020 Mariana Beilune Abad. All rights reserved.
//

import Foundation

class Model {
    static let instance = Model()
    
    private init() {
        
    }
    
    var repositoryDefault = Repository(repositoryName: "DefaultName", description: "DefaultDescription", url: "DefaultURL", ownerName: "DefaultOwnerName", urlToImage: "logo", updatedAt: "Default", stargazersCount: "Default", watchersCount: "Default")
}
