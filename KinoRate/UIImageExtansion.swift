//
//  UIImageExtansion.swift
//  KinoRate
//
//  Created by Садык Мусаев on 15.12.2020.
//

import UIKit

extension UIImage {
    
     static func mergeTwoImage(firstImage: UIImage, withImage secondImage: UIImage) -> UIImage {
        
        let newImageSize = CGSize(width : firstImage.size.width + secondImage.size.width, height: firstImage.size.height + secondImage.size.height)
        
        UIGraphicsBeginImageContextWithOptions(newImageSize, false, UIScreen.main.scale)
        
        let firstImageDrawX = round(0)
        let firstImageDrawY = round(0)
        let secondImageDrawX = round(firstImage.size.height)
        let secondImageDrawY = round(firstImage.size.width - firstImage.size.width)
        firstImage .draw(at: CGPoint(x: firstImageDrawX, y: firstImageDrawY))
        secondImage.draw(at: CGPoint(x: secondImageDrawX, y: secondImageDrawY))
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image!
        
    }
}
