//
//  TweetCell.swift
//  ResizeCell
//
//  Created by Abiu Ramirez on 09/11/21.
//

import UIKit

final class TweetCell: UITableViewCell {
    
    let userName: UILabel = {
        let label = UILabel()
        label.text = "User name here"
        label.numberOfLines = 1
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.systemBlue
        return label
    }()
    
    let descriptionCell: UILabel = {
        let label = UILabel()
        label.text = ""
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = UIColor.lightGray.withAlphaComponent(0.4)
        
        addSubview(userName)
        addSubview(descriptionCell)
        
        userName.topAnchor.constraint(equalTo: topAnchor, constant: 12).isActive = true
        userName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        userName.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        
        descriptionCell.topAnchor.constraint(equalTo: userName.bottomAnchor, constant: 8).isActive = true
        descriptionCell.leadingAnchor.constraint(equalTo: userName.leadingAnchor).isActive = true
        descriptionCell.trailingAnchor.constraint(equalTo: userName.trailingAnchor).isActive = true
        descriptionCell.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
