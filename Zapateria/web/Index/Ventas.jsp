<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Zapatería - Gestión de Ventas</title>
    <link rel="icon" type="image/x-icon" href="Images/zapateria_logo.png">
    <link rel="stylesheet" href="Styles/ventas.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container">
        <a class="navbar-brand" href="${pageContext.request.contextPath}/Controlador?menu=Ventas">Zapatería</a>
        <div class="collapse navbar-collapse">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/Controlador?menu=Zapatos&accion=Listar">Zapatos</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/Controlador?menu=Ventas&accion=Listar">Ventas</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<section class="container mt-4">
    <h2>Gestión de Ventas</h2>

    <!-- Formulario de búsqueda -->
    <form action="${pageContext.request.contextPath}/Controlador?menu=Ventas&accion=Buscar" method="post" class="mb-4">
        <div class="input-group">
            <input type="text" name="txtBuscar" class="form-control" placeholder="Buscar por ID de Venta...">
            <button type="submit" class="btn btn-primary"><i class="fas fa-search"></i> Buscar</button>
        </div>
    </form>

    <!-- Tabla de ventas -->
    <table class="table table-striped">
        <thead>
            <tr>
                <th>ID Venta</th>
                <th>Fecha</th>
                <th>Cliente</th>
                <th>ID Zapato</th>
                <th>Cantidad</th>
                <th>Total</th>
                <th>Acciones</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="venta" items="${ventas}">
                <tr>
                    <td>${venta.codigoVenta}</td>
                    <td>${venta.fechaVenta}</td>
                    <td>${venta.clienteNombre}</td>
                    <td>${venta.codigoZapato}</td>
                    <td>${venta.cantidad}</td>
                    <td>${venta.total}</td>
                    <td>
                        <a href="${pageContext.request.contextPath}/Controlador?menu=Ventas&accion=Editar&id=${venta.codigoVenta}" class="btn btn-warning btn-sm">
                            <i class="fas fa-edit"></i> Editar
                        </a>
                        <a href="${pageContext.request.contextPath}/Controlador?menu=Ventas&accion=Eliminar&id=${venta.codigoVenta}" class="btn btn-danger btn-sm">
                            <i class="fas fa-trash"></i> Eliminar
                        </a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

    <div class="row">
        <!-- Agregar Venta -->
        <div class="col-md-6">
            <h3>Agregar Venta</h3>
            <form action="${pageContext.request.contextPath}/Controlador?menu=Ventas&accion=Agregar" method="post">
                <div class="mb-3">
                    <label class="form-label">Fecha</label>
                    <input type="date" name="txtFecha" class="form-control" required>
                </div>
                <div class="mb-3">
                    <label class="form-label">Cliente</label>
                    <input type="text" name="txtCliente" class="form-control" required>
                </div>
                <div class="mb-3">
                    <label class="form-label">ID Zapato</label>
                    <input type="number" name="txtZapato" class="form-control" required>
                </div>
                <div class="mb-3">
                    <label class="form-label">Cantidad</label>
                    <input type="number" name="txtCantidad" class="form-control" required>
                </div>
                <div class="mb-3">
                    <label class="form-label">Total</label>
                    <input type="number" name="txtTotal" class="form-control" step="0.01" required>
                </div>
                <button type="submit" class="btn btn-primary"><i class="fas fa-plus"></i> Agregar</button>
            </form>
        </div>

        <!-- Actualizar Venta -->
        <div class="col-md-6">
            <h3>Actualizar Venta</h3>
            <form action="${pageContext.request.contextPath}/Controlador?menu=Ventas&accion=Actualizar" method="post">
                <input type="hidden" name="txtId" value="${venta != null ? venta.codigoVenta : ''}">
                <div class="mb-3">
                    <label class="form-label">Fecha</label>
                    <input type="date" name="txtFecha" class="form-control" value="${venta != null ? venta.fechaVenta : ''}">
                </div>
                <div class="mb-3">
                    <label class="form-label">Cliente</label>
                    <input type="text" name="txtCliente" class="form-control" value="${venta != null ? venta.clienteNombre : ''}">
                </div>
                <div class="mb-3">
                    <label class="form-label">ID Zapato</label>
                    <input type="number" name="txtZapato" class="form-control" value="${venta != null ? venta.codigoZapato : ''}">
                </div>
                <div class="mb-3">
                    <label class="form-label">Cantidad</label>
                    <input type="number" name="txtCantidad" class="form-control" value="${venta != null ? venta.cantidad : ''}">
                </div>
                <div class="mb-3">
                    <label class="form-label">Total</label>
                    <input type="number" name="txtTotal" class="form-control" step="0.01" value="${venta != null ? venta.total : ''}">
                </div>
                <button type="submit" class="btn btn-success"><i class="fas fa-save"></i> Actualizar</button>
            </form>
        </div>
    </div>
</section>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
