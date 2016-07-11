//
//  CurrentPage.swift
//  
//
//  Created by leonardo fernandes farias on 30/06/16.
//
//

import Foundation
import CoreData
import UIKit

class CurrentPage: NSManagedObject {

// Insert code here to add functionality to your managed object subclass
    
    static func salvar(index:Int) {
        
        do{
            // ligação com o delegate
            let appDelegate: AppDelegate = (UIApplication.sharedApplication().delegate as! AppDelegate)
            let context: NSManagedObjectContext = appDelegate.managedObjectContext
            
            // entidade do banco de dados
            let newRap = NSEntityDescription.insertNewObjectForEntityForName("CurrentPage", inManagedObjectContext: context) as NSManagedObject
            
            // atributos da entidade
            newRap.setValue(index, forKey: "currentPage")
            
            try context.save()
            
            print(newRap)
            print("Objetos salvos!")
        }catch{
            
            
        }
        
    }
    
    static func list() -> [AnyObject]? {
        let appDelegate: AppDelegate = (UIApplication.sharedApplication().delegate as! AppDelegate)
        let context: NSManagedObjectContext = appDelegate.managedObjectContext
        let requestFetch = NSFetchRequest(entityName: "CurrentPage")
        do {
            
            return try context.executeFetchRequest(requestFetch)
            
        } catch {
            print("Erro na listagem")
            return nil
        }
    }

}
