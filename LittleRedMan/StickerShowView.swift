//
//  StickerShowView.swift
//  StickerDemo
//
//  Created by 陈建蕾 on 2019/9/18.
//  Copyright © 2019 陈建蕾. All rights reserved.
//

import UIKit
import SnapKit
import YYImage

class StickerShowView: UIView {
    var imageName: String!
    var icon: YYAnimatedImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        self.initSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initSubviews() {
        icon = YYAnimatedImageView()
        icon.contentMode = .center
        addSubview(icon)
        
        layout()
    }
    
    private func layout() {
        icon.snp.makeConstraints { (make) in
            make.edges.equalTo(self)
        }
    }
    
    public func update(_ obj: StickerModel) {
        icon.image = YYImage.init(named: obj.imageName)
    }
}
