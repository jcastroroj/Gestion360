<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="models.Equipos" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestión360 - Equipos</title>
    <script src="https://unpkg.com/@tailwindcss/browser@4"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/js/all.min.js" defer></script>
</head>
<body class="bg-gray-100 font-sans">
    <div>
    <header class="bg-blue-900 bg-opacity-90 text-white text-center py-5 shadow-lg">
            <h1 class="text-3xl font-extrabold flex items-center justify-center gap-3">
                <i class="fas fa-tasks"></i>Gestión360 - Equipos
            </h1>
    </header>
    
    <nav class="bg-blue-800 bg-opacity-90 shadow-md">
            <ul class="flex justify-center space-x-6 py-4">
            <li><a href="/Gestion360"class="text-white hover:bg-blue-700 px-5 py-2 rounded transition duration-300 flex items-center gap-2 "><i class="fas fa-home "></i> Inicio</a></li>
            <li><a href="/Gestion360/Tareas" class="text-white hover:bg-blue-700 px-5 py-2 rounded transition duration-300 flex items-center gap-2 "><i class="fas fa-tasks"></i> Tareas</a></li>
            <li><a href="/Gestion360/Usuarios"class="text-white hover:bg-blue-700 px-5 py-2 rounded transition duration-300 flex items-center gap-2"><i class="fas fa-users"></i> Usuarios</a></li>
            <li><a href="/Gestion360/Equipos" class="text-white hover:bg-blue-700 px-5 py-2 rounded transition duration-300 flex items-center gap-2 rounded border border-white border-solid"><i class="fas fa-briefcase"></i> Equipos</a></li>
            <li><a href="/Gestion360/UsuariosEquipos" class="text-white hover:bg-blue-700 px-5 py-2 rounded transition duration-300 flex items-center gap-2"><i class="fas fa-address-book"></i> Lista de Integrantes</a></li>
        </ul>
    </nav>

    <main class="p-4">
        <div class="flex flex-wrap justify-center gap-6">
            <%
                List<Equipos> equipos = (List<Equipos>) request.getAttribute("equipos");
                if (equipos != null && !equipos.isEmpty()) {
                    for (Equipos equipo : equipos) {
            %>
      <div class="flex bg-white shadow-lg w-96 p-6 rounded-lg border border-gray-300 hover:shadow-xl transition">
    		<div class="flex flex-col w-full space-y-4">
        <!-- Título -->
        <h2 class="text-xl font-bold text-blue-600 text-center border-b pb-2"><%= equipo.getNombre() %></h2>

        <!-- Descripción -->
        <p class="text-gray-700 text-sm"><span class="font-semibold">Descripción:</span> <%= equipo.getDescripcion() %></p>

    </div>
</div>
            <%  
                    } 
                } else { 
            %>
            <p class="text-center text-gray-600 w-full">No se encontraron registros</p>
            <% } %>
        </div>
        <div class="text-center font-bold mt-4">Total registros: <%= (equipos != null) ? equipos.size() : 0 %></div>
    </main>

    <footer class="bg-blue-600 text-white text-center py-3 mt-6">
        <p>&copy; 2025 Gestión360 - Sistema de Gestión de Tareas. Instituto SISE.</p>
    </footer>
    </div>
</body>
</html>