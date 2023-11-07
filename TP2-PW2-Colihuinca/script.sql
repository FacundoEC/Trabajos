create schema tp2;

CREATE TABLE tp2.tipos_usuarios(
	id serial, 
	nombre text not null,
	primary key(id)
);

insert into tp2.tipos_usuarios(nombre) values
('Sistema'), ('Administracion');

CREATE TABLE tp2.empleado(
    id serial primary key,
    apellido text not null,
    nombre text not null,
    fecha_alta date not null,
    fecha_baja date ,
    mail_principal text not null,
    mail_secundario text not null,
    alias text not null,
    contrasenia text not null,
    nro_celular varchar
   
);
ALTER TABLE tp2.empleado ADD COLUMN id_tipo_usuario INTEGER, ADD CONSTRAINT fk_tipo_usuario FOREIGN KEY (id_tipo_usuario ) REFERENCES tp2.tipos_usuarios(id);

insert into tp2.empleado(apellido, nombre, fecha_alta, mail_principal, mail_secundario, alias_e, contrasenia, nro_celular, id_tipo_usuario)
values

	('GONZALEZ', 'ALVARO', '2020-01-10','gonzalezalvaro@gmail.com','gonzalezalvaro2@gmail.com','GonzalezAlvaro','alvaro', 2804157085, 2)
;

SELECT *FROM tp2.empleado  e
JOIN tp2.tipos_usuarios  tu
ON  e.id_tipo_usuario = tu.id;
commit;