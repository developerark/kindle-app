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
    
    init(dictionary: [String: Any]){
        // Try to unwrap if not use ""
        // Same as doing
//        if let title = dictionary["title"] as? String{
//            self.title = title
//        }else{
//            self.title = ""
//        }
        self.title = dictionary["title"] as? String ?? ""
        self.author = dictionary["author"] as? String ?? ""
        self.image = #imageLiteral(resourceName: "stevejobs")
        var bookPages = [Page]()
        if let pagesDictionaries = dictionary["pages"] as? [[String: Any]]{
            
            for pageDictionary in pagesDictionaries{
                if let pageText = pageDictionary["text"] as? String{
                    let page = Page(number: 1, text: pageText)
                    bookPages.append(page)
                }
            }
        }
        self.pages = bookPages
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
