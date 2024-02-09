//
//  FavoriteCharactersViewController.swift
//  FF-RickAndMorty
//
//  Created by Bianca Ferreira on 22/01/24.
//

import UIKit

struct FavoriteCharacter: Codable {
    let name: String
    let image: String
    let isFavorite: Bool
//    let character: Character
}

class FavoriteCharactersViewController: UIViewController {
    let characterMock = [
        FavoriteCharacter(name: "Rick", image: "https://rickandmortyapi.com/api/character/avatar/504.jpeg", isFavorite: false),
        FavoriteCharacter(name: "Phone-person", image: "https://rickandmortyapi.com/api/character/avatar/427.jpeg", isFavorite: true),
        FavoriteCharacter(name: "Abradolf Lincler", image: "https://rickandmortyapi.com/api/character/avatar/7.jpeg", isFavorite: false),
    ]
    
    //MARK: - Views
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 5
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 0, right: 10)
        layout.scrollDirection = .vertical
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.dataSource = self
        collection.delegate = self
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        
        navigationItem.title = "Favoritos"
    }
    
    //MARK: - Functions
    private func setupViews() {
        view.addSubview(collectionView)
        registerCells()
        setupConstraints()
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
    private func registerCells() {
        collectionView.register(FavoriteCharacterCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
    }
}

//showing preview using uikit gtk
@available(iOS 17.0, *)
#Preview {
    FavoriteCharactersViewController()
}
