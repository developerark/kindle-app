//
//  BookPageController.swift
//  kindle-app
//
//  Created by Aswin Raj Kharel on 9/20/18.
//  Copyright © 2018 Aswin Raj Kharel. All rights reserved.
//

import UIKit

class BookPageController: UICollectionViewController, UICollectionViewDelegateFlowLayout{
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView?.backgroundColor = .white
        self.navigationItem.title = "Book"
        self.collectionView?.register(PageCell.self, forCellWithReuseIdentifier: "cellID")
        
        // Collectionview layout
        let layout = self.collectionView?.collectionViewLayout as? UICollectionViewFlowLayout
        layout?.scrollDirection = .horizontal
        self.collectionView?.isPagingEnabled = true
        layout?.minimumLineSpacing = 0
    }
    
    // Configuring cell size - conform to UICOllectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width, height: self.view.frame.height)
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellID", for: indexPath)
//        if indexPath.item % 2 == 0 {
//            cell.backgroundColor = .blue
//        }else{
//            cell.backgroundColor = .red
//        }
            return cell
    }
}
