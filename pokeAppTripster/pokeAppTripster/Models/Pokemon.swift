//
//  PokemonIndex.swift
//  pokeAppTripster
//
//  Created by user on 21/09/22.
//

import Foundation
import UIKit

struct Pokemon :Decodable{
    var id: Int?
    var name: String?
    
}

//class Pokemon{
//
//    var id: Int?
//    var name: String?
//    var imageUrl: String?
//    var backImageUrl: String?
//    var image: UIImage?
//    var backImage: UIImage?
//    var weight: Int32?
//    var height: Int32?
//    var defense: Int32?
//    var attack: Int32?
//    var description: String?
//    var type: String?
//    var baseExperience: Int32?
//
//    init(id: Int, dictionary: [String: AnyObject]){
//
//        self.id = id
//
//        if let name = dictionary["name"] as? String{
//            self.name = name
//        }
//        if let imageUrl = dictionary["imageUrl"] as? String{
//            self.imageUrl = imageUrl
//        }
//        if let backImageUrl = dictionary["backImageUrl"] as? String{
//            self.backImageUrl = backImageUrl
//        }
//        if let weight = dictionary["weight"] as? Int32{
//            self.weight = weight
//        }
//        if let height = dictionary["height"] as? Int32{
//            self.height = height
//        }
//        if let defense = dictionary["defense"] as? Int32{
//            self.defense = defense
//        }
//        if let attack = dictionary["attack"] as? Int32{
//            self.attack = attack
//        }
//        if let description = dictionary["description"] as? String{
//            self.description = description
//        }
//        if let type = dictionary["type"] as? String{
//            self.type = type
//        }
//        if let baseExperience = dictionary["baseExperience"] as? Int32{
//            self.baseExperience = baseExperience
//        }
//
//    }
//
//
//}
