//
//  StickerModel.swift
//  StickerDemo
//
//  Created by 陈建蕾 on 2019/9/18.
//  Copyright © 2019 陈建蕾. All rights reserved.
//

import Foundation

struct StickerModel {
    var imageName: String!
    var type: String!
    
    init(_ imageName: String, type: String) {
        self.imageName = imageName
        self.type = type
    }
}
