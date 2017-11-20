//
//  ViewController.swift
//  DialogsAndAnimations
//
//  Created by hackeru on 2 Kislev 5778.
//  Copyright © 5778 hackeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController{//}, IconCollectionViewDelegate {
//    func didSelectIcon(image: UIImage) {
//
//    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //container
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let dest = segue.destination as? IconsCollectionViewController else {return}
        //dest.delegate = self
        dest.listener = onImageTapped(_:) // {_ in print("woot?" + $0.description)}
    }
    
    func onImageTapped(_ image:UIImage){
        //init an imageView
        
        
        
        let imageView = UIImageView(image: image)
       
        //let iv = UIImageView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        //position it:
        imageView.center = self.view.center
        
       
        //starting point for the animation
        imageView.transform =  CGAffineTransform(translationX: 0, y: self.view.frame.height)

        UIView.animate(withDuration: 0.7, animations: {
            imageView.transform = CGAffineTransform.identity
        }) { _ in
           // imageView.removeFromSuperview()
        }
        
        UIView.animate(withDuration: 0.5, delay: 0.7, options: .curveEaseInOut, animations: {
            imageView.alpha = 0
        }) { (_) in
            imageView.removeFromSuperview()
        }
        
//        UIView.animate(withDuration: 0.6) {
//            //transform: scale, translate, rotate
//            //imageView.transform = CGAffineTransform(translationX: 0, y: self.view.frame.height )
//
//
//            //end point
//            imageView.transform = CGAffineTransform.identity //reset all former transformations.
//        }
        
        //add it as a child
        self.view.addSubview(imageView)
    }
}

