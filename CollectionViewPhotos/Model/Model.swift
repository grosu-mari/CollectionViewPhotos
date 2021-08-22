//
//  Model.swift
//  CollectionViewPhotos
//
//  Created by Маша on 22.08.2021.
//

import Foundation
import UIKit

struct Section {
    let type: String
    let title: String
    let items: [ModelItem]
}

struct ModelItem {
    let title: String
    let number: String
    let nameImage: String
}

extension MainViewController {
    func configureCells() {
        models.append(Section(type: "albums", title: "", items: [
                                ModelItem(title: "Недавние", number: "1928", nameImage: "m1"),
                                ModelItem(title: "Viber", number: "9728", nameImage: "m2"),
                                ModelItem(title: "WhatsApp", number: "8", nameImage: "m3"),
                                ModelItem(title: "Telegram", number: "19", nameImage: "m4"),
                                ModelItem(title: "Избранное", number: "155", nameImage: "m5"),
                                ModelItem(title: "Instagram", number: "108", nameImage: "m6"),
                                ModelItem(title: "Pinterest", number: "96", nameImage: "m7"),
                                ModelItem(title: "Lightroom", number: "558", nameImage: "m8")]))
        
        models.append(Section(type: "secondAlbums", title: "", items: [
                                ModelItem(title: "Люди", number: "448", nameImage: "m7"),
                                ModelItem(title: "Места", number: "23", nameImage: "m5"),
                                ModelItem(title: "Страны", number: "187", nameImage: "m4"),
                                ModelItem(title: "Отдых", number:"11", nameImage: "m8")]))
        
        models.append(Section(type: "listAlbums", title: "", items: [
                                ModelItem(title: "Видео", number: "192", nameImage: "video"),
                                ModelItem(title: "Селфи", number: "1", nameImage: "person"),
                                ModelItem(title: "Фото Live Photos", number: "87", nameImage: "livephoto"),
                                ModelItem(title: "Портреты", number: "372", nameImage: "cube"),
                                ModelItem(title: "Таймлапс", number: "288", nameImage: "timelapse"),
                                ModelItem(title: "Замедленно", number: "734", nameImage: "slowmo"),
                                ModelItem(title: "Серии", number: "22", nameImage: "square.stack.3d.down.forward"),
                                ModelItem(title: "Снимки экрана", number: "199", nameImage: "photo")]))
        
        models.append(Section(type: "listPhoto", title: "", items: [
                                ModelItem(title: "Импортированные", number: "355", nameImage: "square.and.arrow.down"),
                                ModelItem(title: "Скрытые", number: "29", nameImage: "eye.slash"),
                                ModelItem(title: "Недавно удаленные", number: "52", nameImage: "trash")]))
    }
}

