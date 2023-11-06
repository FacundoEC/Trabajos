package app.models;

import app.exceptions.EmpleadoException;
import java.sql.Date;
import java.time.LocalDate;
import java.util.List;
import java.util.Map;
import org.javalite.activejdbc.Model;
import org.javalite.activejdbc.annotations.BelongsTo;
import org.javalite.activejdbc.annotations.Table;

@Table("tp2.empleado")
@BelongsTo(foreignKeyName = "id_tipo_usuario", parent = TiposUsuarios.class)


public class Empleado extends Model {

    public static List<Empleado> buscarTodos() {
        List<Empleado> empleados = Empleado
                .findAll()
                .include(TiposUsuarios.class);

        return empleados;
    }

    public TiposUsuarios getTiposUsuarios() {
        return parent(TiposUsuarios.class);
    }

    public static Empleado buscar(Integer id) {

        Empleado empleado = Empleado.findFirst("id = ?", id);

        return empleado;
    }
    //elimina empleado con el id como parametro
    public static void eliminar(Integer id) {
        Empleado.delete("id = ?", id);
    }
    
    
    public static Empleado agregar(String nombre, String apellido, String mail_principal, String mail_secundario,
            String alias_e, String contrasenia, String nro_celular, Integer id_tipo_usuario) {

        Empleado e = new Empleado();
        Date fecha_alta = Date.valueOf(LocalDate.now());

        e.set("apellido", apellido);
        e.set("nombre", nombre);
        e.set("fecha_alta", fecha_alta);
        e.set("mail_principal", mail_principal);
        e.set("mail_secundario", mail_secundario);
        e.set("alias_e", alias_e);
        e.set("contrasenia", contrasenia);
        e.set("nro_celular", nro_celular);
        e.set("id_tipo_usuario", id_tipo_usuario);
        e.saveIt();

        return e;
    }

    public static void modificar(Map<String, String> valores) {
        Integer id = Integer.valueOf(valores.get("id"));
        Empleado e = Empleado.findFirst("id = ?", id);

        if (e != null) {
            Date fechaAlta = java.sql.Date.valueOf(LocalDate.now());

            for (Map.Entry<String, String> entry : valores.entrySet()) {
                String key = entry.getKey();
                String value = entry.getValue();

                if (value != null && !value.isEmpty()) {

                    switch (key) {
                        case "id_tipo_usuario":
                        case "id":
                            e.set(key, Integer.valueOf(value));
                            break;
                        case "nombre":
                        case "apellido":
                        case "mail_principal":
                        case "mail_secundario":
                        case "alias_e":
                        case "contrasenia":
                        case "nro_celular":
                            e.set(key, value);
                            break;
                        default:

                            break;
                    }

                }
            }

            
            e.set("fecha_alta", fechaAlta);
            e.saveIt();
        }

    }

    //valida el agregar empleado nuevo
    public static void validar(String nombre, String apellido, String mail_principal, String mail_secundario,
            String alias_e, String contrasenia, String nro_celular) throws EmpleadoException {

        if (!nombre.matches("^[A-Za-z ]{3,}$")) {
            throw new EmpleadoException("El nombre se introdujo mal deben ser solamente letras (minimo 3)");
        }
        if (!apellido.matches("^[A-Za-z ]{3,}$")) {
            throw new EmpleadoException("El apellido se introdujo mal deben ser solamente letras (minimo 3)");
        }
        if (nombre.toLowerCase().equals(apellido.toLowerCase())) {
            throw new EmpleadoException("El nombre y el apellido no deben ser identicos");
        }
        if (!mail_principal.matches("[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}")) {
            throw new EmpleadoException("El correo principal no es válido");
        }
        if (!mail_secundario.matches("[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}")) {
            throw new EmpleadoException("El correo principal no es válido");
        }
        if (alias_e.length() < 3) {
            throw new EmpleadoException("El alias debe tener al menos 3 caracteres");
        }
        if (contrasenia.length() < 5) {
            throw new EmpleadoException("La contraseña debe tener al menos 5 caracteres");
        }
        if (nro_celular.length() < 10) {
            throw new EmpleadoException("El número de celular debe tener al menos 10 caracteres");
        }
    }

    //metodo sobrecargado valida la modificacion
    public static void validar(Map<String, String> valores) throws EmpleadoException {

        String nombre = valores.get("nombre");
        String apellido = valores.get("apellido");
        String mail_principal = valores.get("mail_principal");
        String mail_secundario = valores.get("mail_secundario");
        String alias_e = valores.get("alias_e");
        String contrasenia = valores.get("contrasenia");
        String nro_celular = valores.get("nro_celular");
        if (!nombre.matches("^[A-Za-z ]{3,}$")) {
            throw new EmpleadoException("El nombre se introdujo mal deben ser solamente letras (minimo 3)");
        }
        if (!apellido.matches("^[A-Za-z ]{3,}$")) {
            throw new EmpleadoException("El apellido se introdujo mal deben ser solamente letras (minimo 3)");
        }
        if (nombre.toLowerCase().equals(apellido.toLowerCase())) {
            throw new EmpleadoException("El nombre y el apellido no deben ser identicos");
        }

        if (!mail_principal.matches("[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}")) {
            throw new EmpleadoException("El correo principal no es válido");
        }
        if (!mail_secundario.matches("[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}")) {
            throw new EmpleadoException("El correo principal no es válido");
        }
        if (alias_e.length() < 3) {
            throw new EmpleadoException("El alias debe tener al menos 3 caracteres");
        }
        if (contrasenia.length() < 5) {
            throw new EmpleadoException("La contraseña debe tener al menos 5 caracteres");
        }
        if (nro_celular.length() < 10) {
            throw new EmpleadoException("El número de celular debe tener al menos 10 caracteres");
        }

    }
}
