//
//  URLImage.swift
//  repositoryFinder
//
//  Created by Mariana Beilune Abad on 15/07/20.
//  Copyright © 2020 Mariana Beilune Abad. All rights reserved.
//

import SwiftUI
import Combine
import Foundation

class ImageLoader: ObservableObject {
    @Published var image: UIImage?
    private let url: URL

    init(url: URL) {
        self.url = url
    }
    
    func load() {}

    func cancel() {}
}
