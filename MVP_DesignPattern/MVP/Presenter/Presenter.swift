//
//  Presenter.swift
//  MVP_DesignPattern
//
//  Created by Maiqui Cedeño on 5/03/22.
//

import Foundation
import UIKit

// https://jsonplaceholder.typicode.com/users

protocol UserPresenterDelegate: AnyObject {
    func presentUsers(users: [User])
    
}

typealias PresenterDelegate = UserPresenterDelegate & UIViewController


final class UserPresenter {
    
    private weak var delegate: PresenterDelegate?
    
    func setViewDelegate(delegate: PresenterDelegate) {
        self.delegate = delegate
        
    }
    
    func getUsers() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let users = try JSONDecoder().decode([User].self, from: data)
                self?.delegate?.presentUsers(users: users)
            }catch {
                print(error)
            }
        }
        task.resume()
    }
    
}


