//
//  BeerStore.swift
//  Beer020
//
//  Created by Alberto Banet Masa on 04/01/2020.
//  Copyright © 2020 Alberto Banet Masa. All rights reserved.
//

import Foundation
import Combine

class BeerStore: ObservableObject {
    @Published private(set) var beers: [Beer] = []
    
    private let punkService: PunkAPI
    
    init(punkService: PunkAPI) {
        self.punkService = punkService
    }
    
    func fetch(matching query: String) {
        punkService.search(matching: query) { [weak self] resultado in
            DispatchQueue.main.async {
                switch resultado {
                case .success(let beers): self?.beers = beers
                case .failure: self?.beers = []
                }
            }
            
        }
    }
}
