//
//  SportViewController.swift
//  Team_UP
//
//  Created by Dmitry Kulagin on 05.06.2021.
//

import UIKit

class SportViewController: UIViewController {
    
    struct SportItem {
        let type: String
        let date: String
        let image: UIImage
    }
    
    private let collectionView: UICollectionView
    private let collectionViewLayout: UICollectionViewFlowLayout
    
    private let tableView = UITableView()
    
    private let descriptionLabel = UILabel()
    
    private let isAdmin: Bool
    
    private let collectionItems: [SportItem] = [
        SportItem(type: "Футбол", date: "11 июня в 16:00", image: #imageLiteral(resourceName: "footbal")),
        SportItem(type: "Баскетбол", date: "12 июня в 08:00", image: #imageLiteral(resourceName: "footbal")),
        SportItem(type: "Бег", date: "13 июня в 11:00", image: #imageLiteral(resourceName: "footbal"))
    ]
    
    private lazy var tableItems: [ListItem] = [
        ListItem(image: #imageLiteral(resourceName: "profile"), title: isAdmin ? "Администраторы" : "Моя команда"),
        ListItem(image: #imageLiteral(resourceName: "archive"), title: "Архив событий")
    ]
    
    init() {
        self.collectionViewLayout = UICollectionViewFlowLayout()
        self.collectionView = UICollectionView(frame: .zero,
                                               collectionViewLayout: collectionViewLayout)
        
        let defaults = UserDefaults.standard
        isAdmin = defaults.bool(forKey: "isAdmin")
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViews()
        configureCollectionView()
    }
    
    private func configureViews() {
        
        navigationController?.navigationBar.isHidden = true
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(ListTableViewCell.self, forCellReuseIdentifier: ListTableViewCell.identifier)
        
        view.backgroundColor = .clear
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        
        descriptionLabel.text = "Предстоящие соревнования"
        descriptionLabel.font = UIFont.systemFont(ofSize: 13, weight: .medium)
        descriptionLabel.textColor = .white
        
        view.addSubview(descriptionLabel)
        view.addSubview(collectionView)
        view.addSubview(tableView)
        
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: view.topAnchor),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 17),
            
            collectionView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 10),
            collectionView.heightAnchor.constraint(equalToConstant: 130),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            tableView.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 20),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
    
    private func configureCollectionView() {
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(SportCollectionViewCell.self,
                                forCellWithReuseIdentifier: SportCollectionViewCell.identifier)
        
        collectionView.register(AddCollectionViewCell.self,
                                forCellWithReuseIdentifier: AddCollectionViewCell.identifier)
        
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        
        collectionViewLayout.scrollDirection = .horizontal
        collectionView.collectionViewLayout = collectionViewLayout
        
        collectionView.backgroundColor = .clear
    }
}

extension SportViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return isAdmin ? collectionItems.count + 1 : collectionItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SportCollectionViewCell.identifier,
                                                                for: indexPath) as? SportCollectionViewCell
        else { fatalError() }
        
        if isAdmin && indexPath.row == collectionItems.count {
            guard let plussCell = collectionView.dequeueReusableCell(withReuseIdentifier: AddCollectionViewCell.identifier,
                                                                    for: indexPath) as? AddCollectionViewCell
            else { fatalError() }
            return plussCell
        }
        
        let item = collectionItems[indexPath.row]
        cell.configureCell(title: item.type, date: item.date, image: item.image)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {
        if isAdmin && indexPath.row == collectionItems.count {
            let storyboard = UIStoryboard(name: "CreatingCompetition", bundle: Bundle.main)
            let vc = storyboard.instantiateViewController(withIdentifier: "CreatingCompetitionID") as! CreatingCompetitionViewController
            vc.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}

extension SportViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        if isAdmin && indexPath.row == collectionItems.count {
            return CGSize(width: 102,
                          height: 130)
        } else {
            return CGSize(width: 200,
                          height: 130)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 28
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
    }
}

extension SportViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return tableItems.count
    }
    
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ListTableViewCell.identifier,
                                                       for: indexPath) as? ListTableViewCell else { fatalError() }
        cell.titleLabel.text = tableItems[indexPath.row].title
        cell.iconImageView.image = tableItems[indexPath.row].image
        return cell
    }
}

extension SportViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}
