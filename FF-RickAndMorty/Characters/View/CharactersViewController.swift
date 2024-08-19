//
//  CharactersViewController.swift
//  FF-RickAndMorty
//
//  Created by Bianca Ferreira on 21/12/23.
//

import UIKit
import SkeletonView
import RxSwift
import RxDataSources

class CharactersViewController: UIViewController, UICollectionViewDelegateFlowLayout {
    //MARK: - Properties
    var viewModel: CharacterViewModelProtocol?
    var numberOfPages: Int = 42
    
    //MARK: - Private Properties
    private let disposeBag = DisposeBag()
    
    //MARK: - Views
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 5
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 0, right: 10)
        layout.scrollDirection = .vertical
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.delegate = self
        collection.isPagingEnabled = true
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()
    
    //MARK: - Lifecycle
    init(viewModel: CharacterViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupBindings()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        self.collectionView.isSkeletonable = true
//        self.reloadTableView()
    }
    
    //MARK: Private Functions
    private func setupViews() {
        view.addSubview(collectionView)
        view.backgroundColor = .white
        
        navigationItem.title = "Personagens"
        
        registerCells()
        setupConstraints()
    }
    
    private func setupConstraints() { 
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
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
    
    private func setupBindings() {
        let dataSource = RxCollectionViewSectionedReloadDataSource<SectionOfCharacters> { _, collectionView, indexPath, characters in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CharactersCollectionViewCell
            cell.setup(characters)
            return cell
        }
        
        viewModel?.sections
            .drive(collectionView.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)
        
        viewModel?.fetchCharacters.onNext(())
    }
}
