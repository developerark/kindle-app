//
//  BookCell.swift
//  kindle-app
//
//  Created by Aswin Raj Kharel on 9/19/18.
//  Copyright © 2018 Aswin Raj Kharel. All rights reserved.
//

import UIKit

class BookCell: UITableViewCell{
    var book: Book?{
        didSet{
            self.titleLabel.text = book?.title
            self.authorLabel.text = book?.author
            guard let coverImageURL = book?.coverImageURL else {return}
            guard let url = URL(string: coverImageURL) else {return}
            self.coverImageView.image = nil
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let error = error{
                    print(error)
                    return
                }
                guard let data = data else {return}
                let image = UIImage(data: data)
                DispatchQueue.main.async {
                    self.coverImageView.image = image
                }
            }.resume()
        }
    }

    private let coverImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let authorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        // Set the cell color
        //self.backgroundColor = .clear
        // Adding coverImageView and constraints
        self.addSubview(self.coverImageView)
        self.coverImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 8).isActive = true
        self.coverImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 8).isActive = true
        self.coverImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8).isActive = true
        self.coverImageView.widthAnchor.constraint(equalToConstant: 80).isActive = true
        
        // Adding titleLabel and constraints
        self.addSubview(self.titleLabel)
        self.titleLabel.leftAnchor.constraint(equalTo: self.coverImageView.rightAnchor, constant: 8).isActive = true
        self.titleLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -8).isActive = true
        self.titleLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        self.titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -20).isActive = true
        
        // Adding authorLabel and constraints
        self.addSubview(self.authorLabel)
        self.authorLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 4).isActive = true
        self.authorLabel.leftAnchor.constraint(equalTo: self.coverImageView.rightAnchor, constant: 8).isActive = true
        self.authorLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        self.authorLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -8).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
