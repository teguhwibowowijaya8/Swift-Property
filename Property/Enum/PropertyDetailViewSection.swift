//
//  PropertySection.swift
//  Property
//
//  Created by Teguh Wibowo Wijaya on 09/03/23.
//

import Foundation

enum PropertyDetailViewSection: Int {
    case property
    case reviews
    case amenities
    case interiorDetails
    case constructionDetails
    case locationMapAndDetails
    
    init(_ section: Int) {
        switch section {
        case 0:
            self = .property
        case 1:
            self = .reviews
        case 2:
            self = .amenities
        case 3:
            self = .interiorDetails
        case 4:
            self = .constructionDetails
        case 5:
            self = .locationMapAndDetails
        default:
            self = .property
        }
    }
}
