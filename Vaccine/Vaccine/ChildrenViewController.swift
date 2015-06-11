//
//  ChildrenViewController.swift
//  Vaccine
//
//  Created by Isaías Lima on 11/06/15.
//  Copyright © 2015 Mobile Engineers. All rights reserved.
//

import UIKit
import CoreData

class ChildrenViewController: UITableViewController, CadastroDelegate {

    @IBOutlet var headerView: UIView!
    var filhos: NSArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        headerView.frame.size.height = 300
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.translucent = true
        self.navigationController?.navigationBar.tintColor = UIColor(red: 33/255, green: 255/255, blue: 192/255, alpha: 1.0)
        
        let fetchRequest = NSFetchRequest(entityName: "Filho")
        fetchRequest.returnsObjectsAsFaults = false

        do {
            try filhos = CoreData.sharedInstance.managedObjectContext.executeFetchRequest(fetchRequest)
        } catch {
            let nserror = error as NSError
            NSLog("Unresolved error \(nserror), \(nserror.userInfo)")
            abort()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return filhos.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("children", forIndexPath: indexPath)

        let filho = filhos.objectAtIndex(indexPath.row) as! Filho
        cell.textLabel?.text = filho.nome

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */
    
    func novoFilho(nome: String, genero: Bool, nascimento: NSDate) {
        
        let novoFilho = NSEntityDescription.insertNewObjectForEntityForName("Filho", inManagedObjectContext: CoreData.sharedInstance.managedObjectContext) as! Filho
        novoFilho.nome = nome
        novoFilho.genero = genero
        novoFilho.nascimento = nascimento
        
        do {
            try CoreData.sharedInstance.managedObjectContext.save()
        } catch {
            let nserror = error as NSError
            NSLog("Unresolved error \(nserror), \(nserror.userInfo)")
            abort()
        }
        
        self.tableView.reloadData()
        
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "cadastro" {
            let viewController = segue.destinationViewController as! CadastroViewController
            viewController.delegate = self
        }
        
    }
    

}
