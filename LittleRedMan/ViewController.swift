//
//  ViewController.swift
//  StickerDemo
//
//  Created by 陈建蕾 on 2019/9/17.
//  Copyright © 2019 陈建蕾. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var collectionView: UICollectionView!
    var objs: [StickerModel]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "LittleRedMan"
        objs = loadData()
        initSubviews()
    }
    
    func initSubviews() {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 2.5
        let width = Int((view.bounds.width - 15) / 3)
        layout.itemSize = CGSize.init(width: width, height: width)
        layout.sectionInset = .init(top: 0, left: 2.5, bottom: 0, right: 2.5)
        
        collectionView = UICollectionView.init(frame: view.bounds, collectionViewLayout: layout)
        collectionView.register(StickerCollectionViewCell.self, forCellWithReuseIdentifier: NSStringFromClass(StickerCollectionViewCell.self))
        collectionView.backgroundColor = .white
        collectionView.delegate = self
        collectionView.dataSource = self
        view.addSubview(collectionView)
    }
}

extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = StickerShowViewController(objs[indexPath.row])
        vc.modalPresentationStyle = .overFullScreen
        self.present(vc, animated: true, completion: nil)
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return objs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NSStringFromClass(StickerCollectionViewCell.self), for: indexPath) as! StickerCollectionViewCell
        cell.update(objs[indexPath.row])
        return cell
    }
}

extension ViewController {
    private func loadData() -> [StickerModel] {
        var arrays = [StickerModel]()
        for i in 1 ..< 44 {
            let imageName = String.init(format: "%d", i)
            let obj = StickerModel.init(imageName, type: "png")
            arrays.append(obj)
        }
        return arrays
    }
}
