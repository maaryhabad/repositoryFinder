//
//  CircleImage.swift
//  repositoryFinder
//
//  Created by Mariana Beilune Abad on 17/07/20.
//  Copyright © 2020 Mariana Beilune Abad. All rights reserved.
//

import SwiftUI
import URLImage


struct CircleImage: View {
    let urlToImage: URL
    
    var body: some View {
        HStack {
            URLImage(urlToImage,
            processors: [ Resize(size: CGSize(width: 70, height: 70), scale: UIScreen.main.scale)])
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.gray, lineWidth: 4))
                .shadow(radius: 10)
        }
    }
}


struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(urlToImage: Model.instance.defaultRepo[0].urlToImage)
    }
}
