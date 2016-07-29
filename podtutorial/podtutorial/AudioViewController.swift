//
//  AudioViewController.swift
//  podtutorial
//
//  Created by leonardo fernandes farias on 28/07/16.
//  Copyright © 2016 leonardo fernandes farias. All rights reserved.
//

import UIKit
import MediaPlayer

class AudioViewController: UIViewController {

    var medias = [MPMediaItem]()
    @IBOutlet weak var myTable: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showAudio()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func showAudio() {
        medias = MPMediaQuery.songsQuery().items!
        print(medias)
        myTable.reloadData()
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

extension AudioViewController : UITableViewDelegate {
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let mediaCollection = MPMediaItemCollection(items: [medias[indexPath.row]])
        
        let player = MPMusicPlayerController.systemMusicPlayer()
        player.setQueueWithItemCollection(mediaCollection)
        
        player.play()
    }
    
    
}

extension AudioViewController: UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return medias.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell")
        cell?.textLabel?.text = medias[indexPath.row].title
        cell?.detailTextLabel?.text = medias[indexPath.row].artist
        let artWork = medias[indexPath.row].valueForProperty(MPMediaItemPropertyArtwork)
        let image = artWork?.imageWithSize(CGSizeMake(75, 75))
        cell?.imageView?.image = image
        return cell!
    }
}