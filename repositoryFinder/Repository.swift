//
//  Repository.swift
//  repositoryFinder
//
//  Created by Mariana Beilune Abad on 05/07/20.
//  Copyright © 2020 Mariana Beilune Abad. All rights reserved.
//

import Foundation

let defaultText: String = "N/A"

struct Repository: Hashable, Decodable, Identifiable {
    
    var id = UUID()
    var repositoryName: String = defaultText
    var description: String = defaultText
    var url: String = defaultText
    var ownerName: String = defaultText
    var urlToImage: String = defaultText
    var updatedAt: String = defaultText
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
    
//    func mapToDictionary() -> [String: Any] {
//
//        var repositoryData: [String:Any] = [:]
//
//        repositoryData["repositoryName"] = self.repositoryName
//        repositoryData["description"] = self.description
//        repositoryData["url"] = self.url
//        repositoryData["ownerName"] = self.ownerName
//        repositoryData["urlToImage"] = self.urlToImage
//        repositoryData["updatedAt"] = self.updatedAt
//        repositoryData["stargazersCount"] = self.stargazersCount
//        repositoryData["watchersCount"] = self.watchersCount
//
//        return repositoryData
//    }
//
//    static func mapToObject(repositoryData: [String: Any]) -> Repository {
//
//        let repositoryName: String = repositoryData["repositoryName"] as! String
//        let description: String = repositoryData["description"] as! String
//        let url: String = repositoryData["url"] as! String
//        let ownerName: String = repositoryData["ownerName"] as! String
//        let urlToImage: String = repositoryData["urlToImage"] as! String
//        let updatedAt: String = repositoryData["updatedAt"] as! String
//        let stargazersCount: String = repositoryData["stargazersCount"] as! String
//        let watchersCount: String = repositoryData["watchersCount"] as! String
//
//
//        let repository = Repository(repositoryName: repositoryName, description: description, url: url, ownerName: ownerName, urlToImage: urlToImage, updatedAt: updatedAt, stargazersCount: stargazersCount, watchersCount: watchersCount)
//
//        return repository
//    }
    
}



func dateFormatter(updatedAt: String) -> Date {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
    let date = dateFormatter.date(from: updatedAt)!
    return date
}

//FIXME: Função que pega url e troca pra imagem
