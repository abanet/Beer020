//
//  SearchView.swift
//  Beer020
//
//  Created by Alberto Banet Masa on 04/01/2020.
//  Copyright © 2020 Alberto Banet Masa. All rights reserved.
//

import SwiftUI

struct SearchView: View {
    @State private var query: String = "" {
        didSet {
            print("cambio") 
        }
    }
    @EnvironmentObject var beerStore: BeerStore
    
    var body: some View {
        NavigationView {
            List {
                TextField("Escribe tu búsqueda...",
                          text: $query,
                          onCommit: fetch)
                ForEach(beerStore.beers) { beer in
                    BeerView(beer: beer)
                }
            }.navigationBarTitle(Text("Busca tu cerveza"))
        }.onAppear(perform: fetch)
    }
    
    private func fetch() {
        beerStore.fetch(matching: query)
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
