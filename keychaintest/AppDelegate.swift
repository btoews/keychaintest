//
//  AppDelegate.swift
//  keychaintest
//
//  Created by Benjamin P Toews on 1/30/18.
//  Copyright © 2018 Benjamin P Toews. All rights reserved.
//

import Cocoa

let label = "keychaintest" as CFString

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        guard let (_, priv) = Keychain.generateKeyPair(attrLabel: label, inSEP: false) else {
            print("error generating keys")
            return
        }

        print("sleeping")
        sleep(10)
        
        guard let appLabel: CFData = Keychain.getSecKeyAttr(key: priv, attr: kSecAttrApplicationLabel) else { return }
        var i = 0
        
        print("sleeping")
        sleep(10)
        
        while Keychain.setSecItemAttr(attrAppLabel: appLabel, name: kSecAttrApplicationTag, value: "\(i)".data(using: .utf8)! as CFData) {
            print(i)
            sleep(10)
            i += 1
        }
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        let ok = Keychain.delete(
            (kSecClass, kSecClassKey),
            (kSecAttrLabel, label as CFString)
        )
        
        print("deleted:", ok)
    }


}

