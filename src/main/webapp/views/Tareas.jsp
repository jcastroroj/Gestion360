<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="models.Tareas" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestión360 - Tareas</title>
    <script src="https://unpkg.com/@tailwindcss/browser@4"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/js/all.min.js" defer></script>
</head>
<body class="bg-gray-100 font-sans">
    <div>
    <header class="bg-blue-900 bg-opacity-90 text-white text-center py-5 shadow-lg">
            <h1 class="text-3xl font-extrabold flex items-center justify-center gap-3">
                <i class="fas fa-tasks"></i> Gestión360 - Tareas
            </h1>
    </header>
     <nav class="bg-blue-800 bg-opacity-90 shadow-md">
            <ul class="flex justify-center space-x-6 py-4">
            <li><a href="/Gestion360"class="text-white hover:bg-blue-700 px-5 py-2 rounded transition duration-300 flex items-center gap-2 "><i class="fas fa-home "></i> Inicio</a></li>
            <li><a href="/Gestion360/Tareas" class="text-white hover:bg-blue-700 px-5 py-2 rounded transition duration-300 flex items-center gap-2 rounded border border-white border-solid"><i class="fas fa-tasks"></i> Tareas</a></li>
            <li><a href="/Gestion360/Usuarios"class="text-white hover:bg-blue-700 px-5 py-2 rounded transition duration-300 flex items-center gap-2"><i class="fas fa-users"></i> Usuarios</a></li>
            <li><a href="/Gestion360/Equipos" class="text-white hover:bg-blue-700 px-5 py-2 rounded transition duration-300 flex items-center gap-2"><i class="fas fa-briefcase"></i> Equipos</a></li>
            <li><a href="/Gestion360/UsuariosEquipos" class="text-white hover:bg-blue-700 px-5 py-2 rounded transition duration-300 flex items-center gap-2"><i class="fas fa-address-book"></i> Lista de Integrantes</a></li>
        </ul>
        </nav>

    <main class="p-4">
        <div class="flex w-full justify-center p-4 gap-4 flex-wrap">
            <%
                List<Tareas> tareas = (List<Tareas>) request.getAttribute("tareas");
                if (tareas != null && !tareas.isEmpty()) {
                    for (Tareas tarea : tareas) {
            %>
              <div class="flex bg-white shadow-lg w-96 p-6 rounded-lg border border-gray-300 hover:shadow-xl transition">
    		<div class="flex flex-col w-full space-y-4">
        <!-- Título -->
        <h2 class="text-xl font-bold text-blue-600 text-center border-b pb-2"><%= tarea.getTitulo() %></h2>

        <!-- Descripción -->
        <p class="text-gray-700 text-sm"><span class="font-semibold">Descripción:</span> <%= tarea.getDescripcion() %></p>

        <!-- Fecha Límite -->
        <p class="text-gray-800 text-sm">
            <span class="font-semibold">Fecha Límite:</span> 
            <span class="text-red-500"><%= tarea.getFechaLimite() %></span>
        </p>

        <!-- Estado -->
        <div class="flex items-center gap-2">
            <span class="font-semibold text-gray-800">Estado:</span>
            <span class="px-3 py-1 rounded-md text-white text-sm"
                style="background-color: <%= tarea.getEstado().equalsIgnoreCase("Pendiente") ? "#f87171" : "#4ade80" %>;">
                <%= tarea.getEstado() %>
            </span>
        </div>

        <!-- Prioridad -->
        <div class="flex items-center gap-2">
            <span class="font-semibold text-gray-800">Prioridad:</span>
            <span class="px-3 py-1 rounded-md text-white text-sm"
                style="background-color: <%= tarea.getPrioridad().equalsIgnoreCase("Alta") ? "#dc2626" : tarea.getPrioridad().equalsIgnoreCase("Media") ? "#facc15" : "#22c55e" %>;">
                <%= tarea.getPrioridad() %>
            </span>
        </div>

        <!-- Fecha Creación -->
        <p class="text-gray-600 text-sm">
            <span class="font-semibold">Fecha Creación:</span> <%= tarea.getFechaCreacion() %>
        </p>
    </div>
</div>
            <%  
                    } 
                } else { 
            %>
                <p class="text-center text-gray-600">No se encontraron registros</p>
            <% } %>
        </div>
        <div class="text-center font-bold mt-4">Total registros: <%= (tareas != null) ? tareas.size() : 0 %></div>
    </main>

    <footer class="bg-blue-600 text-white text-center py-3 mt-6">
        <p>&copy; 2025 Gestión360 - Sistema de Gestión de Tareas. Instituto SISE</p>
    </footer>
    </div>
</body>
</html>