//
//  Meme.swift
//  memeMe V1
//
//  Created by Wassim Seifeddine on 3/8/16.
//  Copyright © 2016 Wassim Seifeddine. All rights reserved.
//

import Foundation
import UIKit
public class Meme {
    
    
    public static let  memeTextAttributes = [
        NSForegroundColorAttributeName : UIColor.whiteColor(),
        NSStrokeColorAttributeName : UIColor.blackColor(),
        NSFontAttributeName : UIFont(name: "HelveticaNeue-CondensedBlack", size: 40)!,
        NSStrokeWidthAttributeName : -3.0
    ]
    
    private var upperText : String
    private var lowerText : String
    private var originalImage : UIImage
    private var memedImage : UIImage
    
    func getUpperText() ->String{
        return self.upperText
    }
    func getLowerText() ->String{
        return self.lowerText
    }
    
    func getOriginalImage() ->UIImage {
        return self.originalImage
    }
    func getMemedImage() -> UIImage {
        return self.memedImage
    }
    
    init(upperText: String, lowerText: String , originalImage  : UIImage, memedImage : UIImage){
        self.upperText = upperText
        self.lowerText = lowerText
        self.originalImage  = originalImage
        self.memedImage = memedImage
    }
    

    
}