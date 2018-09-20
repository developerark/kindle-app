//
//  Models.swift
//  kindle-app
//
//  Created by Aswin Raj Kharel on 9/19/18.
//  Copyright © 2018 Aswin Raj Kharel. All rights reserved.
//

import UIKit

class Book{
    let title: String
    let author: String
    let pages: [Page]
    let image: UIImage
    
    init(title: String, author: String, image: UIImage, pages: [Page]){
        self.title = title
        self.author = author
        self.pages = pages
        self.image = image
    }
}

class Page{
    let number: Int
    let text: String
    
    init(number: Int, text: String){
        self.number = number
        self.text = text
    }
}
