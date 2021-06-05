//
//  SportCollectionViewCell.swift
//  Team_UP
//
//  Created by Dmitry Kulagin on 05.06.2021.
//

import UIKit

class SportCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "SportCollectionViewCell"
    
    private let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 12
        view.clipsToBounds = true
        return view
    }()
    
    private let alphaView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.035, green: 0.035, blue: 0.188, alpha: 0.4)
        return view
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        label.textColor = .white
        label.sizeToFit()
        return label
    }()
    
    private let itemImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .clear
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        label.textColor = .white
        label.sizeToFit()
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .clear
        
        addSubview(containerView)
        containerView.addSubview(itemImageView)
        containerView.addSubview(alphaView)
        alphaView.addSubview(titleLabel)
        alphaView.addSubview(dateLabel)
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        alphaView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        itemImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            itemImageView.topAnchor.constraint(equalTo: topAnchor),
            itemImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            itemImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            itemImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            alphaView.topAnchor.constraint(equalTo: topAnchor),
            alphaView.bottomAnchor.constraint(equalTo: bottomAnchor),
            alphaView.leadingAnchor.constraint(equalTo: leadingAnchor),
            alphaView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            dateLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -14),
            dateLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 17),
            dateLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 16),
            
            titleLabel.bottomAnchor.constraint(equalTo: dateLabel.topAnchor, constant: -10),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 17),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 16),
        ])
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        titleLabel.text = ""
        dateLabel.text = ""
        itemImageView.image = nil
    }
    
    func configureCell(title: String,
                       date: String,
                       image: UIImage?) {
        
        titleLabel.text = title
        dateLabel.text = date
        itemImageView.image = image
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
