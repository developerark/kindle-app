//
//  ViewController.swift
//  kindle-app
//
//  Created by Aswin Raj Kharel on 9/19/18.
//  Copyright © 2018 Aswin Raj Kharel. All rights reserved.
//

import UIKit



class ViewController: UITableViewController {
    
    var books: [Book]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.register(BookCell.self, forCellReuseIdentifier: "cellID")
        
        // Remove cell lines
        tableView.tableFooterView =
            UIView()
        self.navigationItem.title = "Kindle"
        self.setupBooks()
    }
    
    // Setting the height for tableview cell
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    // Number of cells in the tableview
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let count = self.books?.count else {return 0}
        return count
    }
    
    // Generate each cell
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath)
        let book = self.books?[indexPath.row]
//        cell.textLabel?.text = book?.title
//        cell.imageView?.image = book?.image
        
        return cell
    }
    
    func setupBooks(){
        let page1 = Page(number: 1, text: "Text for the first page")
        let page2 = Page(number: 2, text: "Text for the second page")
        
        let book1 = Book(title: "Steve Jobs", author: "Walter Issacson", image: UIImage(named: "stevejobs")!, pages: [page1, page2])
        let book2 = Book(title: "Bill Gates: A Biography", author: "Michael Becraft", image: UIImage(named: "billgates")!, pages: [
            Page(number: 1, text: "This is the first page"),
            Page(number: 2, text: "This is the second page"),
            Page(number: 3, text: "This is the third page"),
            Page(number: 4, text: "This is the fourth page")
            ])
        self.books = [book1, book2]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

