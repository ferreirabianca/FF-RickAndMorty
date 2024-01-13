//
//  CharacterDetailsViewController.swift
//  FF-RickAndMorty
//
//  Created by Bianca Ferreira on 26/12/23.
//

import UIKit

class CharacterDetailsViewController: UIViewController {
    //MARK: - Properties
    var viewModel: CharacterDetailsViewModel?
    var character: Character?
    
    //MARK: - Private Properties
    private var defaultSpacing: CGFloat = 20
    
    //MARK: - Views
    lazy var imageIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.isSkeletonable = true
        imageView.layer.cornerRadius = 15
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.isSkeletonable = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var statusLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.isSkeletonable = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var typeLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.isSkeletonable = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var genderLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.isSkeletonable = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var originLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.isSkeletonable = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var currentLocationLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.isSkeletonable = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var episodesLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.isSkeletonable = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.setupViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    //MARK: - Private Functions
    private func setupViews() {
        view.addSubview(imageIcon)
        view.addSubview(nameLabel)
        view.addSubview(statusLabel)
        view.addSubview(typeLabel)
        view.addSubview(originLabel)
        view.addSubview(genderLabel)
        view.addSubview(currentLocationLabel)
        view.addSubview(episodesLabel)
        
        //TODO: validate character if is not nil and show empty state if necessary
        nameLabel.text = character?.name
        statusLabel.text = "\(character?.status ?? "") - \(character?.species ?? "")"
        typeLabel.isHidden = (character?.type?.isEmpty)!
        typeLabel.text = "Tipo: \(character?.type ?? "")"
        genderLabel.text = "Genero: \(character?.gender ?? "")"
        originLabel.text = "Localização de Origin: \(character?.origin.name ?? "")"
        currentLocationLabel.text = "Localização atual: \(character?.location.name ?? "")"
        episodesLabel.text = "Apareceu em \(character?.episode.count ?? 0) episodios"
        setupImage(for: character?.image)
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            imageIcon.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: defaultSpacing),
            imageIcon.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: defaultSpacing),
            imageIcon.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -defaultSpacing),
            
            nameLabel.topAnchor.constraint(equalTo: imageIcon.bottomAnchor, constant: defaultSpacing),
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            statusLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: defaultSpacing),
            statusLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            typeLabel.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: defaultSpacing),
            typeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            genderLabel.topAnchor.constraint(equalTo: typeLabel.isHidden ? statusLabel.bottomAnchor : typeLabel.bottomAnchor, constant: defaultSpacing),
            genderLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            originLabel.topAnchor.constraint(equalTo: genderLabel.bottomAnchor, constant: defaultSpacing),
            originLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: defaultSpacing),
            originLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -defaultSpacing),
            originLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            currentLocationLabel.topAnchor.constraint(equalTo: originLabel.bottomAnchor, constant: defaultSpacing),
            currentLocationLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: defaultSpacing),
            currentLocationLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -defaultSpacing),
            currentLocationLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            episodesLabel.topAnchor.constraint(equalTo: currentLocationLabel.bottomAnchor, constant: defaultSpacing),
            episodesLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: defaultSpacing),
            episodesLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -defaultSpacing),
            episodesLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
        ])
    }
    
    private func setupImage(for image: String?) {
        guard let image, let imageURL = URL(string: image) else {
            return
        }
        imageIcon.loadFrom(url: imageURL)
    }
}
