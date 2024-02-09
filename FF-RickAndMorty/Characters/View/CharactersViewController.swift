//
//  CharactersViewController.swift
//  FF-RickAndMorty
//
//  Created by Bianca Ferreira on 21/12/23.
//

import UIKit
import SkeletonView

class CharactersViewController: UIViewController {
    //MARK: - Properties
    var viewModel: CharacterViewModelProtocol?
    var numberOfPages: Int = 42
    
    //MARK: - Private Properties
    private(set) var characters: [Character] = []
    //TODO: remove the hardcode number get from api
    private var currentPage: Int = 1
    
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
        collection.isPagingEnabled = true
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()
    
    lazy var nextPageButton: UIButton = {
        let button = UIButton()
        button.setTitle("Proximo", for: .normal)
        button.backgroundColor = .gray
        button.addTarget(self, action: #selector(nextTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var beforeButton: UIButton = {
        let button = UIButton()
        button.setTitle("Anterior", for: .normal)
        button.backgroundColor = .gray
        button.addTarget(self, action: #selector(beforeTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        loadTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.collectionView.isSkeletonable = true
        self.reloadTableView()
    }
    
    //MARK: - objc Functions
    @objc func nextTapped(_ sender: Any) {
        if currentPage <= numberOfPages {
            currentPage += 1
            loadTableView(page: currentPage)
        }
    }
    
    @objc func beforeTapped(_ sender: Any) {
        if currentPage > 1 {
            currentPage -= 1
            loadTableView(page: currentPage)
        }
    }
    
    //MARK: - Private Functions
    private func loadTableView(page: Int = 1) {
        viewModel?.getCharacters(pageNumber: page)
        viewModel?.onSuccess = { [weak self] in
            self?.characters = (self?.viewModel?.characters)!
            DispatchQueue.main.async {
                self?.reloadTableView()
            }
        }
        
        viewModel?.onFailure = { [weak self] in
            self?.showError()
        }
    }
    
    private func setupViews() {
        view.addSubview(collectionView)
        view.addSubview(nextPageButton)
        view.addSubview(beforeButton)
        view.backgroundColor = .white
        
        //TODO: adjust the navigation config
        navigationItem.title = "Personagens"
        
        registerCells()
        setupConstraints()
    }
    
    private func setupConstraints() { 
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: nextPageButton.topAnchor, constant: -10),
            
            nextPageButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            nextPageButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            nextPageButton.widthAnchor.constraint(equalToConstant: 150),
            nextPageButton.heightAnchor.constraint(equalToConstant: 50),
            
            beforeButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            beforeButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            beforeButton.widthAnchor.constraint(equalToConstant: 150),
            beforeButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func registerCells() {
        collectionView.register(CharactersCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
    }
    
    private func reloadTableView() {
        self.collectionView.showAnimatedSkeleton(
            usingColor: .clouds,
            transition: .crossDissolve(0.25))
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0, execute: {
            self.collectionView.stopSkeletonAnimation()
            self.collectionView.hideSkeleton(reloadDataAfter: true, transition: .crossDissolve(0.25))
        })
    }
    
    private func showError() {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "Ocorreu um erro", message: "Não foi possivel retornar os personagens, pagina não existe.", preferredStyle: .actionSheet)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
                alert.dismiss(animated: true)
            }))
            
            self.present(alert, animated: true)
        }
    }
}
