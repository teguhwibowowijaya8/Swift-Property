//
//  Review.swift
//  Property
//
//  Created by Teguh Wibowo Wijaya on 06/03/23.
//

import Foundation

struct Review {
    let image: String?
    let reviewerName: String
    let reviewerPosition: String
    let detail: String
    let _rating: Double
    var rating: Double {
        if _rating > 5.0 { return 5.0 }
        else if _rating < 0.0 { return 0.0 }
        else { return _rating }
    }
    
}
