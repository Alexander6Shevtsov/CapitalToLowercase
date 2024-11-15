//
//  Course.swift
//  CapitalToLowercase
//
//  Created by Alexander Shevtsov on 08.11.2024.
//

import Foundation

struct Course: Decodable {
    let name: String?
    let imageUrl: String?
    let numberOfLessons: Int?
    let numberOfTests: Int?
    
    enum CodingKeys: String, CodingKey {
        case name = "Name"
        case imageUrl = "ImageUrl"
        case numberOfLessons = "Number_of_lessons"
        case numberOfTests = "Number_of_tests"
    }
}
