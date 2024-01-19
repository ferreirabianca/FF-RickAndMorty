//
//  Episodes+TableViewDelegate.swift
//  FF-RickAndMorty
//
//  Created by Bianca Ferreira on 22/12/23.
//

import UIKit
import SkeletonView

extension EpisodesViewController: UITableViewDelegate, SkeletonTableViewDataSource {
    func collectionSkeletonView(_ skeletonView: UITableView, cellIdentifierForRowAt indexPath: IndexPath) -> ReusableCellIdentifier {
        return "cell"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return episodes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? EpisodesCell
        else {
            return UITableViewCell()
        }
        let data = EpisodesCellData(name: episodes[indexPath.row].name)
        cell.setupCell(data: data)
        
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        Task {
            viewModel?.getEpisode(id: episodes[indexPath.row].id, completion: { episode in
                DispatchQueue.main.async {
                    self.viewModel?.gotoEpisodeDetails(with: episode)
                }
            })
        }
    }
}
