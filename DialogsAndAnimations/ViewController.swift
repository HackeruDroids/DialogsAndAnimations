//
//  ViewController.swift
//  DialogsAndAnimations
//
//  Created by hackeru on 2 Kislev 5778.
//  Copyright © 5778 hackeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //container
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let dest = segue.destination as? IconsCollectionViewController else {return}
        
        dest.listener =  onImageTapped(_:) // {_ in }
    }
    
    func onImageTapped(_ image:UIImage){
        print(image)
    }
}

