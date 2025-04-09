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
                <i class="fas fa-tasks"></i> Gestión360 - Equipos
            </h1>
        </header>
        
        <nav class="bg-blue-800 bg-opacity-90 shadow-md">
            <ul class="flex justify-center space-x-6 py-4">
                <li><a href="/Gestion360" class="text-white hover:bg-blue-700 px-5 py-2 rounded transition duration-300 flex items-center gap-2"><i class="fas fa-home"></i> Inicio</a></li>
                <li><a href="/Gestion360/Tareas" class="text-white hover:bg-blue-700 px-5 py-2 rounded transition duration-300 flex items-center gap-2"><i class="fas fa-tasks"></i> Tareas</a></li>
                <li><a href="/Gestion360/Usuarios" class="text-white hover:bg-blue-700 px-5 py-2 rounded transition duration-300 flex items-center gap-2"><i class="fas fa-users"></i> Usuarios</a></li>
                <li><a href="/Gestion360/Equipos" class="text-white hover:bg-blue-700 px-5 py-2 rounded transition duration-300 flex items-center gap-2 rounded border border-white border-solid"><i class="fas fa-briefcase"></i> Equipos</a></li>
                <li><a href="/Gestion360/UsuariosEquipos" class="text-white hover:bg-blue-700 px-5 py-2 rounded transition duration-300 flex items-center gap-2"><i class="fas fa-address-book"></i> Lista de Integrantes</a></li>
            </ul>
        </nav>

        <main class="p-6">
            <div class="overflow-x-auto">
                <%
                    List<Equipos> equipos = (List<Equipos>) request.getAttribute("equipos");
                    if (equipos != null && !equipos.isEmpty()) {
                %>
				<div class="flex justify-center">
				    <!-- Reducido el ancho al 70% y ajustes adicionales en la tabla -->
				    <table class="w-[70%] border border-gray-300 bg-white shadow-md rounded-lg overflow-hidden text-base">
				        <thead class="bg-blue-700 text-white uppercase text-center text-lg">
				            <tr>
				                <!-- Alineado de la celda de "Nombre" y mayor tamaño de letra -->
				                <th class="px-6 py-3 w-2/3 text-left">Nombre</th>
				                <th class="px-6 py-3 w-1/3 text-center">Acciones</th>
				            </tr>
				        </thead>
				        <tbody class="text-gray-800 text-lg">
				            <% for (Equipos equipo : equipos) { %>
				            <tr class="border-t hover:bg-gray-100 transition duration-200">
				                <!-- Ajustando el color del nombre a un tono más oscuro -->
				               <td class="px-6 py-3 text-left cursor-pointer text-black font-semibold" onclick="toggleDescripcion(<%= equipo.getIdEquipo() %>)">
							    <div class="flex items-center gap-2">
							        <span><%= equipo.getNombre() %></span>
							    </div>
						    	</td>
				                <td class="px-6 py-3 text-center">
				                    <div class="flex items-center justify-center gap-4">
				                        <form action="/Gestion360/EquiposEditar" method="get" class="m-0">
				                            <input type="hidden" name="idEquipo" value="<%= equipo.getIdEquipo() %>">
				                            <button type="submit" class="text-blue-600 hover:text-blue-800 text-lg" title="Editar">
				                                <i class="fas fa-edit"></i>
				                            </button>
				                        </form>
				                        <form action="/Gestion360/EquiposEliminar" method="post" class="m-0" onsubmit="return confirm('¿Estás seguro de eliminar este equipo?');">
				                            <input type="hidden" name="idEquipo" value="<%= equipo.getIdEquipo() %>">
				                            <button type="submit" class="text-red-600 hover:text-red-800 text-lg" title="Eliminar">
				                                <i class="fas fa-trash-alt"></i>
				                            </button>
				                        </form>
				                    </div>
				                </td>
				            </tr>
				            <tr id="descripcion-<%= equipo.getIdEquipo() %>" class="hidden border-t bg-gray-50">
				                <!-- Descripción con color negro más oscuro -->
				                <td colspan="2" class="px-6 py-4 text-left text-sm text-gray-900">
				                    <strong class="text-red-700 font-bold">• Descripción:</strong> <%= equipo.getDescripcion() %>
				                </td>
				            </tr>
				            <% } %>
				        </tbody>
				    </table>
				</div>
				<div class="text-center font-bold mt-4">Total registros: <%= equipos.size() %></div>
                <% } else { %>
                    <p class="text-center text-gray-600 w-full">No se encontraron registros</p>
                <% } %>
            </div>
        </main>

        <footer class="bg-blue-600 text-white text-center py-3 mt-6">
            <p>&copy; 2025 Gestión360 - Sistema de Gestión de Tareas. Instituto SISE.</p>
        </footer>
    </div>
</body>
<script>
function toggleDescripcion(id) {
    const row = document.getElementById('descripcion-' + id);
    row.classList.toggle('hidden');
}
</script>
</html>