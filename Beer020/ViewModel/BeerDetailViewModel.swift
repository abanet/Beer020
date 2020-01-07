//
//  BeerDetailViewModel.swift
//  Beer020
//
//  Created by Alberto Banet Masa on 07/01/2020.
//  Copyright © 2020 Alberto Banet Masa. All rights reserved.
//

import Foundation


class BeerDetailViewModel {
    var beer: Beer
    
    init() {
        beer = Beer()
    }
    
    init(beer: Beer) {
        self.beer = beer
    }
    
    func nombre() -> String {
        return beer.name
    }
    
    func urlImagen() -> String {
        return beer.image_url ?? ""
    }
    
    func ph() -> Double {
        return beer.ph ?? 0.0
    }
    
    func descripcion() -> String {
        return beer.description
    }
    
    func food() -> [String] {
        return beer.food_pairing ?? []
    }
    
    func tips() -> String {
        return beer.brewers_tips ?? "no tips".localized
    }

}
