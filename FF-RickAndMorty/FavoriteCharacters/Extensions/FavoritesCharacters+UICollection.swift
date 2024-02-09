//
//  FavoritesCharacters+UICollection.swift
//  FF-RickAndMorty
//
//  Created by Bianca Ferreira on 26/01/24.
//

import UIKit

extension FavoriteCharactersViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return characterMock.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? FavoriteCharacterCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.setup(characterMock[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.bounds.width - 25) / 2
        return CGSize(width: width, height: 200)
    }
}
