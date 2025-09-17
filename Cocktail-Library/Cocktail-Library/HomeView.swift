import SwiftUI

struct HomeView: View {
    @State private var searchText = ""
    @State private var selectedBases: Set<String> = []
    @State private var selectedStyles: Set<String> = []
    @State private var selectedFlavors: Set<String> = []
    
    let bases = ["Gin", "Vodka", "Rum", "Whiskey", "Tequila","Brandy","Mezcal","Sake","Soju"]
    let styles = ["Spritz","Highball","Martini","Old_fashioned","Tiki"]
    let flavors = ["Sweet", "Bitter", "Sour", "Fruity", "Spicy"]
    
    
    var body: some View {
        TabView{
            VStack() {
                // Title
                Text("Cocktail Library")
                    .font(.largeTitle)
                    .bold()
                    .padding(.top)
                Text("Today's Pick")
                    .font(.headline)
                // Banner
                ZStack{
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.blue.opacity(0.2))
                        .frame(height: 100)
                        .shadow(radius: 3)

                }
                // Search Bar
                SearchBar(text: $searchText)
                
                // Filter
                Group {
                    Text("Base").font(.headline).padding()
                    MultiSelectChips(options: bases, selection: $selectedBases)
                    
                    Text("Style").font(.headline).padding()
                    MultiSelectChips(options: styles, selection: $selectedStyles)
                    
                    Text("Flavor").font(.headline).padding()
                    MultiSelectChips(options: flavors, selection: $selectedFlavors)
                }
                
                
            }
            .tabItem{
                Label("Home", systemImage: "house.fill")
            }
            LibraryView()
                .tabItem{
                    Label("Library", systemImage:"book.fill")
                }
            CreateNew()
                .tabItem{
                    Label("Create", systemImage:"heart.fill")
                }
            
            ProfileView()
                .tabItem{
                    Label("Profile", systemImage:"circle.fill")
                }
            
        }
    }
}



// Search Bar
struct SearchBar: View {
    @Binding var text: String
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
            TextField("Search...", text: $text)
                .textFieldStyle(PlainTextFieldStyle())
        }
        .padding(8)
        .background(Color(.systemGray6))
        .cornerRadius(12)
        .padding(.horizontal)
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
