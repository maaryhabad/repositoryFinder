//
//  Data.swift
//  repositoryFinder
//
//  Created by Mariana Beilune Abad on 05/07/20.
//  Copyright © 2020 Mariana Beilune Abad. All rights reserved.
//

import SwiftUI

class Api {
    func getRepos(completion: @escaping ([Repository]) -> ()) {
        guard let url = URL(string: "https://api.github.com/search/repositories") else { return }
        
        //?q= pra fazer busca
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            let repos = try! JSONDecoder().decode([Repository].self, from: data!)
            print(repos)
            DispatchQueue.main.async {
                completion(repos)
            }
        }
    .resume()
    }
    
    
}
