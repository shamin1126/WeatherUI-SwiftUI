//
//  ContentView.swift
//  weatherUI
//
//  Created by BJIT on 17/5/22.
//

import SwiftUI

struct ContentView: View {
    @State private var isNight = false //UI will observe this value
    var body: some View {
        //Zstack is like vertical view hierachy/layer
        ZStack{
            //for solid color
            //Color(.blue)
            //for gradient color
            bgSetup(isNight:$isNight)
            VStack{
                cityName(nameOfCity: "Dhaka, Bangladesh")
                currentWeatherView(imageName: isNight ? "moon.stars.fill":"cloud.sun.fill", temp: 76)
                //**Note: order of modifier matters**
                HStack(spacing: 40) {
                    weatherDayView(weekDay: "Tue", imgName: "cloud.sun.fill", temp: 76)
                    weatherDayView(weekDay: "Tue", imgName: "cloud.sun.fill", temp: 76)
                    weatherDayView(weekDay: "Tue", imgName: "cloud.sun.fill", temp: 76)
                    weatherDayView(weekDay: "Tue", imgName: "cloud.sun.fill", temp: 76)
                    weatherDayView(weekDay: "Tue", imgName: "cloud.sun.fill", temp: 76)
                }
                //streching the VStack
                Spacer()
                Button {
                    print("tapped")
                    isNight.toggle()

                } label: {
                    btnTextSetup(btnText: "Change Day Time", txtColor: .blue, bgColor: .white)
                }
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct weatherDayView: View {
    var weekDay: String
    var imgName: String
    var temp: Int

    var body: some View {
        VStack{
            Text(weekDay)
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.white)
            Image(systemName: imgName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temp)°")
                .font(.system(size: 20, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct bgSetup: View {
    //var topColor: Color
    //var bottomColor: Color
    @Binding var isNight: Bool
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black:.blue,isNight ? .black:Color("lightSkyBlue")]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        //for covering whole screen with safe area
            .edgesIgnoringSafeArea(.all)
    }
}
struct cityName: View {
    var nameOfCity: String
    var body: some View {
        Text(nameOfCity)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct currentWeatherView: View{
    var imageName: String
    var temp: Int
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            Text("\(temp)°C")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }
        .padding(.bottom, 40)
    }
}
