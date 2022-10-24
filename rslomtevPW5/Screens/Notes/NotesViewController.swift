//
//  NotesViewController.swift
//  rslomtevPW4
//
//  Created by Роман Ломтев on 06.10.2022.
//

import UIKit

protocol NotesDisplayLogic : AnyObject {
    
    func display(data: [ShortNote])
}

final class NotesViewController: UIViewController {
    
    // MARK: - Internal vars
    private let interactor: NotesBusinessLogic
    
    private let tableView = UITableView(frame: .zero, style: .insetGrouped)
    private var dataSource = [ShortNote]()
    
    // MARK: - Init
    init(interactor: NotesBusinessLogic) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupView()
        interactor.fetchNotes()
    }
    
    private func setupView() {
        setupTableView()
        setupNavBar()
    }
    
    private func setupNavBar() {
        self.title = "Notes"
    }
    
    private func setupTableView() {
        tableView.register(
            AddNoteCell.self,
            forCellReuseIdentifier: AddNoteCell.reuseIdentifier
        )
        
        tableView.register(
            NoteCell.self,
            forCellReuseIdentifier: NoteCell.reuseIdentifier
        )
        
        view.addSubview(tableView)
        
        tableView.backgroundColor = .clear
        tableView.keyboardDismissMode = .onDrag
        tableView.dataSource = self
        tableView.delegate = self
        
        view.addSubview(tableView)
        tableView.pin(to: self.view)
    }
    
    private func handleDelete(indexPath: IndexPath) {
        dataSource.remove(at: indexPath.row)
        tableView.reloadData()
    }
}

extension NotesViewController: UITableViewDataSource {
    
    private static let tableViewAddNoteSectionNumber : Int = 0
    private static let tableViewNotesSectionNumber = 1
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case NotesViewController.tableViewAddNoteSectionNumber:
            return 1
        case NotesViewController.tableViewNotesSectionNumber:
            return dataSource.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case NotesViewController.tableViewAddNoteSectionNumber:
            if let addNewCell = tableView.dequeueReusableCell(withIdentifier:
            AddNoteCell.reuseIdentifier, for: indexPath) as? AddNoteCell {
                addNewCell.delegate = self
                return addNewCell
            }
            
        case NotesViewController.tableViewNotesSectionNumber:
            let note = dataSource[indexPath.row]
            if let noteCell = tableView.dequeueReusableCell(
                withIdentifier: NoteCell.reuseIdentifier,
                for: indexPath
            ) as? NoteCell {
                noteCell.configure(note: note)
                return noteCell
            }
        default:
            return UITableViewCell()
        }
        
        return UITableViewCell()
    }
}

extension NotesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        if (indexPath.section == NotesViewController.tableViewNotesSectionNumber) {
            let deleteAction = UIContextualAction(
                style: .destructive,
                title: .none
            ) { [weak self] (action, view, completion) in
                self?.handleDelete(indexPath: indexPath)
                completion(true)
            }
            deleteAction.image = UIImage(
                systemName: "trash.fill",
                withConfiguration: UIImage.SymbolConfiguration(weight: .bold)
            )?.withTintColor(.white)
            deleteAction.backgroundColor = .red
            
            return UISwipeActionsConfiguration(actions: [deleteAction])
        }
        
        return nil
    }
}

extension NotesViewController: AddNoteDelegate {
    func newNoteAdded(note: ShortNote) {
        dataSource.insert(note, at: 0)
        tableView.reloadData()
    }
}

extension NotesViewController: NotesDisplayLogic {
    
    func display(data: [ShortNote]) {
        dataSource.removeAll()
        dataSource.append(contentsOf: data)
        tableView.reloadData()
    }
}

