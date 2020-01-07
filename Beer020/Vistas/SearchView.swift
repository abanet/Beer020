//
//  SearchView.swift
//  Beer020
//
//  Created by Alberto Banet Masa on 04/01/2020.
//  Copyright © 2020 Alberto Banet Masa. All rights reserved.
//

import SwiftUI

struct SearchView: View {
    @State private var query: String = ""
    @EnvironmentObject var beerStore: BeerStore
    
    var body: some View {
        
        NavigationView {
            List {
                TextField("Escribe tu búsqueda...",
                          text: Binding(
                            get: {
                                return self.query
                            },
                            set: { (newValue) in
                                self.fetch(query: newValue)
                                return self.query = newValue
                          }),
                          onCommit: self.endEditing
                    )
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                ForEach(beerStore.beers) { beer in
                    NavigationLink(destination: BeerDetail(beer: beer)) {
                        BeerView(beer: beer)
                    }
                }
            }.navigationBarTitle(Text("Busca tu cerveza"))
                .onAppear { // focus fuera si hemos salido de la vista para no tener el teclado ocupando pantalla.
                    self.endEditing()
            }
        }
    }
    
    
    private func fetch(query: String) {
        beerStore.fetch(matching: query)
    }
    
    private func endEditing() {
        UIApplication.shared.endEditing()
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
