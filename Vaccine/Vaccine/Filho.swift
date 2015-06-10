//
//  Filho.swift
//  Vaccine
//
//  Created by Isaías Lima on 10/06/15.
//  Copyright © 2015 Mobile Engineers. All rights reserved.
//

import Foundation
import CoreData

@objc(Filho)
class Filho: NSManagedObject {

// Insert code here to add functionality to your managed object subclass
    
    func addVacina(vacina: Vacina) {
        self.vacinas = self.vacinas?.setByAddingObject(vacina)
    }

}
