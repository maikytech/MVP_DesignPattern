//
//  ViewController.swift
//  MVP_DesignPattern
//
//  Created by Maiqui Cedeño on 5/03/22.
//

import UIKit

class UsersViewController: UIViewController {
    
    //MARK: - Variables
    private lazy var tableView: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
      
    }
    
    //MARK: - Private Methods
    private func setupView() {
        title = "Users"
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        tableView.frame = view.bounds
    }

}

//MARK: - UITableViewDataSource
extension UsersViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        return cell
    }
}

//MARK: - UITableViewDelegate
extension UsersViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //Ask presenter to handle the tap.
    }
    
}

