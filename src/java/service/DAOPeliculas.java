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
import model.Peliculas;

/**
 *
 * @author Laboratorio
 */
public class DAOPeliculas  implements CRUD<Peliculas>{
    private ConexionSingleton oConexion;
    
    public DAOPeliculas(ConexionSingleton oConexion){
        this.oConexion= oConexion;
    }
    
    @Override
    public void insert(Peliculas obj){
                String sql = "INSERT INTO peliculas VALUES(NULL,'"+ obj.getTitulo()+ "','" + obj.getDirector()+ "','" + obj.getGenero()+ "')";
        try {
            oConexion.getConnection().createStatement().execute(sql);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void delete(Peliculas obj) {
        
        String sql = "DELETE FROM peliculas WHERE id_pelicula= '" + obj.getId()+ "'";
        try {
            oConexion.getConnection().createStatement().execute(sql);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public Optional<Peliculas> get(int id) {
                String sql = "SELECT * FROM peliculas WHERE id_pelicula= '" + id + "'";
        try {
            ResultSet oResultSet = oConexion.getConnection().createStatement().executeQuery(sql);
            if (oResultSet.next()) {
                return Optional.of(new Peliculas(oResultSet.getInt("id_pelicula"), oResultSet.getString("titulo"), oResultSet.getString("director"), oResultSet.getString("genero")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return Optional.empty();
    }

    @Override
    public void update(Peliculas obj) {
                String sql = "UPDATE peliculas set titulo='" + obj.getTitulo()+ "', director ='" + obj.getDirector()+ "', genero='" + obj.getGenero()+ "' WHERE id_pelicula='"+ obj.getId()+ "'";
        try {
           oConexion.getConnection().createStatement().execute(sql); 
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public Optional<List<Peliculas>> getAll() {
                String sql= "SELECT * FROM peliculas";
        List<Peliculas> list =new ArrayList<>();
        try {
            ResultSet oResultSet = oConexion.getConnection().createStatement().executeQuery(sql);
            while (oResultSet.next()) {
                list.add(new Peliculas (oResultSet.getInt("id_pelicula"), oResultSet.getString("titulo"), oResultSet.getString("director"), oResultSet.getString("genero")));
                
            }
            return Optional.of(list);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return Optional.empty();
    }

}
