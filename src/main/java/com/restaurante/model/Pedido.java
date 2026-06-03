package com.restaurante.model;

/**
 * Clase Pedido.
 * Representa una orden enviada por el mesero.
 * Se utiliza en la vista de administración para mostrar
 * el historial de ventas y el total acumulado.
 */
public class Pedido {

    private int idPedido;
    private int idMesa;
    private String fecha;
    private double total;
    private String estado;

    public Pedido() {
        // Constructor vacío para facilitar la lectura desde JSP.
    }

    public Pedido(int idPedido, int idMesa, String fecha, double total, String estado) {
        this.idPedido = idPedido;
        this.idMesa = idMesa;
        this.fecha = fecha;
        this.total = total;
        this.estado = estado;
    }

    public int getIdPedido() {
        return idPedido;
    }

    public void setIdPedido(int idPedido) {
        this.idPedido = idPedido;
    }

    public int getIdMesa() {
        return idMesa;
    }

    public void setIdMesa(int idMesa) {
        this.idMesa = idMesa;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }
}
