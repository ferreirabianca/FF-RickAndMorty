//
//  EpisodeDetailsViewController.swift
//  FF-RickAndMorty
//
//  Created by Bianca Ferreira on 26/12/23.
//

import UIKit

class EpisodeDetailsViewController: UIViewController {
    //MARK: - Lifecycle
    var viewModel: EpisodeDetailsViewModel?
    var episode: Episode?
    
    //MARK: - Views
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.isSkeletonable = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var airDateLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.isSkeletonable = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var episodeLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.isSkeletonable = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
    }
    
    //MARK: - Private Functions
    private func setupViews() {
        view.addSubview(nameLabel)
        view.addSubview(airDateLabel)
        view.addSubview(episodeLabel)
        
        nameLabel.text = episode?.name
        airDateLabel.text = episode?.airDate
        episodeLabel.text = episode?.episode
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            airDateLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),
            airDateLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            airDateLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            episodeLabel.topAnchor.constraint(equalTo: airDateLabel.bottomAnchor, constant: 20),
            episodeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            episodeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ])
    }
}
