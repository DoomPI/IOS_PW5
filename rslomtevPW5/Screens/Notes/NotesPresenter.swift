//
//  NotesPresenter.swift
//  rslomtevPW4
//
//  Created by Роман Ломтев on 09.10.2022.
//

import Foundation

protocol NotesPresentationLogic {
    
    func present()
}

class NotesPresenter {
    
    // MARK: - External vars
    weak var viewController: NotesDisplayLogic?
}

// MARK: - Presentation logic implementation
extension NotesPresenter: NotesPresentationLogic {
    
    func present() {
        
        // Here we would get backend model and transform it to local one, but since we don't have interaction with backend, we'll present the following data to display:
        
        let data = [
            ShortNote(text: "a"),
            ShortNote(text: "b"),
            ShortNote(text: "c")
        ]
        
        viewController?.display(data: data)
    }
}
