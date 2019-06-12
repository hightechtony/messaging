//
//  ViewController.swift
//  messaging
//
//  Created by Salvador Mireles on 2/4/19.
//  Copyright © 2019 Salvador Mireles. All rights reserved.
//

import UIKit

struct  ChatMessage {
    
    let text: String
    let isIncoming: Bool
    let date: Date

}

extension Date {
    static func dateForCustomString(customString: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        return dateFormatter.date(from: customString) ?? Date()
        
    }
}

class ViewController: UITableViewController {
    
    
    fileprivate let cellId = "id123"
    
    let messagesFromServer = [
           ChatMessage(text: "hey honey boo boo", isIncoming: true, date: Date.dateForCustomString(customString: "09/09/2018")),
           ChatMessage(text: "hey honey boo boo", isIncoming: true, date: Date.dateForCustomString(customString: "09/09/2018")),
           ChatMessage(text: "hey honey boo miss you", isIncoming: false, date: Date.dateForCustomString(customString: "09/09/2018")),
           ChatMessage(text: "me too ", isIncoming: true, date: Date.dateForCustomString(customString: "09/09/2019")),
           ChatMessage(text: "aww how sweet", isIncoming: false, date:  Date.dateForCustomString(customString: "09/09/2019")),
           ChatMessage(text: "you know it", isIncoming: true, date: Date.dateForCustomString(customString: "09/09/2019")),
           ChatMessage(text: "youou", isIncoming: true, date: Date.dateForCustomString(customString: "09/09/2020"))
            ]
    
    
  
    
    

    var chatMessages = [[ChatMessage]]()
    
    fileprivate func attemToAssembleGroupedMessages() {
        print("attempt to")
        
        let groupedMessages = Dictionary(grouping: messagesFromServer) { (element) -> Date in
            return element.date
        }
        // provide a sorting for your keys somehow
        let sortedKeys = groupedMessages.keys.sorted()
        sortedKeys.forEach { (key) in
            let values = groupedMessages[key] 
            chatMessages.append(values ?? [])
        }
            
       /* groupedMessages.keys.forEach{ (key) in
                print(key)
                let values = groupedMessages[key]
                print (values ?? "")
            
               chatMessages.append(values ?? [])
            } */
        
        
            
     }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        attemToAssembleGroupedMessages()
        
        
        navigationItem.title = "messages"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        tableView.register(ChatMessageCell.self, forCellReuseIdentifier: cellId)
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor(white: 0.965, alpha: 1)
        
   
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return chatMessages.count
    }
    
    class DateHeaderLabel: UILabel {
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            backgroundColor = .black
            textColor = .white
            textAlignment = .center
            translatesAutoresizingMaskIntoConstraints = false
           

        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        override var intrinsicContentSize: CGSize {
            font = UIFont.boldSystemFont(ofSize: 14)
            let originalContentSize = super.intrinsicContentSize
            let height = originalContentSize.height + 12
            layer.cornerRadius = height / 2
            layer.masksToBounds = true
            return CGSize(width: originalContentSize.width + 16, height: height)
        }
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if let firstMessageInSection = chatMessages[section].first {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MM/dd/yyyy"
            let dateString = dateFormatter.string(from:
                firstMessageInSection.date)
            
            let label = DateHeaderLabel()
            label.text = dateString
            
            let containerView = UIView()
            
            containerView.addSubview(label)
            label.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
            label.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
            
            return containerView
        }
        
        let label = DateHeaderLabel()
        label.backgroundColor = .black
        label.text = "SOME STRING"
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 14)
        
        let containerView = UIView()
        
        containerView.addSubview(label)
        label.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        
        return containerView
    }
    
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    
    
    /*override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if let firstMessageInSection = chatMessages[section].first {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MM/dd/yyyy"
            let dateString = dateFormatter.string(from:
            firstMessageInSection.date)
            
            return dateString
        }
        return "Section: \(Date())"
    } */
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatMessages[section].count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as!
            ChatMessageCell
       // cell.textLabel?.text = "test test testjfdsjfj dfsadfjsdjflskjfksa dfasdf skdjf dfksd"
       // cell.textLabel?.numberOfLines = 0
      //  let chatMessage = chatMessages[indexPath.row]
        //cell.messageLabel.text = chatMessage.text
       // cell.isIncoming = chatMessage.isIncoming
        
        let chatMessage = chatMessages[indexPath.section][indexPath.row]
        
        cell.chatMessage = chatMessage
        
       // cell.isIncoming = indexPath.row % 2 == 0
        return cell
    }

   
        // Dispose of any resources that can be recreated.
    


}

