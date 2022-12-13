//
//  GameModel.swift
//  TicTacToe
//
//  Created by Brendon Crowe on 12/12/22.
//

import UIKit

enum Player: Int, CaseIterable {
    case player1, player2
}

class TicTacToeGame {
    
    var currentPlayer = Player.player1
    
  



    
    
    func spacePressed(_ button: BoardButton, _ player: Player) {
        switch player.rawValue {
        case 0:
            button.setBackgroundImage(UIImage(systemName:"xmark"), for: .normal)
            currentPlayer = .player2
        case 1:
            button.setBackgroundImage(UIImage(systemName: "circle"), for: .normal)
            currentPlayer = .player1
        default:
            break
        }
    }
    
    
    
    
}
