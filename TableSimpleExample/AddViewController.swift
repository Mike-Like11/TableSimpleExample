//
//  AddViewController.swift
//  TableSimpleExample
//
//  Created by Mike I on 19.03.2021.
//

import UIKit

class AddViewController: UIViewController {
    var name: String = ""
    var textView = UITextView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        title = "New Footballer"
        self.navigationItem.backBarButtonItem?.target = self
        self.navigationItem.backBarButtonItem?.action = #selector(backToRootVCAction)
        
        let backToRootVCButton = UIBarButtonItem.init(title: "Back", style: UIBarButtonItem.Style.plain, target: self, action: #selector(backToRootVCAction))
        self.navigationItem.setLeftBarButton(backToRootVCButton, animated: true)
        textView.frame=CGRect(x: 30, y: 50, width: 100, height: 100)
                
                textView.font = .systemFont(ofSize: 18)
                view.addSubview(textView)
                textView.translatesAutoresizingMaskIntoConstraints = false
                [
                    textView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                    textView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                    textView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                    textView.heightAnchor.constraint(equalToConstant: 100)
                ].forEach{$0.isActive=true}

    }
    @objc func backToRootVCAction() {
        let a = self.navigationController?.viewControllers[0] as! ViewController
        if textView.text != ""{
            a.deleteTable()
            a.footbolisti.append(textView.text)
            a.updateTable(footbolshiki: a.footbolisti)
        a.tableView.reloadData()
        }
        _ = self.navigationController?.popToRootViewController(animated: true)
    }
    

}

