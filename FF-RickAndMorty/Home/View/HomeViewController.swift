//
//  ViewController.swift
//  FF-RickAndMorty
//
//  Created by Bianca Ferreira on 19/12/23.
//

import UIKit

class HomeViewController: UIViewController {
    //MARK: - Properties
    var viewModel: HomeViewModel?
    
    //MARK: - Views
    lazy var charactersView: HomeCategoryView = {
        let view = HomeCategoryView()
        view.setupView(title: "Personagens", imageName: "characters-home-icon")
        view.backgroundColor = .blue.withAlphaComponent(0.3)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var locationsView: HomeCategoryView = {
        let view = HomeCategoryView()
        view.setupView(title: "Localização", imageName: "locations-home-icon")
        view.backgroundColor = .green.withAlphaComponent(0.3)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var episodesView: HomeCategoryView = {
        let view = HomeCategoryView()
        view.setupView(title: "Episodios", imageName: "episodes-home-icon")
        view.backgroundColor = .red.withAlphaComponent(0.3)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    //MARK: - objc Functions
    @objc func didTapCharacters(_ sender: Any) {
        viewModel?.gotoCharacters()
    }
    
    @objc func didTapLocations(_ sender: Any) {
        viewModel?.gotoLocations()
    }
    
    @objc func didTapEpisodes(_ sender: Any) {
        viewModel?.gotoEpisodes()
    }
    
    //MARK: - Private Functions
    private func setupViews() {
        view.addSubview(charactersView)
        view.addSubview(locationsView)
        view.addSubview(episodesView)
        
        setupConstraints()
        setupTapGestures()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            charactersView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            charactersView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            charactersView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            charactersView.heightAnchor.constraint(equalToConstant: 100),
            
            locationsView.topAnchor.constraint(equalTo: charactersView.bottomAnchor, constant: 10),
            locationsView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            locationsView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            locationsView.heightAnchor.constraint(equalToConstant: 100),
            
            episodesView.topAnchor.constraint(equalTo: locationsView.bottomAnchor, constant: 10),
            episodesView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            episodesView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            episodesView.heightAnchor.constraint(equalToConstant: 100),
        ])
    }
    
    private func setupTapGestures() {
        let charactersTap = UITapGestureRecognizer(target: self, action: #selector(didTapCharacters))
        let locationsTap = UITapGestureRecognizer(target: self, action: #selector(didTapLocations))
        let episodesTap = UITapGestureRecognizer(target: self, action: #selector(didTapEpisodes))
        
        charactersView.addGestureRecognizer(charactersTap)
        locationsView.addGestureRecognizer(locationsTap)
        episodesView.addGestureRecognizer(episodesTap)
    }
}
