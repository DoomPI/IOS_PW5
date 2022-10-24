//
//  NotesInteractor.swift
//  rslomtevPW4
//
//  Created by Роман Ломтев on 09.10.2022.
//

import Foundation

protocol NotesBusinessLogic {
    
    func fetchNotes()
}

class NotesInteractor {
    
    // MARK: Internal vars
    private let presenter: NotesPresentationLogic
    
    init(presenter: NotesPresentationLogic) {
        self.presenter = presenter
    }
}

extension NotesInteractor: NotesBusinessLogic {
    
    func fetchNotes() {
        
        // Here we would fetch notes data from server and provide backend model to presenter
        
        presenter.present()
    }
}
