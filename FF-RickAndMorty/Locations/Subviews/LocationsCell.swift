//
//  LocationsCell.swift
//  FF-RickAndMorty
//
//  Created by Bianca Ferreira on 22/12/23.
//

import UIKit
import SkeletonView

struct LocationsCellData {
    var name: String
}

class LocationsCell: UITableViewCell {
    //MARK: - Views
    lazy var characterName: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.isSkeletonable = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //MARK: - Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        self.isSkeletonable = true
        self.contentView.isSkeletonable = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        contentView.backgroundColor = .red.withAlphaComponent(0.3)
        contentView.layer.cornerRadius = 15
        contentView.layer.borderWidth = 0.2
        
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10))
    }
    
    //MARK: - Functions
    func setupCell(data: LocationsCellData) {
        characterName.text = data.name
    }
    
    //MARK: - Private Functions
    private func setupViews() {
        contentView.addSubview(characterName)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            characterName.topAnchor.constraint(equalTo: contentView.topAnchor),
            characterName.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            characterName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            characterName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        ])
    }
}
