//
//  NoteCell.swift
//  rslomtevPW4
//
//  Created by Роман Ломтев on 06.10.2022.
//

import UIKit

protocol AddNoteDelegate: AnyObject {
    func newNoteAdded(note: ShortNote)
}

final class AddNoteCell: UITableViewCell {
    
    static let reuseIdentifier = "AddNoteCell"
    private var textView = UITextView()
    public var addButton = UIButton()
    
    var delegate: AddNoteDelegate?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.selectionStyle = .none
        setupView()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    @available (*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        setupStackView()
        
        contentView.backgroundColor = .systemGray5
    }
    
    private func setupTextView() {
        textView.font = .systemFont(ofSize: 14, weight: .regular)
        textView.textColor = .tertiaryLabel
        textView.backgroundColor = .clear
        textView.setHeight(to: 140)
    }
    
    private func setupAddButton() {
        addButton.setTitle("Add new note", for: .normal)
        addButton.titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)
        addButton.setTitleColor(.systemBackground, for: .normal)
        addButton.backgroundColor = .label
        addButton.layer.cornerRadius = 8
        addButton.setHeight(to: 44)
        addButton.addTarget(self, action: #selector(addButtonTapped(_:)), for: .touchUpInside)
        //addButton.isEnabled = false
        addButton.alpha = 0.5
    }
    
    @objc
    private func addButtonTapped(_ sender: UIButton) {
        delegate?.newNoteAdded(note: ShortNote(text: textView.text))
        clearTextView()
    }
    
    private func clearTextView() {
        textView.text = ""
    }
    
    private func setupStackView() {
        setupTextView()
        setupAddButton()
        
        let stackView = UIStackView(arrangedSubviews: [textView, addButton])
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.distribution = .fill
        
        contentView.addSubview(stackView)
        stackView.pin(to: contentView, [.left: 16, .top: 16, .bottom: 16, .right: 16])
    }
}
