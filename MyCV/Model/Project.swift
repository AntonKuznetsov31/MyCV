//
//  Project.swift
//  MyCV
//
//  Created by Anton Kuznetsov on 4/26/19.
//  Copyright © 2019 AntonKuznetsov. All rights reserved.
//

import Foundation

struct Project {
    
    let projectsArray = [MyProject.ticTacToe, MyProject.testApp, MyProject.weatherApp]
    
    enum MyProject: String {
        
        case ticTacToe = "Tic-Tac-Toe"
        case testApp = "Test App"
        case weatherApp = "Weather App"
        
        func mainImage() -> String {
            switch self {
            case .ticTacToe:
                return "project1"
            case .testApp:
                return "project2"
            case .weatherApp:
                return "project3"
            }
        }
        
        func imagesAndDescriptions() -> [[String: String]] {
            switch self {
            case .ticTacToe:
                return [["https://i.ibb.co/82d98FG/IMG-0939.png": "It's a simple TicTacToe game for two players"],
                        ["https://i.ibb.co/XL290VK/IMG-0940.png": "System calculates winner and tells to user who won"]]
            case .testApp:
                return [["https://i.ibb.co/6my4W30/IMG-0941.png": "Test for Apple geeks"],
                    ["https://i.ibb.co/3hy8tbN/IMG-0942.png": "Answer questions"],
                    ["https://i.ibb.co/0jr6bNV/IMG-0943.png": "Check your result"]]
            case .weatherApp:
                return [["https://i.ibb.co/W3dC4pH/IMG-0952.png": "Start writing the name of your city, and choose your city"],
                    ["https://i.ibb.co/3hZs7Xm/IMG-0957.png": "Add your cities in list, app saves them using Core Data"],
                    ["https://i.ibb.co/3m7yWHz/IMG-0946.png": "App check if it can find your city on map"],
                    ["https://i.ibb.co/yn3cCzM/IMG-0956.png": "App check your cities for duplicates"],
                    ["https://i.ibb.co/3hrq91L/IMG-0954.png": "I have used darksky.net API to provide user with common weather information for every city"]]
            }
        }
    }
}
