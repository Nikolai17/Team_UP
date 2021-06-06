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
    
    let viewsImageView: UIImageView = {
        let iv = UIImageView()
        iv.clipsToBounds = true
        iv.contentMode = .scaleAspectFit
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.image = UIImage(named: "views")
        iv.tintColor = .lightGray
        return iv
    }()
    
    let viewsLabel: UILabel = {
        let label = UILabel()
        label.font = .monospacedDigitSystemFont(ofSize: 12, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let commentsImageView: UIImageView = {
        let iv = UIImageView()
        iv.clipsToBounds = true
        iv.contentMode = .scaleAspectFit
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.image = UIImage(named: "comment")
        iv.tintColor = .lightGray
        return iv
    }()
    
    let commentsLabel: UILabel = {
        let label = UILabel()
        label.font = .monospacedDigitSystemFont(ofSize: 12, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .right
        return label
    }()
    
    let likesImageView: UIImageView = {
        let iv = UIImageView()
        iv.clipsToBounds = true
        iv.contentMode = .scaleAspectFit
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.image = UIImage(named: "likes")
        iv.tintColor = .lightGray
        return iv
    }()
    
    let likesLabel: UILabel = {
        let label = UILabel()
        label.font = .monospacedDigitSystemFont(ofSize: 12, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .right
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
        addSubview(viewsImageView)
        addSubview(viewsLabel)
        addSubview(commentsLabel)
        addSubview(commentsImageView)
        addSubview(likesLabel)
        addSubview(likesImageView)
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
            // box
            viewSport.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            viewSport.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor),
            viewSport.heightAnchor.constraint(equalToConstant: 22),
            viewSport.topAnchor.constraint(equalTo: topAnchor, constant: 18),
            // kind of sport
            kindOfSport.leadingAnchor.constraint(equalTo: viewSport.leadingAnchor, constant: 10),
            kindOfSport.trailingAnchor.constraint(equalTo: viewSport.trailingAnchor, constant: -10),
            kindOfSport.topAnchor.constraint(equalTo: viewSport.topAnchor, constant: 4),
            kindOfSport.bottomAnchor.constraint(equalTo: viewSport.bottomAnchor, constant: -4),
            //Views
            viewsImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            viewsImageView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 10),
            viewsImageView.heightAnchor.constraint(equalToConstant: 20),
            viewsImageView.widthAnchor.constraint(equalTo: viewsImageView.heightAnchor),
            
            viewsLabel.leadingAnchor.constraint(equalTo: viewsImageView.trailingAnchor, constant: 6),
            viewsLabel.topAnchor.constraint(equalTo: viewsImageView.topAnchor),
            viewsLabel.heightAnchor.constraint(equalTo: viewsImageView.heightAnchor),
            viewsLabel.trailingAnchor.constraint(lessThanOrEqualTo: descriptionLabel.trailingAnchor),
            //Comments
            commentsLabel.widthAnchor.constraint(equalToConstant: 34),
            commentsLabel.topAnchor.constraint(equalTo: viewsLabel.topAnchor),
            commentsLabel.trailingAnchor.constraint(equalTo: commentsImageView.leadingAnchor, constant: -6),
            commentsLabel.heightAnchor.constraint(equalTo: viewsImageView.heightAnchor),
            
            commentsImageView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 10),
            commentsImageView.heightAnchor.constraint(equalToConstant: 20),
            commentsImageView.widthAnchor.constraint(equalTo: viewsImageView.heightAnchor),
            commentsImageView.trailingAnchor.constraint(equalTo: likesLabel.leadingAnchor, constant: -10),
            // Likes
            likesLabel.topAnchor.constraint(equalTo: viewsLabel.topAnchor),
            likesLabel.trailingAnchor.constraint(equalTo: likesImageView.leadingAnchor, constant: -6),
            likesLabel.heightAnchor.constraint(equalTo: viewsLabel.heightAnchor),
            
            likesImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            likesImageView.heightAnchor.constraint(equalToConstant: 20),
            likesImageView.widthAnchor.constraint(equalTo: likesImageView.heightAnchor),
            likesImageView.topAnchor.constraint(equalTo: viewsImageView.topAnchor)
            
        ])
    }
    
}
