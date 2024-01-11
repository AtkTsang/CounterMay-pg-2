//
//  HeartView.swift
//  
//
//


import SwiftUI
import CoreData
import Combine

struct HeartView: View {
    
    @ObservedObject var targetEntity: TargetEntity

    @AppStorage("counterName") var counterName: String = "Set Counter Name Here"
    
    init(targetEntity: TargetEntity) {
        self.targetEntity = targetEntity
    }
        
    var body: some View {
      
        VStack {
            //Counter name
            TextField("Set Counter Name", text: $counterName)
                .padding(.bottom, 10)
                .font(.largeTitle)
                .multilineTextAlignment(TextAlignment.center)
                .foregroundColor(.white)
                .onChange(of: counterName) { _ in
                    counterName = String(counterName.prefix(17))
                  }
            
            //the hearts
            VStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                    .frame(width: 370.0, height: 220.0)
                        .foregroundColor(Color.yellow)
                    VStack {
                        HStack (alignment: .bottom, spacing: -3) {
                            if targetEntity.countnum > 0 {
                                if targetEntity.countnum == 0 {
                                    Image(systemName: "heart.slash")
                                } else if targetEntity.countnum == 1 {
                                    Image(systemName: "heart.fill")
                                        .foregroundColor(.pink)
                                } else if targetEntity.countnum == 2 || targetEntity.countnum == 3 {
                                    ForEach(Array(1...targetEntity.countnum), id: \.self){_ in
                                        Image(systemName: "heart.fill")
                                            .foregroundColor(.pink)
                                    }
                                } else if targetEntity.countnum == 4 {
                                    Image(systemName: "heart.fill")
                                      .foregroundColor(.pink)
                                      .font(.system(size: 30.0))
                                } else if targetEntity.countnum > 4 && targetEntity.countnum < 41 && targetEntity.countnum/4 != 0 {
                                    ForEach(Array(1...(targetEntity.countnum/4)), id: \.self){_ in
                                        Image(systemName: "heart.fill")
                                            .foregroundColor(.pink)
                                            .font(.system(size: 30.0))
                                    }
                                }
                                if targetEntity.countnum > 4 && targetEntity.countnum < 41 && targetEntity.countnum%4 != 0 {
                                    ForEach(Array(1...targetEntity.countnum%4), id: \.self){_ in
                                        Image(systemName: "heart.fill")
                                            .foregroundColor(.pink)
                                    }
                                }
                            }
                            if targetEntity.countnum > 40 {
                                ForEach(Array(1...10), id: \.self){_ in
                                    Image(systemName: "heart.fill")
                                        .foregroundColor(.pink)
                                        .font(.system(size: 30.0))
                                }
                            }
                            Spacer()
                        }
                        .padding(.leading, -20)
                        
                        HStack (alignment: .bottom, spacing: -3) {
                            if targetEntity.countnum > 40 {
                                if targetEntity.countnum == 41 {
                                    Image(systemName: "heart.fill")
                                        .foregroundColor(.pink)
                                } else if targetEntity.countnum == 42 || targetEntity.countnum == 43 {
                                    ForEach(Array(41...targetEntity.countnum), id: \.self){_ in
                                        Image(systemName: "heart.fill")
                                            .foregroundColor(.pink)
                                    }
                                } else if targetEntity.countnum == 44 {
                                        Image(systemName: "heart.fill")
                                            .foregroundColor(.pink)
                                            .font(.system(size: 30.0))
                                } else if targetEntity.countnum > 44 && targetEntity.countnum < 81 && targetEntity.countnum%4 == 0 {
                                    ForEach(Array(1...((targetEntity.countnum/4)-10)), id: \.self){_ in
                                        Image(systemName: "heart.fill")
                                            .foregroundColor(.pink)
                                            .font(.system(size: 30.0))
                                    }
                                }
                                if targetEntity.countnum > 44 && targetEntity.countnum < 81 && targetEntity.countnum%4 != 0 {
                                    ForEach(Array(1...(targetEntity.countnum/4)-10), id: \.self){_ in
                                        Image(systemName: "heart.fill")
                                            .foregroundColor(.pink)
                                            .font(.system(size: 30.0))
                                    }
                                    ForEach(Array(1...targetEntity.countnum%4), id: \.self){_ in
                                        Image(systemName: "heart.fill")
                                            .foregroundColor(.pink)
                                    }
                                }
                            }
                            if targetEntity.countnum < 40 {
                                    Image(systemName: "heart.fill")
                                        .foregroundColor(.yellow)
                                        .font(.system(size: 30.0))
                            }
                            if targetEntity.countnum > 80 {
                                ForEach(Array(1...10), id: \.self){_ in
                                    Image(systemName: "heart.fill")
                                        .foregroundColor(.pink)
                                        .font(.system(size: 30.0))
                                }
                            }
                            Spacer()
                        }
                        .padding(.leading, -20)
                        
                        HStack (alignment: .bottom, spacing: -3) {
                            if targetEntity.countnum > 80 {
                                if targetEntity.countnum == 81 {
                                    Image(systemName: "heart.fill")
                                        .foregroundColor(.pink)
                                } else if targetEntity.countnum == 82 || targetEntity.countnum == 83 {
                                    ForEach(Array(81...targetEntity.countnum), id: \.self){_ in
                                        Image(systemName: "heart.fill")
                                            .foregroundColor(.pink)
                                    }
                                } else if targetEntity.countnum == 84 {
                                        Image(systemName: "heart.fill")
                                            .foregroundColor(.pink)
                                            .font(.system(size: 30.0))

                                } else if targetEntity.countnum > 84 && targetEntity.countnum < 121 && targetEntity.countnum%4 == 0 {
                                    ForEach(Array(1...((targetEntity.countnum/4)-20)), id: \.self){_ in
                                        Image(systemName: "heart.fill")
                                            .foregroundColor(.pink)
                                            .font(.system(size: 30.0))
                                    }
                                }
                                if targetEntity.countnum > 84 && targetEntity.countnum < 121 && targetEntity.countnum%4 != 0 {
                                    ForEach(Array(1...(targetEntity.countnum/4)-20), id: \.self){_ in
                                        Image(systemName: "heart.fill")
                                            .foregroundColor(.pink)
                                            .font(.system(size: 30.0))
                                    }
                                    ForEach(Array(1...targetEntity.countnum%4), id: \.self){_ in
                                        Image(systemName: "heart.fill")
                                            .foregroundColor(.pink)
                                    }
                                }
                            }
                            if targetEntity.countnum < 80 {
                                    Image(systemName: "heart.fill")
                                        .foregroundColor(.yellow)
                                        .font(.system(size: 30.0))
                            }
                            if targetEntity.countnum > 120 {
                                ForEach(Array(1...10), id: \.self){_ in
                                    Image(systemName: "heart.fill")
                                        .foregroundColor(.pink)
                                        .font(.system(size: 30.0))
                                }
                            }
                            Spacer()
                        }
                        .padding(.leading, -20)

                        HStack (alignment: .bottom, spacing: -3) {
                            if targetEntity.countnum > 120 {
                                if targetEntity.countnum == 121 {
                                    Image(systemName: "heart.fill")
                                        .foregroundColor(.pink)
                                } else if targetEntity.countnum == 122 || targetEntity.countnum == 123 {
                                    ForEach(Array(121...targetEntity.countnum), id: \.self){_ in
                                        Image(systemName: "heart.fill")
                                            .foregroundColor(.pink)
                                    }
                                } else if targetEntity.countnum == 124 {
                                        Image(systemName: "heart.fill")
                                            .foregroundColor(.pink)
                                            .font(.system(size: 30.0))

                                } else if targetEntity.countnum > 124 && targetEntity.countnum < 161 && targetEntity.countnum%4 == 0 {
                                    ForEach(Array(1...((targetEntity.countnum/4)-30)), id: \.self){_ in
                                        Image(systemName: "heart.fill")
                                            .foregroundColor(.pink)
                                            .font(.system(size: 30.0))
                                    }
                                }
                                if targetEntity.countnum > 124 && targetEntity.countnum < 161 && targetEntity.countnum%4 != 0 {
                                    ForEach(Array(1...(targetEntity.countnum/4)-30), id: \.self){_ in
                                        Image(systemName: "heart.fill")
                                            .foregroundColor(.pink)
                                            .font(.system(size: 30.0))
                                    }
                                    ForEach(Array(1...targetEntity.countnum%4), id: \.self){_ in
                                        Image(systemName: "heart.fill")
                                            .foregroundColor(.pink)
                                    }
                                }
                            }
                            if targetEntity.countnum < 120 {
                                    Image(systemName: "heart.fill")
                                        .foregroundColor(.yellow)
                                        .font(.system(size: 30.0))
                            }
                            if targetEntity.countnum > 160 {
                                ForEach(Array(1...10), id: \.self){_ in
                                    Image(systemName: "heart.fill")
                                        .foregroundColor(.pink)
                                        .font(.system(size: 30.0))
                                }
                            }
                            Spacer()
                        }
                        .padding(.leading, -20)

                        HStack (alignment: .bottom, spacing: -3) {
                            if targetEntity.countnum > 160 {
                                if targetEntity.countnum == 161 {
                                    Image(systemName: "heart.fill")
                                        .foregroundColor(.pink)
                                } else if targetEntity.countnum == 162 || targetEntity.countnum == 163 {
                                    ForEach(Array(161...targetEntity.countnum), id: \.self){_ in
                                        Image(systemName: "heart.fill")
                                            .foregroundColor(.pink)
                                    }
                                } else if targetEntity.countnum == 164 {
                                        Image(systemName: "heart.fill")
                                            .foregroundColor(.pink)
                                            .font(.system(size: 30.0))

                                } else if targetEntity.countnum > 164 && targetEntity.countnum < 201 && targetEntity.countnum%4 == 0 {
                                    ForEach(Array(1...((targetEntity.countnum/4)-40)), id: \.self){_ in
                                        Image(systemName: "heart.fill")
                                            .foregroundColor(.pink)
                                            .font(.system(size: 30.0))
                                    }
                                }
                                if targetEntity.countnum > 164 && targetEntity.countnum < 201 && targetEntity.countnum%4 != 0 {
                                    ForEach(Array(1...(targetEntity.countnum/4)-40), id: \.self){_ in
                                        Image(systemName: "heart.fill")
                                            .foregroundColor(.pink)
                                            .font(.system(size: 30.0))
                                    }
                                    ForEach(Array(1...targetEntity.countnum%4), id: \.self){_ in
                                        Image(systemName: "heart.fill")
                                            .foregroundColor(.pink)
                                    }
                                }
                            }
                            if targetEntity.countnum < 160 {
                                    Image(systemName: "heart.fill")
                                        .foregroundColor(.yellow)
                                        .font(.system(size: 30.0))
                            }
                            if targetEntity.countnum > 200 {
                                ForEach(Array(1...10), id: \.self){_ in
                                    Image(systemName: "heart.fill")
                                        .foregroundColor(.pink)
                                        .font(.system(size: 30.0))
                                }
                            }
                            Spacer()
                        }
                        .padding(.leading, -20)

                        HStack (alignment: .bottom, spacing: -3) {
                            if targetEntity.countnum > 200 {
                                if targetEntity.countnum == 201 {
                                    Image(systemName: "heart.fill")
                                        .foregroundColor(.pink)
                                } else if targetEntity.countnum == 202 || targetEntity.countnum == 203 {
                                    ForEach(Array(201...targetEntity.countnum), id: \.self){_ in
                                        Image(systemName: "heart.fill")
                                            .foregroundColor(.pink)
                                    }
                                } else if targetEntity.countnum == 204 {
                                        Image(systemName: "heart.fill")
                                            .foregroundColor(.pink)
                                            .font(.system(size: 30.0))

                                } else if targetEntity.countnum > 204 && targetEntity.countnum < 241 && targetEntity.countnum%4 == 0 {
                                    ForEach(Array(1...((targetEntity.countnum/4)-50)), id: \.self){_ in
                                        Image(systemName: "heart.fill")
                                            .foregroundColor(.pink)
                                            .font(.system(size: 30.0))
                                    }
                                }
                                if targetEntity.countnum > 204 && targetEntity.countnum < 241 && targetEntity.countnum%4 != 0 {
                                    ForEach(Array(1...(targetEntity.countnum/4)-50), id: \.self){_ in
                                        Image(systemName: "heart.fill")
                                            .foregroundColor(.pink)
                                            .font(.system(size: 30.0))
                                    }
                                    ForEach(Array(1...targetEntity.countnum%4), id: \.self){_ in
                                        Image(systemName: "heart.fill")
                                            .foregroundColor(.pink)
                                    }
                                }
                            }
                            if targetEntity.countnum < 200 {
                                    Image(systemName: "heart.fill")
                                        .foregroundColor(.yellow)
                                        .font(.system(size: 30.0))
                            }
                            if targetEntity.countnum > 240 {
                                ForEach(Array(1...10), id: \.self){_ in
                                    Image(systemName: "heart.fill")
                                        .foregroundColor(.pink)
                                        .font(.system(size: 30.0))
                                }
                            }
                            Spacer()
                        }
                        .padding(.leading, -20)

                        HStack (alignment: .bottom, spacing: -3) {
                            if targetEntity.countnum > 240 {
                                if targetEntity.countnum == 241 {
                                    Image(systemName: "heart.fill")
                                        .foregroundColor(.pink)
                                } else if targetEntity.countnum == 242 || targetEntity.countnum == 243 {
                                    ForEach(Array(241...targetEntity.countnum), id: \.self){_ in
                                        Image(systemName: "heart.fill")
                                            .foregroundColor(.pink)
                                    }
                                } else if targetEntity.countnum == 244 {
                                        Image(systemName: "heart.fill")
                                            .foregroundColor(.pink)
                                            .font(.system(size: 30.0))

                                } else if targetEntity.countnum > 244 && targetEntity.countnum < 281 && targetEntity.countnum%4 == 0 {
                                    ForEach(Array(1...((targetEntity.countnum/4)-60)), id: \.self){_ in
                                        Image(systemName: "heart.fill")
                                            .foregroundColor(.pink)
                                            .font(.system(size: 30.0))
                                    }
                                }
                                if targetEntity.countnum > 244 && targetEntity.countnum < 281 && targetEntity.countnum%4 != 0 {
                                    ForEach(Array(1...(targetEntity.countnum/4)-60), id: \.self){_ in
                                        Image(systemName: "heart.fill")
                                            .foregroundColor(.pink)
                                            .font(.system(size: 30.0))
                                    }
                                    ForEach(Array(1...targetEntity.countnum%4), id: \.self){_ in
                                        Image(systemName: "heart.fill")
                                            .foregroundColor(.pink)
                                    }
                                }
                            }
                            if targetEntity.countnum < 240 {
                                    Image(systemName: "heart.fill")
                                        .foregroundColor(.yellow)
                                        .font(.system(size: 30.0))
                            }

                            if targetEntity.countnum > 280 {
                                ForEach(Array(1...10), id: \.self){_ in
                                    Image(systemName: "heart.fill")
                                        .foregroundColor(.pink)
                                        .font(.system(size: 30.0))
                                }
                            }
                            Spacer()
                        }
                        .padding(.leading, -20)

                    }
                    .padding(.leading, 37.0)
                }
            }
            //CountNum
            HStack {
                Spacer()
                Text("Hearts:")
                    .multilineTextAlignment(.leading)
                    .padding(.leading, 50.0)
                TextField("Test", value: $targetEntity.countnum, formatter: NumberFormatter())
                    .frame(width: 50.0, height: 25.0)
                    .keyboardType(.numberPad)
//enable when ship                    .disabled(true)
            }
            .foregroundColor(.white)
        }
        
    }
    
    
}

struct HeartView_Previews: PreviewProvider {
    static var previews: some View {
        HeartView(targetEntity: TargetEntity())
    }
}
