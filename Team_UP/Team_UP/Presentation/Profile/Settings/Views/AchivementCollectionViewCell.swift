//
//  AchivementCollectionViewCell.swift
//  Team_UP
//
//  Created by Dmitry Kulagin on 05.06.2021.
//

import UIKit

class AchivementCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "AchivementCollectionViewCell"
    
    private let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 8
        view.clipsToBounds = true
        return view
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13, weight: .medium)
        label.textColor = .black
        label.sizeToFit()
        return label
    }()
    
    private let itemImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .clear
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let counterLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 34, weight: .medium)
        label.textColor = UIColor(red: 0.918, green: 0.337, blue: 0.086, alpha: 1)
        label.sizeToFit()
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .clear
        
        addSubview(containerView)
        containerView.addSubview(itemImageView)
        containerView.addSubview(titleLabel)
        containerView.addSubview(counterLabel)
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        counterLabel.translatesAutoresizingMaskIntoConstraints = false
        itemImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 16),
            
            counterLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 7),
            counterLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            
            itemImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            itemImageView.widthAnchor.constraint(equalToConstant: 90),
            itemImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 14),
        ])
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        titleLabel.text = ""
        counterLabel.text = ""
        itemImageView.image = nil
    }
    
    func configureCell(title: String,
                       counter: Int,
                       image: UIImage?) {
        
        titleLabel.text = title
        counterLabel.text = String(counter)
        itemImageView.image = image
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
