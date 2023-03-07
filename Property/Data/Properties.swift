//
//  PropertiesData.swift
//  Property
//
//  Created by Teguh Wibowo Wijaya on 06/03/23.
//

import Foundation

struct Properties {
    static let data: [Property] = [
        Property(image: "Beautiful Apartment", name: "Beautiful Apartment", price: 200000, address: "2BW Street, NY, New York, United States", size: 2000, facilities: facilitiesOne, review: reviewerOne, interiorDetail: detailString, interiorDetailImages: interiorDetails, constructionDetail: detailString, constructionDetailImages: constructionDetails, locations: locationsOne),
        Property(image: "President Apartment", name: "President Apartment", price: 500000, address: "2BW Street, NY, New York, United States", size: 5000, facilities: facilitiesTwo, review: reviewerTwo, interiorDetail: detailString, interiorDetailImages: constructionDetails, constructionDetail: detailString, constructionDetailImages: interiorDetails, locations: locationsTwo),
        Property(image: "Deluxe Apartment", name: "Deluxe Apartment", price: 700000, address: "2BW Street, NY, New York, United States", size: 7000, facilities: facilitiesOne, review: reviewerOne, interiorDetail: detailString, interiorDetailImages: interiorDetails, constructionDetail: detailString, constructionDetailImages: constructionDetails, locations: locationsOne),
        Property(image: "Sky Apartment", name: "Sky Apartment", price: 100000, address: "2BW Street, NY, New York, United States", size: 1000, facilities: facilitiesOne, review: reviewerTwo, interiorDetail: detailString, interiorDetailImages: constructionDetails, constructionDetail: detailString, constructionDetailImages: interiorDetails, locations: locationsTwo),
    ]
    
    private static let facilitiesOne: Facilities = Facilities(
        beds: [
            FacilityDetail(name: "Luxury Bed", image: Images.beautifulApartment),
            FacilityDetail(name: "Famous Bed", image: Images.presidentApartment)
        ], baths: [
            FacilityDetail(name: "Luxury Bath", image: Images.deluxeApartment),
            FacilityDetail(name: "Famous Bath", image: Images.skyApartment)
        ], kitchens: [
            FacilityDetail(name: "Famous Kitchen", image: Images.beautifulApartment)
        ])
    
    private static let facilitiesTwo: Facilities = Facilities(
        beds: [
            FacilityDetail(name: "Truly Famous Bed", image: Images.presidentApartment),
            FacilityDetail(name: "Truly Luxury Bed", image: Images.skyApartment),
            FacilityDetail(name: "Truly Nice Bed", image: Images.deluxeApartment)
        ], baths: [
            FacilityDetail(name: "Truly Famous Bath", image: Images.deluxeApartment),
            FacilityDetail(name: "Truly Luxury Bath", image: Images.beautifulApartment),
            FacilityDetail(name: "Truly Nice Bath", image: Images.presidentApartment)
        ], kitchens: [
            FacilityDetail(name: "Truly Famous Kitchen", image: Images.beautifulApartment),
            FacilityDetail(name: "Truly Luxury Kitchen", image: Images.presidentApartment),
            FacilityDetail(name: "Truly Nice Kitchen", image: Images.deluxeApartment)
        ])
    
    private static let reviewerOne: [Review] = [
        Review(image: Images.james, reviewerName: "James Butler", reviewerPosition: "Owner", detail: detailStringTwo, _rating: 4.5),
        Review(image: nil, reviewerName: "Miles Lala", reviewerPosition: "Broker", detail: detailString, _rating: 4.2),
    ]
    
    private static let reviewerTwo: [Review] = [
        Review(image: nil, reviewerName: "Miles Males", reviewerPosition: "Owner", detail: detailString, _rating: 3.7),
        Review(image: Images.james, reviewerName: "James Butler", reviewerPosition: "Broker", detail: detailStringTwo, _rating: 3.0),
    ]
    
    private static let interiorDetails: [FacilityDetail] = [
        FacilityDetail(name: "Walalala", image: Images.presidentApartment),
        FacilityDetail(name: "Trililil", image: Images.deluxeApartment)
    ]
    
    private static let constructionDetails: [FacilityDetail] = [
        FacilityDetail(name: "Trililil", image: Images.skyApartment),
        FacilityDetail(name: "Walalala", image: Images.beautifulApartment)
    ]
    
    private static let detailStringTwo = """
    Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.
    """
    
    private static let detailString = """
Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.
    
Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.
"""
    
    private static let locationsOne: [Location] = [
        Location(place: "Location Map", image: "MapsOne"),
        Location(place: "Hospital", image: "MapsTwo"),
        Location(place: "School", image: "MapsThree"),
    ]
    
    private static let locationsTwo: [Location] = [
        Location(place: "Location Map", image: "MapsThree"),
        Location(place: "Hospital", image: "MapsOne"),
        Location(place: "School", image: "MapsTwo"),
    ]
}
