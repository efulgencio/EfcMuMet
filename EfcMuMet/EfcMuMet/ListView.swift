//
//  ContentView.swift
//  EfcMuMet
//
//  Created by efulgencio on 10/5/24.
//

import SwiftUI

struct ListView: View {
    var body: some View {
        ZStack {
            Color.black
            VStack {
                HeaderList
                ListOptions
                HorizontalView
            }
        }.ignoresSafeArea()
    }

}

#Preview {
    ListView()
}


private var ListOptions: some View {
    ScrollView {
        ForEach(museus, id: \.self) { item in
            HStack(spacing:5){
                Button(action: {
                        print("Button pressed")
                    }) {
                        ZStack(alignment: .leading) {
                            Rectangle()
                                .fill(LinearGradient(gradient: Gradient(colors: [.black, .black.opacity(0.8), .gray]), startPoint: .leading, endPoint: .trailing))
                                .background(Color.yellow.opacity(0.6))
                                .cornerRadius(20)
                            HStack {
                                Text(item.name)
                                    .padding(0)
                                Spacer()
                            RectangleColorsBottom(nameImage: "departamentid\(item.id)", maxSize: 80)
                                .padding(.trailing, 2)
                            }

                        }.padding(0)
                    }
                    .buttonStyle(CapsuleBthStyle())
                    .frame(maxWidth: .infinity)
            }
            .frame(height: 80)
            .padding(.horizontal, 0)
        }
    }
}

private var HorizontalView: some View {
    ScrollView(.horizontal, showsIndicators: false) {
        HStack(spacing: 10) {
            ForEach(museus, id: \.self) { item in
                VStack {
                    Image("departamentid\(item.id)")
                        .resizable()
                        .frame(maxWidth: .infinity)
                        .frame(height:70)
                        .cornerRadius(10)
                    Text(item.name)
                        .foregroundColor(.white)
                }
            }
        }
        .padding()
    }
}

private var HeaderList: some View {
    VStack {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [
                Color.black.opacity(0.1),
                Color.black.opacity(0.2),
                Color.black.opacity(0.3),
                Color.black.opacity(0.4)
            ]),
                           startPoint: .topLeading,
                           endPoint: .bottom
            ).edgesIgnoringSafeArea(.all)
            Text("The Metropolitan Museum of Art Collection")
                .font(.title3)
                .foregroundColor(.white)
                .bold()
                .multilineTextAlignment(.center)
        }
    }
    .padding(.top, 20)
    .frame(maxWidth: .infinity)
    .frame(height: 150)
    .background(Color.white.opacity(1))
    .clipShape(RoundedCorner(radius: 80, corners: [.bottomLeft,.bottomRight]))
}

struct RoundedCorner: Shape {
    
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        
        return Path(path.cgPath)
    }
}


struct RectangleColorsBottom: View {
    
    let nameImage: String
    let maxSize: Int
    
    init(nameImage: String = "phone", maxSize: Int = 60) {
        self.nameImage = nameImage
        self.maxSize = maxSize
    }
    
    var body: some View {
        HStack {
            Image(nameImage)
                .resizable()
                .scaledToFill()
                .frame(width: 70, height: 70)
        }
        .background(Color.blue)
        .cornerRadius(15)
    }
}

struct CapsuleBthStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .foregroundColor(.white)
            .background(configuration.isPressed ? Color.black.opacity(0.5) : Color.black)
            .cornerRadius(30)
            .padding(.horizontal, 2)
            .scaleEffect(configuration.isPressed ? 0.90 : 1.0)
    }
}

struct Museu : Hashable {
    let id: Int
    let name: String
}

let museus = [
            Museu(id: 1, name: "American Decorative Arts"),
            Museu(id: 3, name: "Ancient Near Eastern Art"),
            Museu(id: 4, name: "Arms and Armor"),
            Museu(id: 5, name: "Arts of Africa, Oceania, and the Americas"),
            Museu(id: 6, name: "Asian Art"),
            Museu(id: 9, name: "Drawings and Prints"),
            Museu(id: 10, name: "Egyptian Art"),
            Museu(id: 11, name: "European Paintings"),
            Museu(id: 12, name: "European Sculpture and Decorative Arts"),
            Museu(id: 13, name: "Greek and Roman Art"),
            Museu(id: 14, name: "Islamic Art"),
            Museu(id: 17, name: "Medieval Art"),
            Museu(id: 18, name: "Musical Instruments"),
            Museu(id: 19, name: "Photographs"),
            Museu(id: 21, name: "Modern Art")
        ]
