//
//  UIImageView+Extensions.swift
//  FF-RickAndMorty
//
//  Created by Bianca Ferreira on 21/12/23.
//

import UIKit
import Kingfisher

extension UIImageView {
    func setImage(from image: String?) {
        guard let image, let imageURL = URL(string: image) else {
            return
        }
        self.kf.setImage(with: imageURL)
    }
}
