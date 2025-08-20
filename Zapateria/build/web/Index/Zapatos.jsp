<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Zapatería - Gestión</title>
    <link rel="icon" type="image/x-icon" href="Images/zapateria_logo.png">
   <link rel="stylesheet" href="Styles/ventas.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container">
        <a class="navbar-brand" href="${pageContext.request.contextPath}/index.jsp">Zapatería</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/Controlador?menu=Zapatos&accion=Listar">Zapatos</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/Controlador?menu=Ventas&accion=Listar">Ventas</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/index.jsp">Inicio</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<section class="container mt-4">
    <h2>Gestión de Zapatos</h2>

    <!-- Formulario de búsqueda -->
    <form action="${pageContext.request.contextPath}/Controlador?menu=Zapatos&accion=Buscar" method="post" class="mb-4">
        <div class="input-group">
            <input type="text" name="txtBuscar" class="form-control" placeholder="Buscar por ID...">
            <button type="submit" class="btn btn-primary"><i class="fas fa-search"></i> Buscar</button>
        </div>
    </form>

    <!-- Tabla de zapatos -->
    <table class="table table-striped">
        <thead>
        <tr>
            <th>ID</th>
            <th>Modelo</th>
            <th>Talla</th>
            <th>Precio</th>
            <th>Stock</th>
            <th>Acciones</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="zapato" items="${zapatos}">
            <tr>
                <td>${zapato.idZapato}</td>
                <td>${zapato.nombreZapato}</td>
                <td>${zapato.tallaZapato}</td>
                <td>${zapato.precioZapato}</td>
                <td>${zapato.stockZapato}</td>
                <td>
                    <a href="${pageContext.request.contextPath}/Controlador?menu=Zapatos&accion=Editar&id=${zapato.idZapato}" class="btn btn-warning btn-sm">
                        <i class="fas fa-edit"></i> Editar
                    </a>
                    <a href="${pageContext.request.contextPath}/Controlador?menu=Zapatos&accion=Eliminar&id=${zapato.idZapato}" class="btn btn-danger btn-sm">
                        <i class="fas fa-trash"></i> Eliminar
                    </a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <div class="row">
        <!-- Agregar Zapato -->
        <div class="col-md-6">
            <h3>Agregar Zapato</h3>
            <form action="${pageContext.request.contextPath}/Controlador?menu=Zapatos&accion=Agregar" method="post">
                <div class="mb-3">
                    <label class="form-label">Modelo</label>
                    <input type="text" name="txtNombre" class="form-control" required>
                </div>
                <div class="mb-3">
                    <label class="form-label">Talla</label>
                    <input type="text" name="txtTalla" class="form-control" required>
                </div>
                <div class="mb-3">
                    <label class="form-label">Precio</label>
                    <input type="number" name="txtPrecio" class="form-control" step="0.01" required>
                </div>
                <div class="mb-3">
                    <label class="form-label">Stock</label>
                    <input type="number" name="txtStock" class="form-control" required>
                </div>
                <button type="submit" class="btn btn-primary"><i class="fas fa-plus"></i> Agregar</button>
            </form>
        </div>

        <!-- Actualizar Zapato -->
        <div class="col-md-6">
            <h3>Actualizar Zapato</h3>
            <form action="${pageContext.request.contextPath}/Controlador?menu=Zapatos&accion=Actualizar" method="post">
                <input type="hidden" name="txtId" value="${zapato != null ? zapato.idZapato : ''}">
                <div class="mb-3">
                    <label class="form-label">Modelo</label>
                    <input type="text" name="txtNombre" class="form-control" value="${zapato != null ? zapato.nombreZapato : ''}">
                </div>
                <div class="mb-3">
                    <label class="form-label">Talla</label>
                    <input type="text" name="txtTalla" class="form-control" value="${zapato != null ? zapato.tallaZapato : ''}">
                </div>
                <div class="mb-3">
                    <label class="form-label">Precio</label>
                    <input type="number" name="txtPrecio" class="form-control" step="0.01" value="${zapato != null ? zapato.precioZapato : ''}">
                </div>
                <div class="mb-3">
                    <label class="form-label">Stock</label>
                    <input type="number" name="txtStock" class="form-control" value="${zapato != null ? zapato.stockZapato : ''}">
                </div>
                <button type="submit" class="btn btn-success"><i class="fas fa-save"></i> Actualizar</button>
            </form>
        </div>
    </div>
</section>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
