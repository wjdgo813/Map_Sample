//
//  FindPlaces.swift
//  KakaoMap_Sample
//
//  Created by JHH on 28/05/2019.
//  Copyright © 2019 JHH. All rights reserved.
//

import Foundation

public struct FindPlaces: Codable {
    public var isEnd : Bool
    public var places: [Place]?
    
    enum CodingKeys: String,CodingKey {
        case places = "documents"
        case isEnd  = "meta"
    }
    
    enum Meta: String, CodingKey {
        case is_end
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.places = try? values.decode([Place].self, forKey: .places)
        
        let meta = try values.nestedContainer(keyedBy: Meta.self, forKey: .isEnd)
        self.isEnd = try meta.decode(Bool.self, forKey: .is_end)
    }
    
    public init(){
        self.isEnd  = false
        self.places = nil
    }
}
