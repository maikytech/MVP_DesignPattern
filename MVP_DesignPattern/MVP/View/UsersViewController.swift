//
//  ViewController.swift
//  MVP_DesignPattern
//
//  Created by Maiqui Cedeño on 5/03/22.
//

import UIKit

class UsersViewController: UIViewController, UserPresenterDelegate {

    //MARK: - Variables
    private let presenter =  UserPresenter()
    private var users = [User]()
    
    private lazy var tableView: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        presenter.setViewDelegate(delegate: self)
        presenter.getUsers()
      
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        tableView.frame = view.bounds
    }

    //MARK: - Private Methods
    private func setupView() {
        title = "Users"
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func presentUsers(users: [User]) {
        self.users = users
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func presentAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
        present(alert, animated: true)
    }
}

//MARK: - UITableViewDataSource
extension UsersViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = users[indexPath.row].name
        return cell
    }
}

//MARK: - UITableViewDelegate
extension UsersViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.didTap(user: users[indexPath.row])
    }
    
}

