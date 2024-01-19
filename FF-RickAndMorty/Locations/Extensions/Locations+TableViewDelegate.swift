//
//  Locations+TableViewDelegate.swift
//  FF-RickAndMorty
//
//  Created by Bianca Ferreira on 22/12/23.
//

import UIKit
import SkeletonView

extension LocationsViewController: UITableViewDelegate, SkeletonTableViewDataSource {
    func collectionSkeletonView(_ skeletonView: UITableView, cellIdentifierForRowAt indexPath: IndexPath) -> ReusableCellIdentifier {
        return "cell"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return locations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? LocationsCell
        else {
            return UITableViewCell()
        }
        let data = LocationsCellData(name: locations[indexPath.row].name)
        cell.setupCell(data: data)
        
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        Task {
            viewModel?.getLocation(id: locations[indexPath.row].id, completion: { location in
                DispatchQueue.main.async {
                    self.viewModel?.gotoLocationDetails(with: location)
                }
            })
        }
    }
}
