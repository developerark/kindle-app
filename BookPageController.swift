//
//  BookPageController.swift
//  kindle-app
//
//  Created by Aswin Raj Kharel on 9/20/18.
//  Copyright © 2018 Aswin Raj Kharel. All rights reserved.
//

import UIKit

class BookPageController: UICollectionViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView?.backgroundColor = .white
        self.navigationItem.title = "Book"
        self.collectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cellID")
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellID", for: indexPath)
        cell.backgroundColor = .red
        return cell
    }
}
