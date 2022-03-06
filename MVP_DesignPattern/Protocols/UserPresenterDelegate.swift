//
//  UserPresenterDelegate.swift
//  MVP_DesignPattern
//
//  Created by Maiqui Cedeño on 5/03/22.
//

import Foundation

protocol UserPresenterDelegate: AnyObject {
    func presentUsers(users: [User])
    func presentAlert(title: String, message: String)
}
