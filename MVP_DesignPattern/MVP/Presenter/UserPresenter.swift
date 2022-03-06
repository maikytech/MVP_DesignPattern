//
//  Presenter.swift
//  MVP_DesignPattern
//
//  Created by Maiqui Cedeño on 5/03/22.
//

import Foundation
import UIKit

final class UserPresenter {
    typealias PresenterDelegate = UserPresenterDelegate & UIViewController
    
    private weak var delegate: PresenterDelegate?
    
    func setViewDelegate(delegate: PresenterDelegate) {
        self.delegate = delegate
    }
    
    func getUsers() {
        let url = "\(EndPoint.domain)\(EndPoint.searchUsers)"
        
        guard let objectUrl = URL(string: url) else {
            return
        }
        let task = URLSession.shared.dataTask(with: objectUrl) { [weak self] data, _, error in
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
    
    func didTap(user: User) {
        delegate?.presentAlert(title: user.name, message: user.email)
    }
}


