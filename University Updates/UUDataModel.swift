//
//  UUDataModel.swift
//  University Updates
//
//  Created by Vasu Yarasu on 05/09/18.
//  Copyright © 2018 Dev. All rights reserved.
//

import Foundation
struct University {
    let name: String
    var course: [String]
    var expanded: Bool
}

let ANU = University(name: "Acharya Nagarjuna University", course: ["BA","BA(Languages)& BA(OL)","B.sc","B.Com"], expanded: true)
let Andhra = University(name: "Andhra University", course: ["BA","BA(Languages)& BA(OL)","B.sc","B.Com"], expanded: true)
let Anna = University(name: "Anna University", course: ["BA","BA(Languages)& BA(OL)","B.sc","B.Com"], expanded: true)
let jntu = University(name: "JNTU", course: ["BA(Languages)& BA(OL)","B.sc","B.Com"], expanded: true)
let kakathiya = University(name: "Kakathiya University", course: ["B.sc","B.Com"], expanded: true)
let jntuHyd = University(name: "JNTU-HYD", course: ["BA","B.Com"], expanded: true)

var universities = [ANU,Andhra,Anna,kakathiya,jntu,jntuHyd]
