//
//  NotesAssembly.swift
//  rslomtevPW5
//
//  Created by Роман Ломтев on 23.10.2022.
//

import UIKit

enum NotesAssembly {
    
    static func build() -> UIViewController {
        let presenter = NotesPresenter()
        let interactor = NotesInteractor(presenter: presenter)
        let viewController = NotesViewController(interactor: interactor)
        
        presenter.viewController = viewController
        
        return viewController
    }
}
