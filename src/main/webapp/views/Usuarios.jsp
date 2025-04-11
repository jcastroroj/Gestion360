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
                <li><a href="/Gestion360" class="text-white hover:bg-blue-700 px-5 py-2 rounded transition duration-300 flex items-center gap-2"><i class="fas fa-home"></i> Inicio</a></li>
                <li><a href="/Gestion360/Tareas" class="text-white hover:bg-blue-700 px-5 py-2 rounded transition duration-300 flex items-center gap-2"><i class="fas fa-tasks"></i> Tareas</a></li>
                <li><a href="/Gestion360/Usuarios" class="text-white hover:bg-blue-700 px-5 py-2 rounded transition duration-300 flex items-center gap-2 rounded border border-white border-solid"><i class="fas fa-users"></i> Usuarios</a></li>
                <li><a href="/Gestion360/Equipos" class="text-white hover:bg-blue-700 px-5 py-2 rounded transition duration-300 flex items-center gap-2"><i class="fas fa-briefcase"></i> Equipos</a></li>
                <li><a href="/Gestion360/UsuariosEquipos" class="text-white hover:bg-blue-700 px-5 py-2 rounded transition duration-300 flex items-center gap-2"><i class="fas fa-address-book"></i> Lista de Integrantes</a></li>
            </ul>
        </nav>

        <main class="p-6">
            <div class="text-right mb-4">
                <a href="Usuarios?action=agregar" class="bg-blue-600 text-white py-2 px-6 rounded-full hover:bg-blue-700 transition duration-300">
                    <i class="fas fa-plus"></i> Agregar Nuevo Usuario
                </a>
            </div>

            <div class="overflow-x-auto">
                <%
                    List<Usuarios> usuarios = (List<Usuarios>) request.getAttribute("usuarios");
                    if (usuarios != null && !usuarios.isEmpty()) {
                %>
                <table class="min-w-full border border-gray-300 bg-white shadow-md rounded-lg overflow-hidden">
                    <thead class="bg-blue-700 text-white text-sm uppercase text-left">
                        <tr>
                            <th class="px-4 py-3">Nombre completo</th>
                            <th class="px-4 py-3">Usuario</th>
                            <th class="px-4 py-3">Rol</th>
                            <th class="px-4 py-3">Documento</th>
                            <th class="px-4 py-3">Correo</th>
                            <th class="px-4 py-3">Teléfono</th>
                            <th class="px-4 py-3">Sexo</th>
                            <th class="px-4 py-3">Nacimiento</th>
                            <th class="px-4 py-3 text-center">Acciones</th>
                        </tr>
                    </thead>
                    <tbody class="text-sm text-gray-900">
                        <% for (Usuarios usuario : usuarios) { %>
                        <tr class="border-t hover:bg-gray-100 transition duration-200">
                            <td class="px-4 py-2 font-semibold text-gray-900">
                                <%= usuario.getNombre() %> <%= usuario.getApellidoPaterno() %> <%= usuario.getApellidoMaterno() %>
                            </td>
                            <td class="px-4 py-2"><%= usuario.getUsername() %></td>
                            <td class="px-4 py-2"><%= usuario.getNombreRol() %></td>
                            <td class="px-4 py-2"><%= usuario.getTipoDocumento() %> - <%= usuario.getNumeroDocumento() %></td>
                            <td class="px-4 py-2"><%= usuario.getCorreo() %></td>
                            <td class="px-4 py-2"><%= usuario.getTelefono() %></td>
                            <td class="px-4 py-2"><%= usuario.getSexo() %></td>
                            <td class="px-4 py-2"><%= usuario.getFechaNacimiento() %></td>
                            
                            <td class="px-4 py-2 flex justify-center items-center gap-3">
                                
                                
                                <!-- Botón Eliminar -->
                                <form id="formEliminar<%= usuario.getIdUsuario() %>" action="/Gestion360/Usuarios" method="get" class="m-0" onsubmit="return mostrarModalConfirmacion(<%= usuario.getIdUsuario() %>);">
                                    <input type="hidden" name="action" value="eliminar">
                                    <input type="hidden" name="idUsuario" value="<%= usuario.getIdUsuario() %>">
                                    <button type="submit" class="text-red-600 hover:text-red-800 text-lg relative" title="Eliminar">
                                        <i class="fas fa-trash-alt"></i>
                                    </button>
                                </form>
                            </td>
                        </tr>
                        <% } %>
                    </tbody>
                </table>
                <div class="text-center font-bold mt-4">Total registros: <%= usuarios.size() %></div>
                <% } else { %>
                    <p class="text-center text-gray-600 w-full">No se encontraron registros</p>
                <% } %>
            </div>
        </main>

        <footer class="bg-blue-600 text-white text-center py-3 mt-6">
            <p>&copy; 2025 Gestión360 - Sistema de Gestión de Tareas. Instituto SISE.</p>
        </footer>
    </div>

    <script>
        function mostrarModalConfirmacion(idUsuario) {
            return confirm("¿Estás seguro de que deseas eliminar este usuario?");
        }
    </script>
</body>
</html>