//
//  CompetitionsViewController.swift
//  Team_UP
//
//  Created by Ivan Kopiev on 05.06.2021.
//

import UIKit

class CompetitionsViewController: UIViewController {
    
    init() {
        super.init(nibName: nil, bundle: nil)
        tabBarItem = UITabBarItem(title: "Соревнования", image: #imageLiteral(resourceName: "competition"), tag: 0)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    // MARK: - Свойства
    
    lazy var tagCollection: UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.scrollDirection = .horizontal
        layout.estimatedItemSize = CGSize(width: 20, height: 40)
        let collection = UICollectionView(frame: CGRect(x: 16, y: 100, width: view.frame.width, height: 40), collectionViewLayout: layout)
        collection.dataSource = self
        collection.delegate = self
        collection.showsHorizontalScrollIndicator = false
        collection.register(TagCell.self, forCellWithReuseIdentifier: TagCell.identifier)
        collection.backgroundColor = .clear
        return collection
    }()
    
    private let cellId = "cell"
    private lazy var eventTableView: UITableView = {
        let table = UITableView(frame: CGRect(x: 0, y: 160, width: view.frame.width, height: view.frame.height-160), style: .plain)
        table.register(EventCell.self, forCellReuseIdentifier: cellId)
        table.delegate = self
        table.dataSource = self
        table.separatorStyle = .none
        table.estimatedRowHeight = 300
        table.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0)
        table.backgroundColor = .clear
        return table
    }()
    
    private lazy var titleLabel: UILabel = {
        let titleLabel = UILabel(frame:CGRect(x: 0, y: 50, width: view.frame.width, height: 30))
        titleLabel.font = .monospacedDigitSystemFont(ofSize: 22, weight: .regular)
        titleLabel.textColor = .white
        titleLabel.textAlignment = .center
        titleLabel.text = "Соревнования"
        return titleLabel
    }()
    
    var eventsData = [Event]() // Массив с объектами
    var tagData = ["Все", "Футбол","Марафон", "Волейбол","Баскетбол", "Тенис","Кёрлинг", "Олимпиада","Прятки", "Отчеты","Бег", "Стритбол"]
    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
        eventsData.append(Event(date: "10 июля, суббота", adress: "Самый крупный марафон с синхронным стартом", image: "marafon", type: "Марафон, 25 км"))
        eventsData.append(Event(date: "11 июля, воскресение", adress: "Финальный матч между командами “IT гиганты” и “Офисный планктон”", image: "foot", type: "Футбол"))
        
    }
    
    
    // MARK: - Helpers
    
    func createUI() {
        let backgroundImageView = UIImageView(image: UIImage(named: "background"))
        backgroundImageView.frame = view.frame
        view.addSubview(backgroundImageView)
        view.addSubview(eventTableView)
        view.addSubview(tagCollection)
        view.addSubview(titleLabel)

    }
    
}
// MARK: - Extension DataSource
extension CompetitionsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return eventsData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        
        return configure(cell: cell, at: indexPath)
    }
    
    func configure(cell: UITableViewCell, at indexPath: IndexPath) -> EventCell {
        guard let newCell = cell as? EventCell else { return EventCell()}
        newCell.configureCell(with: eventsData[indexPath.row])
        return newCell
    }
    
    
}
// MARK: - Extension Delegate
extension CompetitionsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        navigationController?.pushViewController(DetailCompetitionViewController(state: .part), animated: true)
    }
}

// MARK: - Extension CollectionView DataSource
extension CompetitionsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TagCell.identifier, for: indexPath)
        return configure(cell, at: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tagData.count
    }
    
    func configure(_ cell: UICollectionViewCell, at indexPath: IndexPath) -> TagCell {
        guard let `cell` = cell as? TagCell else {return TagCell()}
        if cell.check {
            cell.viewConteiner.backgroundColor = UIColor(red: 0.918, green: 0.337, blue: 0.086, alpha: 1)
        } else {
            cell.viewConteiner.backgroundColor = UIColor(red: 0.035, green: 0.035, blue: 0.188, alpha: 0.5)
        }
        cell.tagLabel.text = tagData[indexPath.row]
        return cell
    }

}

extension CompetitionsViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? TagCell else {return}
        if cell.check {
            cell.viewConteiner.backgroundColor = UIColor(red: 0.035, green: 0.035, blue: 0.188, alpha: 0.5)
            cell.check = false
        } else {
            cell.viewConteiner.backgroundColor  = UIColor(red: 0.918, green: 0.337, blue: 0.086, alpha: 1)
            cell.check = true
        }
    }
}
