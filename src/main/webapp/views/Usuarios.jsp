<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="models.Usuarios" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestión360 - Usuarios</title>
    <script src="https://unpkg.com/@tailwindcss/browser@4"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/js/all.min.js" defer></script>
</head>
<body class="bg-gray-100 font-sans">
    <div>
    <header class="bg-blue-900 bg-opacity-90 text-white text-center py-5 shadow-lg">
            <h1 class="text-3xl font-extrabold flex items-center justify-center gap-3">
                <i class="fas fa-tasks"></i> Gestión360 - Usuarios
            </h1>
    </header>
     <nav class="bg-blue-800 bg-opacity-90 shadow-md">
            <ul class="flex justify-center space-x-6 py-4">
            <li><a href="/Gestion360"class="text-white hover:bg-blue-700 px-5 py-2 rounded transition duration-300 flex items-center gap-2 "><i class="fas fa-home "></i> Inicio</a></li>
            <li><a href="/Gestion360/Tareas" class="text-white hover:bg-blue-700 px-5 py-2 rounded transition duration-300 flex items-center gap-2 "><i class="fas fa-tasks"></i> Tareas</a></li>
            <li><a href="/Gestion360/Usuarios"class="text-white hover:bg-blue-700 px-5 py-2 rounded transition duration-300 flex items-center gap-2 rounded border border-white border-solid"><i class="fas fa-users"></i> Usuarios</a></li>
            <li><a href="/Gestion360/Equipos" class="text-white hover:bg-blue-700 px-5 py-2 rounded transition duration-300 flex items-center gap-2"><i class="fas fa-briefcase"></i> Equipos</a></li>
            <li><a href="/Gestion360/UsuariosEquipos" class="text-white hover:bg-blue-700 px-5 py-2 rounded transition duration-300 flex items-center gap-2"><i class="fas fa-address-book"></i> Lista de Integrantes</a></li>
        </ul>
        </nav>

    <main class="p-4">
        <div class="flex flex-wrap justify-center gap-6">
            <%
                List<Usuarios> usuarios = (List<Usuarios>) request.getAttribute("usuarios");
                if (usuarios != null && !usuarios.isEmpty()) {
                    for (Usuarios usuario : usuarios) {
            %>
            <div class="bg-white shadow-lg w-80 p-6 rounded-lg border border-gray-300 hover:shadow-xl transition">
                <h2 class="text-xl font-bold text-blue-600 text-center border-b pb-2"><%= usuario.getNombre() %> <%= usuario.getApellidoPaterno() %> <%= usuario.getApellidoMaterno() %></h2>

                <p class="text-gray-700 text-sm"><span class="font-semibold">Usuario:</span> <%= usuario.getUsername() %></p>
                <p class="text-gray-700 text-sm"><span class="font-semibold">Rol:</span> <%= usuario.getNombreRol() %></p>
                <p class="text-gray-700 text-sm"><span class="font-semibold">Documento:</span> <%= usuario.getTipoDocumento() %> - <%= usuario.getNumeroDocumento() %></p>
                <p class="text-gray-700 text-sm"><span class="font-semibold">Correo:</span> <%= usuario.getCorreo() %></p>
                <p class="text-gray-700 text-sm"><span class="font-semibold">Teléfono:</span> <%= usuario.getTelefono() %></p>
                <p class="text-gray-700 text-sm"><span class="font-semibold">Sexo:</span> <%= usuario.getSexo() %></p>
                <p class="text-gray-600 text-sm"><span class="font-semibold">Nacimiento:</span> <%= usuario.getFechaNacimiento() %></p>
            </div>
            <%  
                    } 
                } else { 
            %>
            <p class="text-center text-gray-600 w-full">No se encontraron registros</p>
            <% } %>
        </div>
        <div class="text-center font-bold mt-4">Total registros: <%= (usuarios != null) ? usuarios.size() : 0 %></div>
    </main>

    <footer class="bg-blue-600 text-white text-center py-3 mt-6">
        <p>&copy; 2025 Gestión360 - Sistema de Gestión de Tareas. Instituto SISE.</p>
    </footer>
    </div>
</body>
</html>