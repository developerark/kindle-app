//
//  ViewController.swift
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
    
    init(title: String, author: String, pages: [Page]){
        self.title = title
        self.author = author
        self.pages = pages
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

class ViewController: UIViewController {
    
    var books: [Book]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.setupBooks()
    }
    
    func setupBooks(){
        let page1 = Page(number: 1, text: "Text for the first page")
        let page2 = Page(number: 2, text: "Text for the second page")
        
        let book1 = Book(title: "Steve Jobs", author: "Walter Issacson", pages: [page1, page2])
        let book2 = Book(title: "Bill Gates: A Biography", author: "Michael Becraft", pages: [
            Page(number: 1, text: "This is the first page"),
            Page(number: 2, text: "This is the second page"),
            Page(number: 3, text: "This is the third page"),
            Page(number: 4, text: "This is the fourth page")
            ])
        //self.books = [book1, book2]
        
        // Safely unwrapping an optional
        //        if let unwrappedBooks = self.books{
        //            for book in unwrappedBooks{
        //                print(book)
        //            }
        //        }
        
        guard let books = self.books else {return}
        for book in books{
            print(book)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

