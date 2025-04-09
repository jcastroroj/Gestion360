<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="models.UsuariosEquipos" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestión360 - Lista de Integrantes</title>
    <script src="https://unpkg.com/@tailwindcss/browser@4"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/js/all.min.js" defer></script>
    <style>
        .rotate-180 {
            transform: rotate(180deg);
            transition: transform 0.3s ease;
        }
    </style>
</head>
<body class="bg-gray-100 font-sans">
    <div>
        <header class="bg-blue-900 text-white text-center py-5 shadow">
            <h1 class="text-3xl font-extrabold flex items-center justify-center gap-3">
                <i class="fas fa-address-book"></i> Gestión360 - Lista de Integrantes
            </h1>
        </header>

        <nav class="bg-blue-800 shadow-md">
            <ul class="flex justify-center space-x-6 py-4">
                <li><a href="/Gestion360" class="text-white hover:bg-blue-700 px-4 py-2 rounded transition flex items-center gap-2"><i class="fas fa-home"></i> Inicio</a></li>
                <li><a href="/Gestion360/Tareas" class="text-white hover:bg-blue-700 px-4 py-2 rounded transition flex items-center gap-2"><i class="fas fa-tasks"></i> Tareas</a></li>
                <li><a href="/Gestion360/Usuarios" class="text-white hover:bg-blue-700 px-4 py-2 rounded transition flex items-center gap-2"><i class="fas fa-users"></i> Usuarios</a></li>
                <li><a href="/Gestion360/Equipos" class="text-white hover:bg-blue-700 px-4 py-2 rounded transition flex items-center gap-2"><i class="fas fa-briefcase"></i> Equipos</a></li>
                <li><a href="/Gestion360/UsuariosEquipos" class="text-white bg-blue-700 px-4 py-2 rounded border border-white flex items-center gap-2"><i class="fas fa-address-book"></i> Lista de Integrantes</a></li>
            </ul>
        </nav>

        <main class="px-4 py-6">
            <div class="max-w-2xl mx-auto">  
                <%
                    List<UsuariosEquipos> usuariosEquipos = (List<UsuariosEquipos>) request.getAttribute("usuariosEquipos");
                    if (usuariosEquipos != null && !usuariosEquipos.isEmpty()) {
                        int index = 0;
                        for (UsuariosEquipos usuariosEquipo : usuariosEquipos) {
                %>
                <div class="bg-white rounded-lg shadow-sm mb-3 px-3 py-2 border border-gray-300">
                    <div class="flex justify-between items-center">
                        <h2 class="text-xl font-semibold text-blue-600 flex items-center gap-2">
                            <i class="fas fa-users text-blue-600"></i> <%= usuariosEquipo.getEquipo() %>
                        </h2>
                        <button 
                            class="text-sm text-blue-700 hover:text-blue-900 font-medium flex items-center gap-1" 
                            onclick="toggleIntegrantes('grupo<%= index %>', this)">
                            <i class="fas fa-chevron-down transition-transform duration-300"></i> Integrantes
                        </button>
                    </div>
                    <ul id="grupo<%= index %>" class="ml-5 mt-2 text-lg text-gray-700 list-disc hidden">
                        <%
                            String[] integrantes = usuariosEquipo.getIntegrantes().split(",");
                            for (String integrante : integrantes) {
                        %>
                            <li><%= integrante.trim() %></li>
                        <% } %>
                    </ul>
                </div>
                <%  
                        index++;
                        } 
                    } else { 
                %>
                <p class="text-center text-gray-600 mt-6">No se encontraron registros</p>
                <% } %>

                <div class="text-center font-semibold mt-6 text-gray-800">
                    Total registros: <%= (usuariosEquipos != null) ? usuariosEquipos.size() : 0 %>
                </div>
            </div>
        </main>

        <footer class="bg-blue-600 text-white text-center py-3 mt-6">
            <p>&copy; 2025 Gestión360 - Sistema de Gestión de Tareas. Instituto SISE.</p>
        </footer>
    </div>

    <script>
        function toggleIntegrantes(id, button) {
            const element = document.getElementById(id);
            const icon = button.querySelector("i");

            // Toggle the visibility of the integrantes list
            element.classList.toggle('hidden');

            // Rotate the icon based on the visibility
            if (element.classList.contains('hidden')) {
                icon.classList.remove('rotate-180');
            } else {
                icon.classList.add('rotate-180');
            }
        }
    </script>
</body>
</html>