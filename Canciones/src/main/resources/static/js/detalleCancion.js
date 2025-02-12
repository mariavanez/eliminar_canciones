
//API de Itunes para las portadas:

document.addEventListener("DOMContentLoaded", function() {
	let titulo = document.getElementById("tituloCancion").textContent;
	let artista = document.getElementById("artistaCancion").textContent;
	let imgPortada = document.getElementById("portadaCancion");
	
	let enlace = `https://itunes.apple.com/search?term=${encodeURIComponent(artista + " " + titulo)}&entity=song&limit=1`;
	
	fetch(enlace)
		.then(respuesta => respuesta.json())
		.then(dato => {
			if(dato.results.length > 0) {
				imgPortada.src = dato.results[0].artworkUrl100.replace("100x100", "200x200");	
			}
		})
		.catch(error => console.log("Error al cargar la portada", error));
		
		//Confirmar la eliminación
		const formsEliminar = document.querySelectorAll(".formEliminar");
			formsEliminar.forEach(form => {
				form.addEventListener("submit", function (event) {
					const confirmar = confirm("¿Estás segur@ de querer eliminar esta canción?");
					if(!confirmar) {
						event.preventDefault();
			}
		})
	})
});