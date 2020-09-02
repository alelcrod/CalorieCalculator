//
//  calculator.swift
//  CalorieCalculator
//
//  Created by Alex Rodriguez on 8/20/20.
//  Copyright © 2020 Alex Rodriguez. All rights reserved.
//

import Foundation

class Calculator {
    var weight : Float
    var speed : Float
    var met : Float
    // key: mile mile, value: MET
    let metvalues = [ 15: 6, 12: 8.3, 11.5: 9, 10: 9.8, 9: 10.5,
                   8.5: 11, 8: 11.8, 7.5: 11.8, 7: 12.3, 6.5: 12.8,
                   6: 14.5, 5.5: 16, 5: 19, 4.6: 19.8, 4.3: 23]
    init() {
        weight = 0.0
        speed = 0.0
        met = 0.0
    }
    
    private func weightInKg(lbs: Float) -> Float {
        return lbs/2.2
    }
    
    private func findlowerMET(speed: Float) -> Float{
        var currentmin = 0.0
        var lowestmet = 0.0
        for (minmile, met) in metvalues {
            if minmile == Double(speed) {
                return Float(met)
            }
            if minmile < Double(speed) && minmile > currentmin {
                currentmin = minmile
                lowestmet = met
            }
        }
        return Float(lowestmet)
    }
    private func findhigherMET(speed: Float) -> Float{
        var currentmax = speed * 2
        var highestmet = 3.0
        for (minmile, met) in metvalues {
            if minmile == Double(speed) {
                return Float(met)
            }
            if minmile > Double(speed) &&
                minmile < Double(currentmax) {
                currentmax = Float(minmile)
                highestmet = met
            }
        }
        return Float(highestmet)
    }
    
    /* returns the potential range of calories burned */
    public func calculate(lbs: Float, dist: Float, time: Float) -> (Float, Float) {
        weight = weightInKg(lbs: lbs)
        speed = time / dist
        let lowerboundMET = findlowerMET(speed: speed)
        let upperboundMET = findhigherMET(speed: speed)
        let lowerboundCal = lowerboundMET * weight * time / 60
        let upperboundCal = upperboundMET * weight * time / 60
        return (lowerboundCal, upperboundCal)
    }
}

