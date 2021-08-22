//
//  AlbumCollectionViewCell.swift
//  CollectionViewPhotos
//
//  Created by Маша on 22.08.2021.
//

import Foundation
import UIKit

class AlbumCollectionViewCell: UICollectionViewCell {
    
    static var reuseId: String = "AlbumCollectionViewCell"
    
    let friendImageView: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 4
        image.clipsToBounds = true
        return image
    }()
    
    let friendName: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(14)
        return label
    }()
    let lastMessage: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(14)
        label.textColor = .gray
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(white: 1, alpha: 1)
        setupElements()
        setupConstraints()
    }
    
    func setupElements() {
        friendName.translatesAutoresizingMaskIntoConstraints = false
        lastMessage.translatesAutoresizingMaskIntoConstraints = false
        friendImageView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func configure(with model: ModelItem) {
        friendName.text = model.title
        lastMessage.text = model.number
        friendImageView.image = UIImage(named: model.nameImage)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension AlbumCollectionViewCell {
    func setupConstraints() {
        addSubview(friendImageView)
        addSubview(friendName)
        addSubview(lastMessage)
        
        friendImageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        friendImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        friendImageView.widthAnchor.constraint(equalToConstant: 148).isActive = true
        friendImageView.heightAnchor.constraint(equalToConstant: 148).isActive = true
        
        friendName.topAnchor.constraint(equalTo: friendImageView.bottomAnchor, constant: 2).isActive = true
        friendName.leadingAnchor.constraint(equalTo: friendImageView.leadingAnchor, constant: 2).isActive = true
        friendName.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        lastMessage.topAnchor.constraint(equalTo: friendName.bottomAnchor).isActive = true
        lastMessage.leadingAnchor.constraint(equalTo: friendImageView.leadingAnchor, constant: 2).isActive = true
        lastMessage.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
}
