package com.zapateria.modelo;

import com.zapateria.config.Conexion;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class VentasDAO {

    // Listar todas las ventas
    public List<Ventas> listar() {
        List<Ventas> lista = new ArrayList<>();
        String sql = "CALL sp_ListarVentas()";

        try (Connection con = new Conexion().Conexion();
             CallableStatement cs = con.prepareCall(sql);
             ResultSet rs = cs.executeQuery()) {

            while (rs.next()) {
                Ventas v = new Ventas();
                v.setCodigoVenta(rs.getInt("idVenta"));   // idVenta en DB
                v.setFechaVenta(rs.getDate("fechaVenta"));
                v.setClienteNombre(rs.getString("clienteNombre"));
                v.setCodigoZapato(rs.getInt("idZapato")); // idZapato en DB
                v.setCantidad(rs.getInt("cantidad"));
                v.setTotal(rs.getDouble("total"));
                lista.add(v);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return lista;
    }

    // Agregar una venta
    public int agregar(Ventas venta) {
        int resp = 0;
        String sql = "CALL sp_AgregarVenta(?, ?, ?, ?, ?)";

        try (Connection con = new Conexion().Conexion();
             CallableStatement cs = con.prepareCall(sql)) {

            cs.setDate(1, venta.getFechaVenta());
            cs.setString(2, venta.getClienteNombre());
            cs.setInt(3, venta.getCodigoZapato());
            cs.setInt(4, venta.getCantidad());
            cs.setDouble(5, venta.getTotal());
            resp = cs.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return resp;
    }

    // Actualizar una venta
    public int actualizar(Ventas venta) {
        int resp = 0;
        String sql = "CALL sp_EditarVenta(?, ?, ?, ?, ?, ?)";

        try (Connection con = new Conexion().Conexion();
             CallableStatement cs = con.prepareCall(sql)) {

            cs.setInt(1, venta.getCodigoVenta());
            cs.setDate(2, venta.getFechaVenta());
            cs.setString(3, venta.getClienteNombre());
            cs.setInt(4, venta.getCodigoZapato());
            cs.setInt(5, venta.getCantidad());
            cs.setDouble(6, venta.getTotal());
            resp = cs.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return resp;
    }

    // Eliminar una venta
    public int eliminar(int id) {
        int resp = 0;
        String sql = "CALL sp_EliminarVenta(?)";

        try (Connection con = new Conexion().Conexion();
             CallableStatement cs = con.prepareCall(sql)) {

            cs.setInt(1, id);
            resp = cs.executeUpdate();

            if (resp == 0) {
                System.out.println("No se pudo eliminar la venta con ID: " + id + ". Puede que no exista.");
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return resp;
    }

    // Buscar una venta por ID
    public Ventas buscar(int id) {
        Ventas venta = null;
        String sql = "CALL sp_BuscarVenta(?)";

        try (Connection con = new Conexion().Conexion();
             CallableStatement cs = con.prepareCall(sql)) {

            cs.setInt(1, id);
            try (ResultSet rs = cs.executeQuery()) {
                if (rs.next()) {
                    venta = new Ventas();
                    venta.setCodigoVenta(rs.getInt("idVenta"));
                    venta.setFechaVenta(rs.getDate("fechaVenta"));
                    venta.setClienteNombre(rs.getString("clienteNombre"));
                    venta.setCodigoZapato(rs.getInt("idZapato"));
                    venta.setCantidad(rs.getInt("cantidad"));
                    venta.setTotal(rs.getDouble("total"));
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return venta;
    }
}
