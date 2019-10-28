//
//  StickerCollectionViewCell.swift
//  StickerDemo
//
//  Created by 陈建蕾 on 2019/9/17.
//  Copyright © 2019 陈建蕾. All rights reserved.
//

import UIKit
import SnapKit
import YYImage

class StickerCollectionViewCell: UICollectionViewCell {
    
    var icon: YYAnimatedImageView!
    var obj: StickerModel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initSubviews() {
        icon = YYAnimatedImageView()
        icon.contentMode = .scaleAspectFit
        contentView.addSubview(icon)
        
        layout()
    }
    
    private func layout() {
        icon.snp.makeConstraints { (make) in
            make.edges.equalTo(UIEdgeInsets.init(top: 4, left: 4, bottom: 4, right: 4))
        }
    }
    
    public func update(_ obj: StickerModel) {
        let image = YYImage.init(named: obj.imageName)
        icon.image = image
    }
}
