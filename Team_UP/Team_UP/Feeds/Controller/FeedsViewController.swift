//
//  FeedsViewController.swift
//  Team_UP
//
//  Created by Ivan Kopiev on 05.06.2021.
//
import UIKit

class FeedsViewController: UIViewController {
    
    init() {
        super.init(nibName: nil, bundle: nil)
        
        tabBarItem = UITabBarItem(title: "Лента", image: #imageLiteral(resourceName: "like"), tag: 0)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Свойства
    private let cellId = "cell"
    private lazy var feedTableView: UITableView = {
        let table = UITableView(frame: view.frame, style: .plain)
        table.register(FeedCell.self, forCellReuseIdentifier: cellId)
        table.delegate = self
        table.dataSource = self
        table.separatorStyle = .none
        table.estimatedRowHeight = 300
        table.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0)
        table.backgroundColor = .clear
        return table
    }()
    
    var feedData = [Feed]() // Массив с объектами
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
        feedData.append(Feed(image: "run", name: "Коля Шульгин", description: "Сегодня пробежал 14 км, это было тяжело, но я справился...", kindOfSport: "Бег", numberOfViews: 8563, numberOfLikes: 6473, numberOfComments: 342))
        feedData.append(Feed(image: "football", name: "Александр Крыжовников", description: "С парнями сегодня гоняли мяч, наша команда победила со счетом 4:1. Ура, товарищи!", kindOfSport: "Футбол", numberOfViews: 6573, numberOfLikes: 5606, numberOfComments: 313))

    }
    
    
    // MARK: - Helpers
    
    func createUI() {
        let backgroundImageView = UIImageView(image: UIImage(named: "background"))
        backgroundImageView.frame = view.frame
        view.addSubview(backgroundImageView)
        view.addSubview(feedTableView)
    }
    
}
// MARK: - Extension DataSource
extension FeedsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feedData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        
        return configure(cell: cell, at: indexPath)
    }
    
    func configure(cell: UITableViewCell, at indexPath: IndexPath) -> FeedCell {
        guard let newCell = cell as? FeedCell else { return FeedCell()}
        newCell.configureCell(with: feedData[indexPath.row])
        return newCell
    }
    
    
}
// MARK: - Extension Delegate
extension FeedsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let titleLabel = UILabel(frame:CGRect(x: 0, y: 0, width: 183, height: 40))
        titleLabel.font = .boldSystemFont(ofSize: 22)
        titleLabel.textColor = .white
        titleLabel.textAlignment = .center
        titleLabel.text = "Спортивная лента"
        return titleLabel
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

    
}
