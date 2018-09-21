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
    let coverImageURL: String
    
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
        self.coverImageURL = dictionary["coverImageUrl"] as? String ?? ""
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
