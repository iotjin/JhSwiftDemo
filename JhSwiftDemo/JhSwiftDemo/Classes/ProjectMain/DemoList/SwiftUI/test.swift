//
//  test.swift
//  JhSwiftDemo
//
//  Created by Jh on 2021/12/27.
//


import SwiftUI

struct ContentView: View {
    @available(iOS 13.0.0, *)
    var body: some View {
        Text("Hello, world!").padding()
        
        //        var frame = CGRect(x: 0, y: 100, width: 100, height: 100);
        //       var view = UIView(frame: frame)
        
        Text("To be, or not to be, that is the question:")
            .padding(.all, 1.0)
        
        Text("To be, or not to be, that is the question:")
            .padding(.all, 1.0)
        
    }
}



struct ContentView_Previews: PreviewProvider {
    @available(iOS 13.0.0, *)
    static var previews: some View {
        ContentView()
    }
}

