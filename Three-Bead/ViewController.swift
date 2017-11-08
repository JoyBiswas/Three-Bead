//
//  ViewController.swift
//  Three-Bead
//
//  Created by MacBook Air on 10/25/17.
//  Copyright © 2017 MacBook Air. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
 
    
    @IBOutlet weak var playerIdentityLabel: UILabel!
    
    @IBOutlet weak var playAgainBtn: UIButton!
    @IBOutlet weak var winerLabel: UILabel!
    
    var intheEnd = false
    
    var activeGame = true
    // 1 for nought,2 for cross
    
    var activePlayer = 1
    
    var gameState = [0,0,0,0,0,0,0,0,0]//0-emty,1-nought,2 -cross
    var winningCombination = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
    
    
    @IBAction func buttonPressed(_ sender: Any) {
        
        let activePosition = (sender as AnyObject).tag-1
        
        if gameState[activePosition] == 0 && activeGame {
            
            gameState[activePosition] = activePlayer
       
            if activePlayer == 1 {
                
                (sender as AnyObject).setImage(UIImage(named:"nought.png"), for: [])
                playerIdentityLabel.text = "Player-2-Term👇🏽"
                activePlayer = 2
            }else {
                (sender as AnyObject).setImage(UIImage(named:"cross.png"), for: [])
                playerIdentityLabel.text = "Player-1-Term👇🏽"
                activePlayer = 1
                
            }
           
            for combinnation in winningCombination {
                
                if gameState[combinnation[0]] != 0 && gameState[combinnation[0]] == gameState[combinnation[1]] && gameState[combinnation[1]] == gameState[combinnation[2]] {
                    
                    //we hava a winer
                    activeGame = false
                    
                    winerLabel.isHidden = false
                    playAgainBtn.isHidden = false
                    
                    if gameState[combinnation[0]] == 1 {
                        
                        winerLabel.text = "Nought has won!"
                        
                    }else  {
                        
                        winerLabel.text = "Cross has won!"
                    }
                    UIView.animate(withDuration: 1, animations: {
                        
                        self.winerLabel.center = CGPoint(x: self.winerLabel.center.x+500, y: self.winerLabel.center.y)
                        self.playAgainBtn.center = CGPoint(x: self.playAgainBtn.center.x+500, y: self.playAgainBtn.center.y)
                        
                        
                        
                    })
                    
                    
                    
                    
            }
                
               
                
        }
            activeGame = false
            
            for i in gameState {
                
                if i == 0 {
                    
                    activeGame = true
                    break
                }
            }
            
            if activeGame == false {
                
                winerLabel.textColor = UIColor(colorLiteralRed: 1.0, green: 0.0, blue: 0.0, alpha: 1.0)
                
                winerLabel.text = "It was a Draw"
                playAgainBtn.isHidden = false
                winerLabel.isHidden = false
                
            }
            
            
        
    }
        
        
}
    
    @IBAction func playAgainPressed(_ sender: Any) {
        
         activeGame = true
        
        // 1 for nought,2 for cross
        
         activePlayer = 1
        
         gameState = [0,0,0,0,0,0,0,0,0]
        
        
        for i in 0..<10 {
            
            if let button = view.viewWithTag(i) as? UIButton {
                
                button.setImage(nil, for: [])
            }
        }
        
        winerLabel.isHidden = true
        playAgainBtn.isHidden = true
        
        winerLabel.center = CGPoint(x: winerLabel.center.x-500, y: winerLabel.center.y)
        playAgainBtn.center = CGPoint(x: playAgainBtn.center.x-500, y: playAgainBtn.center.y)
        
        playerIdentityLabel.text = "Player-1-Term👇🏽"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
       
        winerLabel.isHidden = true
        playAgainBtn.isHidden = true
        
        winerLabel.center = CGPoint(x: winerLabel.center.x-500, y: winerLabel.center.y)
        playAgainBtn.center = CGPoint(x: playAgainBtn.center.x-500, y: playAgainBtn.center.y)
        
        playerIdentityLabel.text = "Player-1-Term👇🏽"
        
    }

   


}

