//
//  ProfileViewController.swift
//  Team_UP
//
//  Created by Dmitry Kulagin on 05.06.2021.
//

import UIKit

class ProfileViewController: UIViewController {
    
    private let backgroundImage = UIImageView()
    private let backgroundView = UIView()
    
    private let titleLabel = UILabel()
    private let notifyImageView = UIImageView()
    
    private let peopleImageView = UIImageView()
    private let editView = UIView()
    private let editImageView = UIImageView()
    
    private let peopleNameLabel = UILabel()
    private let peopleDescriptionLabel = UILabel()
    
    private let sectionStackView = UIStackView()
    private let sportButton = UIButton()
    private let achievementsButton = UIButton()
    private let settingsButton = UIButton()
    
    private let containerView = UIView()
    private let sportVC = SportViewController()
    private let achievementsVC = AchivementViewController()
    private let settingsVC = SettingsViewController()
    
    init() {
        super.init(nibName: nil, bundle: nil)
        
        tabBarItem = UITabBarItem(title: "Профиль", image: #imageLiteral(resourceName: "profile_tab"), tag: 0)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        didTapSportButton()
    }
    
    private func setupViews() {
        
        addChild(sportVC)
        addChild(achievementsVC)
        addChild(settingsVC)
        
        backgroundImage.image = #imageLiteral(resourceName: "background")
        backgroundImage.contentMode = .scaleAspectFill
        
        backgroundView.backgroundColor = UIColor(red: 0.035, green: 0.035, blue: 0.188, alpha: 0.8)
        
        titleLabel.text = "Профиль"
        titleLabel.font = UIFont.systemFont(ofSize: 22, weight: .regular)
        titleLabel.textColor = .white
        
        notifyImageView.image = #imageLiteral(resourceName: "notify")
        notifyImageView.contentMode = .scaleAspectFill
        
        peopleImageView.image = #imageLiteral(resourceName: "people")
        peopleImageView.contentMode = .scaleAspectFill
        
        editView.backgroundColor = UIColor(red: 0.918, green: 0.337, blue: 0.086, alpha: 1)
        editView.layer.cornerRadius = 11
        
        editImageView.image = #imageLiteral(resourceName: "edit")
        editImageView.contentMode = .scaleAspectFill
        
        peopleNameLabel.text = "Коля Шульгин"
        peopleNameLabel.font = UIFont.systemFont(ofSize: 22, weight: .medium)
        peopleNameLabel.textColor = .white
        
        peopleDescriptionLabel.text = "Москва, 32 года"
        peopleDescriptionLabel.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        peopleDescriptionLabel.textColor = .white
        
        sectionStackView.alignment = .fill
        sectionStackView.distribution = .fillProportionally
        sectionStackView.spacing = 10
        sectionStackView.axis = .horizontal
        sectionStackView.addArrangedSubview(sportButton)
        sectionStackView.addArrangedSubview(achievementsButton)
        sectionStackView.addArrangedSubview(settingsButton)
        
        sportButton.layer.cornerRadius = 22.5
        achievementsButton.layer.cornerRadius = 22.5
        settingsButton.layer.cornerRadius = 22.5
        sportButton.setTitle("Мой спорт", for: .normal)
        achievementsButton.setTitle("Награды", for: .normal)
        settingsButton.setTitle("Настройки", for: .normal)
        sportButton.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        achievementsButton.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        settingsButton.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        sportButton.titleLabel?.textColor = .white
        achievementsButton.titleLabel?.textColor = .white
        settingsButton.titleLabel?.textColor = .white
        
        sportButton.addTarget(self, action: #selector(didTapSportButton), for: .touchUpInside)
        achievementsButton.addTarget(self, action: #selector(didTapAchivementButton), for: .touchUpInside)
        settingsButton.addTarget(self, action: #selector(didTapSettingsButton), for: .touchUpInside)
        
        view.addSubview(backgroundImage)
        view.addSubview(backgroundView)
        backgroundView.addSubview(titleLabel)
        backgroundView.addSubview(notifyImageView)
        backgroundView.addSubview(peopleImageView)
        peopleImageView.addSubview(editView)
        editView.addSubview(editImageView)
        backgroundView.addSubview(peopleNameLabel)
        backgroundView.addSubview(peopleDescriptionLabel)
        backgroundView.addSubview(sectionStackView)
        backgroundView.addSubview(containerView)
        
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        notifyImageView.translatesAutoresizingMaskIntoConstraints = false
        peopleImageView.translatesAutoresizingMaskIntoConstraints = false
        editView.translatesAutoresizingMaskIntoConstraints = false
        editImageView.translatesAutoresizingMaskIntoConstraints = false
        peopleNameLabel.translatesAutoresizingMaskIntoConstraints = false
        peopleDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        sectionStackView.translatesAutoresizingMaskIntoConstraints = false
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            notifyImageView.topAnchor.constraint(equalTo: titleLabel.topAnchor),
            notifyImageView.widthAnchor.constraint(equalToConstant: 19),
            notifyImageView.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -24),
            
            peopleImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 26),
            peopleImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            peopleImageView.widthAnchor.constraint(equalToConstant: 94),
            peopleImageView.heightAnchor.constraint(equalToConstant: 94),
            
            editView.bottomAnchor.constraint(equalTo: peopleImageView.bottomAnchor),
            editView.trailingAnchor.constraint(equalTo: peopleImageView.trailingAnchor, constant: -5),
            editView.widthAnchor.constraint(equalToConstant: 22),
            editView.heightAnchor.constraint(equalToConstant: 22),
            
            editImageView.centerYAnchor.constraint(equalTo: editView.centerYAnchor),
            editImageView.centerXAnchor.constraint(equalTo: editView.centerXAnchor),
            
            peopleNameLabel.topAnchor.constraint(equalTo: peopleImageView.bottomAnchor, constant: 8),
            peopleNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            peopleDescriptionLabel.topAnchor.constraint(equalTo: peopleNameLabel.bottomAnchor, constant: 6),
            peopleDescriptionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            sectionStackView.topAnchor.constraint(equalTo: peopleDescriptionLabel.bottomAnchor, constant: 20),
            sectionStackView.heightAnchor.constraint(equalToConstant: 45),
            sectionStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            sectionStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            containerView.topAnchor.constraint(equalTo: sectionStackView.bottomAnchor, constant: 32),
            containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -(tabBarController?.tabBar.frame.height ?? 0)),
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
    
    @objc private func didTapSportButton() {
        sportButton.backgroundColor = UIColor(red: 0.918, green: 0.337, blue: 0.086, alpha: 1)
        achievementsButton.backgroundColor = .clear
        settingsButton.backgroundColor = .clear
        
        removeContainerSubviews()
        sportVC.view.frame.size = containerView.frame.size
        containerView.addSubview(sportVC.view)
    }
    
    @objc private func didTapAchivementButton() {
        sportButton.backgroundColor = .clear
        achievementsButton.backgroundColor = UIColor(red: 0.918, green: 0.337, blue: 0.086, alpha: 1)
        settingsButton.backgroundColor = .clear
        
        removeContainerSubviews()
        achievementsVC.view.frame.size = containerView.frame.size
        containerView.addSubview(achievementsVC.view)
    }
    
    @objc private func didTapSettingsButton() {
        sportButton.backgroundColor = .clear
        achievementsButton.backgroundColor = .clear
        settingsButton.backgroundColor = UIColor(red: 0.918, green: 0.337, blue: 0.086, alpha: 1)
        
        removeContainerSubviews()
        settingsVC.view.frame.size = containerView.frame.size
        containerView.addSubview(settingsVC.view)
    }
    
    private func removeContainerSubviews() {
        for view in containerView.subviews {
            view.removeFromSuperview()
        }
    }
}
