//
//  EdicaoImagemViewController.swift
//  podtutorial
//
//  Created by leonardo fernandes farias on 29/06/16.
//  Copyright © 2016 leonardo fernandes farias. All rights reserved.
//

import UIKit

class EdicaoImagemViewController: UIViewController {

    @IBOutlet weak var ivImage: UIImageView!
    var recebeImagem: UIImage!
    var pageIndex: Int!
    override func viewDidLoad() {
        super.viewDidLoad()
        ivImage.image = recebeImagem
        print("onde aparece: \(self)")
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func teste(sender: AnyObject) {
        
        print(CurrentPage.list())
    }

    @IBAction func descricao(sender: AnyObject) {
        print("1")
        showMessage()
    }
    @IBAction func narracao(sender: AnyObject) {
        print("2")
        showMessage()
    }
    @IBAction func fala(sender: AnyObject) {
        print("3")
        showMessage()
    }
    
    func showMessage() {
        
        let alert:UIAlertController = UIAlertController(title: "Audio", message: "escolha o audio", preferredStyle: UIAlertControllerStyle.ActionSheet)
        
        let itunes = UIAlertAction(title: "ITunes", style: UIAlertActionStyle.Default) { UIAlertAction in
            //self.openCamera()
        }
        let googleDrive = UIAlertAction(title: "Google Drive", style: UIAlertActionStyle.Default) { UIAlertAction in
            //self.openGallery()
        }
        let cancelAction = UIAlertAction(title: "cancel", style: UIAlertActionStyle.Cancel) { UIAlertAction in
            
        }
        
        alert.addAction(itunes)
        alert.addAction(googleDrive)
        alert.addAction(cancelAction)
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
