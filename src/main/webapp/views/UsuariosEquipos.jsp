<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
</head>
<body class="bg-gray-100 font-sans">
    <div>
    <header class="bg-blue-900 bg-opacity-90 text-white text-center py-5 shadow-lg">
            <h1 class="text-3xl font-extrabold flex items-center justify-center gap-3">
                <i class="fas fa-tasks"></i> Gestión360 - Lista de Integrantes
            </h1>
    </header>
     <nav class="bg-blue-800 bg-opacity-90 shadow-md">
            <ul class="flex justify-center space-x-6 py-4">
            <li><a href="/Gestion360"class="text-white hover:bg-blue-700 px-5 py-2 rounded transition duration-300 flex items-center gap-2 "><i class="fas fa-home "></i> Inicio</a></li>
            <li><a href="/Gestion360/Tareas" class="text-white hover:bg-blue-700 px-5 py-2 rounded transition duration-300 flex items-center gap-2 "><i class="fas fa-tasks"></i> Tareas</a></li>
            <li><a href="/Gestion360/Usuarios"class="text-white hover:bg-blue-700 px-5 py-2 rounded transition duration-300 flex items-center gap-2 "><i class="fas fa-users"></i> Usuarios</a></li>
            <li><a href="/Gestion360/Equipos" class="text-white hover:bg-blue-700 px-5 py-2 rounded transition duration-300 flex items-center gap-2"><i class="fas fa-briefcase"></i> Equipos</a></li>
            <li><a href="/Gestion360/UsuariosEquipos" class="text-white hover:bg-blue-700 px-5 py-2 rounded transition duration-300 flex items-center gap-2 rounded border border-white border-solid"><i class="fas fa-address-book"></i> Lista de Integrantes</a></li>
        </ul>
        </nav>

    <main class="p-4">
        <div class="flex flex-wrap justify-center gap-6">
            <%
                List<UsuariosEquipos> usuariosEquipos = (List<UsuariosEquipos>) request.getAttribute("usuariosEquipos");
                if (usuariosEquipos != null && !usuariosEquipos.isEmpty()) {
                    for (UsuariosEquipos usuariosEquipo : usuariosEquipos) {
            %>
		      <div class="flex bg-white shadow-lg w-96 p-6 rounded-lg border border-gray-300 hover:shadow-xl transition">
		    		<div class="flex flex-col w-full space-y-4">
		        
		        <h2 class="text-xl font-bold text-blue-600 text-center border-b pb-2"><%= usuariosEquipo.getEquipo() %></h2>
		        <p class="text-gray-700 text-sm"><span class="font-semibold">Integrantes:</span> <%= usuariosEquipo.getIntegrantes() %></p>
		
		    </div>
		</div>
            <%  
                    } 
                } else { 
            %>
            <p class="text-center text-gray-600 w-full">No se encontraron registros</p>
            <% } %>
        </div>
        <div class="text-center font-bold mt-4">Total registros: <%= (usuariosEquipos != null) ? usuariosEquipos.size() : 0 %></div>
    </main>

    <footer class="bg-blue-600 text-white text-center py-3 mt-6">
        <p>&copy; 2025 Gestión360 - Sistema de Gestión de Tareas. Instituto SISE.</p>
    </footer>
    </div>
</body>
</html>