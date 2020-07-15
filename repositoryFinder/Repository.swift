//
//  Repository.swift
//  repositoryFinder
//
//  Created by Mariana Beilune Abad on 05/07/20.
//  Copyright © 2020 Mariana Beilune Abad. All rights reserved.
//

import Foundation
import Combine

class Repository: ObservableObject, Identifiable {
    
    var id = UUID()
    var repositoryName: String
    var description: String
    var url: String
    var ownerName: String
    var urlToImage: String
    var updatedAt: String
    var stargazersCount: Int
    var watchersCount: Int 
    
    init(repositoryName: String, description: String, url: String, ownerName: String, urlToImage: String, updatedAt: String, stargazersCount: Int, watchersCount: Int) {
        self.repositoryName = repositoryName
        self.description = description
        self.url = url
        self.ownerName = ownerName
        self.urlToImage = urlToImage
        self.updatedAt = updatedAt
        self.stargazersCount = stargazersCount
        self.watchersCount = watchersCount
        
    }
    
    static func mapToObject(repoDict: [String:Any]) -> Repository {
        
        print("repoDict: ", repoDict)
        let repoName = repoDict["name"] as! String
        let description = repoDict["description"] as! String
        let url = repoDict["html_url"] as! String
        let ownerName = (repoDict["owner"] as! [String:Any])["login"] as! String
        let urlToImage = (repoDict["owner"] as! [String:Any])["avatar_url"] as! String
        let updatedAt = repoDict["updated_at"] as! String
        let stargazersCount = repoDict["stargazers_count"] as! Int
        let watchersCount = repoDict["watchers_count"] as! Int
        
        print("Infos: ", url, repoName, ownerName, urlToImage)
        
        let newRepo = Repository(repositoryName: repoName, description: description, url: url, ownerName: ownerName, urlToImage: urlToImage, updatedAt: updatedAt, stargazersCount: stargazersCount, watchersCount: watchersCount)
        print("--------------------")
        print("New Repo: ", newRepo)

        return newRepo
    }
    
}



func dateFormatter(updatedAt: String) -> Date {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
    let date = dateFormatter.date(from: updatedAt)!
    return date
}

//FIXME: Função que pega url e troca pra imagem
