//
//  FavoriteCharacterCollectionViewCell.swift
//  FF-RickAndMorty
//
//  Created by Bianca Ferreira on 22/01/24.
//

import UIKit

class FavoriteCharacterCollectionViewCell: UICollectionViewCell {
    //MARK: - Views
    private lazy var characterImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20)
        label.textAlignment = .center
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var favoriteButton: UIButton = {
        let button = UIButton()
        let icon = UIImage(systemName: "heart.fill")?.withTintColor(.red, renderingMode: .alwaysOriginal)
        button.setImage(icon, for: .normal)
        button.addTarget(self, action: #selector(didTapFavoriteButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    //MARK: - Lifecyle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - objc Functions
    @objc func didTapFavoriteButton(_ sender: UIButton) {
        print("favorite tapped")
    }
    
    //MARK: - Functions
    func setup(_ character: FavoriteCharacter) {
        characterImage.setImage(from: character.image)
        nameLabel.text = character.name
        favoriteButton.isSelected = character.isFavorite
    }
    
    //MARK: - Private Functions
    private func setupViews() {
        addSubview(characterImage)
        addSubview(nameLabel)
        addSubview(favoriteButton)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            characterImage.topAnchor.constraint(equalTo: topAnchor),
            characterImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            characterImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            characterImage.heightAnchor.constraint(equalToConstant: 150),
            
            nameLabel.topAnchor.constraint(equalTo: characterImage.bottomAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            favoriteButton.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5),
            favoriteButton.leadingAnchor.constraint(equalTo: leadingAnchor),
            favoriteButton.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
}
