//
//  PageCell.swift
//  kindle-app
//
//  Created by Aswin Raj Kharel on 9/20/18.
//  Copyright © 2018 Aswin Raj Kharel. All rights reserved.
//

import UIKit

class PageCell: UICollectionViewCell{
    let textLabel: UILabel = {
        let label = UILabel()
        label.text = "SAMPLE TEXT FOR LABELSAMPLE TEXT FOR LABELSAMPLE TEXT FOR LABELSAMPLE TEXT FOR LABELSAMPLE TEXT FOR LABELSAMPLE TEXT FOR LABELSAMPLE TEXT FOR LABELSAMPLE TEXT FOR LABEL"
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        //label.backgroundColor = .green
        return label
    }()
    override init(frame: CGRect){
        super.init(frame: frame)
        //self.backgroundColor = .yellow
        
        addSubview(self.textLabel)
        self.textLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        self.textLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        self.textLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
        self.textLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
