PGDMP                         w            test    11.5    11.5                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false                       1262    18907    test    DATABASE     �   CREATE DATABASE test WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Spanish_Spain.1252' LC_CTYPE = 'Spanish_Spain.1252';
    DROP DATABASE test;
             postgres    false                        2615    18974    Matiz    SCHEMA        CREATE SCHEMA "Matiz";
    DROP SCHEMA "Matiz";
             postgres    false            �            1259    18978    cliente    TABLE       CREATE TABLE "Matiz".cliente (
    id_cliente character varying NOT NULL,
    "Nombre" character varying NOT NULL,
    "Apellidos" character varying NOT NULL,
    "Direccion" character varying NOT NULL,
    "Correo" character varying,
    "Telefono" character varying NOT NULL
);
    DROP TABLE "Matiz".cliente;
       Matiz         postgres    false    6            �            1259    18957    task    TABLE     �   CREATE TABLE public.task (
    id character varying NOT NULL,
    descripcion character varying NOT NULL,
    fecha date NOT NULL,
    prioridad character varying NOT NULL,
    realizada character varying
);
    DROP TABLE public.task;
       public         postgres    false                       0    18978    cliente 
   TABLE DATA               h   COPY "Matiz".cliente (id_cliente, "Nombre", "Apellidos", "Direccion", "Correo", "Telefono") FROM stdin;
    Matiz       postgres    false    198   �
       �
          0    18957    task 
   TABLE DATA               L   COPY public.task (id, descripcion, fecha, prioridad, realizada) FROM stdin;
    public       postgres    false    197   �
       �
           2606    18985    cliente cliente_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY "Matiz".cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY (id_cliente);
 ?   ALTER TABLE ONLY "Matiz".cliente DROP CONSTRAINT cliente_pkey;
       Matiz         postgres    false    198            �
           2606    18964    task task_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.task
    ADD CONSTRAINT task_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.task DROP CONSTRAINT task_pkey;
       public         postgres    false    197                   x������ � �      �
      x������ � �     