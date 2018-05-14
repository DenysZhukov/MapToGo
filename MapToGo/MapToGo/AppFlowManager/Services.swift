//
//  Services.swift
//  MapToGo
//
//  Created by Denys on 4/13/18.
//  Copyright © 2018 Denys Zhukov. All rights reserved.
//

import UIKit
import GooglePlaces
import GoogleMaps

class Services: Configurable {
    let services: [Configurable]
    
    init(with services: [Configurable] = [GoogleServices()]) {
        self.services = services
    }
    
    func configure() {
        services.forEach { $0.configure() }
    }
}

struct GoogleServices: Configurable {
    static let googleAPIKey = "AIzaSyCE0ZVytP96wIWjJMz9NONwzVqjxGTrY_A"
    private let APIKey: String
    
    init(with key: String = GoogleServices.googleAPIKey) {
        self.APIKey = key
    }
    
    func configure() {
        guard  GMSServices.provideAPIKey(APIKey) && GMSPlacesClient.provideAPIKey(APIKey) else {
            fatalError("Google services have not been configurated!!!")
        }
    }
}
