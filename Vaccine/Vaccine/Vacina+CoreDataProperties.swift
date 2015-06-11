//
//  Vacina+CoreDataProperties.swift
//  Vaccine
//
//  Created by Isaías Lima on 11/06/15.
//  Copyright © 2015 Mobile Engineers. All rights reserved.
//
//  Delete this file and regenerate it using "Create NSManagedObject Subclass…"
//  to keep your implementation up to date with your model.
//

import Foundation
import CoreData

extension Vacina {

    @NSManaged var check: Bool
    @NSManaged var contras: String?
    @NSManaged var doencas: String?
    @NSManaged var efeitos: String?
    @NSManaged var meses: Int
    @NSManaged var nome: String?
    @NSManaged var filho: Filho?

}
