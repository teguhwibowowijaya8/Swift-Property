//
//  Property.swift
//  Property
//
//  Created by Teguh Wibowo Wijaya on 06/03/23.
//

import Foundation

struct Property {
    let image: String
    let name: String
    let price: Int
    let address: String
    let size: Int
    let facilities: Facilities
    let review: [Review]
    let interiorDetail: String
    let interiorDetailImages: [FacilityDetail]
    let constructionDetail: String
    let constructionDetailImages: [FacilityDetail]
    let locations: [Location]
    
    var priceString: String {
        return String(format: "$%d", locale: .current, price)
    }
    
    var sizeString: String {
        return String(format: "%dsqft", locale: .current, size)
    }
    
    var facilitiesCount: Int {
        return facilities.kitchens.count + facilities.beds.count + facilities.baths.count
    }
    
}
