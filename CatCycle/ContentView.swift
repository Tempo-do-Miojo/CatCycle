//
//  ContentView.swift
//  CatCycle
//
//  Created by PATRICIA S SIQUEIRA on 13/05/21.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext

    private var items = CoreDataManager.fetchDay(in: 5, year: 2021)

    var body: some View {
        NavigationView {
        VStack {
            List {
                ForEach(0..<items.count) { index in
                    Text("Item at \(items[index].bleedingRawValue ?? "")")
                }
                .onDelete(perform: deleteItems)
            }
            .toolbar {
                Button(action: addItem) {
                    Label("Add Item", systemImage: "plus")
                }
                }
            }
        }
    }

    private func addItem() {
        withAnimation {
            let newItem = DayTrack.init(context: viewContext)
            newItem.date = Date()
            newItem.bleedingRawValue = Bleeding.heavy.rawValue

            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
