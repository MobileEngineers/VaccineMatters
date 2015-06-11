//
//  CadastroViewController.swift
//  Vaccine
//
//  Created by Isaías Lima on 11/06/15.
//  Copyright © 2015 Mobile Engineers. All rights reserved.
//

import UIKit

protocol CadastroDelegate {
    func novoFilho(nome: String, genero: Bool, nascimento: NSDate)
}

class CadastroViewController: UITableViewController, UITextFieldDelegate {
    
    var delegate: CadastroDelegate!

    @IBOutlet var textField: UITextField!
    @IBOutlet var segmentedControl: UISegmentedControl!
    @IBOutlet var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        datePicker.maximumDate = NSDate()
        textField.delegate = self
        
    }
    
    func genero(binary: Int) -> Bool {
        if binary == 0 {
            return true
        }
        if binary == 1 {
            return false
        }
        return true
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func salvar(sender: AnyObject) {
        if textField!.text! != "" {
            delegate.novoFilho(textField!.text!, genero: genero(segmentedControl.selectedSegmentIndex), nascimento: datePicker.date)
            self.dismissViewControllerAnimated(true, completion: nil)
        }
    }
    
    @IBAction func cancelar(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }


}
