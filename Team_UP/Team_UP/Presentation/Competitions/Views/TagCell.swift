//
//  TagCell.swift
//  Team_UP
//
//  Created by Ivan Kopiev on 05.06.2021.
//

import UIKit

final class TagCell: UICollectionViewCell {
    static let identifier = "TagCollectionViewCell"
    let viewConteiner: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 12
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 1.0, height: 2.0)
        view.layer.shadowRadius = 3.0
        view.layer.shadowOpacity = 0.2
        view.layer.masksToBounds = false
        view.backgroundColor = UIColor(red: 0.035, green: 0.035, blue: 0.188, alpha: 0.5)
       return view
    }()
    
    let tagLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        return label
    }()
    var check: Bool = false
    
    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        createUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        createUI()
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Helpers
    
    private func createUI() {
        addSubview(viewConteiner)
        viewConteiner.addSubview(tagLabel)
        createConstrains()
        check = false
    }
    private func createConstrains() {
        
        NSLayoutConstraint.activate([
            // box
            viewConteiner.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            viewConteiner.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor),
            viewConteiner.heightAnchor.constraint(equalToConstant: 40),
            viewConteiner.topAnchor.constraint(equalTo: topAnchor, constant: 0),
             // Tag
            tagLabel.leadingAnchor.constraint(equalTo: viewConteiner.leadingAnchor, constant: 10),
            tagLabel.trailingAnchor.constraint(equalTo: viewConteiner.trailingAnchor, constant: -10),
            tagLabel.topAnchor.constraint(equalTo: viewConteiner.topAnchor, constant: 7),
            tagLabel.bottomAnchor.constraint(equalTo: viewConteiner.bottomAnchor, constant: -7),
            
        ])
    }
}
