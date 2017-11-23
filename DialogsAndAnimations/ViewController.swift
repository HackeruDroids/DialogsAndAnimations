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
    
    var effect: UIVisualEffect?
    @IBOutlet weak var blur: UIVisualEffectView!{
        didSet{
            //save the effect
            effect = blur.effect
            //cancel the effect
            blur.effect = nil
        }
    }
    
    
    
    
    @IBAction func toggleDialog(_ sender: UIBarButtonItem) {
        isDialogVisibile ? (blur.effect = nil) : (blur.effect = effect)
        
        isDialogVisibile ? dismissDialog() : presentDialog()
        
        
    }
    
    var isDialogVisibile = false
    
    func dismissDialog(){
        //state
        isDialogVisibile = false
        //animate()...
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseInOut, animations: {
            self.dialog.transform =  CGAffineTransform(translationX: 0, y: -self.view.frame.height)
        }) { (_) in
            self.dialog.removeFromSuperview()
        }
    }
    func presentDialog(){
        dialog.center = view.center
        //starting point for the animation.
        dialog.transform = CGAffineTransform(translationX: 0, y: -view.frame.height)
        //add subview,
        view.addSubview(dialog)
        //state:
        isDialogVisibile = true
 
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseInOut, animations: {
            self.dialog.transform = .identity
        }, completion: nil)
    }
    
    
    @IBOutlet weak var dialog: UIView!
    //    }
    
    @IBOutlet weak var menuHeightConstraint: NSLayoutConstraint!
    
    
    var isMenuOpen: Bool{
        return menuHeightConstraint.constant == 100
    }
    @IBAction func toggleMenu(_ sender: UIBarButtonItem) {
        menuHeightConstraint.constant = isMenuOpen ? 0 : 100
        
        let v = sender.value(forKey: "view") as! UIView
        
      
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 10, options: [], animations: {
             self.view.layoutIfNeeded()
             v.transform = self.isMenuOpen ? CGAffineTransform(rotationAngle: .pi / 4) : .identity
        }, completion: nil)
        
    }
    @IBOutlet weak var addButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
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


        
        
        UIView.animate(withDuration: 0.8, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 10, options: [], animations: {
            imageView.transform = CGAffineTransform.identity
        }, completion: nil)
        
        UIView.animate(withDuration: 0.4, delay: 0.7, options: .curveEaseInOut, animations: {
            imageView.alpha = 0
        }) { _ in
            imageView.removeFromSuperview()
        }
        
//        UIView.animate(withDuration: 0.7, animations: {
//            //tranform, alpha, backgroundcolor, postioning:
//            imageView.transform = CGAffineTransform.identity
//        }) { _ in
//           // imageView.removeFromSuperview()
//        }
//
//        UIView.animate(withDuration: 0.5, delay: 0.7, options: .curveEaseInOut, animations: {
//            imageView.alpha = 0
//        }) { (_) in
//            imageView.removeFromSuperview()
        //}
        
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

