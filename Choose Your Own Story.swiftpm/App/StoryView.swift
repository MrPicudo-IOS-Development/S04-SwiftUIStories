/* StoryView.swift --> Stories. Created by Miguel Torres on 09/04/2023 */

import SwiftUI

/// Es la primer vista de nuestra aplicación. Al momento de iniciar la app, vamos a ver la vista que definimos aquí.
struct StoryView: View {

    var body: some View {
        // El NavigationStack es equivalente al NavigationController que usamos en Storyboards.
        NavigationStack {
            // Creamos un objeto de la estructura StoryPageView para definir el origen del NavigationStack.
            StoryPageView(story: story, pageIndex: 0)
            // El NavigationStack muestra solo una página de historia a la vez y la actualiza cada vez que el usuario da clic sobre un "Navigation Link".
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        StoryView()
    }
}
