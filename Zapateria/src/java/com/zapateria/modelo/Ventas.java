/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.zapateria.modelo;

import java.sql.Date;

/**
 *
 * @author Joshua
 */
public class Ventas {
    private int codigoVenta;
    private Date fechaVenta;
    private String clienteNombre;  
    private int codigoZapato;
    private int cantidad;
    private Double total;
    
    public Ventas(){
    }

    public int getCodigoVenta() {
        return codigoVenta;
    }

    public void setCodigoVenta(int codigoVenta) {
        this.codigoVenta = codigoVenta;
    }

    public Date getFechaVenta() {
        return fechaVenta;
    }

    public void setFechaVenta(Date fechaVenta) {
        this.fechaVenta = fechaVenta;
    }

    public String getClienteNombre() {
        return clienteNombre;
    }

    public void setClienteNombre(String clienteNombre) {
        this.clienteNombre = clienteNombre;
    }

    public int getCodigoZapato() {
        return codigoZapato;
    }

    public void setCodigoZapato(int codigoZapato) {
        this.codigoZapato = codigoZapato;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public Double getTotal() {
        return total;
    }

    public void setTotal(Double total) {
        this.total = total;
    }

    @Override
    public String toString() {
        return "Ventas{" + "codigoVenta=" + codigoVenta + ", fechaVenta=" + fechaVenta + ", clienteNombre=" + clienteNombre + ", codigoZapato=" + codigoZapato + ", cantidad=" + cantidad + ", total=" + total + '}';
    }
}
