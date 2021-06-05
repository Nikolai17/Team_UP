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
    
    // MARK: - Свойства
    private let cellId = "cell"
    private lazy var feedTableView: UITableView = {
        let table = UITableView(frame: view.frame, style: .plain)
        table.register(EventCell.self, forCellReuseIdentifier: cellId)
        table.delegate = self
        table.dataSource = self
        table.separatorStyle = .none
        table.estimatedRowHeight = 300
        table.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0)
        table.backgroundColor = .clear
        return table
    }()
    
    var eventsData = [Event]() // Массив с объектами
    
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
        view.addSubview(feedTableView)
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
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let titleLabel = UILabel(frame:CGRect(x: 0, y: 0, width: 183, height: 40))
        titleLabel.font = .boldSystemFont(ofSize: 22)
        titleLabel.textColor = .white
        titleLabel.textAlignment = .center
        titleLabel.text = "Соревнования"
        return titleLabel
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

    
}
