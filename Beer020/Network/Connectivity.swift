//
//  Connectivity.swift
//  Beer020
//
//  Created by Alberto Banet Masa on 09/01/2020.
//  Copyright © 2020 Alberto Banet Masa. All rights reserved.
//

import Foundation
import Alamofire

class Connectivity: ObservableObject {
    @Published var conectado: Bool = false
    
    class func isConnectedToInternet() -> Bool {
        return NetworkReachabilityManager()?.isReachable ?? false
    }
}
