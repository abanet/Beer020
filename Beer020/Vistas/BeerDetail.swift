//
//  BeerDetail.swift
//  Beer020
//
//  Created by Alberto Banet Masa on 05/01/2020.
//  Copyright © 2020 Alberto Banet Masa. All rights reserved.
//

import SwiftUI

struct BeerDetail: View {
    
    let beerVM: BeerDetailViewModel
    
    var body: some View {
        ZStack {
            Color(UIColor(named: "background")!)
                .edgesIgnoringSafeArea(.all)
                .layoutPriority(1.0)
            
            VStack(alignment: .center) {
                
                BeerImageView(imageURL: beerVM.urlImagen())
                
                HStack {
                    Spacer()
                    Text(beerVM.nombre())
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
                    Text(beerVM.tips())
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
                
                List(beerVM.food(), id: \.self) { string in
                    HStack {
                        Text("🍺")
                        Text(string)
                    }
                }
               
            }
        }
    }
}

