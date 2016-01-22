//
//  DataManager.swift
//  CityCamera
//
//  Created by Dusan Jugovic on 1/22/16.
//  Copyright © 2016 Codeeco. All rights reserved.
//

import UIKit



class DataManager {
    
    var image:UIImage? = nil
    
    var longitude:String? = nil
    
    var latitude:String? = nil
    
    var address:String? = nil

    
    static let sharedInstance = DataManager()
    
}

