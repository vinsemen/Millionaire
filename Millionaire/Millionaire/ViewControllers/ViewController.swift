//
//  ViewController.swift
//  Millionaire
//
//  Created by Семён Винников on 18.02.2023.
//

import UIKit

class ViewController: UIViewController, GameVCDelegate {
    
    @IBOutlet var startGameButton: UIButton!
    
    @IBAction func startButton(_ sender: UIButton) {
        performSegue(withIdentifier: "startGameSegue", sender: nil)
    }
    
    @IBAction func resultButton(_ sender: UIButton) {
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "startGameSegue":
            guard let vc = segue.destination as? GameViewController else { return }
            vc.delegate = self
            
        default: break
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    func didEndGame(_ result: Result) {
        Game.shared.addResult(result)
    }
    
    
}

