//
//  Feed.swift
//  Team_UP
//
//  Created by Ivan Kopiev on 05.06.2021.
//

import Foundation

struct Feed: Codable {
    
    var image: String
    var name: String
    var description: String
    var kindOfSport: String
    var numberOfViews: Int
    var numberOfLikes: Int
    var numberOfComments: Int
}
