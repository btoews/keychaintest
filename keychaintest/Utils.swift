//
//  Utils.swift
//  keychaintest
//
//  Created by Benjamin P Toews on 1/30/18.
//  Copyright © 2018 Benjamin P Toews. All rights reserved.
//

import Foundation

typealias CFDictionaryMember = (CFString, CFTypeRef)

// Helper for making CFDictionary.
func makeCFDictionary(_ members: [CFDictionaryMember]) -> CFDictionary {
    var dict = [String: AnyObject]()
    
    members.forEach { elt in
        dict[elt.0 as String] = elt.1
    }
    
    return dict as CFDictionary
}

// Helper for making CFDictionary.
func makeCFDictionary(_ members: CFDictionaryMember...) -> CFDictionary {
    return makeCFDictionary(members)
}
