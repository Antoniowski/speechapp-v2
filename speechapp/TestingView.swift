//TEST

import SwiftUI

struct ColorPicker: View{
    var gridLayout = Array(repeating: GridItem(.flexible()), count: 6)
    var colors = colorArray
    @Binding var chosenColor: Color
    
    var body: some View{
        LazyVGrid(columns: gridLayout, spacing: 10) {
            ForEach(colors, id: \.self){ color in
                ZStack {
                    Circle()
                        .fill(color)
                        .frame(width: UIScreen.main.bounds.height*0.045, height: UIScreen.main.bounds.height*0.045)
                        .onTapGesture(perform: {
                            chosenColor = color
                        })
                        .padding(5)
                    if chosenColor == color {
                        Circle()
                            .stroke(color, lineWidth: 4)
                            .frame(width: UIScreen.main.bounds.height*0.055, height: UIScreen.main.bounds.height*0.055)
                    }
                }
            }
        }
        .padding(10)
    }
}

struct EditView: View{
    @State var title: String = ""
    @State var subtitle: String = ""
    @State var partType: PartType = .mid
    @State var color: Color = .black
    
    var body: some View{
        NavigationView{
            Form{
                Section("Section info"){
                    TextField("Title", text: $title)
                    TextField("Subtitle", text: $subtitle)
                    
                }
                Section("Type"){
                    Picker("Type", selection: $partType){
                        Text("Beginning").tag(PartType.start)
                        Text("Body").tag(PartType.mid)
                        Text("End").tag(PartType.end)
                    }
                    .pickerStyle(.segmented)
                    .padding()
                }
                Section("Color"){
                    ColorPicker(chosenColor: $color)
                }
            }
            .toolbar{navigationBarItems}
        }
    }
    
    @ViewBuilder
    var navigationBarItems: some View {
        HStack{
            Button(action: {
            }, label: {
                Text("Done")
            })
        }
        .padding()
    }
}

struct Testing_Previews: PreviewProvider {
    static var previews: some View {
        EditView()
    }
}
