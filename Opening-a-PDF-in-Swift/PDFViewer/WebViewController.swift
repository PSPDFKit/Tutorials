//
//  WebViewController.swift
//  PDFViewer
//
//  Created by Julian Grosshauser on 15/07/16.
//  Copyright © 2016 PSPDFKit. All rights reserved.
//

import UIKit

class WebViewController: UIViewController {

    // We're going to show a PDF with the help of this web view.
    let webView = UIWebView()

    override func viewDidLoad() {
        super.viewDidLoad()
         // Make sure the web view is shown fullscreen.
        webView.frame = view.frame
        view.addSubview(webView)
    }
}
