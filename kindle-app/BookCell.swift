//
//  BookCell.swift
//  kindle-app
//
//  Created by Aswin Raj Kharel on 9/19/18.
//  Copyright © 2018 Aswin Raj Kharel. All rights reserved.
//

import UIKit

class BookCell: UITableViewCell{
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        print("Cell is being Initialized")
        self.backgroundColor = .yellow
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
