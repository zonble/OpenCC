//
//  ViewController.swift
//  OpenCC
//
//  Created by zonble on 10/21/2019.
//  Copyright (c) 2019 zonble. All rights reserved.
//

import UIKit
import OpenCC

class ViewController: UIViewController {

    lazy var bundle: Bundle? = {
        let openCCBundle = Bundle(for: ChineseConverter.self)
        guard let resourceUrl = openCCBundle.url(forResource: "OpenCCDictionary", withExtension: "bundle") else {
            return nil
        }
        return Bundle(url: resourceUrl)
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        guard let bundle = self.bundle else {
            return
        }
        do {

            let c = try ChineseConverter.init(bundle:bundle, option: .simplify)
            let s = c.convert("我想試試看")
            print(s)
        } catch {
            print(error)
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

