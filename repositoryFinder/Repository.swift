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
    var urlToImage: URL
    var updatedAt: String
    var stargazersCount: Int
    var watchersCount: Int 
    
    init(repositoryName: String, description: String, url: String, ownerName: String, urlToImage: URL, updatedAt: String, stargazersCount: Int, watchersCount: Int) {
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
        
        let url = repoDict["html_url"] as! String
        let ownerName = (repoDict["owner"] as! [String:Any])["login"] as! String
        var urlToImage = (repoDict["owner"] as! [String:Any])["avatar_url"] as! String
        let updatedAt = repoDict["updated_at"] as! String
        let stargazersCount = repoDict["stargazers_count"] as! Int
        let watchersCount = repoDict["watchers_count"] as! Int
        var newDescription: String
        
        
        if let description = repoDict["description"] as? NSNull {
            newDescription = ""
        } else {
            newDescription = repoDict["description"] as! String
        }
        
        
        
        var imageURL = URL(string: urlToImage)!
        var update = dateFormatter(updatedAt: updatedAt)
        print("update: ", update)
        
        print("Infos: ", url, repoName, ownerName, urlToImage)
        
        let newRepo = Repository(repositoryName: repoName, description: newDescription, url: url, ownerName: ownerName, urlToImage: imageURL, updatedAt: update, stargazersCount: stargazersCount, watchersCount: watchersCount)
        print("--------------------")
        print("New Repo: ", newRepo)

        return newRepo
    }
    
    func mapToDictionary() -> [String: Any] {
        var repositoryData: [String:Any] = [:]
        
        let urlConverted = self.urlToImage.path
        
        repositoryData["name"] = self.repositoryName
        repositoryData["description"] = self.description
        repositoryData["url"] = self.url
        repositoryData["ownerName"] = self.ownerName
        repositoryData["urlToImage"] = urlConverted
        repositoryData["updatedAt"] = self.updatedAt
        repositoryData["stargazersCount"] = self.stargazersCount
        repositoryData["watchersCount"] = self.watchersCount
        
        return repositoryData
    }
    
    //map to dictionary
}



func dateFormatter(updatedAt: String) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
    var date = dateFormatter.date(from: updatedAt)!
    
    let formatter = DateFormatter()
    formatter.dateFormat = "dd/MM/yyyy"
    let newDate = formatter.string(from: date)
    return newDate
}

//FIXME: Função que pega url e troca pra imagem
