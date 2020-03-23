//
//  TabContainerView.swift
//  RedditUI
//
//  Created by Ryan Grigsby on 2/20/20.
//  Copyright © 2020 Ryan Grigsby. All rights reserved.
//

import SwiftUI

struct TabContainerView: View {

    var body: some View {
        
        TabView {
            HStack {
                Button(action: {
                    
                }) { () -> Text in
                    Text("blah")
                }
                Spacer()
                Button(action: {
                    
                }) { () -> Text in
                    Text("blah2")
                }
            }
        }
    }
}

struct TabContainerView_Previews: PreviewProvider {
    static var previews: some View {
        TabContainerView()
    }
}
