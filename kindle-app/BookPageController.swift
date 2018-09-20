//
//  BookPageController.swift
//  kindle-app
//
//  Created by Aswin Raj Kharel on 9/20/18.
//  Copyright © 2018 Aswin Raj Kharel. All rights reserved.
//

import UIKit

class BookPageController: UICollectionViewController, UICollectionViewDelegateFlowLayout{
    
    var book: Book?{
        didSet{
            self.navigationItem.title = self.book?.title
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView?.backgroundColor = .white
        self.collectionView?.register(PageCell.self, forCellWithReuseIdentifier: "cellID")
        
        // Collectionview layout
        let layout = self.collectionView?.collectionViewLayout as? UICollectionViewFlowLayout
        layout?.scrollDirection = .horizontal
        self.collectionView?.isPagingEnabled = true
        layout?.minimumLineSpacing = 0
        // Adding the close button
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Close", style: .plain, target: self, action: #selector(handleCloseBook))
    }
    
    @objc func handleCloseBook(){
        self.dismiss(animated: true, completion: nil)
    }
    
    // Configuring cell size - conform to UICOllectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // 40 is nav bar height, 20 is status bar height
        return CGSize(width: self.view.frame.width, height: self.view.frame.height - 44 - 20)
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (self.book?.pages.count)!
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let pageCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellID", for: indexPath) as! PageCell
//        if indexPath.item % 2 == 0 {
//            cell.backgroundColor = .blue
//        }else{
//            cell.backgroundColor = .red
//        }
        pageCell.textLabel.text = self.book?.pages[indexPath.item].text
        return pageCell
    }
}
