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
    init(title: String, author: String){
        self.title = title
        self.author = author
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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.view.backgroundColor = .red
        
        let book = Book(title: "Steve Jobs", author: "Walter Issacson")
        print("Title: \(book.title), Author: \(book.author)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

