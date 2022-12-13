//
//  ViewController.swift
//  TicTacToe
//
//  Created by Brendon Crowe on 12/12/22.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var currentPlayer: UILabel!
    @IBOutlet var gameBoardSpaces: [BoardButton]!
    let model = TicTacToeGame()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentPlayer.text = "It's \(model.currentPlayer)'s turn!"
      
    
    }
    
    
    @IBAction func boardButtonPressed(_ button: BoardButton) {
        print("row \(button.row) at column \(button.col)")
        model.spacePressed(button, model.currentPlayer)
        currentPlayer.text = "It's \(model.currentPlayer)'s turn!"
        model.gameStatus(button, gameBoardSpaces)
        
        }
        

    @IBAction func newGameStarted(_ sender: UIButton) {
        model.newGame(gameBoardSpaces)
        currentPlayer.text = "It's \(model.currentPlayer)'s turn!"
    }
    

}

