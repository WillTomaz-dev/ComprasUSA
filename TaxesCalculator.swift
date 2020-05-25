//
//  TaxesCalculator.swift
//  ComprasUSA
//
//  Created by William Tomaz on 22/05/20.
//  Copyright © 2020 William Tomaz. All rights reserved.
//

import Foundation

class TaxesCalculator {
    
    static let shared = TaxesCalculator()
    
    var dolar: Double = 5.50
    var iof: Double = 6.38
    var stateTax: Double = 7.0
    var shoppingValue: Double = 0
    
    let formatter = NumberFormatter()
    
    var shoppingValueInReal: Double {
        return shoppingValue * dolar
    }
    
    var stateTaxValue: Double {
       return shoppingValue * stateTax/100
    }
    var iofValue: Double {
        return (shoppingValue + stateTax) * iof/100
    }
    
    func calculate(usingCreditCard: Bool) -> Double {
        var finalValue = shoppingValueInReal + stateTaxValue
        if usingCreditCard {
            finalValue += iofValue
        }
        return finalValue
    }
    
    func convertToDouble(_ string: String) -> Double {
        formatter.numberStyle = .none
        return formatter.number(from: string)!.doubleValue
    }
    
    func getFormattedValue(of value: Double, withCurrency currency: String) -> String{
        formatter.numberStyle = .currency
        formatter.currencySymbol = currency
        formatter.alwaysShowsDecimalSeparator = true
        return formatter.string(for: value)!
    }
    
    private init(){
        formatter.usesGroupingSeparator = true
    }
    
}
