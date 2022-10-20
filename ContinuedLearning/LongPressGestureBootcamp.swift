//
//  LongPressGestureBootcamp.swift
//  ContinuedLearning
//
//  Created by Chi Dung on 19/09/2022.
//

import SwiftUI

struct LongPressGestureBootcamp: View {
    @State var isComplete: Bool = false
    @State var isSuccess: Bool = false
    var body: some View {
        
        VStack {
            Rectangle()
                .fill(isSuccess ? Color.green : Color.blue)
                .frame(maxWidth: isComplete ? .infinity : 0)
                .frame(height: 55)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color.gray)
            
            HStack {
                Text("CLICK HERE")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.black)
                .cornerRadius(10)
                .onLongPressGesture(minimumDuration: 1.0, maximumDistance: 50) { (isPressing) in
                    if isPressing {
                        withAnimation(.easeInOut(duration: 1.0)) {
                            isComplete.toggle()
                        }
                    }
                } perform: {
                    withAnimation(.easeInOut) {
                        isSuccess = true
                    }
                }
                
                Text("RESET")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.black)
                .cornerRadius(10)
            }
        }
//        Text(isComplete ? "COMPLETED" : "NOT COMPLETE")
//            .padding()
//            .padding(.horizontal)
//            .background(isComplete ? Color.green : Color.gray)
//            .cornerRadius(10)
////            .onTapGesture {
////                isComplete.toggle()
////            }
//            .onLongPressGesture(minimumDuration: 5.0, maximumDistance: 50) {
//                isComplete.toggle()
//            }
        
    }
}

struct LongPressGestureBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        LongPressGestureBootcamp()
    }
}
