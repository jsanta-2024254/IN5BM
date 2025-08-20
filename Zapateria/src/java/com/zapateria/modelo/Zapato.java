/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.zapateria.modelo;

public class Zapato {
    private int idZapato;
    private String nombreZapato;
    private double precioZapato;
    private int stockZapato;
    private String tallaZapato;

    public Zapato() {}

    public Zapato(int idZapato, String nombreZapato, double precioZapato, int stockZapato, String tallaZapato) {
        this.idZapato = idZapato;
        this.nombreZapato = nombreZapato;
        this.precioZapato = precioZapato;
        this.stockZapato = stockZapato;
        this.tallaZapato = tallaZapato;
    }

    public int getIdZapato() {
        return idZapato;
    }

    public void setIdZapato(int idZapato) {
        this.idZapato = idZapato;
    }

    public String getNombreZapato() {
        return nombreZapato;
    }

    public void setNombreZapato(String nombreZapato) {
        this.nombreZapato = nombreZapato;
    }

    public double getPrecioZapato() {
        return precioZapato;
    }

    public void setPrecioZapato(double precioZapato) {
        this.precioZapato = precioZapato;
    }

    public int getStockZapato() {
        return stockZapato;
    }

    public void setStockZapato(int stockZapato) {
        this.stockZapato = stockZapato;
    }

    public String getTallaZapato() {
        return tallaZapato;
    }

    public void setTallaZapato(String tallaZapato) {
        this.tallaZapato = tallaZapato;
    }
}