//
//  PunkAPI.swift
//  Beer020
//
//  Created by Alberto Banet Masa on 04/01/2020.
//  Copyright © 2020 Alberto Banet Masa. All rights reserved.
//

import Foundation

struct Respuesta: Decodable {
    let items: [Beer]
}

class PunkAPI {
    private let session: URLSession
    private let decoder: JSONDecoder
    
    init(session: URLSession = .shared, decoder: JSONDecoder = .init()){
        self.session = session
        self.decoder = decoder
    }
    
    func search(matching query: String, handler: @escaping (Result<[Beer], Error>) -> Void) {
        guard var urlAPI = URLComponents(string: "https://api.punkapi.com/v2/beers")
            else {
                preconditionFailure("Imposible crear url")
        }
        
        urlAPI.queryItems = [
            URLQueryItem(name: "food", value: query)
        ]
        
        guard let url = urlAPI.url
            else {
               preconditionFailure("Parametro no encontrado en url.")
        }
        print("Intentando consultar en \(url)")
        session.dataTask(with: url) { [weak self] data, response, error in
            if let error = error {
                handler(.failure(error))
            } else {
                do {
                    let data = data ?? Data()
                    let response = try self?.decoder.decode([Beer].self, from: data)
                    print(response)
                    handler(.success(response ?? []))
                } catch {
                    handler(.failure(error))
                }
            }
        }.resume()
    }
}
