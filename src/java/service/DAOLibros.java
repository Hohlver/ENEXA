/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package service;

import db.ConexionSingleton;
import java.util.List;
import java.util.Optional;
import java.util.ArrayList;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.CRUD;
import model.Libros;

/**
 *
 * @author Laboratorio
 */

        

public class DAOLibros implements CRUD<Libros>{
    private ConexionSingleton oConexion;
    
    public DAOLibros (ConexionSingleton oConexion){
        this.oConexion= oConexion;
    }
    
    @Override
    public void insert (Libros obj) {
        String sql = "INSERT INTO libros VALUES('"+ obj.getIsbn() + "','" + obj.getTitulo()+ "','" + obj.getAutor()+ "','" + obj.getIdioma() + "')";
        try {
            oConexion.getConnection().createStatement().execute(sql);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void delete(Libros obj) {
        String sql = "DELETE FROM libros WHERE ISBN = '" + obj.getIsbn()+ "'";
        try {
            oConexion.getConnection().createStatement().execute(sql);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public Optional<Libros> get(int isbn) {
        String sql = "SELECT * FROM libros WHERE ISBN = '" + isbn + "'";
        try {
            ResultSet oResultSet = oConexion.getConnection().createStatement().executeQuery(sql);
            if (oResultSet.next()) {
                return Optional.of(new Libros(oResultSet.getInt("ISBN"), oResultSet.getString("titulo"), oResultSet.getString("autor"), oResultSet.getString("idioma")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return Optional.empty();
    }

    @Override
    public void update(Libros obj) {
        String sql = "UPDATE libros set titulo='" + obj.getTitulo()+ "', autor ='" + obj.getAutor()+ "', idioma='" + obj.getIdioma()+ "' WHERE ISBN='"+ obj.getIsbn()+ "'";
        try {
           oConexion.getConnection().createStatement().execute(sql); 
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public Optional<List<Libros>> getAll() {
        String sql= "SELECT * FROM libros";
        List<Libros> list =new ArrayList<>();
        try {
            ResultSet oResultSet = oConexion.getConnection().createStatement().executeQuery(sql);
            while (oResultSet.next()) {
                list.add(new Libros (oResultSet.getInt("ISBN"), oResultSet.getString("titulo"), oResultSet.getString("autor"), oResultSet.getString("idioma")));
            }
            return Optional.of(list);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return Optional.empty();
    }
    
  
}
