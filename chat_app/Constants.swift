//
//  Constants.swift
//  chat_app
//
//  Created by R.M.K.CET on 19/02/18.
//  Copyright © 2018 R.M.K.C.E.T. All rights reserved.
//

import Foundation
import Firebase

struct Constants
{
    
    struct refs
    {
        static let databaseRoot = Database.database().reference()
        static let databaseChats = databaseRoot.child("chats")
    }
}
