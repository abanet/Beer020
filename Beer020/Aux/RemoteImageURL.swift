//
//  RemoteImageURL.swift
//  Beer020
//
//  Created by Alberto Banet Masa on 05/01/2020.
//  Copyright © 2020 Alberto Banet Masa. All rights reserved.
//

import Foundation
import Combine

/**
 RemoteImageURL es una clase observable que llama a una url que contiene una imagen y se descarga la misma.
 */
class RemoteImageURL: ObservableObject {
    @Published var data = Data() // variable que nos interesa observar.
    
    
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
