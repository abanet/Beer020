//
//  PunkAPI.swift
//  Beer020
//
//  Created by Alberto Banet Masa on 04/01/2020.
//  Copyright © 2020 Alberto Banet Masa. All rights reserved.
//

import Foundation

/**
 Estructura de la respuesta de una llamada a las api
 */
typealias TipoRespuesta = [Beer]


/**
Estructura básica de la consulta a la api.
 
 url: url que ofrece el servicio;
 parametro: parámetro necesario para la consulta solicitada
*/
struct ConsultaApi {
    static let url = "https://api.punkapi.com/v2/beers"
    static let parametro = "food"
}


/**
 Clase PunkAPI
 
 Interroga las api de PUNK siguiendo las especificaciones indicadas en https:// punkapi.com/documentacion/v2
 */
class PunkAPI {
    private let session: URLSession
    private let decoder: JSONDecoder
    
    
    init(session: URLSession = .shared, decoder: JSONDecoder = .init()){
        self.session = session
        self.decoder = decoder
    }
    
    /**
     Esta función lanza la consulta definida y opera con el resultado obtenido.
     - Parameter matching: cadena que estamos buscando.
     - Parameter handler: maneja el resultado obtenido.
     */
    func search(matching query: String, handler: @escaping (Result<TipoRespuesta, Error>) -> Void) {
        guard var urlAPI = URLComponents(string: ConsultaApi.url)
            else {
                preconditionFailure("Imposible crear url")
        }
        
        urlAPI.queryItems = [
            URLQueryItem(name: ConsultaApi.parametro, value: query)
        ]
        
        guard let url = urlAPI.url
            else {
               preconditionFailure("Parametro no encontrado en url.")
        }
       
        // Tenemos una url montada para llamar al servicio
        session.dataTask(with: url) { [weak self] data, response, error in
            if let error = error {
                handler(.failure(error))
            } else {
                do {
                    let data = data ?? Data()
                    let response = try self?.decoder.decode(TipoRespuesta.self, from: data)
                    handler(.success(response ?? []))
                } catch {
                    handler(.failure(error))
                }
            }
        }.resume()
    }
}
