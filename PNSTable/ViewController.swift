//
//  ViewController.swift
//  PNSTable
//
//  Created by Santiago Matiz on 5/12/17.
//  Copyright © 2017 Intelyclick. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
}

extension ViewController: NSTableViewDataSource {
    func numberOfRows(in tableView: NSTableView) -> Int {
        return 3;
    }
}

extension ViewController: NSTableViewDelegate {
    
    fileprivate enum CellIdentifiers {
        static let NameCell = "NameCellID"
        static let DateCell = "DateCellID"
    }
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
       
        var text: String = ""
        var cellIdentifier: String = ""
        
        
        NSLog( " Identifier: \(tableColumn) row: \(row) ");
        
        // 2
        if tableColumn == tableView.tableColumns[0] {
            text = "Uno \(row)"
            cellIdentifier = CellIdentifiers.NameCell
        } else if tableColumn == tableView.tableColumns[1] {
            text = "dos \(row)"
            cellIdentifier = CellIdentifiers.DateCell
        } else {
        text = "paso";
        }
        
        // 1
        var cellView: NSTableCellView = tableView.makeView(withIdentifier: tableColumn!.identifier, owner: self) as! NSTableCellView

      
  
        cellView.textField?.stringValue = text;
        /*
       if let cell = tableView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: cellIdentifier), owner: nil) as? NSTableCellView {
            cell.textField?.stringValue = text
             NSLog( " Retorna Celda ");
            return cell;
        }
      */
        return cellView;
    }
    
}

