//
//  ViewController.swift
//  ComprasUSA
//
//  Created by William Tomaz on 21/05/20.
//  Copyright © 2020 William Tomaz. All rights reserved.
//

import UIKit

class ShoppingViewController: UIViewController {

    
    @IBOutlet weak var tfDolar: UITextField!
    @IBOutlet weak var lbRealDescription: UILabel!
    @IBOutlet weak var lbReal: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
       setAmmount()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        setAmmount()
        tfDolar.resignFirstResponder()

    }
    
    func setAmmount(){
        tc.shoppingValue = tc.convertToDouble(tfDolar.text!)
        lbReal.text = tc.getFormattedValue(of: tc.shoppingValue * tc.dolar, withCurrency: "R$ ")
        let dolar = tc.getFormattedValue(of: tc.dolar, withCurrency: "R$ ")
        lbRealDescription.text = "Valor sem impostos (Dólar: \(dolar))"
        
    }
}

