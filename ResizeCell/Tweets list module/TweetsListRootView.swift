//
//  TweetsListRootView.swift
//  ResizeCell
//
//  Created by Abiu Ramirez on 10/11/21.
//

import UIKit

final class TweetsListRootView: UIView {
    
    // MARK: Private variables
    private lazy var tableView: UITableView = {
        let tv = UITableView()
        tv.backgroundColor = .black
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.register(TweetCell.self, forCellReuseIdentifier: "cell")
        tv.rowHeight = UITableView.automaticDimension
        return tv
    }()
    
    private let addTweetButton: UIButton = {
        let button = UIButton()
        button.setTitle("Add", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor.systemBlue
        button.layer.cornerRadius = 25
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        styleView()
        constructViews()
        activateConstraints()
    }
    
    // MARK: Privaee Methods
    private func styleView() {
        backgroundColor = .black
    }
    
    private func constructViews() {
        addSubview(tableView)
        addSubview(addTweetButton)
    }
    
    private func activateConstraints() {
        tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        tableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 0).isActive = true
        tableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
        
        addTweetButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16).isActive = true
        addTweetButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -16).isActive = true
        addTweetButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        addTweetButton.widthAnchor.constraint(equalTo: addTweetButton.heightAnchor).isActive = true
    }
    
    // MARK: Public Methods
    public func getTableView() -> UITableView {
        return tableView
    }
    
    public func getAddButon() -> UIButton {
        return addTweetButton
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
