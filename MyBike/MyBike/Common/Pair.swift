//
//  Pair.swift
//  MyBike
//
//  Created by Darius Couti on 06.06.2023.
//

import Foundation

struct Pair: Hashable {
    var id: UUID?
    var name: String?
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func empty() -> Pair {
        return Pair(id: nil, name: nil)
    }
}

func ==(left: Pair, right: Pair) -> Bool {
    return left.id == right.id && left.name == right.name
}
