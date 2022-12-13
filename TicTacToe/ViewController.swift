//
//  ViewController.swift
//  TicTacToe
//
//  Created by Brendon Crowe on 12/12/22.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var currentPlayer: UILabel!
    @IBOutlet var gameBoardSpaceID: [BoardButton]!
    let model = TicTacToeGame()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentPlayer.text = "It's \(model.currentPlayer)'s turn!"
      
    
    }
    
    
    @IBAction func boardButtonPressed(_ button: BoardButton) {
        print("row \(button.row) at column \(button.col)")
        model.spacePressed(button, model.currentPlayer)
        currentPlayer.text = "It's \(model.currentPlayer)'s turn!"
        
        
        }
        

    

}

