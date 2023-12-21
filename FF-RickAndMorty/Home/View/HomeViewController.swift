//
//  ViewController.swift
//  FF-RickAndMorty
//
//  Created by Bianca Ferreira on 19/12/23.
//

import UIKit

class HomeViewController: UIViewController {
    var service: CharactersServiceable?
    
    //MARK: - LazyVars
    lazy var charactersView: HomeCategoryView = {
        let view = HomeCategoryView()
        view.setupView(title: "Personagens", imageName: "characters-home-icon")
        view.backgroundColor = .blue.withAlphaComponent(0.3)
        let gesture = UITapGestureRecognizer(target: self, action: #selector(getCharacter))
        view.addGestureRecognizer(gesture)
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
    init(service: CharactersServiceable) {
        super.init(nibName: nil, bundle: nil)
        self.service = service
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func getCharacters(completion: @escaping (Result<Character, RequestError>) -> Void) {
        Task(priority: .background) {
            let result = await service?.getCaracter(id: 2)
            switch result {
            case .success(let success):
                print(success.name)
            case .failure(let failure):
                print(failure)
            case .none:
                break;
            }
        }
    }
    
    @objc func getCharacter(_ sender: Any) {
        getCharacters { result in
            print(result)
        }
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
}
