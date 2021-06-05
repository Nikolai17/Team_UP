//
//  FeedCell.swift
//  Team_UP
//
//  Created by Ivan Kopiev on 05.06.2021.
//

import UIKit

class FeedCell: UITableViewCell {

    // MARK: - Properties
    private lazy var cellView = FeedsView()

    
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
        addSubview(cellView)
        cellView.translatesAutoresizingMaskIntoConstraints = false
        cellView.layer.cornerRadius = 16
        backgroundColor = .clear
        NSLayoutConstraint.activate([
            cellView.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 16),
            cellView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            cellView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            cellView.bottomAnchor.constraint(equalTo: bottomAnchor),
            

        ])
    }
    
    func configureCell(with feed: Feed) {
        cellView.feedImageView.image = UIImage(named: feed.image)
        cellView.nameLabel.text = feed.name
        cellView.descriptionLabel.text = feed.description
        cellView.kindOfSport.text = feed.kindOfSport

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
