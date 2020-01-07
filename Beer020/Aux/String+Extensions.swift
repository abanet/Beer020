//
//  String+Extensions.swift
//  Beer020
//
//  Created by Alberto Banet Masa on 07/01/2020.
//  Copyright © 2020 Alberto Banet Masa. All rights reserved.
//

import Foundation


extension String {
    // Variable utilizada para la localización de los String
    var localized: String {
        return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: "")
    }
}
