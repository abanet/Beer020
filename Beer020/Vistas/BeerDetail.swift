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
        ZStack {
            Color(UIColor(named: "background")!)
                .edgesIgnoringSafeArea(.all)
                .layoutPriority(1.0)
            
            VStack(alignment: .center) {
                
                BeerImageView(imageURL: beer.image_url)
                
                HStack {
                    Spacer()
                    Text(beer.name)
                        .font(.headline)
                        .multilineTextAlignment(.center)
                        .lineLimit(2)
                        .padding([.vertical])
                    Spacer()
                }
                .border(Color.black, width: 1.5)
                .background(Color(UIColor(named: "backName")!))
                
                HStack {
                    Spacer()
                    Text(beer.brewers_tips ?? "no tips".localized)
                    .font(.subheadline)
                    .padding()
                    Spacer()
                }
                .border(Color.black, width: 1.0)
                .background(Color(UIColor(named: "backText")!))
               
                HStack {
                    Text("Ideal to drink with".localized)
                        .italic()
                        .padding([.leading, .top])
                    Spacer()
                }
                
                List(beer.food_pairing!,id: \.self) { string in
                    HStack {
                        Text("🍺")
                        Text(string)
                    }
                }
               
            }
        }
    }
}

