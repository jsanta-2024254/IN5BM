<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Papitos Luxury Watch Store</title>
    <link rel="stylesheet" href="Styles/principal.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container">
            <a class="navbar-brand d-flex align-items-center" href="#">
                <img src="Images/LogoPapa.jpg" alt="Logo" width="50" height="50" class="me-2">
                <span>Papitos Luxury Tenis Store</span>
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                         <a class="nav-link" href="${pageContext.request.contextPath}/Controlador?menu=Ventas&accion=Listar">Ventas</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/Controlador?menu=Zapatos&accion=Listar">Zapatos</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Carrusel -->
    <div id="carouselExampleIndicators" class="carousel slide mt-3" data-bs-ride="carousel">
        <div class="carousel-indicators">
            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active"></button>
            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1"></button>
            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2"></button>
        </div>
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="Images/zapato1.jpg" class="d-block w-100" alt="Zapato 1">
            </div>
            <div class="carousel-item">
                <img src="Images/zapato2.jpg" class="d-block w-100" alt="Zapato 2">
            </div>
            <div class="carousel-item">
                <img src="Images/zapato4.jpg" class="d-block w-100" alt="Zapato 3">
            </div>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
            <span class="carousel-control-prev-icon"></span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
            <span class="carousel-control-next-icon"></span>
        </button>
    </div>

    <!-- Sección Conócenos -->
    <section class="conocenos">
        <h2>Conócenos</h2>
        <p>
            Bienvenido a Papitos Luxury Tenis Store, tu tienda de confianza para los mejores tenis de lujo.
            Nos dedicamos a ofrecer productos de alta calidad y atención personalizada. Visítanos y descubre
            nuestra amplia colección, diseñada para satisfacer tus gustos y necesidades.
        </p>
    </section>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
