//
//  TweetsListController.swift
//  ResizeCell
//
//  Created by Abiu Ramirez on 09/11/21.
//

import UIKit

class TweetsListController: UIViewController {
    
    private let rootView = TweetsListRootView()
    
    private let exampleText = ["Lorem ipsum dolor sit amet, consectetur adipiscing elit", "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam", " Mattis enim ut tellus elementum sagittis. Odio morbi quis commodo odio aenean sed. In est ante in nibh mauris cursus. Ac odio tempor orci dapibus. Sit amet volutpat consequat mauris. Vestibulum morbi blandit cursus risus at ultrices mi tempus imperdiet. Tincidunt eget nullam non nisi est sit amet. Sit amet consectetur adipiscing elit ut. Sed ullamcorper morbi tincidunt ornare massa eget egestas purus. Non quam lacus suspendisse faucibus. Tempor nec feugiat nisl pretium fusce id velit. Ipsum dolor sit amet consectetur adipiscing elit duis tristique sollicitudin."]
    
    override func loadView() {
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "User name..."
        configureTableView()
        addNavTopItems()
        addButtonsTargets()
    }
    
    private func configureTableView() {
        rootView.getTableView().delegate = self
        rootView.getTableView().dataSource = self
    }
    
    @objc private func composeTweetAction() {
        let navController = UINavigationController(rootViewController: WriteTweetController())
        self.present(navController, animated: true, completion: nil)
    }
    
    private func addNavTopItems() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .compose, target: self, action: #selector(composeTweetAction))
    }
    
    private func addButtonsTargets() {
        rootView.getAddButon().addTarget(self, action: #selector(composeTweetAction), for: .touchUpInside)
    }
}

extension TweetsListController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exampleText.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TweetCell
        cell.descriptionCell.text = exampleText[indexPath.row]
        return cell
    }
    
    
}
