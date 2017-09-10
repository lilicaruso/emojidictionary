//
//  ViewController.swift
//  emojidictionary
//
//  Created by toko on 9/8/17.
//  Copyright (c) 2017 toko. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var lilitableview: UITableView!
    
    var emojis : [Emoji] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        lilitableview.delegate = self
        lilitableview.dataSource = self
        emojis = makeEmojiArray()
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emojis.count
        
        }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let emoji = emojis[indexPath.row]
        cell.textLabel?.text = emoji.stringEmoji
        return cell
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        let emoji = emojis[indexPath.row]
        performSegueWithIdentifier("moveSegue", sender: emoji)
        
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let defVC = segue.destinationViewController as! DefinitionViewController
        defVC.emoji = sender as!  Emoji
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func makeEmojiArray() -> [Emoji]{
        let emoji1 = Emoji()
        emoji1.stringEmoji = "😏"
        emoji1.birthYear = 2010
        emoji1.category = "smiley"
        emoji1.definition = "winky face"

        let emoji2 = Emoji()
        
        emoji2.stringEmoji = "🙋"
        emoji2.birthYear = 2007
        emoji2.category = "person"
        emoji2.definition = "waving girl"
        
        let emoji3 = Emoji()
        
        emoji3.stringEmoji = "💜"
        emoji3.birthYear = 1991
        emoji3.category = "symbol"
        emoji3.definition = "purple heart"
        
        return [emoji1, emoji2, emoji3]
    }


}


