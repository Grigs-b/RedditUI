//
//  ContentView.swift
//  RedditUI
//
//  Created by Ryan Grigsby on 6/10/19.
//  Copyright © 2019 Ryan Grigsby. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    @EnvironmentObject var store: ListStore
    
    var body: some View {
        VStack {
            Button {
                
                }.onAppear {
                    thing.goGetThing()
            }
        }
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        
        ContentView()
    }
}
#endif
