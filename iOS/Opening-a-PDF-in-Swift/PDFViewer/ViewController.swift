//
//  ViewController.swift
//  PDFViewer
//
//  Created by Julian Grosshauser on 15/07/16.
//  Copyright © 2016 PSPDFKit. All rights reserved.
//

import UIKit
import PSPDFKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // To keep things DRY we're going to define our button attributes in an array
        // and loop over it to create our buttons.
        let buttonAttributes = [(title: "Open Document in Web View", selector: #selector(openDocumentInWebView(_:)), yOffset: CGFloat(-100)),
                                (title: "Open Document in PSPDFKit", selector: #selector(openDocumentInPSPDFKit(_:)), yOffset: CGFloat(100))]

        for buttonAttribute in buttonAttributes {
            let button = UIButton()
            button.translatesAutoresizingMaskIntoConstraints = false
            button.setTitle(buttonAttribute.title, forState: .Normal)
            button.setTitleColor(.blueColor(), forState: .Normal)
            button.sizeToFit()
            button.addTarget(self, action: buttonAttribute.selector, forControlEvents: .TouchUpInside)
            view.addSubview(button)

            // We're using a bit of Auto Layout to keep our buttons centered.
            NSLayoutConstraint(item: button, attribute: .CenterX, relatedBy: .Equal, toItem: view, attribute: .CenterX, multiplier: 1, constant: 0).active = true
            NSLayoutConstraint(item: button, attribute: .CenterY, relatedBy: .Equal, toItem: view, attribute: .CenterY, multiplier: 1, constant: buttonAttribute.yOffset).active = true
        }
    }

    @objc
    private func openDocumentInWebView(sender: UIButton) {
        // Get URL of PDF document.
        guard let documentURL = NSBundle.mainBundle().resourceURL?.URLByAppendingPathComponent("Document.pdf") else { return }
        let urlRequest = NSURLRequest(URL: documentURL)

        // Create web view controller.
        let webViewController = WebViewController()
        webViewController.webView.loadRequest(urlRequest)

        // Present the document.
        let navigationController = UINavigationController(rootViewController: webViewController)
        webViewController.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Close", style: .Plain, target: self, action: #selector(dismissController(_:)))
        presentViewController(navigationController, animated: true, completion: nil)
    }

    @objc
    private func openDocumentInPSPDFKit(sender: UIButton) {
        // Get URL of PDF document.
        guard let documentURL = NSBundle.mainBundle().resourceURL?.URLByAppendingPathComponent("Document.pdf") else { return }

        // Create PSPDFDocument and PSPDFViewController.
        let document = PSPDFDocument(URL: documentURL)
        let pdfController = PSPDFViewController(document: document)

        // Present document.
        let navigationController = UINavigationController(rootViewController: pdfController)
        presentViewController(navigationController, animated: true, completion: nil)
    }

    @objc
    private func dismissController(sender: UIBarButtonItem) {
        dismissViewControllerAnimated(true, completion: nil)
    }
}
