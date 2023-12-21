//
//  ViewController.swift
//  FF-RickAndMorty
//
//  Created by Bianca Ferreira on 19/12/23.
//

import UIKit

class HomeViewController: UIViewController {
    //MARK: - LazyVars
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
        getCharacters()
    }
    
    //MARK: - Private Functions
    private func setupViews() {
        view.addSubview(charactersView)
        view.addSubview(locationsView)
        view.addSubview(episodesView)
        
        setupConstraints()
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
    
    func getCharacters() {
        let urlString = "https://rickandmortyapi.com/api/character/2"
        NetworkManager.shared.fetchData(from: urlString) { result in
            switch result {
            case .success(let data):
                do {
                    let decoder = JSONDecoder()
                    let character = try decoder.decode(Character.self, from: data)
                    print("\(character)")
                } catch {
                    print("")
                }
            case .failure(let failure):
                print()
            }
        }
    }
}
