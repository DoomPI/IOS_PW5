//
//  NewsListViewController.swift
//  rslomtevPW5
//
//  Created by Роман Ломтев on 23.10.2022.
//

import UIKit

class NewsListViewController: UIViewController {
    
    // MARK: - Internal vars
    private let interactor: NewsListBusinessLogic
    private let router: NewsListRoutingLogic
    
    private var tableView = UITableView(frame: .zero, style: .plain)
    private var isLoading = false
    private var newsModels = Model.News(articles: [])
    
    // MARK: - Init
    init(interactor: NewsListBusinessLogic, router: NewsListRoutingLogic) {
        self.interactor = interactor
        self.router = router
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        interactor.fetchNews(Model.GetNews.Request())
    }
    
    private func setupUI() {
        view.backgroundColor = .systemBackground
        setupNavBar()
        configureTableView()
    }
    
    private func setupNavBar() {
        self.title = "Articles"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .refresh,
            target: self,
            action: #selector(refreshButtonPressed)
        )
        navigationItem.rightBarButtonItem?.tintColor = .label
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "chevron.left"),
            style: .plain,
            target: self,
            action: #selector(backButtonPressed)
        )
        navigationItem.leftBarButtonItem?.tintColor = .label
    }
    
    @objc func backButtonPressed() {
        router.navigateBack()
    }
    
    @objc
    private func refreshButtonPressed() {
        let generator = UIImpactFeedbackGenerator(style: .light)
        generator.impactOccurred()
        self.interactor.fetchNews(Model.GetNews.Request())
    }
    
    private func configureTableView() {
        setTableViewUI()
        setTableViewDelegate()
        setTableViewCell()
    }
    
    private func setTableViewDelegate() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func setTableViewUI() {
        view.addSubview(tableView)
        tableView.backgroundColor = .clear
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        tableView.rowHeight = 120
        tableView.pinLeft(to: view)
        tableView.pinTop(to: view.safeAreaLayoutGuide.topAnchor)
        tableView.pinRight(to: view)
        tableView.pinBottom(to: view)
    }
    
    private func setTableViewCell() {
        tableView.register(NewsCell.self, forCellReuseIdentifier: NewsCell.reuseIdentifier)
    }
}

extension NewsListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isLoading {
            return 0
        } else {
            return newsModels.articles?.count ?? 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if isLoading {
            
        } else {
            guard let article = newsModels.articles?[indexPath.row] else {
                return UITableViewCell()
            }
            
            if let newsCell = tableView.dequeueReusableCell(
                withIdentifier: NewsCell.reuseIdentifier,
                for: indexPath
            ) as? NewsCell {
                newsCell.configure(with: article)
                return newsCell
            }
        }
        
        return UITableViewCell()
    }
}

extension NewsListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if !isLoading {
            guard let article = newsModels.articles?[indexPath.row] else {
                return
            }
            router.navigateToNewsScreen(article: article)
        }
    }
}

extension NewsListViewController: NewsListDisplayLogic {
    
    func display(data: Model.GetNews.ViewModel) {
        newsModels = data.news
        DispatchQueue.main.async { [weak self] in
            self?.tableView.reloadData()
        }
    }
}
