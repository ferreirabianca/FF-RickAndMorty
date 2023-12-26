//
//  CharacterDetailsViewController.swift
//  FF-RickAndMorty
//
//  Created by Bianca Ferreira on 26/12/23.
//

import UIKit

class CharacterDetailsViewController: UIViewController {
    //MARK: - Views
    lazy var characterImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.isSkeletonable = true
        imageView.layer.cornerRadius = 15
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var characterName: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.isSkeletonable = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //MARK: - Properties
    var viewModel: CharacterDetailsViewModel?
    var character: Character?
    
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
        view.addSubview(characterImage)
        view.addSubview(characterName)
        
        characterName.text = character?.name
        
        guard let imageURL = URL(string: character!.image) else {
            return
        }
        characterImage.loadFrom(url: imageURL)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            characterImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            characterImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            characterImage.widthAnchor.constraint(equalToConstant: 50),
            characterImage.heightAnchor.constraint(equalToConstant: 50),
            
            characterName.topAnchor.constraint(equalTo: characterImage.topAnchor, constant: 20),
            
        ])
    }
}
