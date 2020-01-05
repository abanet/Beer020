//
//  BeerImageView.swift
//  Beer020
//
//  Created by Alberto Banet Masa on 05/01/2020.
//  Copyright © 2020 Alberto Banet Masa. All rights reserved.
//

import SwiftUI

struct BeerImageView: View {
    @ObservedObject var remoteImageURL: RemoteImageURL
    
    init(imageURL: String?) {
        remoteImageURL = RemoteImageURL(imageURL: imageURL ?? "https://images.punkapi.com/v2/18.png") //image por defecto
    }
    
    var body: some View {
        Image(uiImage: UIImage(data: remoteImageURL.data) ?? UIImage())
            .resizable()
            .scaledToFit()
            .frame(width: 200, height: 200)
//            .clipShape(Circle())
//            .overlay(Circle().stroke(Color.gray, lineWidth: 4))
//            .shadow(radius: 10)
        
    }
}

