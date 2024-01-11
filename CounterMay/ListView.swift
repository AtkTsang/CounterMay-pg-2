//
//  ListView.swift
//
//
//  
//


import SwiftUI
import CoreData

struct ListView: View {
    
    var viewContext: NSManagedObjectContext
    var positives: [PositiveEntity]
    var negatives: [NegativeEntity]
    var targets: [TargetEntity]
    
    @State private var isShowingPosAlert = false
    @State private var isShowingNegAlert = false
    @State private var alertInput = ""
   
    @AppStorage("instructions") var instructions: [String] = [
            "Items can be deleted by swiping left", 
            "Double tap the +/- sign to add/substract the counter",
            "Long press the +/- to add an action for record",
            "Tap the counter number to input direcgtly"
    ]
    
    var body: some View {
        VStack (spacing:0){
            HStack {
                VStack (spacing: -15){
                        Text("+")
                            .onAppear{add()}
                            .onTapGesture (count: 2){
                                do {
                                    increment(targets.first!)
                                    try viewContext.save()
                                } catch {
                                    print("error")
                                }
                            }
                            .onLongPressGesture {
                                isShowingPosAlert.toggle()
                                alertInput = ""
                            }
                            .font(.system(size: 60))
                            .padding(.bottom, 10)
                            .zIndex(1)
                            .foregroundColor(.green)
                    
                    List{
                        ForEach(instructions, id: \.self) { item in
                            Text("\(item)")
                        }
                        .onDelete(perform: deleteInstructions)
                        .font(.system(size: 14.0))
                        
                        ForEach(positives) { item in
                            Text(item.title ?? "Unknown Title")
                        }
                        .onDelete(perform: deletePositive)
                        .font(.system(size: 14.0))
                    }
                    .environment(\.defaultMinListRowHeight, 8)
                }
                .listStyle(.plain)
                
                VStack (spacing: -15){
                    Text("-")
                        .onTapGesture (count: 2){
                            do {
                                reduction(targets.first!)
                                try viewContext.save()
                            } catch {
                                print("error")
                            }
                        }
                        .onLongPressGesture {
                            isShowingNegAlert.toggle()
                            alertInput = ""
                        }
                        .font(.system(size: 60))
                        .padding(.bottom, 10)
                        .zIndex(1)
                        .foregroundColor(.red)
                    List{
                        ForEach(instructions, id: \.self) { item in
                            Text("\(item)")
                        }
                        .onDelete(perform: deleteInstructions)
                        .font(.system(size: 14.0))
                        ForEach(negatives) { item in
                            Text(item.title ?? "Unknown Title")
                        }
                        .onDelete(perform: deleteNegative)
                        .font(.system(size: 14.0))
                    }
                    .environment(\.defaultMinListRowHeight, 8)
                }.listStyle(.plain)
            }
            Spacer()
        }
        .posTextFieldAlert(isShowing: $isShowingPosAlert, text: $alertInput, title: "Win")
        .negTextFieldAlert(isShowing: $isShowingNegAlert, text: $alertInput, title: "Misstep")
    }
        
    func increment(_ item: TargetEntity) {
            item.countnum += 1
            save()
    }
    
    func reduction(_ item: TargetEntity) {
            item.countnum -= 1
            save()
    }
    
    func add() {
        let countnum = TargetEntity(context: viewContext)
        countnum.countnum = 0
        save()
    }
    
    func addPositive(){
        let newPositive = PositiveEntity(context: viewContext)
        newPositive.title = alertInput
        save()
    }
    
    func deletePositive(item: PositiveEntity) {
        viewContext.delete(item)
        save()
    }
    
    func addNegative(){
        let newNegative = NegativeEntity(context: viewContext)
        newNegative.title = alertInput
        save()
    }
    
    func deleteNegative(item: NegativeEntity) {
        viewContext.delete(item)
        save()
    }
    
     private func deletePositive(offsets: IndexSet) {
         withAnimation {
             offsets.map { positives[$0] }.forEach(viewContext.delete)

             do {
                 try viewContext.save()
             } catch {
                 let nsError = error as NSError
                 fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
             }
         }
     }
    
    private func deleteNegative(offsets: IndexSet) {
        withAnimation {
            offsets.map { negatives[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
    
    func deleteInstructions(at offsets: IndexSet) {
        instructions.remove(atOffsets: offsets)
    }
    
    func save() {
        do { try viewContext.save() } catch { print(error) }
    }
    
}



extension Array: RawRepresentable where Element: Codable {
    public init?(rawValue: String) {
        guard let data = rawValue.data(using: .utf8),
              let result = try? JSONDecoder().decode([Element].self, from: data)
        else {
            return nil
        }
        self = result
    }

    public var rawValue: String {
        guard let data = try? JSONEncoder().encode(self),
              let result = String(data: data, encoding: .utf8)
        else {
            return "[]"
        }
        return result
    }
}


struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ListView(viewContext: NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType),
                     positives: [],
                     negatives: [],
                     targets: [])//.environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
        }
        
    }
}

