/* StoryModels.swift --> Stories. Created by Miguel Torres on 09/04/2023 */

/// La estructura principal sirve para crear un arreglo de StoryPages, al cual vamos a poder acceder a través del índice del arreglo, que representa una página de historia distinta.
struct Story {
    // Atributo principal, es la base del proyecto.
    let pages: [StoryPage]
    // Los subscripts se utilizan para acceder o modificar los elementos de una colección de manera intuitiva y fácil. Este subscript nos permite acceder a las páginas de la historia por su índice.
    subscript(_ pageIndex: Int) -> StoryPage {
        return pages[pageIndex]
    }
    // Básicamente nos permite acceder de manera más sencilla a las páginas, por ejemplo: si creamos una instancia de la estructura Story, llamada "myStory", sin el subscript accederíamos a las páginas con "myStory.pages[n]" pero con el subscript, podemos acceder a las páginas con "myStory[n]".
}

/// El arreglo de la primer estructura está formado por objetos de tipo "StoryPage"
struct StoryPage {
    // El primer atributo de una página de historia es el texto que explica la situación que está ocurriendo.
    let text: String
    // Después, aparecen las opciones, que ordenamos en un arreglo porque van a variar en número en cada historia.
    let choices: [Choice]
    // Para crear de manera eficiente las páginas de la historia, definimos en el constructor de la estructura, que no se necesite escribir el parámetro "text" para crear un objeto, pero si el parámetro "choises" para diferenciar fácilmente el arreglo de opciones que vamos a tener.
    init(_ text: String, choices: [Choice]) {
        self.text = text
        self.choices = choices
    }
}

/// Las opciones de la estructura "StoryPage" están formadas por un arreglo de objetos de tipo "Choice"
struct Choice {
    let text: String
    let destination: Int
}
