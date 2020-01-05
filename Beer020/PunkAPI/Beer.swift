//
//  Beer.swift
//  Beer020
//
//  Created by Alberto Banet Masa on 04/01/2020.
//  Copyright © 2020 Alberto Banet Masa. All rights reserved.
//


struct Beer: Decodable, Identifiable {
    var id: Int
    let name: String
    let description: String
    let image_url: String?
}
