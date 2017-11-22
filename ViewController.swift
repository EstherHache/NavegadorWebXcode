//
//  ViewController.swift
//  NavegadorWeb
//
//  Created by usuario on 20/11/17.
//  Copyright © 2017 usuario. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var gobutton: UIBarButtonItem!
    @IBOutlet weak var nextbutton: UIBarButtonItem!
    @IBOutlet weak var backbutton: UIBarButtonItem!
    @IBOutlet weak var tv_web: UITextView!
    @IBOutlet weak var tf_web: UITextField!
    
    @IBAction func next(_ sender: Any) {
        if wv_web.canGoForward {
            wv_web.goForward()
        }
    }
    @IBAction func back(_ sender: Any) {
        if wv_web.canGoBack {
            wv_web.goBack()
        }
    }
    @IBOutlet weak var wv_web: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL (string: "https://www.google.com")
        tf_web.text = "https://www.google.com"
        wv_web.loadRequest(URLRequest(url: url!))
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func ir(_ sender: Any) {
        let dire = URL (string: tf_web.text!)
        if (tf_web.text?.characters.count)! > 0 {
        wv_web.loadRequest(URLRequest(url: dire!))
            tv_web.text = tf_web.text!
        } else {
            tv_web.text = "No se puede mostrar la pagina"
        }
        
    }
    @IBAction func reload(_ sender: Any) {
        wv_web.reload()
        /*let url = URL (string: navegador.text!)
         web.loadRequest(URLRequest(url: url!))*/
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

 func textFieldDidChange(_ textField: UITextField) {
 
    if (tf_web.text?.characters.count)! <= 0 {
            gobutton.isEnabled=false
    } else {
            gobutton.isEnabled=true
        
    }
    
    if wv_web.canGoBack {
            backbutton.isEnabled=true
 
    }
        else {
            backbutton.isEnabled=false
        }
 
    if wv_web.canGoForward {
            nextbutton.isEnabled=true
 
    }
        else {
            nextbutton.isEnabled=false
    }
    
 
 
 }
 
    func webViewDidStartLoad(_ webView: UIWebView) {
     wv_web.request?.url?.absoluteString
     let txt = wv_web.request?.description
     tv_web.text = txt
     tf_web.text = txt
 
     }
    

}

