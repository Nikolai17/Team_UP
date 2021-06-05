//
//  EventCell.swift
//  Team_UP
//
//  Created by Ivan Kopiev on 05.06.2021.
//

import UIKit

class EventCell: UITableViewCell {
    // type
    let typeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let adressLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.numberOfLines = 2
        label.lineBreakMode = .byWordWrapping
        label.font = UIFont.systemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    let eventImageView: UIImageView = {
        let iv = UIImageView()
        iv.clipsToBounds = true
        iv.contentMode = .scaleAspectFill
        iv.backgroundColor = UIColor(red: 1.00, green: 0.42, blue: 0.42, alpha: 1.00)
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    let gradientImageView: UIImageView = {
        let iv = UIImageView(image: UIImage(named: "gradient"))
        iv.clipsToBounds = true
        iv.contentMode = .scaleAspectFill
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    let viewConteiner: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 1.0, height: 2.0)
        view.layer.shadowRadius = 3.0
        view.layer.shadowOpacity = 0.2
        view.layer.masksToBounds = false
       return view
    }()
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    

    
    // MARK: - Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        createUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

     // MARK: - Helpers
    
    func createUI() {
        contentView.backgroundColor = .clear
        backgroundColor = .clear
        addSubview(eventImageView)
        eventImageView.addSubview(gradientImageView)
        gradientImageView.addSubview(typeLabel)
        gradientImageView.addSubview(adressLabel)
        gradientImageView.addSubview(viewConteiner)
        viewConteiner.addSubview(dateLabel)
        NSLayoutConstraint.activate([
            eventImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            eventImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            eventImageView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            eventImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            gradientImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            gradientImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            gradientImageView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            gradientImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            // box
            viewConteiner.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            viewConteiner.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor),
            viewConteiner.heightAnchor.constraint(equalToConstant: 22),
            viewConteiner.topAnchor.constraint(equalTo: eventImageView.topAnchor, constant: 18),
            // kind of sport
            dateLabel.leadingAnchor.constraint(equalTo: viewConteiner.leadingAnchor, constant: 10),
            dateLabel.trailingAnchor.constraint(equalTo: viewConteiner.trailingAnchor, constant: -10),
            dateLabel.topAnchor.constraint(equalTo: viewConteiner.topAnchor, constant: 4),
            dateLabel.bottomAnchor.constraint(equalTo: viewConteiner.bottomAnchor, constant: -4),
            // Type
            typeLabel.heightAnchor.constraint(equalToConstant: 25),
            typeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            typeLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            typeLabel.bottomAnchor.constraint(equalTo: adressLabel.topAnchor, constant: -10),
            // Adress
            adressLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            adressLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            adressLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -30),
        ])
    }
    
    func configureCell(with event: Event) {
        eventImageView.image = UIImage(named: event.image)
        typeLabel.text = event.type
        dateLabel.text = event.date
        adressLabel.text = event.adress
    }

}
