//
//  RemoteImageURL.swift
//  Beer020
//
//  Created by Alberto Banet Masa on 05/01/2020.
//  Copyright © 2020 Alberto Banet Masa. All rights reserved.
//

import Foundation
import Combine

class RemoteImageURL: ObservableObject {
    @Published var data = Data()
    
    init(imageURL: String) {
        guard let url = URL(string: imageURL) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            
            DispatchQueue.main.async {
                self.data = data
            }
        }.resume()
    }
}
