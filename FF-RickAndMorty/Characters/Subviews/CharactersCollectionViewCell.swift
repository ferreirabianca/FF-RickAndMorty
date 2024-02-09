//
//  CharactersCollectionViewCell.swift
//  FF-RickAndMorty
//
//  Created by Bianca Ferreira on 09/02/24.
//

import UIKit
import SkeletonView

class CharactersCollectionViewCell: UICollectionViewCell {
    //MARK: - Views
    lazy var characterImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 10
        imageView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        imageView.clipsToBounds = true
        imageView.isSkeletonable = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var characterName: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20)
        label.textColor = .white
        label.text = "Rick Sanchez"
        label.textAlignment = .center
        label.isSkeletonable = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var characterStatus: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17)
        label.textColor = #colorLiteral(red: 0.6106664538, green: 0.6106664538, blue: 0.6106664538, alpha: 1)
        label.text = "Alive"
        label.numberOfLines = 0
        label.isSkeletonable = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.layer.cornerRadius = 10
    }
    
    //MARK: - Functions
    func setup(_ character: Character) {
        characterImage.setImage(from: character.image)
        characterName.text = character.name
        characterStatus.text = character.name
        contentView.backgroundColor = character.status.contains("Alive") ? #colorLiteral(red: 0.5287373662, green: 0.7190186381, blue: 0.5462085605, alpha: 1) : #colorLiteral(red: 0.9317510724, green: 0.5798297524, blue: 0.4544511437, alpha: 1)
    }
    
    //MARK: - Private Functions
    private func setupViews() {
        contentView.addSubview(characterImage)
        contentView.addSubview(characterName)
//        contentView.addSubview(characterStatus)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            characterImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            characterImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            characterImage.widthAnchor.constraint(equalToConstant: contentView.frame.width),
            characterImage.heightAnchor.constraint(equalToConstant: contentView.frame.height / 1.5),
            
            characterName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            characterName.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            characterName.centerXAnchor.constraint(equalTo: centerXAnchor),
            characterName.topAnchor.constraint(equalTo: characterImage.bottomAnchor, constant: 5),
//
//            characterStatus.leadingAnchor.constraint(equalTo: characterName.leadingAnchor),
//            characterStatus.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
//            characterStatus.bottomAnchor.constraint(equalTo: characterImage.bottomAnchor, constant: -5),
        ])
    }
}
