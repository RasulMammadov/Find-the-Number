//
//  ViewController.swift
//  Find it
//
//  Created by Fizza Hagverdizade on 09.01.22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var Random: UILabel!
    @IBOutlet weak var Message: UILabel!
    @IBOutlet weak var number: UITextField!
    @IBOutlet weak var buttonOut: UIButton!
    @IBOutlet weak var lives: UILabel!
    
    var correct = 0
    var heart = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        loadDefaultData()
        
    }
    
    func loadDefaultData() {
        buttonOut.layer.cornerRadius = 6
        Random.text = "?"
        lives.text = "❤️ ❤️ ❤️"
        heart = 3
        number.text = ""
        Message.text = ""
        correct = Int(arc4random_uniform(UInt32(10)))
    }
    
    @IBAction func buttonOut(_ sender: Any) {
        
        //print(correct)
        
        let number1 = number.text ?? ""
        if let n1 = Int(number1) {
            
            helpClient(number: n1)
            
            if correct == n1 {
                print("Right guess!")
                Random.text = "\(correct)"
                defaultAlert(title: "❤️ CONGRATULATIONS! ❤️", message: "You WON!")
                
            }else{
                heart = heart - 1
                
                if heart < 1 {
                    defaultAlert(title: "Game Over!", message: "Unfortunately, you could not win...")
                }
                
                heartCalculator(heart: heart)
                
                
            }
        }
        
    }
    
    func defaultAlert (title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            
            switch action.style {
            case .default:
                self.loadDefaultData()
            case .cancel:
                print("Cancel")
            default:
                print("")
            }
            
        }))
        
        self.present(alert, animated: true, completion: nil)
        
    }
    
    func heartCalculator (heart:Int) {
        
        switch heart {
        case 3:
            lives.text = "❤️ ❤️ ❤️"
        case 2:
            lives.text = "❤️ ❤️"
        case 1:
            lives.text = "❤️"
        default:
            lives.text = ""
        }
        
    }

    func helpClient (number: Int) {
        Message.text = correct > number ? "Up!" : "Down!"
    }
}

