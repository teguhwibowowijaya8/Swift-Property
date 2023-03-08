//
//  TermOfServices.swift
//  Property
//
//  Created by Teguh Wibowo Wijaya on 08/03/23.
//

import Foundation

struct TermOfServices {
    static let data: [TermOfService] = [
        TermOfService(point: "Terms", detail: detailOne),
        TermOfService(point: "User License", detail: detailOne),
        TermOfService(point: "Our Privacy Policy", detail: detailTwo),
    ]
    
    private static let detailOne = """
A term and conditions agreement outlines the website administrator’s rules regarding user behavior, and provides information about the actions the website administrator can and will perform.

Your terms and conditions text is a contract between your website and its users. In the event of a legal dispute, arbitrators will look to this agreement to determine whether each party acted within their rights
"""
    
    private static let detailTwo = """
A term and conditions agreement outlines the website administrator’s rules regarding user behavior, and provides information about the actions the website administrator can and will perform.
"""
}
