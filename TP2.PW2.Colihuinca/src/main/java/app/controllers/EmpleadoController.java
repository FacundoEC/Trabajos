package app.controllers;

import app.exceptions.EmpleadoException;
import app.models.Empleado;
import app.models.TiposUsuarios;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.javalite.activeweb.AppController;
import org.javalite.activeweb.annotations.POST;

public class EmpleadoController extends AppController {

    public void index() {
        session("nombre_usuario", getHttpServletRequest().getRemoteUser());
        session("ver", getHttpServletRequest().isUserInRole("ver"));
        session("modificar", getHttpServletRequest().isUserInRole("modificar"));

        List<Empleado> emps = Empleado.buscarTodos();
        List<TiposUsuarios> tipoUsuario = TiposUsuarios.buscarTodos();

        view("usuarios", emps);
        view("tipoUsuarios", tipoUsuario);
    }
    //cierra la sesion
    public void cerrar() {
        session().invalidate();
        redirect();
    }
    
    //Agrega un usuario, primero valida y luego lo agrega, sino muestra los errores
    @POST
    public void agregar() {

        String nombre = getHttpServletRequest().getParameter("nombre");
        String apellido = getHttpServletRequest().getParameter("apellido");
        String mail_principal = getHttpServletRequest().getParameter("mail_principal");
        String mail_secundario = getHttpServletRequest().getParameter("mail_secundario");
        String alias_e = getHttpServletRequest().getParameter("alias_e");
        String contrasenia = getHttpServletRequest().getParameter("contrasenia");
        String nro_celular = param("nro_celular");
        Integer id_tipo_usuario = Integer.valueOf(getHttpServletRequest().getParameter("id_tipo_usuario"));
        try {
            Empleado.validar(nombre, apellido, mail_principal, mail_secundario, alias_e, contrasenia, nro_celular);
            Empleado.agregar(nombre, apellido, mail_principal, mail_secundario, alias_e, contrasenia, nro_celular, id_tipo_usuario);
            redirect(EmpleadoController.class, "index");
        } catch (EmpleadoException ex) {
            view("error", ex.getMessage());
            render("/empleado/error").noLayout();
        }

    }

    public void error() {

    }

    public void eliminar() {
        Empleado.eliminar(Integer.valueOf(getId()));
        redirect(EmpleadoController.class, "index");
    }
    //metodo para mostrar correctamente a los usuarios y el tipo de usuario en la vista modificar.ftl
    public void modificar() {

        Integer id = Integer.valueOf(getId());
        List<TiposUsuarios> tipoUsuario = TiposUsuarios.buscarTodos();

        Empleado emps = Empleado.buscar(id);

        view("usuarios", emps);
        view("tipoUsuarios", tipoUsuario);
    }
    //metodo que valida y modifica en la vista modificar.ftl
    @POST
    public void procesomod() {

        Map<String, String> valores = new HashMap<>();

        String id = getId();

        String nombre = getHttpServletRequest().getParameter("nombre");
        String apellido = getHttpServletRequest().getParameter("apellido");
        String mail_principal = getHttpServletRequest().getParameter("mail_principal");
        String mail_secundario = getHttpServletRequest().getParameter("mail_secundario");
        String alias_e = getHttpServletRequest().getParameter("alias_e");
        String contrasenia = getHttpServletRequest().getParameter("contrasenia");
        String nro_celular = getHttpServletRequest().getParameter("nro_celular");
        String id_tipo_usuario = getHttpServletRequest().getParameter("id_tipo_usuario");

        valores.put("id", id);
        valores.put("apellido", apellido);
        valores.put("nombre", nombre);
        valores.put("mail_principal", mail_principal);
        valores.put("mail_secundario", mail_secundario);
        valores.put("alias_e", alias_e);
        valores.put("contrasenia", contrasenia);
        valores.put("nro_celular", nro_celular);
        valores.put("id_tipo_usuario", id_tipo_usuario);

        try {
            Empleado.validar(valores);
            Empleado.modificar(valores);

            redirect(EmpleadoController.class, "index");

        } catch (EmpleadoException ex) {
            view("error", ex.getMessage());
            render("error");
        }

    }
    //metodo para ver la informacion mas detallada de cada empleado/usuario
    public void informacion() {
        Integer id = Integer.valueOf(getId());
        Empleado emps = Empleado.buscar(id);
        view("usuarioInfo", emps);
    }
}
