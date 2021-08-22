//
//  MainViewController.swift
//  CollectionViewPhotos
//
//  Created by Маша on 22.08.2021.
//

import Foundation
import UIKit

class MainViewController: UIViewController, UICollectionViewDelegateFlowLayout {
    var models = [Section]()
    var collectionView: UICollectionView!
    
    lazy var imageViewPlus: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(systemName: "plus")!
        return view
    }()
    
    let titleGeneralView: UILabel = {
        let title = UILabel()
        title.font = .boldSystemFont(ofSize: 33)
        title.text = "Альбомы"
        return title
    }()
    
    let titleForMyAlbums: UILabel = {
        let label = UILabel()
        label.text = "Мои альбомы"
        label.font = .boldSystemFont(ofSize: 21)
        return label
    }()
    
    let titleSeeAll: UILabel = {
        let label = UILabel()
        label.textColor = .systemBlue
        label.font = .systemFont(ofSize: 16)
        label.text = "См.все"
        return label
    }()
    
    let titleForPeopleAndPlaces: UILabel = {
        let label = UILabel()
        label.text = "Люди и места"
        label.font = .boldSystemFont(ofSize: 21)
        return label
    }()
    
    let titleSeeAllPeople: UILabel = {
        let label = UILabel()
        label.textColor = .systemBlue
        label.font = .systemFont(ofSize: 16)
        label.text = "См.все"
        return label
    }()
    
    let titleMedia: UILabel = {
        let label = UILabel()
        label.text = "Типы медифайлов"
        label.font = .boldSystemFont(ofSize: 21)
        return label
    }()
    
    let titleOther: UILabel = {
        let label = UILabel()
        label.text = "Другое"
        label.font = .boldSystemFont(ofSize: 21)
        return label
    }()
    
    let separatorMyAlbums: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    let separatorPeople: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    let separatorMedia: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    let separatorOther: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCells()
        setupCollectionView()
    }
    
    func setupCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createCompositionalLayout())
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.backgroundColor = .white
        view.addSubview(collectionView)
        collectionView.addSubview(imageViewPlus)
        collectionView.addSubview(titleGeneralView)
        collectionView.addSubview(titleForMyAlbums)
        collectionView.addSubview(titleSeeAll)
        collectionView.addSubview(titleForPeopleAndPlaces)
        collectionView.addSubview(titleSeeAllPeople)
        collectionView.addSubview(separatorMyAlbums)
        collectionView.addSubview(separatorPeople)
        collectionView.addSubview(titleMedia)
        collectionView.addSubview(separatorMedia)
        collectionView.addSubview(titleOther)
        collectionView.addSubview(separatorOther)
        
        collectionView.register(ListCollectionViewCell.self, forCellWithReuseIdentifier: ListCollectionViewCell.reuseId)
        collectionView.register(AlbumCollectionViewCell.self, forCellWithReuseIdentifier: AlbumCollectionViewCell.reuseId)
        collectionView.delegate = self
        collectionView.dataSource = self
        
        imageViewPlus.translatesAutoresizingMaskIntoConstraints = false
        imageViewPlus.topAnchor.constraint(equalTo: collectionView.topAnchor, constant: 15).isActive = true
        imageViewPlus.leadingAnchor.constraint(equalTo: collectionView.leadingAnchor, constant: 23).isActive = true
        
        titleGeneralView.translatesAutoresizingMaskIntoConstraints = false
        titleGeneralView.topAnchor.constraint(equalTo: collectionView.topAnchor, constant: 45).isActive = true
        titleGeneralView.leadingAnchor.constraint(equalTo: collectionView.leadingAnchor, constant: 23).isActive = true
        
        titleForMyAlbums.translatesAutoresizingMaskIntoConstraints = false
        titleForMyAlbums.topAnchor.constraint(equalTo: titleGeneralView.bottomAnchor, constant: 10).isActive = true
        titleForMyAlbums.leadingAnchor.constraint(equalTo: titleGeneralView.leadingAnchor).isActive = true
        
        titleSeeAll.translatesAutoresizingMaskIntoConstraints = false
        titleSeeAll.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15).isActive = true
        titleSeeAll.centerYAnchor.constraint(equalTo: titleForMyAlbums.centerYAnchor).isActive = true
        
        separatorMyAlbums.translatesAutoresizingMaskIntoConstraints = false
        separatorMyAlbums.leadingAnchor.constraint(equalTo: titleGeneralView.leadingAnchor).isActive = true
        separatorMyAlbums.bottomAnchor.constraint(equalTo: titleForMyAlbums.topAnchor, constant: -7).isActive = true
        separatorMyAlbums.heightAnchor.constraint(equalTo: titleForMyAlbums.heightAnchor, multiplier: 0.01).isActive = true
        separatorMyAlbums.widthAnchor.constraint(equalToConstant: 400).isActive = true
        
        separatorPeople.translatesAutoresizingMaskIntoConstraints = false
        separatorPeople.leadingAnchor.constraint(equalTo: collectionView.leadingAnchor, constant: 23).isActive = true
        separatorPeople.bottomAnchor.constraint(equalTo: titleForPeopleAndPlaces.topAnchor, constant: -7).isActive = true
        separatorPeople.heightAnchor.constraint(equalTo: titleForMyAlbums.heightAnchor, multiplier: 0.01).isActive = true
        separatorPeople.widthAnchor.constraint(equalToConstant: 400).isActive = true
        
        titleSeeAll.translatesAutoresizingMaskIntoConstraints = false
        titleSeeAll.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15).isActive = true
        titleSeeAll.centerYAnchor.constraint(equalTo: titleForMyAlbums.centerYAnchor).isActive = true
        
        titleForPeopleAndPlaces.translatesAutoresizingMaskIntoConstraints = false
        titleForPeopleAndPlaces.topAnchor.constraint(equalTo: titleGeneralView.bottomAnchor, constant: 475).isActive = true
        titleForPeopleAndPlaces.leadingAnchor.constraint(equalTo: titleGeneralView.leadingAnchor).isActive = true
        
        titleSeeAllPeople.translatesAutoresizingMaskIntoConstraints = false
        titleSeeAllPeople.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15).isActive = true
        titleSeeAllPeople.centerYAnchor.constraint(equalTo: titleForPeopleAndPlaces.centerYAnchor).isActive = true
        
        titleMedia.translatesAutoresizingMaskIntoConstraints = false
        titleMedia.leadingAnchor.constraint(equalTo: titleForPeopleAndPlaces.leadingAnchor).isActive = true
        titleMedia.topAnchor.constraint(equalTo: titleForPeopleAndPlaces.bottomAnchor, constant: 235).isActive = true
        
        separatorMedia.translatesAutoresizingMaskIntoConstraints = false
        separatorMedia.leadingAnchor.constraint(equalTo: collectionView.leadingAnchor, constant: 23).isActive = true
        separatorMedia.bottomAnchor.constraint(equalTo: titleMedia.topAnchor, constant: -7).isActive = true
        separatorMedia.heightAnchor.constraint(equalTo: titleMedia.heightAnchor, multiplier: 0.01).isActive = true
        separatorMedia.widthAnchor.constraint(equalToConstant: 400).isActive = true
        
        titleOther.translatesAutoresizingMaskIntoConstraints = false
        titleOther.leadingAnchor.constraint(equalTo: titleForPeopleAndPlaces.leadingAnchor).isActive = true
        titleOther.topAnchor.constraint(equalTo: titleMedia.bottomAnchor, constant: 430).isActive = true
        
        separatorOther.translatesAutoresizingMaskIntoConstraints = false
        separatorOther.leadingAnchor.constraint(equalTo: collectionView.leadingAnchor, constant: 23).isActive = true
        separatorOther.bottomAnchor.constraint(equalTo: titleOther.topAnchor, constant: -7).isActive = true
        separatorOther.heightAnchor.constraint(equalTo: titleMedia.heightAnchor, multiplier: 0.01).isActive = true
        separatorOther.widthAnchor.constraint(equalToConstant: 400).isActive = true
    }

    func createCompositionalLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { (sectionIndex, layoutEnvironment) -> NSCollectionLayoutSection? in
            let section = self.models[sectionIndex]
            
            switch section.type {
            case "albums": return self.createAlbumSection();
            case "secondAlbums": return self.createSecondAlbumSection()
            default:
                return self.createlistAlbumSection()
            }
        }
        return layout
    }
    
    func createlistAlbumSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(50))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets.init(top: 0, leading: 0, bottom: 8, trailing: 0)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                               heightDimension: .estimated(1))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets.init(top: 66, leading: 20, bottom: 0, trailing: 20)
        
        return section
    }
    
    func createAlbumSection() -> NSCollectionLayoutSection {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(170),
                                               heightDimension: .absolute(400))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitem: item, count: 2)
        group.contentInsets = NSDirectionalEdgeInsets(top: 5,
                                                      leading: 5,
                                                      bottom: 5,
                                                      trailing: 5)
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging
        section.contentInsets = NSDirectionalEdgeInsets.init(top: 126, leading: 15, bottom: 0, trailing: 20)
        
        return section
    }
    
    func createSecondAlbumSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(170),
                                               heightDimension: .absolute(190))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitem: item, count: 1)
        group.contentInsets = NSDirectionalEdgeInsets(top: 5,
                                                      leading: 5,
                                                      bottom: 5,
                                                      trailing: 5)
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging
        section.contentInsets = NSDirectionalEdgeInsets.init(top: 66, leading: 15, bottom: 0, trailing: 20)
    
        return section
    }
}

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return models.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return models[section].items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let section = models[indexPath.section].type
        switch section {
        case "albums":
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AlbumCollectionViewCell.reuseId, for: indexPath) as! AlbumCollectionViewCell
            let section = models[indexPath.section]
            let item = section.items[indexPath.item]
            cell.configure(with: item)
            return cell;
            
        case "secondAlbums":
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AlbumCollectionViewCell.reuseId, for: indexPath) as! AlbumCollectionViewCell
            let section = models[indexPath.section]
            let item = section.items[indexPath.item]
            cell.configure(with: item)
            return cell;
            
        case "listAlbums":
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ListCollectionViewCell.reuseId, for: indexPath) as! ListCollectionViewCell
            let section = models[indexPath.section]
            let item = section.items[indexPath.item]
            cell.configure(with: item)
            return cell;
            
        case "listPhoto":
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ListCollectionViewCell.reuseId, for: indexPath) as! ListCollectionViewCell
            let section = models[indexPath.section]
            let item = section.items[indexPath.item]
            cell.configure(with: item)
            return cell;
            
        default:
            return UICollectionViewCell()
        }
    }
}

extension MainViewController {
    func configureCells() {
        models.append(Section(type: "albums", title: "", items: [ ModelItem(title: "Недавние", number: "1928", nameImage: "m1"),ModelItem(title: "Viber", number: "9728", nameImage: "m2"),ModelItem(title: "WhatsApp", number: "8", nameImage: "m3"),ModelItem(title: "Telegram", number: "19", nameImage: "m4"),ModelItem(title: "Избранное", number: "155", nameImage: "m5"),ModelItem(title: "Instagram", number: "108", nameImage: "m6"),ModelItem(title: "Pinterest", number: "96", nameImage: "m7"),ModelItem(title: "Lightroom", number: "558", nameImage: "m8")]))
        
        models.append(Section(type: "secondAlbums", title: "", items: [ ModelItem(title: "Люди", number: "448", nameImage: "m7"),ModelItem(title: "Места", number: "23", nameImage: "m5"),ModelItem(title: "Страны", number: "187", nameImage: "m4"),ModelItem(title: "Отдых", number:"11", nameImage: "m8")]))
        
        models.append(Section(type: "listAlbums", title: "", items: [ ModelItem(title: "Видео", number: "192", nameImage: "video"),ModelItem(title: "Селфи", number: "1", nameImage: "person"),ModelItem(title: "Фото Live Photos", number: "87", nameImage: "livephoto"),ModelItem(title: "Портреты", number: "372", nameImage: "cube"),ModelItem(title: "Таймлапс", number: "288", nameImage: "timelapse"),ModelItem(title: "Замедленно", number: "734", nameImage: "slowmo"),ModelItem(title: "Серии", number: "22", nameImage: "square.stack.3d.down.forward"),ModelItem(title: "Снимки экрана", number: "199", nameImage: "photo")]))
        
        models.append(Section(type: "listPhoto", title: "", items: [ ModelItem(title: "Импортированные", number: "355", nameImage: "square.and.arrow.down"),ModelItem(title: "Скрытые", number: "29", nameImage: "eye.slash"),ModelItem(title: "Недавно удаленные", number: "52", nameImage: "trash")]))
    }
}
