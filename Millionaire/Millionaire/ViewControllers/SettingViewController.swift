//
//  SettingViewController.swift
//  Millionaire
//
//  Created by Семён Винников on 23.02.2023.
//

import UIKit

class SettingViewController: UIViewController {

    let setting = GameSetting()
    
    //MARK: - Outlets
    
    @IBOutlet weak var sequenceBtn: UIButton!
    @IBOutlet weak var randomBtn: UIButton!
    
    @IBAction func buttonInSequence(_ sender: Any) {
        setting.strategyType = .sequentially
        Game.shared.saveSettings(setting)
        actionBtn(sequenceBtn)
        disactionBtn(randomBtn)
    }
    
    @IBAction func buttonInShuffle(_ sender: Any) {
        setting.strategyType = .randomly
        Game.shared.saveSettings(setting)
        actionBtn(randomBtn)
        disactionBtn(sequenceBtn)
    }
    
    
    //MARK: - Function
    
    func prepareButton() {
        let savedSettings = Game.shared.settings
        switch savedSettings.strategyType {
        case .randomly:
            actionBtn(randomBtn)
            disactionBtn(sequenceBtn)
        case .sequentially:
            actionBtn(sequenceBtn)
            disactionBtn(randomBtn)
        }
    }
    
    
    func actionBtn(_ button: UIButton) {
        button.layer.cornerRadius = 10
        button.tintColor = .black
        button.backgroundColor = .orange
    }
    
    func disactionBtn(_ button: UIButton) {
        button.layer.cornerRadius = 10
        button.tintColor = .black
        button.backgroundColor = .gray
    }
    
    
//MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()

        prepareButton()
    }
 
}
