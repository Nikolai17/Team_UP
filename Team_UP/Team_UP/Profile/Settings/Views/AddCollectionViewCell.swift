//
//  AddCollectionViewCell.swift
//  Team_UP
//
//  Created by Dmitry Kulagin on 05.06.2021.
//

import UIKit

class AddCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "AddCollectionViewCell"
    
    private let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 12
        view.clipsToBounds = true
        return view
    }()
    
    private let itemImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "addplus")
        imageView.backgroundColor = .clear
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .clear
        
        containerView.backgroundColor = UIColor(red: 0.918, green: 0.337, blue: 0.086, alpha: 1)
        
        addSubview(containerView)
        containerView.addSubview(itemImageView)
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        itemImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            itemImageView.heightAnchor.constraint(equalToConstant: 50),
            itemImageView.widthAnchor.constraint(equalToConstant: 50),
            itemImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            itemImageView.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        itemImageView.image = nil
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
