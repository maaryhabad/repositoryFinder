//
//  Data.swift
//  repositoryFinder
//
//  Created by Mariana Beilune Abad on 05/07/20.
//  Copyright © 2020 Mariana Beilune Abad. All rights reserved.
//

import SwiftUI
import Alamofire

class Api {
    
    static func getRepos(text: String) {
        AF.request("https://api.github.com/search/repositories?q="+text+"&per_page=20").responseJSON { response in
            
            switch response.result {
            case let .success(value):
                print("success: ", value)
                let dic = value as! [String:Any]
                print("dic: ", dic)
                if dic.count > 0 {
                    let repoDict = (dic["items"] as! [[String:Any]])[0]
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
                    
                    Model.instance.repositories.append(newRepo)
                    print("--------------------")
                    print("Repositories Count: ", Model.instance.repositories.count)
                }
                
                

                
                
                
            case let .failure(error):
                print(error)
            }
            
            
        }
    }
    
//    static func getRepos(text: String, completionHandler: @escaping (Repository?)-> ()) {
//        var gitUrl = "https://api.github.com/search/repositories?q="
//        let apiURL = gitUrl + text
//
//        AF.request(apiURL).responseJSON { response in
//            switch response.result {
//            case let .success(value):
//                print("success")
//                let dic = value as! [String:Any]
//
//                if dic["totalItems"] as? Int == 1 {
//                    let repoDict = (dic["items"] as! [[String:Any]])[0]
//
//                    print(repoDict)
//
//            }
//            case let .failure(error):
//                print("Não encontrou o dic")
//                completionHandler(nil)
//            }
//        }
//    }
}
