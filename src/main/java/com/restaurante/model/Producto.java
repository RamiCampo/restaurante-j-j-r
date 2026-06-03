package com.restaurante.model;

/**
 * Clase Producto.
 * Representa un platillo o bebida del menú del restaurante.
 * Esta clase aplica encapsulamiento con atributos privados
 * y métodos getters/setters para mantener el código ordenado.
 */
public class Producto {

    private int idProducto;
    private String nombre;
    private double precio;
    private String categoria;

    public Producto() {
        // Constructor vacío requerido por el framework MVC y por JSP.
    }

    public Producto(int idProducto, String nombre, double precio, String categoria) {
        this.idProducto = idProducto;
        this.nombre = nombre;
        this.precio = precio;
        this.categoria = categoria;
    }

    public int getIdProducto() {
        return idProducto;
    }

    public void setIdProducto(int idProducto) {
        this.idProducto = idProducto;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }
}
