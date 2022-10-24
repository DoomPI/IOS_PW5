//
//  NoteCell.swift
//  rslomtevPW4
//
//  Created by Роман Ломтев on 06.10.2022.
//

import UIKit

final class NoteCell : UITableViewCell {
    
    static let reuseIdentifier = "NoteCell"
    private var textView = UITextView()
    
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
    
    func configure(note: ShortNote) {
        textView.text = note.text
    }
    
    private func setupView() {
        setupTextView()
        
        contentView.backgroundColor = .systemGray5
    }
    
    private func setupTextView() {
        textView.font = .systemFont(ofSize: 14, weight: .regular)
        textView.textColor = .tertiaryLabel
        textView.backgroundColor = .clear
        textView.setHeight(to: 140)
        
        contentView.addSubview(textView)
        textView.pin(to: contentView, [.left: 16, .top: 16, .bottom: 16, .right: 16])
    }
}
