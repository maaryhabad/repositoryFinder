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
    
    static func getRepos(text: String
//        , completionHandler: @escaping ([Repository]) ->()
    ) {
        
        var reposArray: [Repository]
        
        AF.request("https://api.github.com/search/repositories?q="+text+"&per_page=20").responseJSON { response in
            
            switch response.result {
            case let .success(value):
                print("success: ", value)
                let dic = value as! [String:Any] //transforma JSON em dicionário
                print("dic: ", dic)
                
                //dividir para uma outra função que recebe todos os repos, e transforma em dic
                print("dicCount: ", dic.count)
                if dic.count > 0 {
                    for i in 0...dic.count {
                        let repoDict = (dic["items"] as! [[String:Any]])[0]
                        print("repoDict: ", repoDict)
                        
                        let newRepo = Repository.mapToObject(repoDict: repoDict)
                        
//                        reposArray.append(newRepo)
                        Model.instance.repositories.append(newRepo)
                        print("--------------------")

                        print("Repositories Count: ", Model.instance.repositories.count)
                    }
                    print("--------------------")
                    print(Model.instance.repositories)
//                    completionHandler(reposArray)
                    
                }
                
                //FIXME: else: Alerta sobre não ter resultados.

                
                
                
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
