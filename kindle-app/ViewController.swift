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
        setupNavigationBarStyles()
        setupNavBarButtons()
        
        tableView.register(BookCell.self, forCellReuseIdentifier: "cellID")
        
        // Remove cell lines
        tableView.tableFooterView = UIView()
        
        // Set the table view background color not the cells
        self.tableView.backgroundColor = .lightGray
        self.navigationItem.title = "Kindle"
        self.fetchBooks()
    }
    
    func fetchBooks(){
        guard let url = URL(string: "https://letsbuildthatapp-videos.s3-us-west-2.amazonaws.com/kindle.json") else {return}
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print(error)
            }
            guard let data = data else {return}
            //guard let dataStr = String(data: data, encoding: .utf8) else {return}
            
            do{
                let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
                // Declare an array of dictionary
                guard let bookDictionaries = json as? [[String: Any]] else {return}
                self.books = []
                for bookDictionary in bookDictionaries{
//                    guard let title = bookDictionary["title"] as? String else {return}
//                    guard let author = bookDictionary["author"] as? String else {return}
//                    let book = Book(title: title as! String, author: author, image: #imageLiteral(resourceName: "stevejobs"), pages: [])
                    let book = Book(dictionary: bookDictionary)
                    self.books?.append(book)
                    
                    // Call the UI code in the main thread
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }                }
            }catch let jsonError{
                print("Failed to parse JSON properly: ", jsonError)
            }
        }.resume()
    }
    // Configuring the footer view
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = UIView()
        footerView.backgroundColor = UIColor(red: 40/255, green: 40/255, blue: 40/255, alpha: 1)
        
        // Create segmented control
        let segmentedControl = UISegmentedControl(items: ["Cloud", "Device"])
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.tintColor = .white
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.addTarget(self, action: #selector(handleSegmentController(sender:)), for: UIControlEvents.valueChanged)
        footerView.addSubview(segmentedControl)
        segmentedControl.widthAnchor.constraint(equalToConstant: 200).isActive = true
        segmentedControl.heightAnchor.constraint(equalToConstant: 30).isActive = true
        segmentedControl.centerXAnchor.constraint(equalTo: footerView.centerXAnchor, constant: 0).isActive = true
        segmentedControl.centerYAnchor.constraint(equalTo: footerView.centerYAnchor, constant: 0).isActive = true

        let gridButton = UIButton(type: .system)
        gridButton.setImage(UIImage(named:"grid"), for: .normal)
        gridButton.translatesAutoresizingMaskIntoConstraints = false
        gridButton.tintColor = .white
        gridButton.addTarget(self, action: #selector(gridButtonPressed(sender:)), for: .touchUpInside)
        footerView.addSubview(gridButton)
        gridButton.leftAnchor.constraint(equalTo: footerView.leftAnchor, constant: 16).isActive = true
        gridButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        gridButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        gridButton.centerYAnchor.constraint(equalTo: footerView.centerYAnchor, constant: 0).isActive = true
        
        let sortButton = UIButton(type: .system)
        sortButton.setImage(UIImage(named:"sort"), for: .normal)
        sortButton.translatesAutoresizingMaskIntoConstraints = false
        sortButton.tintColor = .white
        sortButton.addTarget(self, action: #selector(sortButtonPressed(sender:)), for: .touchUpInside)
        footerView.addSubview(sortButton)
        sortButton.rightAnchor.constraint(equalTo: footerView.rightAnchor, constant: -16).isActive = true
        sortButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        sortButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        sortButton.centerYAnchor.constraint(equalTo: footerView.centerYAnchor, constant: 0).isActive = true
        return footerView
    }
    
    @objc func handleSegmentController(sender: UISegmentedControl){
        print(sender.selectedSegmentIndex)
    }
    
    @objc func gridButtonPressed(sender: UIButton){}
    
    @objc func sortButtonPressed(sender: UIButton){}
    
    // Cell tap handler
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let layout = UICollectionViewFlowLayout()
        let bookPageController = BookPageController(collectionViewLayout: layout)
        let navController = UINavigationController(rootViewController: bookPageController)
        let selectedBook = self.books![indexPath.row]
        bookPageController.book = selectedBook
        self.present(navController, animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 50
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
        // Downcasting
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath) as! BookCell
        let book = self.books?[indexPath.row]
        cell.book = book
        return cell
    }
    
//    func setupBooks(){
//        let page1 = Page(number: 1, text: "Text for the first page")
//        let page2 = Page(number: 2, text: "Text for the second page")
//
//        let book1 = Book(title: "Steve Jobs", author: "Walter Issacson", image: UIImage(named: "stevejobs")!, pages: [page1, page2])
//        let book2 = Book(title: "Bill Gates: A Biography", author: "Michael Becraft", image: UIImage(named: "billgates")!, pages: [
//            Page(number: 1, text: "This is the first page"),
//            Page(number: 2, text: "This is the second page"),
//            Page(number: 3, text: "This is the third page"),
//            Page(number: 4, text: "This is the fourth page")
//            ])
//        self.books = [book1, book2]
//    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func setupNavBarButtons(){
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "menuicon")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleMenuPress))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "amazonicon")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleLogoPress))
        
    }
    
    @objc func handleLogoPress(){
        print("Logo Pressed")
    }
    
    
    @objc func handleMenuPress(){
        print("Menu Pressed")
    }
    
    func setupNavigationBarStyles(){
        // Setting background color
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 40/255, green: 40/255, blue: 40/255, alpha: 1)
        self.navigationController?.navigationBar.isTranslucent = false
        let textAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.titleTextAttributes = textAttributes
    }

}

