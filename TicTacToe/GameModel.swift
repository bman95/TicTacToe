//
//  GameModel.swift
//  TicTacToe
//
//  Created by Brendon Crowe on 12/12/22.
//


// Model and logic developed around the custom buttons class "BoardButton"
// BoardButton contains two properties: row and col

import UIKit

enum Player: Int {
    case Player1, Player2
}

class TicTacToeGame {
    
    var currentPlayer = Player.Player1
    var buttonsPressed: Set<[Int]> = []
    var player1Buttons: Set<[Int]> = []
    var player2Buttons: Set<[Int]> = []
    // Horizontal combinations
    var winningCombination1 = Set([[0,0], [0,1], [0,2]])
    var winningCombination2 = Set([[1,0], [1,1], [1,2]])
    var winningCombination3 = Set([[2,0], [2,1], [2,2]])
    // Vertical combinations
    var winningCombination4 = Set([[0,0], [1,0], [2,0]])
    var winningCombination5 = Set([[0,1], [1,1], [2,1]])
    var winningCombination6 = Set([[0,2], [1,2], [2,2]])
    // Diagonal combinations
    var winningCombination7 = Set([[0,0], [1,1], [2,2]])
    var winningCombination8 = Set([[0,2], [1,1], [2,0]])
    
    
    
    func gameStatus(_ buttonPressed: BoardButton, _ allButtons: [BoardButton], _ message: UILabel) {
        buttonsPressed.insert([buttonPressed.row, buttonPressed.col])
        
        if (player1Buttons == winningCombination1) || (player1Buttons == winningCombination2) || (player1Buttons == winningCombination3) || (player1Buttons == winningCombination4) || (player1Buttons == winningCombination5) || (player1Buttons == winningCombination6) || (player1Buttons == winningCombination7) || (player1Buttons == winningCombination8) {
            print("Player1 wins!")
            message.text = "Player1 wins!"
            for button in allButtons {
                button.isEnabled = false
            }
            
        } else if (player2Buttons == winningCombination1) || (player2Buttons == winningCombination2) || (player2Buttons == winningCombination3) || (player2Buttons == winningCombination4) || (player2Buttons == winningCombination5) || (player2Buttons == winningCombination6) || (player2Buttons == winningCombination7) || (player2Buttons == winningCombination8)  {
          print("Player2 wins!")
            message.text = "Player2 wins!"
            for button in allButtons {
                button.isEnabled = false
            }
        }
        
        if buttonsPressed.count == 9 {
            print("Game Over")
            message.text = "It's a tie..."
            for button in allButtons {
                button.isEnabled = false
            }
        }
    }
    
    func spacePressed(_ button: BoardButton, _ player: Player) {
        switch player.rawValue {
        case 0:
            if player1Buttons.contains([button.row, button.col]) != true && player2Buttons.contains([button.row, button.col]) != true {
                player1Buttons.insert([button.row, button.col])
                button.setBackgroundImage(UIImage(systemName:"xmark"), for: .normal)
                print(player1Buttons)
                print("Player1 has \(player1Buttons.count) buttons")
                currentPlayer = .Player2
            } else {
            }
        case 1:
            if player2Buttons.contains([button.row, button.col]) != true && player1Buttons.contains([button.row, button.col]) != true {
                player2Buttons.insert([button.row, button.col])
                button.setBackgroundImage(UIImage(systemName:"circle"), for: .normal)
                print(player2Buttons)
                print("Player2 has \(player1Buttons.count) buttons")
                currentPlayer = .Player1
            } else {
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
            currentPlayer = Player.Player1
        }
        
    }
