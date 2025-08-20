package Controlador;

import com.zapateria.modelo.Zapato;
import com.zapateria.modelo.ZapatosDAO;
import com.zapateria.modelo.Ventas;
import com.zapateria.modelo.VentasDAO;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "ZapateriaControlador", urlPatterns = {"/Controlador"})
public class Controlador extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String menu = request.getParameter("menu");
        String accion = request.getParameter("accion");
        ZapatosDAO zapatosDAO = new ZapatosDAO();
        VentasDAO ventasDAO = new VentasDAO();

        if (menu == null) menu = "Zapatos";

        switch (menu) {

            case "Principal":
                response.sendRedirect("index.jsp");
                return;

            case "Zapatos":
                if (accion == null) accion = "Listar";

                switch (accion) {
                    case "Listar":
                        request.setAttribute("zapatos", zapatosDAO.listar());
                        request.getRequestDispatcher("/Index/Zapatos.jsp").forward(request, response);
                        return;

                    case "Buscar":
                        String idBuscarStr = request.getParameter("txtBuscar");
                        List<Zapato> listaBuscada = new ArrayList<>();
                        if (idBuscarStr != null && !idBuscarStr.trim().isEmpty()) {
                            try {
                                int idBuscar = Integer.parseInt(idBuscarStr);
                                Zapato zap = zapatosDAO.buscar(idBuscar);
                                if (zap != null && zap.getIdZapato() != 0) listaBuscada.add(zap);
                                else request.setAttribute("error", "Zapato no encontrado");
                            } catch (NumberFormatException e) {
                                request.setAttribute("error", "ID inválido");
                            }
                        } else {
                            request.setAttribute("error", "Debe ingresar un ID para buscar");
                        }
                        if (!listaBuscada.isEmpty()) request.setAttribute("zapatos", listaBuscada);
                        request.getRequestDispatcher("/Index/Zapatos.jsp").forward(request, response);
                        return;

                    case "Agregar":
                        try {
                            String nombre = request.getParameter("txtNombre");
                            String talla = request.getParameter("txtTalla");
                            double precio = Double.parseDouble(request.getParameter("txtPrecio"));
                            int stock = Integer.parseInt(request.getParameter("txtStock"));

                            Zapato nuevo = new Zapato();
                            nuevo.setNombreZapato(nombre);
                            nuevo.setTallaZapato(talla);
                            nuevo.setPrecioZapato(precio);
                            nuevo.setStockZapato(stock);

                            int res = zapatosDAO.agregar(nuevo);
                            if (res > 0) request.getSession().setAttribute("mensaje", "Zapato agregado correctamente");
                            else request.getSession().setAttribute("error", "Error al agregar el zapato");

                        } catch (NumberFormatException e) {
                            request.getSession().setAttribute("error", "Datos inválidos para precio o stock");
                        }
                        response.sendRedirect("Controlador?menu=Zapatos&accion=Listar");
                        return;

                    case "Editar":
                        try {
                            int id = Integer.parseInt(request.getParameter("id"));
                            Zapato zEditar = zapatosDAO.buscar(id);
                            request.setAttribute("zapato", zEditar);
                            request.setAttribute("zapatos", zapatosDAO.listar());
                        } catch (NumberFormatException e) {
                            request.setAttribute("error", "ID inválido");
                        }
                        request.getRequestDispatcher("/Index/Zapatos.jsp").forward(request, response);
                        return;

                    case "Actualizar":
                        try {
                            int id = Integer.parseInt(request.getParameter("txtId"));
                            String nombre = request.getParameter("txtNombre");
                            String talla = request.getParameter("txtTalla");
                            double precio = Double.parseDouble(request.getParameter("txtPrecio"));
                            int stock = Integer.parseInt(request.getParameter("txtStock"));

                            Zapato actualizar = new Zapato();
                            actualizar.setIdZapato(id);
                            actualizar.setNombreZapato(nombre);
                            actualizar.setTallaZapato(talla);
                            actualizar.setPrecioZapato(precio);
                            actualizar.setStockZapato(stock);

                            int filas = zapatosDAO.actualizar(actualizar);
                            if (filas > 0) request.getSession().setAttribute("mensaje", "Zapato actualizado correctamente");
                            else request.getSession().setAttribute("error", "Error al actualizar el zapato");

                        } catch (NumberFormatException e) {
                            request.getSession().setAttribute("error", "Datos inválidos para precio o stock");
                        }
                        response.sendRedirect("Controlador?menu=Zapatos&accion=Listar");
                        return;

                    case "Eliminar":
                        try {
                            int id = Integer.parseInt(request.getParameter("id"));
                            int filas = zapatosDAO.eliminar(id);
                            if (filas > 0) request.getSession().setAttribute("mensaje", "Zapato eliminado correctamente");
                            else request.getSession().setAttribute("error", "Error al eliminar el zapato");
                        } catch (NumberFormatException e) {
                            request.getSession().setAttribute("error", "ID inválido");
                        }
                        response.sendRedirect("Controlador?menu=Zapatos&accion=Listar");
                        return;

                    default:
                        request.setAttribute("error", "Acción no reconocida");
                        request.getRequestDispatcher("/Index/Zapatos.jsp").forward(request, response);
                        return;
                }

            case "Ventas":
                if (accion == null) accion = "Listar";

                switch (accion) {
                    case "Listar":
                        request.setAttribute("ventas", ventasDAO.listar());
                        request.getRequestDispatcher("/Index/Ventas.jsp").forward(request, response);
                        return;

                    case "Agregar":
                        try {
                            java.sql.Date fecha = java.sql.Date.valueOf(request.getParameter("txtFecha"));
                            String cliente = request.getParameter("txtCliente");
                            int codigoZapato = Integer.parseInt(request.getParameter("txtZapato"));
                            int cantidad = Integer.parseInt(request.getParameter("txtCantidad"));
                            double total = Double.parseDouble(request.getParameter("txtTotal"));

                            Ventas v = new Ventas();
                            v.setFechaVenta(fecha);
                            v.setClienteNombre(cliente);
                            v.setCodigoZapato(codigoZapato);
                            v.setCantidad(cantidad);
                            v.setTotal(total);

                            int res = ventasDAO.agregar(v);
                            if (res > 0) request.getSession().setAttribute("mensaje", "Venta registrada correctamente");
                            else request.getSession().setAttribute("error", "Error al registrar venta");

                        } catch (Exception e) {
                            request.getSession().setAttribute("error", "Datos inválidos en la venta");
                        }
                        response.sendRedirect("Controlador?menu=Ventas&accion=Listar");
                        return;

                    case "Editar":
                        try {
                            int id = Integer.parseInt(request.getParameter("id"));
                            Ventas vEditar = ventasDAO.buscar(id);
                            request.setAttribute("venta", vEditar);
                            request.setAttribute("ventas", ventasDAO.listar());
                        } catch (Exception e) {
                            request.setAttribute("error", "ID inválido");
                        }
                        request.getRequestDispatcher("/Index/Ventas.jsp").forward(request, response);
                        return;

                    case "Actualizar":
                        try {
                            int id = Integer.parseInt(request.getParameter("txtId"));
                            java.sql.Date fecha = java.sql.Date.valueOf(request.getParameter("txtFecha"));
                            String cliente = request.getParameter("txtCliente");
                            int codigoZapato = Integer.parseInt(request.getParameter("txtZapato"));
                            int cantidad = Integer.parseInt(request.getParameter("txtCantidad"));
                            double total = Double.parseDouble(request.getParameter("txtTotal"));

                            Ventas actualizar = new Ventas();
                            actualizar.setCodigoVenta(id);
                            actualizar.setFechaVenta(fecha);
                            actualizar.setClienteNombre(cliente);
                            actualizar.setCodigoZapato(codigoZapato);
                            actualizar.setCantidad(cantidad);
                            actualizar.setTotal(total);

                            int filas = ventasDAO.actualizar(actualizar);
                            if (filas > 0) request.getSession().setAttribute("mensaje", "Venta actualizada correctamente");
                            else request.getSession().setAttribute("error", "Error al actualizar venta");

                        } catch (Exception e) {
                            request.getSession().setAttribute("error", "Datos inválidos");
                        }
                        response.sendRedirect("Controlador?menu=Ventas&accion=Listar");
                        return;

                    case "Eliminar":
                        try {
                            int id = Integer.parseInt(request.getParameter("id"));
                            int filas = ventasDAO.eliminar(id);
                            if (filas > 0) request.getSession().setAttribute("mensaje", "Venta eliminada correctamente");
                            else request.getSession().setAttribute("error", "Error al eliminar venta");
                        } catch (Exception e) {
                            request.getSession().setAttribute("error", "ID inválido");
                        }
                        response.sendRedirect("Controlador?menu=Ventas&accion=Listar");
                        return;

                    default:
                        request.setAttribute("error", "Acción no reconocida");
                        request.getRequestDispatcher("/Index/Ventas.jsp").forward(request, response);
                        return;
                }

            default:
                request.setAttribute("error", "Menú no reconocido");
                request.getRequestDispatcher("/Index/error.jsp").forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Servlet para gestionar Zapatos y Ventas";
    }
}
