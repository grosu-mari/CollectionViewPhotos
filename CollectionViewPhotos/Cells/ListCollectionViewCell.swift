//
//  ListCollectionViewCell.swift
//  CollectionViewPhotos
//
//  Created by Маша on 22.08.2021.
//

import Foundation
import UIKit

class ListCollectionViewCell: UICollectionViewCell {
    
    static var reuseId: String = "ListCollectionViewCell"
    
    private let imageNextText = UIImage(systemName: "chevron.right")!
    
    lazy var imageTextView: UIImageView = {
        var imageNext = UIImageView()
        imageNext.image = imageNextText
        imageNext.tintColor = .gray
        return imageNext
    }()
    
    let iconImage: UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    let title: UILabel = {
        let title = UILabel()
        title.font = title.font.withSize(22)
        title.textColor = .systemBlue
        return title
    }()
    
    let number: UILabel = {
        let number = UILabel()
        number.textColor = .gray
        return number
    }()
    
    let separator: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(white: 1, alpha: 1)
        setupConstraints()
        self.layer.cornerRadius = 4
        self.clipsToBounds = true
    }
    
    func configure(with model: ModelItem) {
        title.text = model.title
        number.text = model.number
        iconImage.image = UIImage(systemName: model.nameImage)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ListCollectionViewCell {
    func setupConstraints() {
        addSubview(iconImage)
        addSubview(title)
        addSubview(number)
        addSubview(imageTextView)
        addSubview(separator)
                
        separator.translatesAutoresizingMaskIntoConstraints = false
        separator.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        separator.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.95).isActive = true
        separator.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.005).isActive = true
        separator.leadingAnchor.constraint(equalTo: title.leadingAnchor).isActive = true
        
        imageTextView.translatesAutoresizingMaskIntoConstraints = false
        imageTextView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        imageTextView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        
        iconImage.translatesAutoresizingMaskIntoConstraints = false
        iconImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        iconImage.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        iconImage.widthAnchor.constraint(equalToConstant: 35).isActive = true
        iconImage.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        title.translatesAutoresizingMaskIntoConstraints = false
        title.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        title.leadingAnchor.constraint(equalTo: iconImage.trailingAnchor, constant: 15).isActive = true

        number.translatesAutoresizingMaskIntoConstraints = false
        number.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        number.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -25).isActive = true
    }
}
