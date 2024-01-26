//
//  CharactersCell.swift
//  FF-RickAndMorty
//
//  Created by Bianca Ferreira on 21/12/23.
//

import UIKit
import SkeletonView

struct CharactersCellData {
    var name: String
    var image: String
    var status: String
}

class CharactersCell: UITableViewCell {
    //MARK: - Views
    lazy var characterImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 15
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
        label.numberOfLines = 0
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
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        self.isSkeletonable = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        contentView.backgroundColor = #colorLiteral(red: 0.2177622914, green: 0.2177622914, blue: 0.2177622914, alpha: 1)
        contentView.layer.cornerRadius = 10
        
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10))
    }
    
    //MARK: - Functions
    func setupCell(character: CharactersCellData) {
        characterName.text = character.name
        characterStatus.text = character.status
        characterImage.setImage(from: character.image)
    }
    
    //MARK: - Private Functions
    private func setupViews() {
        contentView.addSubview(characterImage)
        contentView.addSubview(characterName)
        contentView.addSubview(characterStatus)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            characterImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            characterImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            characterImage.heightAnchor.constraint(equalToConstant: 53),
            characterImage.widthAnchor.constraint(equalToConstant: 53),
            
            characterName.leadingAnchor.constraint(equalTo: characterImage.trailingAnchor, constant: 15),
            characterName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            characterName.topAnchor.constraint(equalTo: characterImage.topAnchor, constant: 5),
            
            characterStatus.leadingAnchor.constraint(equalTo: characterName.leadingAnchor),
            characterStatus.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            characterStatus.bottomAnchor.constraint(equalTo: characterImage.bottomAnchor, constant: -5),
        ])
    }
}
