//
//  ContentView.swift
//  BrightNessSlider
//
//  Created by Rakesh Verma				 on 09/03/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var lastDragValue: CGFloat = 0
    @State var sliderProgress:CGFloat = 0
    @State var sliderHieght: CGFloat = 0
    @State var sliderMaxHeight:CGFloat = 300
    var body: some View {
        VStack{
            Text("Battery Slider").font(.largeTitle).bold()
                .offset(y: -(sliderHieght / 10))
            ZStack(alignment: .bottom){
                Rectangle()
                    .fill(Color.green.opacity(0.7))
                Rectangle()
                    .fill(Color.green)
                    .frame(height: sliderHieght)
                    Text("\(Int(sliderProgress * 100))%")
                        .frame(width: 50, height: 40)
                        .background(Color.white)
                        .cornerRadius(10)
                        .padding()
                        .offset( y: sliderHieght < sliderMaxHeight - 70 ? -sliderHieght :  -sliderMaxHeight + 70)
            }
            .frame(width: 100, height: sliderMaxHeight)
            .cornerRadius(20)
            .gesture(DragGesture().onEnded({ (value) in
                lastDragValue = sliderHieght
                sliderHieght = sliderHieght > sliderMaxHeight ? sliderMaxHeight : sliderHieght
                sliderHieght = sliderHieght >= 0 ? sliderHieght : 0
                sliderProgress = CGFloat(sliderHieght / sliderMaxHeight)
            }).onChanged({ (value) in
                sliderHieght = -value.translation.height + lastDragValue
                sliderHieght = sliderHieght > sliderMaxHeight ? sliderMaxHeight : sliderHieght
                sliderHieght = sliderHieght >= 0 ? sliderHieght : 0
                sliderProgress = sliderHieght / sliderMaxHeight
            }))
          
        }
        .frame(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height + 10)
        .background(Color.red)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
