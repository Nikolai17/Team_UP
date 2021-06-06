//
//  DetailCompetitionViewController.swift
//  Team_UP
//
//  Created by Dmitry Kulagin on 05.06.2021.
//

import UIKit
import CoreLocation

class DetailCompetitionViewController: UIViewController {
    
    enum DetailCompetitionState {
        case create
        case part
    }
    
    private let locationManager = CLLocationManager()
    
    private let backgroundImage = UIImageView()
    private let backgroundView = UIView()
    private let gradientView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 200))
    
    private let backButton = UIButton()
    
    private let eventImageView = UIImageView()
    private let titleLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let runButton = UIButton()
    
    private let itemsStackView = UIStackView(arrangedSubviews: [
                                                EventItemView(title: "Вид спорта", value: "Настольный теннис", image: #imageLiteral(resourceName: "ball")),
                                                EventItemView(title: "Дата", value: "12 июня – 19 июня  ", image: #imageLiteral(resourceName: "calendar")),
                                                EventItemView(title: "Место", value: "Парк им. Горького", image: #imageLiteral(resourceName: "location"))])
    
    private let detailTitleLabel = UILabel()
    private let detailDescriptionLabel = UILabel()
    
    private let galleryTitleLabel = UILabel()
    private let galleryDescriptionLabel = UILabel()
    
    private let sendButton = UIButton()
    
    private let state: DetailCompetitionState
    
    init(state: DetailCompetitionState) {
        self.state = state
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        
        setupViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    private func setupViews() {
        backgroundImage.image = #imageLiteral(resourceName: "background")
        backgroundImage.contentMode = .scaleAspectFill
        
        backgroundView.backgroundColor = UIColor(red: 0.035, green: 0.035, blue: 0.188, alpha: 0.8)
        
        backButton.setImage(#imageLiteral(resourceName: "back"), for: .normal)
        backButton.contentMode = .scaleAspectFit
        backButton.addTarget(self, action: #selector(didTapBackButton), for: .touchUpInside)
        
        sendButton.setImage(#imageLiteral(resourceName: "message"), for: .normal)
        sendButton.contentMode = .scaleAspectFill
        
        eventImageView.contentMode = .scaleAspectFill
        eventImageView.image = #imageLiteral(resourceName: "peoples")
        
        titleLabel.text = "Настольный теннис"
        titleLabel.font = UIFont.systemFont(ofSize: 22, weight: .medium)
        titleLabel.textColor = .white
        
        descriptionLabel.text = "Отборочный тур среди всех офисов ПСБ банка Москвы"
        descriptionLabel.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        descriptionLabel.textColor = .white
        
        setGradient()
        
        runButton.backgroundColor = UIColor(red: 0.918, green: 0.337, blue: 0.086, alpha: 1)
        runButton.setTitle(state == .create ? "Создать" : "Участвовать", for: .normal)
        runButton.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        runButton.layer.cornerRadius = 16
        runButton.addTarget(self, action: #selector(didTapRunButton), for: .touchUpInside)
        
        detailTitleLabel.text = "Детали"
        detailTitleLabel.font = UIFont.systemFont(ofSize: 13, weight: .medium)
        detailTitleLabel.textColor = .white
        
        detailDescriptionLabel.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        detailDescriptionLabel.numberOfLines = 0
        detailDescriptionLabel.lineBreakMode = .byWordWrapping
        detailDescriptionLabel.textColor = .white
        detailDescriptionLabel.textAlignment = .left
        detailDescriptionLabel.text = """
        Соревнование по настольному теннису будет проходить с 12 по 19 июня, с 18:00 до 21:00. Мероприятие состоится в парке им. Горького (м. Октябрьская). По всем организационным вопросам обращайтесь в чат мероприятия. Желаем вам победы!
        """
        
        itemsStackView.axis = .vertical
        itemsStackView.spacing = 20
        
        galleryTitleLabel.text = "Фотогалерея"
        galleryTitleLabel.font = UIFont.systemFont(ofSize: 13, weight: .medium)
        galleryTitleLabel.textColor = .white
        
        galleryDescriptionLabel.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        galleryDescriptionLabel.numberOfLines = 0
        galleryDescriptionLabel.lineBreakMode = .byWordWrapping
        galleryDescriptionLabel.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.5)
        galleryDescriptionLabel.textAlignment = .left
        galleryDescriptionLabel.text = """
        Фотографии появятся после
        проведения соревнования
        """
        
        view.addSubview(backgroundImage)
        view.addSubview(backgroundView)
        view.addSubview(eventImageView)
        view.addSubview(gradientView)
        view.addSubview(titleLabel)
        view.addSubview(descriptionLabel)
        view.addSubview(runButton)
        view.addSubview(itemsStackView)
        view.addSubview(detailTitleLabel)
        view.addSubview(detailDescriptionLabel)
        view.addSubview(galleryTitleLabel)
        view.addSubview(galleryDescriptionLabel)
        view.addSubview(backButton)
        view.addSubview(sendButton)
        
        sendButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.translatesAutoresizingMaskIntoConstraints = false
        gradientView.translatesAutoresizingMaskIntoConstraints = false
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        eventImageView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        runButton.translatesAutoresizingMaskIntoConstraints = false
        itemsStackView.translatesAutoresizingMaskIntoConstraints = false
        detailTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        detailDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        galleryTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        galleryDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            gradientView.heightAnchor.constraint(equalToConstant: 200),
            gradientView.bottomAnchor.constraint(equalTo: runButton.topAnchor, constant: 4),
            gradientView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            gradientView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            backButton.heightAnchor.constraint(equalToConstant: 30),
            backButton.widthAnchor.constraint(equalToConstant: 30),
            backButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 55),
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
            eventImageView.topAnchor.constraint(equalTo: view.topAnchor),
            eventImageView.heightAnchor.constraint(equalToConstant: 250),
            eventImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            eventImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            descriptionLabel.bottomAnchor.constraint(equalTo: eventImageView.bottomAnchor, constant: -20),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            titleLabel.bottomAnchor.constraint(equalTo: descriptionLabel.topAnchor, constant: -10),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            runButton.topAnchor.constraint(equalTo: eventImageView.bottomAnchor, constant: 24),
            runButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            runButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            runButton.heightAnchor.constraint(equalToConstant: 58),
            
            itemsStackView.topAnchor.constraint(equalTo: runButton.bottomAnchor, constant: 24),
            itemsStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            itemsStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            detailTitleLabel.topAnchor.constraint(equalTo: itemsStackView.bottomAnchor, constant: 20),
            detailTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            detailTitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            detailDescriptionLabel.topAnchor.constraint(equalTo: detailTitleLabel.bottomAnchor, constant: 6),
            detailDescriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            detailDescriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            galleryTitleLabel.topAnchor.constraint(equalTo: detailDescriptionLabel.bottomAnchor, constant: 23),
            galleryTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            galleryTitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            galleryDescriptionLabel.topAnchor.constraint(equalTo: galleryTitleLabel.bottomAnchor, constant: 6),
            galleryDescriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            galleryDescriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            sendButton.heightAnchor.constraint(equalToConstant: 70),
            sendButton.widthAnchor.constraint(equalToConstant: 70),
            sendButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -26),
            sendButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
        ])
    }
    
    private func setGradient() {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.colors = [UIColor.clear.cgColor, UIColor(red: 0.035, green: 0.035, blue: 0.188, alpha: 1).cgColor]
        gradient.locations = [0.0 , 1]
        gradient.frame = gradientView.layer.frame
        gradientView.layer.insertSublayer(gradient, at: 0)
    }
    
    private func startUpdatingLocation() {
        // Start updating location
        locationManager.startUpdatingLocation()
    }
    
    private func stopUpdatingLocation() {
        // Make sure to stop updating location when your
        // app no longer needs location updates
        locationManager.stopUpdatingLocation()
    }
    
    @objc private func didTapRunButton() {
        if state == .create {
            navigationController?.popToRootViewController(animated: true)
            NotificationManager.shared.showNotification(title: "Cобытие добавлено",
                                                        body: "Спасибо за ваше уделенное время",
                                                        identifier: "Notification event")
            
        } else {
            let status = CLLocationManager.authorizationStatus()
            
            switch status {
            case .authorizedAlways:
                locationManager.requestLocation()
            case .authorizedWhenInUse:
                locationManager.requestLocation()
            case .denied:
                print("denied")
                locationManager.requestAlwaysAuthorization()
                break
            case .notDetermined:
                print("notDetermined")
                locationManager.requestAlwaysAuthorization()
                break
            case .restricted:
                print("restricted")
                locationManager.requestAlwaysAuthorization()
                break
            @unknown default:
                break
            }
        }
    }
    
    @objc private func didTapBackButton() {
        navigationController?.popViewController(animated: true)
        print("didTapBackButton")
    }
}

extension DetailCompetitionViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager,
                         didFailWithError error: Error) {
        print("didFailWithError: \(error)")
    }
    
    func locationManager(_ manager: CLLocationManager,
                         didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            let latitude = location.coordinate.latitude
            let longitude = location.coordinate.longitude
            print("latitude: \(latitude) longitude: \(longitude)")
            
            navigationController?.popToRootViewController(animated: true)
            NotificationManager.shared.showNotification(title: "Присутствие подтверждено",
                                                        body: "Спасибо за ваше участие в данном соревновании",
                                                        identifier: "Notification event")
        }
    }
}
