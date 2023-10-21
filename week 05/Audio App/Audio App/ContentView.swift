import SwiftUI


struct ContentView: View {
    @State private var navPath = NavigationPath()
    let selections: [String: Any] = ["My Favorite Song": PlayFavSong(), "Study Break": AudioRow(audio: audiofiles[0])]
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
    }
    var body: some View {
        VStack {
            NavigationStack(path: $navPath) {
                ZStack {
                    Color("DarkBG").ignoresSafeArea()
                    
                    VStack(alignment: .center) {
                        NavigationLink (destination: PlayFavSong()) {
                            Text("My Favorite Song")
                                .font(Font.custom("Archivo-ExtraBold", size: 24))
                                //.font(.title)
                        }
                        .padding(/*@START_MENU_TOKEN@*/.all, 10.0/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.black)
                        .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(hue: 0.391, saturation: 0.822, brightness: 0.705)/*@END_MENU_TOKEN@*/)
                        .hoverEffect(/*@START_MENU_TOKEN@*/.lift/*@END_MENU_TOKEN@*/)
                        .cornerRadius(/*@START_MENU_TOKEN@*/5.0/*@END_MENU_TOKEN@*/)
                        .frame(maxWidth: .infinity)
                        NavigationLink (destination: AudioRow(audio: audiofiles[0])) {
                            Text("Study Break")
                                .font(Font.custom("Archivo-ExtraBold", size: 24))
                        }
                        .padding(/*@START_MENU_TOKEN@*/.all, 10.0/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.black)
                        .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(hue: 0.391, saturation: 0.822, brightness: 0.705)/*@END_MENU_TOKEN@*/)
                        .cornerRadius(/*@START_MENU_TOKEN@*/5.0/*@END_MENU_TOKEN@*/)
                        .frame(maxWidth: .infinity)
                        
                    }
                    .navigationTitle("Emily's Space")
                    .font(Font
                        .custom("Archivo-ExtraBold", size: 36))
                    .padding(/*@START_MENU_TOKEN@*/.all, 20.0/*@END_MENU_TOKEN@*/)
                    
                    
                }
                .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(red: 0.631, green: 0.0, blue: 0.0)/*@END_MENU_TOKEN@*/)
            }
        }
    }
}


struct NavPage_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
