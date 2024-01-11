//
//  SwiftUIView.swift
//
//  
//

import SwiftUI
import CoreData


struct PosTextFieldAlertView: View {
    @State private var isShowingPosAlert = false
    @State private var alertInput = "1"

        var body: some View {
            NavigationView {
                VStack {
                    Button(action: {
                        withAnimation {
                            self.isShowingPosAlert.toggle()
                        }
                    }) {
                        Text("Show alert")
                    }
                }
                .navigationBarTitle(Text("A List"), displayMode: .large)
            }
            .posTextFieldAlert(isShowing: $isShowingPosAlert, text: $alertInput, title: "Win2")
        }
}

struct PosTextFieldAlert<Presenting>: View where Presenting: View {
    @Environment(\.managedObjectContext) var viewContext
    @FetchRequest(sortDescriptors: []) var targets: FetchedResults<TargetEntity>
    @FetchRequest(sortDescriptors: []) var positives: FetchedResults<PositiveEntity>
    
    @Binding var isShowing: Bool
    @Binding var text: String
    let presenting: Presenting
    let title: String

    var body: some View {
        GeometryReader { (deviceSize: GeometryProxy) in
            ZStack {
                self.presenting
                    .disabled(isShowing)
                VStack {
                    Text(self.title)
                        .foregroundColor(.black)
                    TextField(self.title, text: self.$text)
                        .foregroundColor(.black)
                    Divider()
                    VStack{
                        HStack {
                            Button(action: {
                                withAnimation {
                                  increment(targets.first!)
//                                    self.isShowing.toggle()
                                }
                                
                            }) {
                                Text("+")
                                
                            }.padding()
                            
                            Button(action: {
                                withAnimation {
                                  reduction(targets.first!)
//                                    self.isShowing.toggle()
                                }
                            }) {
                                Text("-")
                            }.padding()
                        }
                        
                        HStack {
                            Button(action: {
                                withAnimation {
                                    self.isShowing.toggle()
                                    addPositive()
                                }
                            }) {
                                Text("Done")
                            }
                            
                            Button(action: {
                                withAnimation {
                                    self.isShowing.toggle()
                                }
                            }) {
                                Text("Cancel")
                            }
                        }
                        
                        
                    }
                }
                .padding()
                .background(Color.white)
                .frame(
                    width: deviceSize.size.width*0.7,
                    height: deviceSize.size.height*0.7
                )
                .shadow(radius: 1)
                .opacity(self.isShowing ? 1 : 0)
            }
        }
    }

    func increment(_ item: TargetEntity) {
            item.countnum += 1
            save()
    }
    
    func reduction(_ item: TargetEntity) {
            item.countnum -= 1
            save()
    }
    
    func addPositive(){
        let newPositive = PositiveEntity(context: viewContext)
        newPositive.title = text
        increment(targets.first!)
        save()
    }

    func save() {
        do { try viewContext.save() } catch { print(error) }
    }
}

extension View {
    func posTextFieldAlert(isShowing: Binding<Bool>,
                        text: Binding<String>,
                        title: String) -> some View {
        PosTextFieldAlert(isShowing: isShowing,
                       text: text,
                       presenting: self,
                       title: title)
    }

}

struct PosTextFieldAlertView_Previews: PreviewProvider {
    static var previews: some View {
        PosTextFieldAlertView()
    }
}
