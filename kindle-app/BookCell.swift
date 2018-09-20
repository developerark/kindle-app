//
//  BookCell.swift
//  kindle-app
//
//  Created by Aswin Raj Kharel on 9/19/18.
//  Copyright © 2018 Aswin Raj Kharel. All rights reserved.
//

import UIKit

class BookCell: UITableViewCell{
    let coverImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .red
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "This is a text for the label"
        label.backgroundColor = .blue
        return label
    }()
    
    let authorLabel: UILabel = {
        let label = UILabel()
        label.text = "This is the author label"
        return label
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        print("Cell is being Initialized")
        self.backgroundColor = .yellow
        self.addSubview(self.coverImageView)
        self.coverImageView.frame = CGRect(x: 8, y: 8, width: 50, height: 64)
        self.addSubview(self.titleLabel)
        self.titleLabel.frame = CGRect(x: 66, y: 20, width: 200, height: 20)
        self.addSubview(self.authorLabel)
        self.authorLabel.frame = CGRect(x: 66, y: 48, width: 200, height: 20)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
