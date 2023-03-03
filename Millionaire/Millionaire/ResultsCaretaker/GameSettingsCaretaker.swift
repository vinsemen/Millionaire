//
//  GameSettingsCaretaker.swift
//  Millionaire
//
//  Created by Семён Винников on 28.02.2023.
//

import Foundation

typealias GameSettingMemento = Data

class GameSettingsCarectaker {
    
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    private let key = "gameSettings"
    
    func saveSetting(setting: GameSetting) {
        do {
            let data: GameSettingMemento = try encoder.encode(setting)
            UserDefaults.standard.setValue(data, forKey: key)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func loadSetting() -> GameSetting {
        guard let data: GameSettingMemento = UserDefaults.standard.data(forKey: key) else {
            return GameSetting()
        }
        
        do {
            return try decoder.decode(GameSetting.self, from: data)
        } catch {
            print(error.localizedDescription)
            return GameSetting()
        }
    }
}
