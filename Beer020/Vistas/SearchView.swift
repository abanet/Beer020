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
    @ObservedObject var beerList = BeerListViewModel(punkService: .init())
    
    var body: some View {
        
        NavigationView {
            List {
                TextField("Type your food...".localized,
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
                
                Section(
                    footer: Text("pie de tabla".localized)
                        .foregroundColor(.white)) {
                            ForEach(beerList.beers) { beer in
                                NavigationLink(destination: BeerDetail(beerVM:  beer)) {
                                    BeerView(beerVM: beer)
                                }
                            }
                }
            }.navigationBarTitle(Text("The perfect beer"))
                .onAppear { // focus fuera si hemos salido de la vista para no tener el teclado ocupando pantalla.
                    self.endEditing()
            }
        }
        
    }
    
    
    init() {
        UITableView.appearance().separatorColor = .clear
        UITableView.appearance().backgroundColor = UIColor(named: "background")
        UITableViewCell.appearance().backgroundColor = UIColor(named: "background")
    }
    
    private func fetch(query: String) {
        beerList.fetch(matching: query)
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
