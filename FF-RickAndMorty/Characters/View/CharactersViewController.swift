//
//  CharactersViewController.swift
//  FF-RickAndMorty
//
//  Created by Bianca Ferreira on 21/12/23.
//

import UIKit

class CharactersViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    //MARK: - Properties
    var viewModel: CharactersViewModel?
    
    //MARK: - Private Properties
    private(set) var characters: [Character] = []
    
    //MARK: - Views
    lazy var tableView: UITableView = {
        let table = UITableView()
        table.dataSource = self
        table.delegate = self
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        loadTableView()
    }
    
    //MARK: - Private Functions
    private func loadTableView(completion: (() -> Void)? = nil) {
        viewModel?.getCaracters { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                self.characters = response.results
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
                completion?()
                
            case .failure(let failure):
                print("error \(failure)")
                completion?()
            }
        }
    }
    
    private func setupViews() {
        view.addSubview(tableView)
        view.backgroundColor = .blue
        navigationItem.title = "Personagens"
        
        setupConstraints()
        
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
}
