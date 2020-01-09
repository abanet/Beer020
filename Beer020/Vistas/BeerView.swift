//
//  BeerView.swift
//  Beer020
//
//  Created by Alberto Banet Masa on 04/01/2020.
//  Copyright © 2020 Alberto Banet Masa. All rights reserved.
//

import SwiftUI

struct BeerView: View {
    let beerVM: BeerDetailViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(beerVM.nombre())
                .font(.subheadline)
                .bold()
        }
    }
}


let beerVM: BeerDetailViewModel = BeerDetailViewModel(beer: Beer())
struct BearView_Previews: PreviewProvider {
    static var previews: some View {
       BeerView(beerVM: beerVM)
    }
}

