//
//  Data.swift
//  repositoryFinder
//
//  Created by Mariana Beilune Abad on 05/07/20.
//  Copyright © 2020 Mariana Beilune Abad. All rights reserved.
//

import SwiftUI

class Api {
    var apiUrl = "https://api.github.com/search/repositories?q="

    
    func prepareUrl(text: String) {
        apiUrl = apiUrl + text
        print(apiUrl)
        
    }
    
    func searchRepos(completion: @escaping ([Repository]) -> ()) {
        guard let url = URL(string: apiUrl) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            let repos = try! JSONDecoder().decode([Repository].self, from: data!)
            print("repos: ", repos)
            DispatchQueue.main.async {
                completion(repos)
            }
        }
        .resume()
    }
    
    
    
}


    
//    func getRepos(completion: @escaping ([Repository]) -> ()) {
//        guard let url = URL(string: "https://api.github.com/search/repositories") else { return }
//
//        //?q= pra fazer busca
//
//        URLSession.shared.dataTask(with: url) { (data, _, _) in
//            let repos = try? JSONDecoder().decode([Repository].self, from: data!)
//            print(repos)
//            DispatchQueue.main.async {
//                completion(repos!)
//            }
//        }
//    .resume()
//    }
