//
//  LoginScreen.swift
//  repositoryFinder
//
//  Created by Mariana Beilune Abad on 17/07/20.
//  Copyright © 2020 Mariana Beilune Abad. All rights reserved.
//

import SwiftUI

struct LoginScreen: View {
    
    @State private var email  = ""
    @State private var password = ""
    
    var body: some View {
        VStack() {
            Text("RepositoryFinder")
//            Image()
            TextField("Email", text: self.$email)
            TextField("Senha", text: self.$password)
            Button(action: {
                
            }) {
                Text("Entrar")
            }
        }
    }
}

struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreen()
    }
}
