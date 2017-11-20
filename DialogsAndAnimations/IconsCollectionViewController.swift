//
//  IconsCollectionViewController.swift
//  DialogsAndAnimations
//
//  Created by hackeru on 2 Kislev 5778.
//  Copyright © 5778 hackeru. All rights reserved.
//

import UIKit



class IconsCollectionViewController: UICollectionViewController {
//iconCell
    private var data = [#imageLiteral(resourceName: "icons8-mario"), #imageLiteral(resourceName: "icons8-novel"), #imageLiteral(resourceName: "icons8-alien"), #imageLiteral(resourceName: "icons8-zubat"), #imageLiteral(resourceName: "icons8-desura"), #imageLiteral(resourceName: "icons8-pokemon"), #imageLiteral(resourceName: "icons8-rattata"), #imageLiteral(resourceName: "icons8-candy_cane"), #imageLiteral(resourceName: "icons8-pokeball_2"), #imageLiteral(resourceName: "icons8-filled_like"), #imageLiteral(resourceName: "icons8-super_mario"), #imageLiteral(resourceName: "icons8-christmas_stocking")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return data.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "iconCell", for: indexPath) as! IconCell
    
        // Configure the cell
        //get the image using the indexpath
        let image = data[indexPath.item]
        
        cell.icon.image = image
        
        return cell
    }

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let icon = data[indexPath.item]
        //if we have a listener notify the listener
        listener?(icon)
    }
    
    public var listener : ((_ image:UIImage)->Void)?
    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
