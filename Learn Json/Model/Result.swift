//
//  Result.swift
//  Learn Json
//
//  Created by Jonathan Burnett on 23/01/2021.
//

import Foundation
import SwiftUI

struct Results : Codable {
    var total : Int
    var results : [Result]
}

struct Result: Codable {
    var id : String
    var description : String?
    var urls : URLs
}

struct URLs: Codable {
    var small : String
}
