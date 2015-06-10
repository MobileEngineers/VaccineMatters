//
//  Filho+CoreDataProperties.swift
//  Vaccine
//
//  Created by Isaías Lima on 10/06/15.
//  Copyright © 2015 Mobile Engineers. All rights reserved.
//
//  Delete this file and regenerate it using "Create NSManagedObject Subclass…"
//  to keep your implementation up to date with your model.
//

import Foundation
import CoreData

extension Filho {

    @NSManaged var backgroundColor: NSData?
    @NSManaged var checkCalendario: Bool
    @NSManaged var genero: Bool
    @NSManaged var nascimento: NSDate?
    @NSManaged var nome: String?
    @NSManaged var vacinas: NSSet?

}
