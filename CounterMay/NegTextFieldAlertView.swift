//
//  SwiftUIView.swift
//
//  
//

import SwiftUI
import CoreData


struct NegTextFieldAlertView: View {
    @State private var isShowingNegAlert = false
    @State private var alertInput = ""

        var body: some View {
            NavigationView {
                VStack {
                    Button(action: {
                        withAnimation {
                            self.isShowingNegAlert.toggle()
                        }
                    }) {
                        Text("Show alert")
                    }
                }
                .navigationBarTitle(Text("A List"), displayMode: .large)
            }
            .negTextFieldAlert(isShowing: $isShowingNegAlert, text: $alertInput, title: "Misstep")
        }
}

struct NegTextFieldAlert<Presenting>: View where Presenting: View {
    @Environment(\.managedObjectContext) var viewContext
    @FetchRequest(sortDescriptors: []) var targets: FetchedResults<TargetEntity>
    @FetchRequest(sortDescriptors: []) var positives: FetchedResults<PositiveEntity>
    @FetchRequest(sortDescriptors: []) var negatives: FetchedResults<NegativeEntity>
    
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
                                    self.isShowing.toggle()
                                }
                            }) {
                                Text("+")
                            }.padding()
                            
                            Button(action: {
                                withAnimation {
                                    reduction(targets.first!)
                                    self.isShowing.toggle()
                                }
                            }) {
                                Text("-")
                            }.padding()
                        }
                        
                        Button(action: {
                            withAnimation {
                                self.isShowing.toggle()
                                addNegative()
                            }
                        }) {
                            Text("Done")
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
    
    func addNegative(){
        let newNegative = NegativeEntity(context: viewContext)
        newNegative.title = text
        reduction(targets.first!)
        save()
    }

    func save() {
        do { try viewContext.save() } catch { print(error) }
    }

}

extension View {

    func negTextFieldAlert(isShowing: Binding<Bool>,
                        text: Binding<String>,
                        title: String) -> some View {
        NegTextFieldAlert(isShowing: isShowing,
                       text: text,
                       presenting: self,
                       title: title)
    }

}

struct NegTextFieldAlertView_Previews: PreviewProvider {
    static var previews: some View {
        NegTextFieldAlertView()
    }
}
