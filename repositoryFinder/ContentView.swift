//
//  ContentView.swift
//  repositoryFinder
//
//  Created by Mariana Beilune Abad on 05/07/20.
//  Copyright © 2020 Mariana Beilune Abad. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    @State var repos: [Repository] = []
    @State private var searchText = ""
    @State private var showCancelButton: Bool = false

        var body: some View {

            NavigationView {
                VStack {
                    // Search view
                    HStack {
                        HStack {
                            Image(systemName: "magnifyingglass")

                            TextField("search", text: $searchText, onEditingChanged: { isEditing in
                                self.showCancelButton = true
                            }, onCommit: {
                                print("onCommit")
                                Api.getRepos(text: self.searchText)
                                ForEach(Model.instance.repositories) { repo in RepositoryRow(repository: repo)}
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
                            Button("Cancel") {
                                    UIApplication.shared.endEditing(true) // this must be placed before the other commands here
                                    self.searchText = ""
                                    self.showCancelButton = false
                            }
                            .foregroundColor(Color(.systemBlue))
                        }
                    }
                    .padding(.horizontal)
                    .navigationBarHidden(showCancelButton) // .animation(.default) // animation does not work properly

                    List(repos) { repos in
                        ForEach(Model.instance.repositories) { repo in RepositoryRow(repository: repo)}

                    }
                    .navigationBarTitle(Text("Search"))
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
