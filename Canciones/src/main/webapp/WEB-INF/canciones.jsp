<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Canciones</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body class="d-flex justify-content-center align-items-center" style="min-height: 100vh; background-color: #f8f9fa;">
	<main class="container">
		<div class="row justify-content-center">
			<div class="col-12 col-md-6">
				<h1 class="text-center">Lista de Canciones</h1>
				<table class="table table-striped table-hover shadow-sm rounded">
					<thead>
						<tr>
							<th>Titulo</th>
							<th>Autor</th>
							<th>Detalles</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${cancionesLista}" var="cancion">
							<tr>
								<td>${cancion.titulo}</td>
								<td>${cancion.artista}</td>
								<td>
									<a href="/canciones/detalle/${cancion.id}" class="btn btn-primary">Ver detalles</a>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div class="text-center mt-4 mb-4">
					<a href="/canciones/formulario/agregar" class="btn btn-success">Agregar una Canción</a>
				</div>
			</div>
		</div>
	</main>
</body>
</html>