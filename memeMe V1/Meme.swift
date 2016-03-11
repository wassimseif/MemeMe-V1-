//
//  Meme.swift
//  memeMe V1
//
//  Created by Wassim Seifeddine on 3/8/16.
//  Copyright © 2016 Wassim Seifeddine. All rights reserved.
//

import Foundation
import UIKit
struct Meme {
    
    
     var upperText : String
     var lowerText : String
     var originalImage : UIImage
     var memedImage : UIImage
    init(upperText : String, lowerText:String, originalImage : UIImage, memedImage: UIImage){
        self.upperText = upperText
        self.lowerText = lowerText
        self.originalImage = originalImage
        self.memedImage = memedImage
    }
    

    

    
}