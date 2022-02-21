//
//  Defaults.swift
//  WeatherEverywhere
//
//  Created by Adam Rafiandri on 02/21/22.
//

import Foundation
import Combine

@propertyWrapper
struct UserDefault<T> {
    let key: String
    let defaultValue: T
    
    init(_ key: String, defaultValue: T) {
        self.key = key
        self.defaultValue = defaultValue
    }
    
    var wrappedValue: T {
        get {
            return UserDefaults.standard.object(forKey: key) as? T ?? defaultValue
        }
        
        set {
            UserDefaults.standard.set(newValue, forKey: key)
        }
    }
}

final class SettingStore: ObservableObject {
    let objectWillChange = PassthroughSubject<Void, Never>()
    
    @UserDefault("Celcius", defaultValue: false)
    var showCelcius: Bool {
        willSet {
            objectWillChange.send()
        }
    }
}
