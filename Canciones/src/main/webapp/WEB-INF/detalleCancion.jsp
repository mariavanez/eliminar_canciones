<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Detalles de la Canción</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body class="d-flex justify-content-center align-items-center" style="min-height: 100vh; background-color: #f8f9fa;">
	<main class="container">
		<div class="row justify-content-center">
			<div class="col-12 col-md-6">
				<h1 class="text-center mb-3">Detalles de ${cancion.titulo}</h1>
				<div class="text-center mb-4">
					<img src="https://via.placeholder.com/200" alt="Portada de ${cancion.titulo}" id="portadaCancion" class="img-fluid rounded shadow">
				</div>
				<table class="table table-striped table-hover shadow-sm rounded">
					<thead>
						<tr>
							<th>Titulo</th>
							<th>Artista</th>
							<th>Álbum</th>
							<th>Género</th>
							<th>Idioma</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td id="tituloCancion">${cancion.titulo}</td>
							<td id="artistaCancion">${cancion.artista}</td>
							<td>${cancion.album}</td>
							<td>${cancion.genero}</td>
							<td>${cancion.idioma}</td>
						</tr>
					</tbody>
				</table>
				<div class="d-flex justify-content-center align-items-center gap-3 mb-3">
					<a href="/canciones/formulario/editar/${cancion.id}" class="btn btn-primary">Editar Canción</a>
					<form action="/canciones/eliminar/${cancion.id}" method="post" class="formEliminar" style="display:inline;">
						<input type="hidden" name="_method" value="DELETE">
						<button type="submit" class="btn btn-danger">Eliminar Canción</button>
					</form>
				</div>
				<div class="d-flex justify-content-center align-items-center" >
					<a href="/canciones" class="btn btn-outline-secondary">🔙 Volver a la lista de canciones</a>
				</div>
				
			</div>
		</div>
	</main>
	
	<script src="/js/detalleCancion.js"></script>
</body>
</html>