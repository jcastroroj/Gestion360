<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.List" %>
    <%@ page import="models.UsuariosEquipos" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestión360 - Lista De Integrantes</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 font-sans">
    <header class="bg-blue-600 text-white text-center py-4">
        <h1 class="text-2xl font-bold">Gestión360 - Lista De Integrantes</h1>
    </header>
    
    <nav class="bg-blue-800">
        <ul class="flex justify-center space-x-6 py-3">
            <li><a href="/Gestion360" class="text-white hover:bg-blue-700 px-4 py-2 rounded">Inicio</a></li>
            <li><a href="/Gestion360/Tareas" class="text-white hover:bg-blue-700 px-4 py-2 rounded">Tareas</a></li>
            <li><a href="/Gestion360/Usuarios" class="text-white hover:bg-blue-700 px-4 py-2 rounded ">Usuarios</a></li>
            <li><a href="/Gestion360/Equipos" class="text-white hover:bg-blue-700 px-4 py-2 rounded border border-white" >Equipos</a></li>
            <li><a href="/Gestion360/UsuariosEquipos" class="text-white hover:bg-blue-700 px-4 py-2 rounded">Lista de Integrantes</a></li>
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
        <p>&copy; 2025 Gestión360 - Todos los derechos reservados.</p>
    </footer>
</body>
</html>