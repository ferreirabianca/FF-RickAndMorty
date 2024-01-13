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
}

class CharactersCell: UITableViewCell {
    //MARK: - Views
    lazy var characterImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
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
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //MARK: - Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        self.contentView.isSkeletonable = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        contentView.backgroundColor = .red.withAlphaComponent(0.3)
        contentView.layer.cornerRadius = 15
        contentView.layer.borderWidth = 0.2
        
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10))
    }
    
    //MARK: - Functions
    func setupCell(data: CharactersCellData) {
        characterName.text = data.name
        
        guard let imageURL = URL(string: data.image) else {
            return
        }
        characterImage.loadFrom(url: imageURL)
    }
    
    //MARK: - Private Functions
    private func setupViews() {
        contentView.addSubview(characterImage)
        contentView.addSubview(characterName)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            characterImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            characterImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            characterImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            characterImage.trailingAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            characterName.leadingAnchor.constraint(equalTo: contentView.centerXAnchor),
            characterName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            characterName.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
}
