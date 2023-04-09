/* StoryPageView.swift --> Stories. Created by Miguel Torres on 09/04/2023 */

import SwiftUI

/// Muestra la historia para que el usuario pueda navegar entre los diferentes caminos de la app al hacer decisiones que se muestran en cada página de historia
struct StoryPageView: View {

    // Esta constante es la misma que definimos en el archivo "MyStory.swift", ya que ahí es una variable global.
    let story: Story
    let pageIndex: Int // Almacena el índice de la página de historia actual.
    // Aquí no se inicializa nada, solamente de definen los atributos y cada vez que creamos una instancia de la estructura "StoryPageView" se define quién es el objeto "Story" y cuál es el índice.

    var body: some View {
        
        // Toda la vista de cada página de historia se organiza en un stack vertical, con un ScrollView y una lista de NavigationLinks que muestran las opciones que tenemos en cada página.
        VStack {
            // Muestra el texto de cada página de historia, en una scroll view para que no haya problemas de espacio.
            ScrollView {
                Text(story[pageIndex].text)
            }
            
            // Muestra todas las opciones que tenemos en cada historia, sin importar cuántos sean (por eso el ForEach), y las pone dentro de un link de navegación, que parece un botón (pero no lo es), pues manda a una vista diferente en conjunto con el NavigationStack cada vez que se da clic sobre uno de los links.
            ForEach(story[pageIndex].choices, id: \Choice.text) { choice in
                NavigationLink(destination: StoryPageView(story: story, pageIndex: choice.destination)) {
                    Text(choice.text) // Lo único que muestra el link de navegación es el texto formateado de cada opción
                        .multilineTextAlignment(.leading)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(Color.black)
                        .padding()
                        .background(Color.green.opacity(0.50))
                        .cornerRadius(8)
                }
            }
            // En este ForEach identificamos a cada elemento del arreglo de "choices" que tiene cada página de historia, por medio del texto de esa opción (ya que no hay textos iguales). Siempre que recorramos una colección con un ForEach debemos dar una manera de diferenciar un elemento con respecto a otro, por eso es necesario el "id: \Choice.text"
            // Es importante mencionar que los NavigationLink no funcionan a menos que se encuentren dentro de un Navigation View, como el que creamos con "NavigationStack" en el archivo "StoryView.swift". Entonces no van a funcionar los links de nuestro proyecto en la vista previa del archivo "StoryPageView", pero si van a funcionar en la vista previa de toda la app, ya que los NavigationLinks se cargan desde el archivo que si contiene el stack de navegación.
        }
        // Los modificadores .navigation solamente funcionan cuando la vista está relacionada con una NavigationView como el NavigationStack que tenemos en el proyecto.
            .padding()
            .navigationTitle("Page \(pageIndex + 1)")
            .navigationBarTitleDisplayMode(.inline)
        
    }
    
}

struct NonlinearStory_Previews: PreviewProvider {
    static var previews: some View {
        StoryPageView(story: story, pageIndex: 0)
    }
}
