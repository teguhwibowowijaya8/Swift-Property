//
//  Amenity.swift
//  Property
//
//  Created by Teguh Wibowo Wijaya on 09/03/23.
//

import Foundation

struct Amenity {
    let description: String
    let beds: [FacilityDetail]
    let baths: [FacilityDetail]
    let kitchens: [FacilityDetail]
}
