//
//  RepositoryDetailView.swift
//  repositoryFinder
//
//  Created by Mariana Beilune Abad on 17/07/20.
//  Copyright © 2020 Mariana Beilune Abad. All rights reserved.
//

import SwiftUI
import URLImage

struct RepositoryDetailView: View {
    
    let repository: Repository
    
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    CircleImage(urlToImage: repository.urlToImage)
                        .padding(.trailing)
                    VStack {
                        Text(repository.repositoryName)
                            .font(.largeTitle)
                        Text(repository.ownerName)
                        .font(.subheadline)
                    }
                }
                
                HStack {
                    Text(repository.description)
                    Spacer()
                }.padding()
                
                HStack {
                    Button(action: {
                        UIApplication.shared.open(URL(string: self.repository.url)!)
                    }) {
                            VStack {
                                Image("github").resizable()
                                    .frame(width: 40, height: 40)
                                    .scaledToFit()
                                Text("Ver no Github")
                            }
                        }

                    Button(action: { }) {
                        VStack {
                            Image("eye").resizable()
                                .frame(width: 40, height: 40)
                                .scaledToFit()
                            Text("\(repository.watchersCount)")
                        }
                    }
                }
                
            }
            
        }.navigationBarItems(trailing:
            Button(action: {
                DAOFirebase.save(repository: self.repository)
            }) {
                Text("Salvar")
        })
        
    }
}

struct RepositoryDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RepositoryDetailView(repository: Model.instance.defaultRepo[0])
    }
}
