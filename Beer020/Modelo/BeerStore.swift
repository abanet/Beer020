//
//  BeerStore.swift
//  Beer020
//
//  Created by Alberto Banet Masa on 04/01/2020.
//  Copyright © 2020 Alberto Banet Masa. All rights reserved.
//

import Foundation
import Combine

/**
 BeerStore almacena un array con todas las cervezas resultado de la búsqueda.
 */
class BeerStore: ObservableObject {
    @Published private(set) var beers: [Beer] = []
    
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
                case .success(let beers): self?.beers = beers
                case .failure: self?.beers = []
                }
            }
            
        }
    }
}
