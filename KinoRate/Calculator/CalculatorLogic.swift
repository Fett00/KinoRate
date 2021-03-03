//
//  CalculatorLogic.swift
//  KinoRate
//
//  Created by Садык Мусаев on 08.02.2021.
//

import Foundation

class CalculatorLogic{
    
    func roundTo(_ value: Double, toNearest: Double) -> Double {
      return round(value / toNearest) * toNearest
    }
    
    func sum(a:Double,b:Double)->Double{
        return roundTo((a + b), toNearest: 0.001)
    }
    
    func raz(a:Double,b:Double) -> Double {
        return roundTo((a - b), toNearest: 0.001)
    }
    
    func umnoj(a:Double,b:Double) -> Double {
        return roundTo((a * b), toNearest: 0.001)
    }
    
    func del(a:Double,b:Double) -> Double {
        assert(b != 0, "Not be null.")
        return roundTo((a / b), toNearest: 0.001)
    }

    
    
}
