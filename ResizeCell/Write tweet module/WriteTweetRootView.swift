//
//  WriteTweetRootView.swift
//  ResizeCell
//
//  Created by Abiu Ramirez on 10/11/21.
//

import UIKit

final class WriteTweetRootView: UIView {
    
    // MARK: Private Variables
    private let tweetTextView: UITextView = {
        let tv = UITextView()
        tv.textColor = .black
        tv.backgroundColor = .gray
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    
    private let counterLabel: UILabel = {
        let label = UILabel()
        label.text = "140"
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        styleView()
        constructViews()
        activateConstraints()
    }
    
    // MARK: Private Methods
    private func styleView() {
        backgroundColor = .black
    }
    
    public func updateCounter(_ text: String) {
        counterLabel.text = text
    }
    
    private func constructViews() {
        addSubview(tweetTextView)
        addSubview(counterLabel)
    }
    
    private func activateConstraints() {
        tweetTextView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        tweetTextView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 0).isActive = true
        tweetTextView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: 0).isActive = true
        tweetTextView.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 0.6).isActive = true
        
        counterLabel.topAnchor.constraint(equalTo: tweetTextView.bottomAnchor, constant: 0).isActive = true
        counterLabel.leadingAnchor.constraint(equalTo: tweetTextView.leadingAnchor).isActive = true
        counterLabel.trailingAnchor.constraint(equalTo: tweetTextView.trailingAnchor).isActive = true
    }
    
    // MARK: Public Methods
    public func getTextView() -> UITextView {
        return self.tweetTextView
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
