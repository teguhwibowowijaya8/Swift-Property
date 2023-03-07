//
//  Location.swift
//  Property
//
//  Created by Teguh Wibowo Wijaya on 07/03/23.
//

import Foundation

struct Location: Equatable {
    let place: String
    let image: String
    var isSelected: Bool = false
    
    mutating func changeIsSelected() {
        isSelected.toggle()
    }
}
