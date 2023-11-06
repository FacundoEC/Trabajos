/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package app.models;

import java.util.List;
import org.javalite.activejdbc.Model;
import org.javalite.activejdbc.annotations.Table;

@Table("tp2.tipos_usuarios")
public class TiposUsuarios extends Model {

    public static List<TiposUsuarios> buscarTodos() {
        return TiposUsuarios.findAll();
    }

}
