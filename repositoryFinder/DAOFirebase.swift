//
//  DAOFirebase.swift
//  repositoryFinder
//
//  Created by Mariana Beilune Abad on 15/07/20.
//  Copyright © 2020 Mariana Beilune Abad. All rights reserved.
//

import Foundation
import Firebase
import FirebaseFirestore
import FirebaseAuth

class DAOFirebase {
    static func save(repository: Repository) {
        let db = Firestore.firestore()
        
        var ref: DocumentReference? = nil
        
        var repositoryData: [String: Any] = repository.mapToDictionary()
        
        ref = db.collection("repositories").addDocument(data: repositoryData) { err in
            if let err = err {
                print("Erro adicionando o documento no Firebase: \(err)")
            } else {
                print("Documento adicionado com a ID: \(ref!.documentID)")
            }
        }
        print("salvou")
    }
    
    static func logIn(email: String, senha: String) {
        let autenticacao = Auth.auth()
        
        autenticacao.signIn(withEmail: email, password: senha, completion: { (usuario, erro) in
            if erro == nil {
                if usuario == nil {
                    print("Erro ao autenticar")
                } else {
                    //entra no app
                }
            } else {
                print("Dados incorretos")
            }
        })
    }
}
