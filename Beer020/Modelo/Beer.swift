//
//  Beer.swift
//  Beer020
//
//  Created by Alberto Banet Masa on 04/01/2020.
//  Copyright © 2020 Alberto Banet Masa. All rights reserved.
//

// Entendemos que el id, el nombre y la descripción son obligatorios.
// El resto de los campos los tomamos como opcionales just in case

/**
 La clase cerveza contiene la información que disponemos sobre una cerveza.
 Sólo se ha trabajado con un subconjunto de la información disponible aportada por Punk.
 */
struct Beer: Decodable, Identifiable {
    var id: Int
    let name: String
    let ph: Double?
    let description: String
    let image_url: String?
    let food_pairing: [String]?
    let brewers_tips: String?

    init() {
        id = 0
        name = ""
        ph = nil
        description = ""
        image_url = nil
        food_pairing = nil
        brewers_tips = nil
    }
}

