//
//  HomeCategoryView.swift
//  FF-RickAndMorty
//
//  Created by Bianca Ferreira on 20/12/23.
//

import UIKit

class HomeCategoryView: UIView {
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var backgroundImage: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "characters"))
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView(title: String, imageName: String) {
        titleLabel.text = title
        backgroundImage.image = UIImage(named: imageName)
    }
    
    private func setupViews() {
        self.addSubview(titleLabel)
        self.addSubview(backgroundImage)
        self.sendSubviewToBack(backgroundImage)
        
        self.layer.cornerRadius = 10
        
        self.clipsToBounds = true
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: backgroundImage.leadingAnchor, constant: 5),
            
            backgroundImage.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 20),
            backgroundImage.heightAnchor.constraint(equalToConstant: 200),
            backgroundImage.widthAnchor.constraint(equalToConstant: 200),
        ])
    }
}

