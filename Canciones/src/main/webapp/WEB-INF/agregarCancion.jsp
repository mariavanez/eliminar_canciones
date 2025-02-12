<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Agregar una canción</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body class="d-flex justify-content-center align-items-center" style="min-height: 100vh; background-color: #f8f9fa;">
	<main class="container">
		<div class="row justify-content-center">
			<div class="col-12 col-md-6">
				<h1 class="text-center mb-3">¡Agrega una nueva canción!</h1>
				<form:form action="/canciones/procesa/agregar" method="post" modelAttribute="cancion" >
					<div class="mb-3 shadow-sm">
						<form:label path="titulo" class="form-label">Título:</form:label>
						<form:input path="titulo" placeholder="Ingresa un título..." class="form-control"></form:input>
						<form:errors path="titulo" class="text-danger bg-light rounded p-1 d-block mt-1"></form:errors>
					</div>
					<div class="mb-3 shadow-sm">
						<form:label path="artista" class="form-label">Artista:</form:label>
						<form:input path="artista" placeholder="Ingresa un artista..." class="form-control"></form:input>
						<form:errors path="artista" class="text-danger bg-light rounded p-1 d-block mt-1"></form:errors>
					</div>
					<div class="mb-3 shadow-sm">
						<form:label path="album" class="form-label">Álbum:</form:label>
						<form:input path="album" placeholder="Ingresa un album..." class="form-control"></form:input>
						<form:errors path="album" class="text-danger bg-light rounded p-1 d-block mt-1"></form:errors>
					</div>
					<div class="mb-3 shadow-sm">
						<form:label path="genero" class="form-label">Género:</form:label>
						<form:input path="genero" placeholder="Ingresa un género..." class="form-control"></form:input>
						<form:errors path="genero" class="text-danger bg-light rounded p-1 d-block mt-1"></form:errors>
					</div>
					<div class="mb-3 shadow-sm">
						<form:label path="idioma"  class="form-label">Idioma:</form:label>
						<form:input path="idioma" placeholder="Ingresa el idioma..."  class="form-control"></form:input>
						<form:errors path="idioma" class="text-danger bg-light rounded p-1 d-block mt-1"></form:errors>
					</div>
					<div class="d-flex justify-content-center align-items-center gap-3 mb-2">
						<button type="submit" class="btn btn-success">Agregar Canción</button>
						<a href="/canciones" class="btn btn-outline-secondary">🔙 Volver a la lista de canciones</a>
					</div>
				</form:form>
			</div>
		</div>
	</main>
</body>
</html>