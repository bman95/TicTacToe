//
//  GameModel.swift
//  TicTacToe
//
//  Created by Brendon Crowe on 12/12/22.
//

import UIKit

enum Player: Int {
    case player1, player2
}

class TicTacToeGame {
    
    var currentPlayer = Player.player1
    var buttonsPressed: Set<[Int]> = []
    var player1Buttons: Set<[Int]> = []
    var player2Buttons: Set<[Int]> = []
    
    
    func gameStatus(_ buttonPressed: BoardButton, _ allButtons: [BoardButton]) {
        buttonsPressed.insert([buttonPressed.row, buttonPressed.col])
        print(buttonsPressed)
        if buttonsPressed.count == 9 {
            print("Game Over")
            for button in allButtons {
                button.isEnabled = false
            }
        }
        
    }
    
    
    func spacePressed(_ button: BoardButton, _ player: Player) {
        switch player.rawValue {
        case 0:
            if player1Buttons.contains([button.row, button.col]) != true {
                button.setBackgroundImage(UIImage(systemName:"xmark"), for: .normal)
                player1Buttons.insert([button.row, button.col])
                print("Player1 has \(player1Buttons.count) buttons")
                currentPlayer = .player2
            }
        case 1:
            if player2Buttons.contains([button.row, button.col]) != true {
                button.setBackgroundImage(UIImage(systemName:"circle"), for: .normal)
                print("Player2 has \(player1Buttons.count) buttons")
                player2Buttons.insert([button.row, button.col])
                
                currentPlayer = .player1
                            }
            default:
                break
            }
        }
        
        func newGame(_ allButtons: [BoardButton]) {
            for button in allButtons {
                button.isEnabled = true
                button.setBackgroundImage(UIImage(systemName: ""), for: .normal)
            }
            buttonsPressed.removeAll()
            player1Buttons.removeAll()
            player2Buttons.removeAll()
            currentPlayer = Player.player1
        }
        
        
        
        
    }
