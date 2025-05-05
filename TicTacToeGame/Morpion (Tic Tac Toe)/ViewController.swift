import UIKit

class ViewController: UIViewController {
    
    
    
    var player1 = true
    var player2 = false
    var win = false
    var buttons: [Bool] = {
        var array = [Bool]()
        for _ in 0...8 {
            array.append(false)
        }
        return array
    }()
    
    var filledArray: [Int] = {
        var array = [Int]()
        for _ in 0...8 {
            array.append(0)
        }
        return array
    }()
    
    
    @IBAction func resetButton(_ sender: Any) {
        
    }
    @IBAction func homeButton(_ sender: Any) {
    }
    
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var winnerLabel: UILabel!
    @IBOutlet weak var winnerImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        winnerLabel.isHidden = true
        winnerImageView.isHidden = true
        errorLabel.isHidden = true
    }
    
    @IBAction func buttonWasTapped(_ sender: UIButton) {
        if win == false{
            if buttons[sender.tag] == false {
                errorLabel.isHidden = true
                if player1 == true && player2 == false {
                    setBox(button: sender, forPlayer: 1)
                    filledArray[sender.tag] = 1
                } else if player2 == true && player1 == false {
                    setBox(button: sender, forPlayer: 2)
                    filledArray[sender.tag] = 2
                } /*else {
                    errorLabel.isHidden = false
                    errorLabel.text = "Error: both players cannot play it at the same time"
                }*/
                
                if let winner = testWinner() {
                    //disable button
                    win = true
                    if winner == 1 {
                        winnerImageView.image = UIImage(named: "circle")
                    } else {
                        winnerImageView.image = UIImage(named: "cross")
                    }
                    
                    winnerImageView.isHidden = false
                    winnerLabel.isHidden = false
                }
                
                player2 = !player2
                player1 = !player1
                
                buttons[sender.tag] = true
            } else {
                
                errorLabel.isHidden = false
                errorLabel.text = "請選擇其他按鈕"
                
            }
            
            
        }
        
    }
    
    // MARK: Private functions
    
    private func setBox(button: UIButton, forPlayer player: Int) {
        if player == 1 {
            button.setBackgroundImage(UIImage(named: "circle"), for: .normal)
        } else if player == 2 {
            button.setBackgroundImage(UIImage(named: "cross"), for: .normal)
        } else {
            
        }
    }
    
    private func testWinner() -> Int? {
        var winner: Int? = nil
        
        
        if filledArray[0] != 0 && filledArray[0] == filledArray[1] && filledArray[1] == filledArray[2] {
            winner = filledArray[0]
        }
        
        if filledArray[3] != 0 && filledArray[3] == filledArray[4] && filledArray[4] == filledArray[5] {
            winner = filledArray[3]
        }
        
        if filledArray[6] != 0 && filledArray[6] == filledArray[7] && filledArray[7] == filledArray[8] {
            winner = filledArray[6]
        }
        
        // Gagnant par colonne
        if filledArray[0] != 0 && filledArray[0] == filledArray[3] && filledArray[3] == filledArray[6] {
            winner = filledArray[0]
        }
        
        if filledArray[1] != 0 && filledArray[1] == filledArray[4] && filledArray[4] == filledArray[7] {
            winner = filledArray[1]
        }
        
        if filledArray[2] != 0 && filledArray[2] == filledArray[5] && filledArray[5] == filledArray[8] {
            winner = filledArray[2]
        }
        
        // Gagnant par diagonale
        if filledArray[0] != 0 && filledArray[0] == filledArray[4] && filledArray[4] == filledArray[8] {
            winner = filledArray[0]
        }
        
        if filledArray[2] != 0 && filledArray[2] == filledArray[4] && filledArray[4] == filledArray[6] {
            winner = filledArray[2]
        }
        
        return winner
    }
    
    
}
