//
//  DetailView.swift
//  L33tNews
//
//  Created by Adrien Wilkins on 2019/12/10.
//  Copyright © 2019 Adrien Wilkins. All rights reserved.
//

import SwiftUI
import WebKit

struct DetailView: View {
    let url: String?
    
    var body: some View {
        WebView(urlString: url)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(url: "https://www.google.com")
    }
}


