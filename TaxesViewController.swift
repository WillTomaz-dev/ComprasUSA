//
//  TaxesViewController.swift
//  ComprasUSA
//
//  Created by William Tomaz on 21/05/20.
//  Copyright © 2020 William Tomaz. All rights reserved.
//

import UIKit

class TaxesViewController: UIViewController {

    @IBOutlet weak var lbDolar: UILabel!
    @IBOutlet weak var lbStateTaxes: UILabel!
    @IBOutlet weak var lbIOF: UILabel!
    @IBOutlet weak var lbIOFDescription: UILabel!
    @IBOutlet weak var lbStateTaxesDescription: UILabel!
    @IBOutlet weak var swCreditCard: UISwitch!
    @IBOutlet weak var lbReal: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        calculateTaxes()
    }
    
    @IBAction func swChangeIOF(_ sender: UISwitch) {
        calculateTaxes()
    }
    
    func calculateTaxes(){
        lbStateTaxesDescription.text = "Imposto do Estado (\(tc.getFormattedValue(of: tc.stateTax, withCurrency: ""))%)"
        lbIOFDescription.text = "IOF (\(tc.getFormattedValue(of: tc.iof, withCurrency: ""))%)"
        
        lbDolar.text = tc.getFormattedValue(of: tc.shoppingValue, withCurrency: "US$ ")
        lbStateTaxes.text = tc.getFormattedValue(of: tc.stateTaxValue, withCurrency: "US$ ")
        lbIOF.text = tc.getFormattedValue(of: tc.iofValue, withCurrency: "US$ ")
        
        let real = tc.calculate(usingCreditCard: swCreditCard.isOn)
        lbReal.text = tc.getFormattedValue(of: real, withCurrency: "R$ ")
    }
}
