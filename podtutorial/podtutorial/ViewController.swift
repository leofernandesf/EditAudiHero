//
//  ViewController.swift
//  podtutorial
//
//  Created by leonardo fernandes farias on 24/06/16.
//  Copyright © 2016 leonardo fernandes farias. All rights reserved.
//

import UIKit
import DKImagePickerController
class ViewController: UIViewController {

    @IBOutlet weak var myCollection: UICollectionView!
    var assets = [DKAsset]()
    var images = [UIImage]()
    var imagemEscolhida = UIImage()
    var index = Int()
    private var longPressGesture: UILongPressGestureRecognizer!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(ViewController.handLongGesture(_:)))
        myCollection.addGestureRecognizer(longPressGesture)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        switch segue.identifier {
        case "editarImagem"?:
            let nextViewController = segue.destinationViewController as! PageViewController
            nextViewController.images = images
            nextViewController.currentIndex = index
        default:
            print("nada")
        }
    }
    
    func handLongGesture(gesture: UILongPressGestureRecognizer) {
        switch gesture.state {
        case .Began:
            guard let selectedIndexPath = self.myCollection.indexPathForItemAtPoint(gesture.locationInView(self.myCollection))
                else {
                    break
            }
            myCollection.beginInteractiveMovementForItemAtIndexPath(selectedIndexPath)
        case .Changed:
            myCollection.updateInteractiveMovementTargetPosition(gesture.locationInView(gesture.view!))
        case .Ended:
            myCollection.endInteractiveMovement()
        default:
            myCollection.cancelInteractiveMovement()
        }
    }
    
    func showImagePickerWithAssetType(
                                      allowMultipleType: Bool = true,
                                      sourceType: DKImagePickerControllerSourceType = .Photo) {
        
        let pickerController = DKImagePickerController()
        //pickerController.assetType = assetType
        //			pickerController.showCancelButton = true
        //pickerController.allowMultipleTypes = allowMultipleType
        pickerController.sourceType = sourceType
        pickerController.defaultSelectedAssets = assets
        pickerController.didSelectAssets = { [unowned self] (assets: [DKAsset]) in
            print("didSelectAssets")
            //print(assets.map({ $0.url}))
            self.assets = assets
            self.images = []
            for asset in assets {
                asset.fetchOriginalImage(true, completeBlock: { (image, info) in
                    
                    self.images.append(image!)
                    
                    
                })
            }
            self.myCollection.reloadData()
            
//            if UI_USER_INTERFACE_IDIOM() == .Pad {
//                pickerController.modalPresentationStyle = .FormSheet
//            }


        }
        self.presentViewController(pickerController, animated: true) {}
        
    }
    @IBAction func addFotos(sender: AnyObject) {
        showImagePickerWithAssetType()
    }

}

extension ViewController: UICollectionViewDataSource {
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return assets.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell: myCellCollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! myCellCollectionViewCell
        cell.ivImages.image = images[indexPath.row]
        cell.lbNumeracao.text = String(indexPath.row)
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, moveItemAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
        let temp = images.removeAtIndex(sourceIndexPath.item)
        images.insert(temp, atIndex: destinationIndexPath.item)
        let temp2 = assets.removeAtIndex(sourceIndexPath.item)
        assets.insert(temp2, atIndex: destinationIndexPath.item)
        myCollection.reloadData()
    }
    
}


extension ViewController: UICollectionViewDelegate {
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        print("clicou")
        imagemEscolhida = images[indexPath.row]
        index = indexPath.row
        performSegueWithIdentifier("editarImagem", sender: self)
    }
    
    func collectionView(collectionView: UICollectionView, didHighlightItemAtIndexPath indexPath: NSIndexPath) {
        let cell : myCellCollectionViewCell = collectionView.cellForItemAtIndexPath(indexPath) as! myCellCollectionViewCell
        cell.layer.borderWidth = 5.0
        cell.layer.borderColor = UIColor.blueColor().CGColor
    }
    
    func collectionView(collectionView: UICollectionView, didUnhighlightItemAtIndexPath indexPath: NSIndexPath) {
        let cell : myCellCollectionViewCell = collectionView.cellForItemAtIndexPath(indexPath) as! myCellCollectionViewCell
        cell.layer.borderWidth = 0
    }
}

