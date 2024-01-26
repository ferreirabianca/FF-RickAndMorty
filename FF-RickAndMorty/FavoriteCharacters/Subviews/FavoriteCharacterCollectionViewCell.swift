//
//  FavoriteCharacterCollectionViewCell.swift
//  FF-RickAndMorty
//
//  Created by Bianca Ferreira on 22/01/24.
//

import UIKit

class FavoriteCharacterCollectionViewCell: UIViewController {
    
    //MARK: - Views
    lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var imageIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "house")
        imageView.contentMode = .scaleAspectFit
        imageView.isSkeletonable = true
        imageView.layer.cornerRadius = 15
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    //MARK: - Lifecyle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    //MARK: - Private Functions
    private func setupViews() {
        view.addSubview(containerView)
        containerView.addSubview(imageIcon)
        view.backgroundColor = .gray
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            containerView.heightAnchor.constraint(equalToConstant: 200),
            containerView.widthAnchor.constraint(equalToConstant: 115),
            
            imageIcon.topAnchor.constraint(equalTo: containerView.topAnchor),
            imageIcon.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            imageIcon.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            imageIcon.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
        ])
    }
    
    private func setup(_ character: Character) {
        
    }
}

@available(iOS 17.0, *)
#Preview {
    FavoriteCharacterCollectionViewCell()
}
