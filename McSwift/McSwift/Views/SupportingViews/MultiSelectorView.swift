//
//  MultiSelectorView.swift
//  McSwift
//
//  https://github.com/SimplyKyra/SimplyKyraBlog/blob/main/SwiftExamples/CustomMultiSelectionPicker.swift
//

import SwiftUI

struct MultiSelectorView: View {
    // The list of items we want to show
    @State var allItems: [String]
    @State var title: String?

    // Binding to the selected items we want to track
    @Binding var selectedItems: [String]
    

    var body: some View {
        Form {
            List {
                ForEach(allItems, id: \.self) { item in
                    Button(action: {
                        withAnimation {
                            if self.selectedItems.contains(item) {
                                // Previous comment: you may need to adapt this piece
                                self.selectedItems.removeAll(where: { $0 == item })
                            } else {
                                self.selectedItems.append(item)
                            }
                        }
                    }) {
                        //changed this part
                        HStack {
                            !selectedItems.contains(item) ? Image(systemName: "circle") : Image(systemName: "checkmark.circle.fill")
                            
                            Text(item)
                        }
                    }
                    .foregroundColor(.primary)
                }
            }
        }
       
    }
}


#Preview {
    struct Preview: View {
        
        @State var previewSelected: [String] = []
        
        var body: some View {
            MultiSelectorView (allItems: ["Yoga", "Zumba", "Pilates"], title: "Select your courses", selectedItems: $previewSelected)
        }
    }

    return Preview()
}
