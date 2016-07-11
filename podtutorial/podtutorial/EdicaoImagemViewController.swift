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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
