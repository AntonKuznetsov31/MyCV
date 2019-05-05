//
//  File.swift
//  MyCV
//
//  Created by Anton Kuznetsov on 4/22/19.
//  Copyright © 2019 AntonKuznetsov. All rights reserved.
//

import Foundation

struct Hobby {
    
    let hobbiesArray = [MyHobby.books, MyHobby.games, MyHobby.music, MyHobby.snowboard, MyHobby.traveling]
    
    enum MyHobby: String {
        
        case books = "Books"
        case games = "Games"
        case music = "Music"
        case snowboard = "Snowboarding"
        case traveling = "Traveling"
        
        func image() -> String {
            switch self {
            case .books:
                return "books"
            case .games:
                return "games"
            case .music:
                return "music"
            case .snowboard:
                return "snowboard"
            case .traveling:
                return "traveling"
            }
        }
        
        func values() -> [String] {
            switch self {
            case .books:
                return ["Dostoevsky F. M. 'Idiot'", "Dostoevsky F. M. 'Crime and punishment'", "Holy Bible",
                        "J. R. R. Tolkien 'Lord of the Rings'", "J. K. Rowling 'Harry Potter'",
                        "Pelevin V. O. 'Chapaev and Void'", "Pelevin V. O. 'Generation P'"]
            case .games:
                return ["Bloodborne", "Heartstone", "Mortal Combat X", "Starcraft 2", "TES Skyrim",
                        "Witcher 3 Wild Hunt", "World of Tanks", "World of warcraft"]
            case .music:
                return ["25/17", "7Б", "Би-2", "Грот", "Кино",
                        "Океан Ельзи", "AC/DC", "Danheim", "Imagine Dragons", "Infected Mushroom",
                        "Linkin Park", "Metallica", "Rammstein", "System of a Down",
                        "Twenty One Pilots", "Wardruna"]
            case .snowboard:
                return ["snowboard1", "snowboard2", "snowboard3", "snowboard4"]
            case .traveling:
                return ["travel1", "travel2", "travel3", "travel4", "travel5",
                        "travel6", "travel7", "travel8", "travel9", "travel10",
                        "travel11", "travel12", "travel13"]
            }
        }
    }
}
