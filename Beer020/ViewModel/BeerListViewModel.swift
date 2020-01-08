//
//  BeerListViewModel.swift
//  Beer020
//
//  Created by Alberto Banet Masa on 08/01/2020.
//  Copyright © 2020 Alberto Banet Masa. All rights reserved.
//

import Foundation
import Combine

/**
 BeerStore almacena un array con todas las cervezas resultado de la búsqueda.
 */
class BeerListViewModel: ObservableObject {
    @Published private(set) var beers: [BeerDetailViewModel] = []
    
    private let punkService: PunkAPI
    
    init(punkService: PunkAPI) {
        self.punkService = punkService
    }
    
    /**
     Lanza la búsqueda de las cervezas con el criterio especificado en query.
     *Actualiza la variable publicada beers.*
     */
    func fetch(matching query: String) {
        punkService.search(matching: query) { [weak self] resultado in
            DispatchQueue.main.async {
                switch resultado {
                case .success(let beers): self?.beers = beers.map(BeerDetailViewModel.init)
                case .failure: self?.beers = []
                }
            }
            
        }
    }
}

