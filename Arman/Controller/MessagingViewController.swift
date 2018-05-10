//
//  MessagingViewController.swift
//  Arman
//
//  Created by Mohd Ruknuddin on 27/04/18.
//  Copyright © 2018 Mohd Ruknuddin. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class MessagingViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var sideMenuConstraint : NSLayoutConstraint!
    
    //var elements = ["Clothing",  "Sunglasses", "Watches", "Shoes", "Home Appliances", "Bags & Backpacks", "Caps", "Smartphones", "Power Banks", "Cases & Covers"]
    var catalogItems : [NSManagedObject] = []
    var isSideMenuHidden    = true
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        sideMenuConstraint.constant = -140
        
        
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return catalogItems.count
    }
    
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "customViewCell") as! CustomTableViewCell
        let item = catalogItems[indexPath.row]
        let itemName = item.value(forKey: "name") as! String
        cell.categorylabel.text = itemName
        cell.categoryImage.image = UIImage(named: itemName)
        return cell
    }
    
    @IBAction func sideMenuOption(_ sender: UIBarButtonItem) {
        
        if isSideMenuHidden {
            sideMenuConstraint.constant = 0
            
            UIView.animate(withDuration: 0.3, animations: {
                self.loadViewIfNeeded()
            })
            
        } else {
            sideMenuConstraint.constant = -140
            
            UIView.animate(withDuration: 0.3, animations: {
                self.loadViewIfNeeded()
            })
            
        }
        isSideMenuHidden = !isSideMenuHidden
    }
    
    @IBAction func addItems(_ sender: Any) {
        
        let alertController = UIAlertController(title: "Add new Item", message: "Please fill in the textfield below", preferredStyle: .alert)
        let saveAction = UIAlertAction(title: "Save", style: .default) { [unowned self] action in
            guard let textField = alertController.textFields?.first,
                let itemToAdd = textField.text else {return}
               // self.add(itemToAdd)
                self.save(item: itemToAdd)
                self.tableView.reloadData()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive, handler: nil)
        
        alertController.addTextField(configurationHandler: nil)
        alertController.addAction(saveAction)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)
        
        
    }
    
    @IBAction func doLogout(_ sender: UIButton) {
        
        self.performSegue(withIdentifier: "loginViewSegue", sender: self)
    }
    
    func save(item : String){
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Items", in: context)
        let items  = NSManagedObject(entity: entity!, insertInto: context)
        
        items.setValue(item, forKey: "name")
        
        do {
            try context.save()
            catalogItems.append(items)
            print("Items saved..!!!")
            //getItems()
        } catch let error as NSError{
                print("Error occured while saving Items",error)
            }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Items")
        do{
            catalogItems = try context.fetch(fetchRequest)
        } catch let error as NSError{
            print("Error occured while fetching items", error)
        }
    }
    
     func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            do {
                context.delete(self.catalogItems[indexPath.row])
                try context.save()
            } catch let error as NSError{
                print("Error occured while deleting Items",error)
            }
            
            self.catalogItems.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}
