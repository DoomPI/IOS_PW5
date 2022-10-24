//
//  NewsCell.swift
//  rslomtevPW5
//
//  Created by Роман Ломтев on 23.10.2022.
//

import UIKit

class NewsCell: UITableViewCell {
    
    static let reuseIdentifier = "NewsCell"
    
    private let newsImageView = UIImageView()
    private let newsTitleLabel = UILabel()
    private let newsDescriptionLabel = UILabel()
    
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        setupView()
    }
        
    @available (*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    func configure(with news: NewsModel.Article) {
        newsTitleLabel.text = news.title
        newsDescriptionLabel.text = news.description
        if let url = news.imageURL {
            URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
                guard let data = data else {
                    return
                }
                DispatchQueue.main.async {
                    self?.newsImageView.image = UIImage(data: data)
                }
            }.resume()
        }
    }
    
    private func setupView() {
        setupImageView()
        setupTitleLabel()
        setupDescriptionLabel()
    }
    
    private func setupImageView() {
        newsImageView.image = UIImage(named: "landscape")
        newsImageView.layer.cornerRadius = 8
        newsImageView.layer.cornerCurve = .continuous
        newsImageView.clipsToBounds = true
        newsImageView.contentMode = .scaleAspectFill
        newsImageView.backgroundColor = .secondarySystemBackground
        
        contentView.addSubview(newsImageView)
        newsImageView.pinTop(to: contentView, 12)
        newsImageView.pinLeading(to: contentView, 16)
        newsImageView.pinBottom(to: contentView, 12)
        newsImageView.pinWidth(to: newsImageView.heightAnchor)
    }
    
    private func setupTitleLabel() {
        newsTitleLabel.text = "Hello"
        newsTitleLabel.font = .systemFont(ofSize: 16, weight: .medium)
        newsTitleLabel.textColor = .label
        newsTitleLabel.numberOfLines = 1
        
        contentView.addSubview(newsTitleLabel)
        newsTitleLabel.pinHeight(with: newsTitleLabel.font.lineHeight)
        newsTitleLabel.pinLeading(to: newsImageView.trailingAnchor, 12)
        newsTitleLabel.pinTop(to: contentView, 12)
        newsTitleLabel.pinTrailing(to: contentView, 12)
    }
    
    private func setupDescriptionLabel() {
        newsDescriptionLabel.text = "World"
        newsDescriptionLabel.font = .systemFont(ofSize: 14, weight: .regular)
        newsDescriptionLabel.textColor = .secondaryLabel
        newsDescriptionLabel.numberOfLines = 0
        
        contentView.addSubview(newsDescriptionLabel)
        newsDescriptionLabel.pinLeading(to: newsImageView.trailingAnchor, 12)
        newsDescriptionLabel.pinTop(to: newsTitleLabel.bottomAnchor, 12)
        newsDescriptionLabel.pinTrailing(to: contentView, 16)
        newsDescriptionLabel.pinBottom(lessThanOrEqualTo: contentView.bottomAnchor, 12)
    }
}
