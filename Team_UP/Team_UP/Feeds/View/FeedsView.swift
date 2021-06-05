//
//  FeedsView.swift
//  Team_UP
//
//  Created by Ivan Kopiev on 05.06.2021.
//

import UIKit

class FeedsView: UIView {
    
    // Имя автора
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.lineBreakMode = .byWordWrapping
        label.font = UIFont.systemFont(ofSize: 13)
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()
    // Изображение
    let feedImageView: UIImageView = {
        let iv = UIImageView()
        iv.clipsToBounds = true
        iv.contentMode = .scaleAspectFill
        iv.backgroundColor = UIColor(red: 1.00, green: 0.42, blue: 0.42, alpha: 1.00)
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    let viewSport: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
       return view
    }()
    
    let kindOfSport: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        createDesign()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        createDesign()
    }
    
    // MARK: - Helpers
    private func createDesign() {
        addSubview(feedImageView)
        addSubview(nameLabel)
        addSubview(descriptionLabel)
        feedImageView.addSubview(viewSport)
        viewSport.addSubview(kindOfSport)
        backgroundColor = .white
        clipsToBounds = true
        createConstraints()
        
    }
    
    private func createConstraints() {
        NSLayoutConstraint.activate([
            
            // Image
            feedImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            feedImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            feedImageView.topAnchor.constraint(equalTo: topAnchor),
            feedImageView.heightAnchor.constraint(equalToConstant: 200),
            // Name
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            nameLabel.topAnchor.constraint(equalTo: feedImageView.bottomAnchor, constant: 16),
            nameLabel.bottomAnchor.constraint(equalTo: descriptionLabel.topAnchor, constant: -16),
            // Description
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            descriptionLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -40),
            // Type
            viewSport.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            viewSport.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor),
            viewSport.heightAnchor.constraint(equalToConstant: 22),
            viewSport.topAnchor.constraint(equalTo: topAnchor, constant: 18),
            
            
            kindOfSport.leadingAnchor.constraint(equalTo: viewSport.leadingAnchor, constant: 10),
            kindOfSport.trailingAnchor.constraint(equalTo: viewSport.trailingAnchor, constant: -10),
            kindOfSport.topAnchor.constraint(equalTo: viewSport.topAnchor, constant: 4),
            kindOfSport.bottomAnchor.constraint(equalTo: viewSport.bottomAnchor, constant: -4),

        ])
    }
}
