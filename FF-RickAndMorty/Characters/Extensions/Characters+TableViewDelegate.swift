//
//  Characters+TableViewDelegate.swift
//  FF-RickAndMorty
//
//  Created by Bianca Ferreira on 22/12/23.
//

import UIKit
import SkeletonView

extension CharactersViewController: UITableViewDelegate, SkeletonTableViewDataSource {
    func collectionSkeletonView(_ skeletonView: UITableView, cellIdentifierForRowAt indexPath: IndexPath) -> ReusableCellIdentifier {
        return "cell"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CharactersCell
        else {
            return UITableViewCell()
        }
        let data = CharactersCellData(name: characters[indexPath.row].name,
                                      image: characters[indexPath.row].image)
        cell.setupCell(data: data)
        
        cell.selectionStyle = .none
        
        return cell
    }
}
