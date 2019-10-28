//
//  StickerShowViewController.swift
//  StickerDemo
//
//  Created by 陈建蕾 on 2019/9/18.
//  Copyright © 2019 陈建蕾. All rights reserved.
//

import UIKit

class StickerShowViewController: UIViewController {
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var showView: StickerShowView!
    var safeView: UIView!
    let obj: StickerModel
    
    init(_ obj: StickerModel) {
        self.obj = obj
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initSubviews()
    }
    
    private func initSubviews() {
        showView = StickerShowView.init(frame: .zero)
        showView.update(obj)
        view.addSubview(showView)
        
        safeView = UIView.init(frame: .zero)
        safeView.backgroundColor = .white
        view.addSubview(safeView)
        
        layout()
    }
    
    private func layout() {
        showView.snp.makeConstraints { (make) in
            make.left.right.equalTo(view)
            make.height.equalTo(300)
            make.bottom.equalTo(view.snp.bottomMargin)
        }
        
        safeView.snp.makeConstraints { (make) in
            make.left.right.equalTo(showView)
            make.top.equalTo(showView.snp.bottom)
            make.bottom.equalTo(view)
        }
    }
}

extension StickerShowViewController {

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 0.25) {
            self.view.backgroundColor = UIColor.init(white: 0, alpha: 0.3)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        let point = touch?.location(in: self.view)
        if !showView.frame.contains(point!) && !safeView.frame.contains(point!){
            self.view.backgroundColor = UIColor.init(white: 0, alpha: 0)
            dismiss(animated: true, completion: nil)
        }
    }
}

