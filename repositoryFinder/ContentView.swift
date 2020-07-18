//
//  ContentView.swift
//  repositoryFinder
//
//  Created by Mariana Beilune Abad on 05/07/20.
//  Copyright © 2020 Mariana Beilune Abad. All rights reserved.
//

import SwiftUI
import Combine

struct ContentView : View {
    @ObservedObject var model = Model.instance
    @State private var searchText: String = ""
    @State private var showCancelButton: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                // Search view
                HStack {
                    HStack {
                        Image(systemName: "magnifyingglass")
                        
                        TextField("digite o nome do repositório", text: $searchText, onEditingChanged: { isEditing in
                            self.showCancelButton = true
                        }, onCommit: {
                            print("onCommit")
                            Model.instance.repositories.removeAll()
                            Api.getRepos(text: self.searchText)
                        }).foregroundColor(.primary)
                        
                        Button(action: {
                            self.searchText = ""
                        }) {
                            Image(systemName: "xmark.circle.fill").opacity(searchText == "" ? 0 : 1)
                        }
                    }
                    .padding(EdgeInsets(top: 8, leading: 6, bottom: 8, trailing: 6))
                    .foregroundColor(.secondary)
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(10.0)
                    
                    if showCancelButton  {
                        Button("Cancelar") {
                            UIApplication.shared.endEditing(true)
                            Model.instance.repositories.removeAll()
                            self.searchText = ""
                            self.showCancelButton = false
                        }
                        .foregroundColor(Color(.systemBlue))
                    }
                }
                .padding(.horizontal)
                .navigationBarHidden(showCancelButton)
                
                    List(self.model.repositories) { repo in
                        NavigationLink(destination: RepositoryDetailView(repository: repo)) {
                            RepositoryRow(repository: repo)
                        }
                    }
                .navigationBarTitle(Text("Cadê o repositório?"))
                .resignKeyboardOnDragGesture()
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .environment(\.colorScheme, .light)
            
            ContentView()
                .environment(\.colorScheme, .dark)
        }
    }
}
