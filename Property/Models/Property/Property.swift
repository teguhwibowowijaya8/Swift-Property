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
    let amenities: Amenity
    let review: [Review]
    let interiors: Facility
    let constructions: Facility
    var locations: [Location]
    
    var priceString: String {
        return String(format: "$%d", locale: .current, price)
    }
    
    var sizeString: String {
        return String(format: "%dsqft", locale: .current, size)
    }
    
    var amenitiesCount: Int {
        return amenities.beds.count + amenities.kitchens.count + amenities.baths.count
    }
    
    mutating func findLocation(_ location: Location) -> Int? {
        let sameIndex = locations.firstIndex{$0 == location}
        
        if let sameIndex = sameIndex {
            locations[sameIndex].changeIsSelected()
            return sameIndex
        }
        
        return nil
    }
    
}
