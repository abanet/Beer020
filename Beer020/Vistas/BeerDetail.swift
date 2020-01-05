//
//  BeerDetail.swift
//  Beer020
//
//  Created by Alberto Banet Masa on 05/01/2020.
//  Copyright © 2020 Alberto Banet Masa. All rights reserved.
//

import SwiftUI

struct BeerDetail: View {
    let beer: Beer
    
    var body: some View {
        VStack(alignment: .center) {
            BeerImageView(imageURL: beer.image_url)
                
            Text(beer.name)
            Text(beer.brewers_tips ?? "no tips")
            List(beer.food_pairing!,id: \.self) { string in
                Text(string)
            }
            Spacer()
        }
    }
}

