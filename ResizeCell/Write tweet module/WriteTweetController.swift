//
//  WriteTweetController.swift
//  ResizeCell
//
//  Created by Abiu Ramirez on 09/11/21.
//

import UIKit

final class WriteTweetController: UIViewController {
    
    private let rootView = WriteTweetRootView()
    
    override func loadView() {
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // prevents to dismiss the view controller
        isModalInPresentation = true
        
        addNavTopItems()
        configureTweetTextView()
    }
    
    private func configureTweetTextView() {
        rootView.getTextView().delegate = self
        
        // Focus the textview
        rootView.getTextView().becomeFirstResponder()
    }
    
    @objc private func dismissController() {
        self.dismiss(animated: true, completion: nil)
    }
    
    private func addNavTopItems() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(dismissController))
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissController))
    }
}

extension WriteTweetController: UITextViewDelegate {
    // Verifies if the user can still type or not
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        // text count has 1 more than textView.text count
        // because it's called before making any changes to verify if the changes should be done
        return (textView.text.count + text.count) <= 140
    }
    
    // gets the text from the textview
    func textViewDidChange(_ textView: UITextView) {
        let remainingCount = 140 - textView.text.count
        rootView.updateCounter("\(remainingCount)")
        print("Text", textView.text ?? "no text pfff", "\ncount..", remainingCount )
    }
}
