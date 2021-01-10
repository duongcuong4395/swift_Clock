//
//  CityModel.swift
//  Clock
//
//  Created by Duong Cuong on 7/1/21.
//  Copyright © 2021 Duong Cuong. All rights reserved.
//

import Foundation


public class Section {
    public var letter : String?
    public var cities : [String]?
    public var isSearch: Bool
    
    init(letter : String, cities : [String], isSearch: Bool) {
        self.letter = letter
        self.cities = cities
        self.isSearch = isSearch
    }
}
