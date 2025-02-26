PGDMP                  
    {            escuela    16.0 (Debian 16.0-1.pgdg120+1)    16.0     >           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            ?           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            @           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            A           1262    33242    escuela    DATABASE     r   CREATE DATABASE escuela WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';
    DROP DATABASE escuela;
                postgres    false            �            1259    33243    campus    TABLE     W   CREATE TABLE public.campus (
    campus_id integer NOT NULL,
    nombre_campus text
);
    DROP TABLE public.campus;
       public         heap    postgres    false            �            1259    33298    claustro    TABLE     |   CREATE TABLE public.claustro (
    profesor_id integer NOT NULL,
    nombre text,
    rol text,
    promocion_id integer
);
    DROP TABLE public.claustro;
       public         heap    postgres    false            �            1259    33262    estudiantes    TABLE     �   CREATE TABLE public.estudiantes (
    alumno_id integer NOT NULL,
    nombre text,
    email text,
    promocion_id integer NOT NULL
);
    DROP TABLE public.estudiantes;
       public         heap    postgres    false            �            1259    33281 
   evaluacion    TABLE     �   CREATE TABLE public.evaluacion (
    evaluacion_id integer NOT NULL,
    proyecto_id integer,
    alumno_id integer NOT NULL,
    resultado text
);
    DROP TABLE public.evaluacion;
       public         heap    postgres    false            �            1259    33250 	   promocion    TABLE     �   CREATE TABLE public.promocion (
    promocion_id integer NOT NULL,
    nombre_promocion text,
    fecha_comienzo text,
    vertical text,
    campus_id integer NOT NULL
);
    DROP TABLE public.promocion;
       public         heap    postgres    false            �            1259    33274 	   proyectos    TABLE     U   CREATE TABLE public.proyectos (
    proyecto_id integer NOT NULL,
    nombre text
);
    DROP TABLE public.proyectos;
       public         heap    postgres    false            6          0    33243    campus 
   TABLE DATA           :   COPY public.campus (campus_id, nombre_campus) FROM stdin;
    public          postgres    false    215   �       ;          0    33298    claustro 
   TABLE DATA           J   COPY public.claustro (profesor_id, nombre, rol, promocion_id) FROM stdin;
    public          postgres    false    220   �       8          0    33262    estudiantes 
   TABLE DATA           M   COPY public.estudiantes (alumno_id, nombre, email, promocion_id) FROM stdin;
    public          postgres    false    217   �       :          0    33281 
   evaluacion 
   TABLE DATA           V   COPY public.evaluacion (evaluacion_id, proyecto_id, alumno_id, resultado) FROM stdin;
    public          postgres    false    219   �#       7          0    33250 	   promocion 
   TABLE DATA           h   COPY public.promocion (promocion_id, nombre_promocion, fecha_comienzo, vertical, campus_id) FROM stdin;
    public          postgres    false    216   1'       9          0    33274 	   proyectos 
   TABLE DATA           8   COPY public.proyectos (proyecto_id, nombre) FROM stdin;
    public          postgres    false    218   �'       �           2606    33249    campus campus_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.campus
    ADD CONSTRAINT campus_pkey PRIMARY KEY (campus_id);
 <   ALTER TABLE ONLY public.campus DROP CONSTRAINT campus_pkey;
       public            postgres    false    215            �           2606    33304    claustro claustro_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.claustro
    ADD CONSTRAINT claustro_pkey PRIMARY KEY (profesor_id);
 @   ALTER TABLE ONLY public.claustro DROP CONSTRAINT claustro_pkey;
       public            postgres    false    220            �           2606    33268    estudiantes estudiantes_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY public.estudiantes
    ADD CONSTRAINT estudiantes_pkey PRIMARY KEY (alumno_id);
 F   ALTER TABLE ONLY public.estudiantes DROP CONSTRAINT estudiantes_pkey;
       public            postgres    false    217            �           2606    33287    evaluacion evaluacion_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.evaluacion
    ADD CONSTRAINT evaluacion_pkey PRIMARY KEY (evaluacion_id);
 D   ALTER TABLE ONLY public.evaluacion DROP CONSTRAINT evaluacion_pkey;
       public            postgres    false    219            �           2606    33256    promocion promocion_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.promocion
    ADD CONSTRAINT promocion_pkey PRIMARY KEY (promocion_id);
 B   ALTER TABLE ONLY public.promocion DROP CONSTRAINT promocion_pkey;
       public            postgres    false    216            �           2606    33280    proyectos proyectos_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.proyectos
    ADD CONSTRAINT proyectos_pkey PRIMARY KEY (proyecto_id);
 B   ALTER TABLE ONLY public.proyectos DROP CONSTRAINT proyectos_pkey;
       public            postgres    false    218            �           2606    33305 #   claustro claustro_promocion_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.claustro
    ADD CONSTRAINT claustro_promocion_id_fkey FOREIGN KEY (promocion_id) REFERENCES public.promocion(promocion_id);
 M   ALTER TABLE ONLY public.claustro DROP CONSTRAINT claustro_promocion_id_fkey;
       public          postgres    false    216    220    3225            �           2606    33269 )   estudiantes estudiantes_promocion_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.estudiantes
    ADD CONSTRAINT estudiantes_promocion_id_fkey FOREIGN KEY (promocion_id) REFERENCES public.promocion(promocion_id);
 S   ALTER TABLE ONLY public.estudiantes DROP CONSTRAINT estudiantes_promocion_id_fkey;
       public          postgres    false    217    3225    216            �           2606    33293 $   evaluacion evaluacion_alumno_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.evaluacion
    ADD CONSTRAINT evaluacion_alumno_id_fkey FOREIGN KEY (alumno_id) REFERENCES public.estudiantes(alumno_id);
 N   ALTER TABLE ONLY public.evaluacion DROP CONSTRAINT evaluacion_alumno_id_fkey;
       public          postgres    false    219    3227    217            �           2606    33288 &   evaluacion evaluacion_proyecto_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.evaluacion
    ADD CONSTRAINT evaluacion_proyecto_id_fkey FOREIGN KEY (proyecto_id) REFERENCES public.proyectos(proyecto_id);
 P   ALTER TABLE ONLY public.evaluacion DROP CONSTRAINT evaluacion_proyecto_id_fkey;
       public          postgres    false    218    3229    219            �           2606    33257 "   promocion promocion_campus_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.promocion
    ADD CONSTRAINT promocion_campus_id_fkey FOREIGN KEY (campus_id) REFERENCES public.campus(campus_id);
 L   ALTER TABLE ONLY public.promocion DROP CONSTRAINT promocion_campus_id_fkey;
       public          postgres    false    215    3223    216            6   !   x�3��ML)�L�2�K�I�K�L����� \��      ;   �   x�5�M�1��U��vO�?�e`����)�(��@�#�Σ�t�B<B.f2��}����7^�]�`�@�%t���2})��7��Ʀ�[rRb+����c�.�5�Ic��.޲,�$�
�	����-�ԉ�yFЈV�Z����5�9�v��=�?�>�6hO�l�I�B�Hz�P�� �yo��i�����@�'�F�      8   �  x�m�Kn9���)x��z�����kl��(��e�E&�nc��x�E���K�I�T������6Y,5V��D�^`��N 	��l��Ok�U��D]��!�D���I�� �Su��S =��2�		�L-)��I��0� |���Xz�"k1$�#uCޭ��� D�cu[��Q������PX�O�y�b�<W���}�E�A�Su�q�q����
�;Id�jaiK�1�=����S )22Vg�Y�h��GAH(�5_|ƭ~��-����<UK��l�5�^���]ř=UFgj�L��3���d��CunM�u��7��x��[�W�_���a�{��h|��W>x=�+
��%P8�5n������3����T�y�`h�uc�7��)"29Pg�z������(���uk�
�BH ��4�r�V�uf(,�Sua���-r%2A"i峳+O�[��n"H$�|vuCA��ƹ�_BAi�ٚZ/ͦ%�/Ѿp J�$H��o*^v����PP�Ow�-߹��{KB��|��n�s���?�V�E�遺l���^��S�6~�@V�"��t��)lxA�Mk����Q�'j���&�A݇+A��3���w�[�X(����9�K��kZ�D�IZy���6�yM�6~ 2p���%@Ǔ+���} 2p��j���V�[���!1��uF��(p5������ I��S���Cwp���쀧_L6�u�	�Yg��86z߂z�n ?�������;���>f:�W��C=���ԃ�����K�����C�Ŭ��B~�^0����箥�誀����o�|44;Ϋ�\�k2�I02p়���e	
I�i�K���N ���L�8�q0�_�����'JO躟g��{k�{*�T���<m��}�W13�>�F����O�      :   �  x�U�K��6�է�	EJ�g����x1���K�P�IH���'�ڧ=�����O������_�����?���.���<?��w^ϝ�q?w��}�[]k�j��ZC]k��4�-��W��{^��%����V��X-9�lI�-��Z��p�Z�%�Z�W�i�k�>�?���ji�k�v���5���5�Z-Mw���5ݵ�߫�h��Z���k�[��|�4���P�)ÐA��#E���@�Dπ�J�@"�7�(�Ǻ��À�JՁG&�@�MT�PY;P1�a@b�����	�'Xme�<��\ϗp?_�����x(Z��e(/E��r�V/��6�j���JۅO��B�M��yO�սQZ����H����OiNw��W�n�H&@2��E�g��W:��)���:�Wo�H�^}�z9�.6&zA���~��y?6̂�*������SY�'�ۆSN�>�qʵ�:Z�m��p�O��u�>Z��h�eڦV Z�	� ��p
�B�]&l���\��r�O�z���?���
B+hjjmN1�y+!fA����z�tm��7'�U�� ����Ov���bԜX��V����6^&�vR�2�TFAa�N	:�{sz�ޯ6F�ځQF%����^N3�<	� ���� ��Sp"���TR��ۅ�|aT�HE� �J\/����ƫܨ��5g��+� ���
�#�;�l�$=�Iz�L}��D=y�_���Iz��qg�g��/�nB(� �Ls�'"������������S}�E�/���$�Ls��{Y�{�5c�VNA�)��|.N� �z��_��JOD+�����N_�\mO�z��UP�(�W�����(�&����חΆ��������e�:��p�wi����u"���%In�'`H�u�_ހ��<���j��~���r������$+$5      7   W   x�3�N-(�L�M*J�4��7��7202�t	�4�2�!��R�@�|NC#}#��	D�	6�#.S���<��Ē�b�,C�=... �%�      9   s   x�3�(ʯLM.ɏ��q�2Bp]]��\''.�ׇ��sI-�ɯ�M�+�2C���&���q�#D܊��J\�R�,�LNL�N
Y"��R�K��4���'�$gs��qqq �=�     