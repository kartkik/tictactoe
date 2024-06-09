//
//  ViewController.swift
//  tictactoe
//
//  Created by MacOS on 26/05/24.
//

import UIKit

class ViewController: UIViewController {
    
    enum Turn{
        case Circle
        case Cross

    }

   
    @IBOutlet weak var turnLabel: UILabel!
    @IBOutlet weak var a1: UIButton!
    @IBOutlet weak var a2: UIButton!
    @IBOutlet weak var a3: UIButton!
    @IBOutlet weak var b1: UIButton!
    @IBOutlet weak var b2: UIButton!
    @IBOutlet weak var b3: UIButton!
    
    @IBOutlet weak var c1: UIButton!
    @IBOutlet weak var c2: UIButton!
    @IBOutlet weak var c3: UIButton!
    
    
    var firstTurn = Turn.Cross
    var currentTurn = Turn.Cross
    
    
    var CIRCLE = "O"
    var CROSS = "X"
    var board =  [UIButton]()
    
    var crossscore = 0
    var circlescore = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initBoard()
    }


    @IBAction func boardTapAction(_ sender: UIButton) {
        
        addToBoard(sender)
        
        if checkVictory(CROSS){
            crossscore += 1
            resultAlert(title: "CROSS WIN")
            
        }
        
        if checkVictory(CIRCLE){
            circlescore += 1
            resultAlert(title: "CIRCLE WIN")
        }
        
        
        if fullBoard(){
            resultAlert(title: "Draw")
        }
        
    }
    
    func checkVictory( _ s :String)-> Bool{
        
        if thisSymbol(a1, s ) && thisSymbol(a2, s) && thisSymbol(a3, s){
        
        return true
            }
        
        if thisSymbol(b1, s ) && thisSymbol(b2, s) && thisSymbol(b3, s){
        
        return true
            }
        
        if thisSymbol(c1, s ) && thisSymbol(c2, s) && thisSymbol(c3, s){
        
        return true
            }
        
        
        if thisSymbol(a1, s ) && thisSymbol(b1, s) && thisSymbol(c1, s){
        
        return true
            }
        
        if thisSymbol(a2, s ) && thisSymbol(b2, s) && thisSymbol(c2, s){
        
        return true
            }
        
        if thisSymbol(a3, s ) && thisSymbol(b3, s) && thisSymbol(c3, s){
        
        return true
            }
        
        
        
        if thisSymbol(a1, s ) && thisSymbol(b2, s) && thisSymbol(c3, s){
        
        return true
            }
        
        if thisSymbol(a3, s ) && thisSymbol(b2, s) && thisSymbol(c1, s){
        
        return true
            }
        
        
        
        return false
    }
    
    
    func thisSymbol(_ button: UIButton, _ symbol: String)-> Bool{
        
        return button.title(for: .normal) == symbol
    }
    
    
    
    func resultAlert(title: String)  {
        
        let messsage =  "\nCircle" + String(circlescore) + "\nCross" + String(crossscore)
        
        let al = UIAlertController(title: title, message: messsage, preferredStyle: .actionSheet)
        al.addAction(UIAlertAction(title: "Reset", style: .default, handler: {(_) in
            self.resetBoard()
            
        }))
        
        self.present(al, animated: true)
    }
    
    
    func resetBoard(){
        
        for button in board{
            button.setTitle(nil, for: .normal)
            button.isEnabled = true
        }
        if firstTurn == Turn.Circle {
            firstTurn = Turn.Cross
            turnLabel.text =  CROSS
        }else if firstTurn == Turn.Cross{
            firstTurn =  Turn.Circle
            turnLabel.text = CIRCLE
        }
        currentTurn = firstTurn
    }
    
    
    
    
    
    func initBoard(){
        
        
        board.append(a1)
        board.append(a2)
        board.append(a3)
        board.append(b1)
        board.append(b2)
        board.append(b3)
        board.append(c1)
        board.append(c2)
        board.append(c3)
        
        
    }
    
    
    
    func fullBoard() -> Bool {
        for button in board{
            if button.title(for: .normal) == nil{
                return false
            }
        }
        return true
    }
    
    func addToBoard(_ sender: UIButton){
        
        if sender.title(for: .normal) == nil{
         
            if currentTurn == Turn.Circle{
                sender.setTitle(CIRCLE, for: .normal)
              
                currentTurn = Turn.Cross
                turnLabel.text =  CROSS
            }else if currentTurn == Turn.Cross{
               
                    sender.setTitle(CROSS, for: .normal)
                    currentTurn = Turn.Circle
                    turnLabel.text = CIRCLE
                
            }
            sender.isEnabled = false
        }
        
    }
    
    
}

