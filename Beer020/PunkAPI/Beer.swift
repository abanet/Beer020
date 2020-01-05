//
//  Beer.swift
//  Beer020
//
//  Created by Alberto Banet Masa on 04/01/2020.
//  Copyright © 2020 Alberto Banet Masa. All rights reserved.
//

// Entendemos que el id, el nombre y la descripción son obligatorios.
// El resto de los campos los tomamos como opcionales just in case

struct Beer: Decodable, Identifiable {
    var id: Int
    let name: String
    let description: String
    let image_url: String?
    let food_pairing: [String]?
    let brewers_tips: String?
}
