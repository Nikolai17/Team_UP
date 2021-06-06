//
//  AchivementViewController.swift
//  Team_UP
//
//  Created by Dmitry Kulagin on 05.06.2021.
//

import UIKit

class AchivementViewController: UIViewController {
    
    struct StoreItem {
        let title: String
        let counter: Int
        let image: UIImage?
    }
    
    private let items: [StoreItem] = [
        StoreItem(title: "Модный мерч", counter: 5, image: #imageLiteral(resourceName: "hoody 1")),
        StoreItem(title: "Фитнес на год", counter: 25, image: #imageLiteral(resourceName: "hoody 1-1")),
        StoreItem(title: "Страховка", counter: 99, image: nil)
    ]
    
    private let scrollView: UIScrollView = {
        let view = UIScrollView()
        view.isScrollEnabled = true
        view.bounces = false
        view.showsVerticalScrollIndicator = false
        view.showsHorizontalScrollIndicator = false
        return view
    }()
    
    private let collectionView: UICollectionView
    private let collectionViewLayout: UICollectionViewFlowLayout
    
    private let countLabel = UILabel()
    private let countDescriptionLabel = UILabel()
    private let descriptionLabel = UILabel()
    
    init() {
        self.collectionViewLayout = UICollectionViewFlowLayout()
        self.collectionView = UICollectionView(frame: .zero,
                                               collectionViewLayout: collectionViewLayout)
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
        countLabel.text = "97"
        countLabel.font = UIFont.systemFont(ofSize: 75, weight: .regular)
        countLabel.textColor = .white
        
        countDescriptionLabel.text = "Набрано баллов"
        countDescriptionLabel.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        countDescriptionLabel.textColor = .white
        
        descriptionLabel.text = "Вы можете обменять баллы на ценные призы или повысить уровень социального пакета"
        descriptionLabel.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        descriptionLabel.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.5)
        descriptionLabel.numberOfLines = 0
        descriptionLabel.lineBreakMode = .byWordWrapping
        descriptionLabel.textAlignment = .center
        
        scrollView.delegate = self
        
        view.addSubview(scrollView)
        scrollView.addSubview(countLabel)
        scrollView.addSubview(countDescriptionLabel)
        scrollView.addSubview(descriptionLabel)
        scrollView.addSubview(collectionView)
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        countLabel.translatesAutoresizingMaskIntoConstraints = false
        countDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            countLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 5),
            countLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            countDescriptionLabel.topAnchor.constraint(equalTo: countLabel.bottomAnchor, constant: 5),
            countDescriptionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            descriptionLabel.topAnchor.constraint(equalTo: countDescriptionLabel.bottomAnchor, constant: 11),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 38),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -38),
            
            collectionView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 24),
            collectionView.heightAnchor.constraint(equalToConstant: 130),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
    
    private func configureCollectionView() {
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(AchivementCollectionViewCell.self,
                                forCellWithReuseIdentifier: AchivementCollectionViewCell.identifier)
        
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        
        collectionViewLayout.scrollDirection = .horizontal
        collectionView.collectionViewLayout = collectionViewLayout
        
        collectionView.backgroundColor = .clear
    }
}

extension AchivementViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AchivementCollectionViewCell.identifier,
                                                                for: indexPath) as? AchivementCollectionViewCell
        else { fatalError() }
        
        let item = items[indexPath.row]
        cell.configureCell(title: item.title, counter: item.counter, image: item.image)
        
        return cell
    }
}

extension AchivementViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 130,
                      height: 130)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 28
    }
}
