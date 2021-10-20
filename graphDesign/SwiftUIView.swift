//
//  SwiftUIView.swift
//  graphDesign
//
//  Created by kenny on 2021/10/18.
//

import SwiftUI

struct Face:Shape{//臉
    func path(in rect: CGRect) ->Path{
        Path{path in
            path.addArc(center: CGPoint(x:195,y:381.5),radius: 100,startAngle: .zero, endAngle: .degrees(360),clockwise: false)
        }
    }
}

struct FaceLine:Shape{//臉線條
    func path(in rect: CGRect) ->Path{
        Path{path in
            path.addArc(center: CGPoint(x:195,y:381.5),radius: 100,startAngle: .zero, endAngle: .degrees(360),clockwise: false)
        }
    }
}

struct Nose:Shape{//鼻子
    func path(in rect: CGRect) ->Path{
        Path{path in
            path.addArc(center: CGPoint(x:195,y:381.5),radius: 20,startAngle: .zero, endAngle: .degrees(360),clockwise: false)
            
        }
    }
}

struct NoseLine:Shape{//鼻子線
    func path(in rect: CGRect) ->Path{
        Path{path in
            path.addArc(center: CGPoint(x:195,y:381.5),radius: 20,startAngle: .zero, endAngle: .degrees(360),clockwise: false)
        }
    }
}

struct Blush:Shape{//腮紅
    func path(in rect: CGRect) ->Path{
        Path{path in
            path.addArc(center: CGPoint(x:150,y:381.5),radius: 25,startAngle: .zero, endAngle: .degrees(360),clockwise: false)
           
            path.addArc(center: CGPoint(x:240,y:381.5),radius: 25,startAngle: .zero, endAngle: .degrees(360),clockwise: false)
        }
    }
}

struct BlushLineA:Shape{//腮紅線
    func path(in rect: CGRect) ->Path{
        Path{path in
            path.addArc(center: CGPoint(x:150,y:381.5),radius: 25,startAngle: .degrees(270), endAngle: .degrees(90),clockwise: false)
            
            path.move(to:CGPoint(x:165,y:401))
            path.addQuadCurve(to: CGPoint(x:225,y:401), control: CGPoint(x:195,y:435))
        }
    }
}


struct BlushLineB:Shape{//腮紅線
    func path(in rect: CGRect) ->Path{
        Path{path in
            path.addArc(center: CGPoint(x:240,y:381.5),radius: 25,startAngle: .degrees(270), endAngle: .degrees(90),clockwise: true)
        }
    }
}

struct Eyebrow:Shape{//眉毛
    func path(in rect: CGRect) ->Path{
        Path{path in
            path.move(to:CGPoint(x:160,y:320))
            path.addQuadCurve(to: CGPoint(x:180,y:320), control: CGPoint(x:170,y:300))
            
            path.move(to:CGPoint(x:210,y:320))
            path.addQuadCurve(to: CGPoint(x:230,y:320), control: CGPoint(x:220,y:300))
        
        }
    }
}
struct Faceview:View {//整臉
       let offsetX:CGFloat=280
       let offsetY:CGFloat=381.5
       var body: some View {
           ZStack{
               
               Group{
                   Face()
                       .fill(Color(red:247/255, green:182/255, blue:126/255))
                       .offset(x:offsetX, y:offsetY)
                   FaceLine()
                       .stroke(lineWidth: 2)
                       .offset(x:offsetX, y:offsetY)
                   Nose()
                       .fill(Color(red:1, green:0, blue:0))
                       .offset(x:offsetX, y:offsetY)
                   NoseLine()
                       .stroke(lineWidth: 2)
                       .offset(x:offsetX, y:offsetY)
                   Blush()
                       .fill(Color(red:1, green:0, blue:0))
                       .offset(x:offsetX, y:offsetY)
                   BlushLineA()
                       .stroke(lineWidth: 2)
                       .offset(x:offsetX, y:offsetY)
                   BlushLineB()
                       .stroke(lineWidth: 2)
                       .offset(x:offsetX, y:offsetY)
                   Eyebrow()
                       .stroke(lineWidth: 2)
                       .offset(x:offsetX, y:offsetY)
               }
           Group{
               Path(ellipseIn: CGRect(x:165, y:325,width:15,height:25))
                   .offset(x:offsetX, y:offsetY)
               Path(ellipseIn: CGRect(x:210, y:325,width:15,height:25))
                   .offset(x:offsetX, y:offsetY)
            }
        }
    }
}

struct SwiftUIView: View {
    var body: some View {
        ZStack{
            Image("Image")
                .offset(x:20,y:20)
            Faceview()
            Text("我是麵包超人")
                .fontWeight(.heavy)
                .font(.title)
                .offset(x: 0, y: -100)
            
        }
    }
}
struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
