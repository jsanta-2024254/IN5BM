package com.zapateria.modelo;

import com.zapateria.config.Conexion;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ZapatosDAO {

    // Listar todos los zapatos
    public List<Zapato> listar() {
        List<Zapato> lista = new ArrayList<>();
        String sql = "CALL sp_ListarZapatos()";

        try (Connection con = new Conexion().Conexion();
             CallableStatement cs = con.prepareCall(sql);
             ResultSet rs = cs.executeQuery()) {

            while (rs.next()) {
                Zapato z = new Zapato();
                z.setIdZapato(rs.getInt("idZapato"));
                z.setNombreZapato(rs.getString("nombreZapato"));
                z.setPrecioZapato(rs.getDouble("precioZapato"));
                z.setStockZapato(rs.getInt("stockZapato"));
                z.setTallaZapato(rs.getString("tallaZapato"));
                lista.add(z);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return lista;
    }

    // Agregar un zapato
    public int agregar(Zapato zap) {
        int resp = 0;
        String sql = "CALL sp_AgregarZapato(?, ?, ?, ?)";

        try (Connection con = new Conexion().Conexion();
             CallableStatement cs = con.prepareCall(sql)) {

            cs.setString(1, zap.getNombreZapato());
            cs.setDouble(2, zap.getPrecioZapato());
            cs.setInt(3, zap.getStockZapato());
            cs.setString(4, zap.getTallaZapato());
            resp = cs.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return resp;
    }

    // Actualizar un zapato
    public int actualizar(Zapato zap) {
        int resp = 0;
        String sql = "CALL sp_EditarZapato(?, ?, ?, ?, ?)";

        try (Connection con = new Conexion().Conexion();
             CallableStatement cs = con.prepareCall(sql)) {

            cs.setInt(1, zap.getIdZapato());
            cs.setString(2, zap.getNombreZapato());
            cs.setDouble(3, zap.getPrecioZapato());
            cs.setInt(4, zap.getStockZapato());
            cs.setString(5, zap.getTallaZapato());
            resp = cs.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return resp;
    }

    // Eliminar un zapato
    public int eliminar(int id) {
        int resp = 0;
        String sql = "CALL sp_EliminarZapato(?)";

        try (Connection con = new Conexion().Conexion();
             CallableStatement cs = con.prepareCall(sql)) {

            cs.setInt(1, id);
            resp = cs.executeUpdate();

            if (resp == 0) {
                System.out.println("No se pudo eliminar el zapato con ID: " + id + ". Puede que no exista.");
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return resp;
    }

    // Buscar un zapato por ID
    public Zapato buscar(int id) {
        Zapato zap = null;
        String sql = "CALL sp_BuscarZapato(?)";

        try (Connection con = new Conexion().Conexion();
             CallableStatement cs = con.prepareCall(sql)) {

            cs.setInt(1, id);
            try (ResultSet rs = cs.executeQuery()) {
                if (rs.next()) {
                    zap = new Zapato();
                    zap.setIdZapato(rs.getInt("idZapato"));
                    zap.setNombreZapato(rs.getString("nombreZapato"));
                    zap.setPrecioZapato(rs.getDouble("precioZapato"));
                    zap.setStockZapato(rs.getInt("stockZapato"));
                    zap.setTallaZapato(rs.getString("tallaZapato"));
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return zap;
    }
}
