<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="models.DetalleUsuarios" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestión360 - Detalle de Usuarios</title>
    <script src="https://unpkg.com/@tailwindcss/browser@4"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/js/all.min.js" defer></script>
</head>
<body class="bg-gray-100 font-sans">
<div>
    <!-- Header -->
    <header class="bg-blue-900 text-white text-center py-6 shadow-lg">
        <h1 class="text-3xl font-extrabold flex items-center justify-center gap-3">
            <i class="fas fa-users"></i> Detalle de Integrantes del Equipo
        </h1>
    </header>

    <!-- Navegación -->
    <nav class="bg-blue-800 shadow-md">
        <ul class="flex justify-center space-x-6 py-4">
            <li><a href="/Gestion360" class="text-white hover:bg-blue-700 px-4 py-2 rounded transition flex items-center gap-2"><i class="fas fa-home"></i> Inicio</a></li>
            <li><a href="/Gestion360/Tareas" class="text-white hover:bg-blue-700 px-4 py-2 rounded transition flex items-center gap-2"><i class="fas fa-tasks"></i> Tareas</a></li>
            <li><a href="/Gestion360/Usuarios" class="text-white hover:bg-blue-700 px-4 py-2 rounded transition flex items-center gap-2"><i class="fas fa-users"></i> Usuarios</a></li>
            <li><a href="/Gestion360/Equipos" class="text-white hover:bg-blue-700 px-4 py-2 rounded transition flex items-center gap-2"><i class="fas fa-briefcase"></i> Equipos</a></li>
            <li><a href="/Gestion360/UsuariosEquipos" class="text-white hover:bg-blue-700 px-4 py-2 rounded transition flex items-center gap-2"><i class="fas fa-address-book"></i> Lista de Integrantes</a></li>
        </ul>
    </nav>

    <!-- Contenido principal -->
    <main class="px-4 py-6">
        <div class="max-w-6xl mx-auto overflow-x-auto">
            <%
                List<DetalleUsuarios> detalleUsuarios = (List<DetalleUsuarios>) request.getAttribute("detalleUsuarios");
                if (detalleUsuarios != null && !detalleUsuarios.isEmpty()) {
            %>
            <table class="min-w-full bg-white shadow-sm rounded-lg">
                <caption class="text-lg font-semibold py-2 text-gray-700">Lista de Integrantes</caption>
                <thead>
                    <tr class="bg-blue-600 text-white">
                        <th scope="col" class="py-2 px-4 text-left">Nombre</th>
                        <th scope="col" class="py-2 px-4 text-left">Usuario</th>
                        <th scope="col" class="py-2 px-4 text-left">Documento</th>
                        <th scope="col" class="py-2 px-4 text-left">Correo</th>
                        <th scope="col" class="py-2 px-4 text-left">Teléfono</th>
                        <th scope="col" class="py-2 px-4 text-left">Sexo</th>
                        <th scope="col" class="py-2 px-4 text-left">Fecha de Nacimiento</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        for (DetalleUsuarios usuario : detalleUsuarios) {
                    %>
                    <tr class="border-t hover:bg-gray-100">
                        <td class="py-3 px-4"><%= usuario.getNombre() + " " + usuario.getApellidoPaterno() + " " + usuario.getApellidoMaterno() %></td>
                        <td class="py-3 px-4"><%= usuario.getUsername() %></td>
                        <td class="py-3 px-4"><%= usuario.getTipoDocumento() + " - " + usuario.getNumeroDocumento() %></td>
                        <td class="py-3 px-4"><%= usuario.getCorreo() %></td>
                        <td class="py-3 px-4"><%= usuario.getTelefono() %></td>
                        <td class="py-3 px-4"><%= usuario.getSexo() %></td>
                        <td class="py-3 px-4"><%= usuario.getFechaNacimiento() %></td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
            <%
                } else {
            %>
            <p class="text-center text-gray-600 mt-6">No se encontraron registros para este equipo</p>
            <% } %>

            <!-- Botón de regreso -->
            <div class="text-center mt-6">
                <a href="/Gestion360/UsuariosEquipos" class="inline-block bg-blue-600 text-white font-semibold py-2 px-6 rounded-lg hover:bg-blue-700 transition duration-200">
                    Volver a la lista de Integrantes
                </a>
            </div>
        </div>
    </main>

    <!-- Footer -->
    <footer class="bg-blue-600 text-white text-center py-3 mt-6">
        <p>&copy; 2025 Gestión360 - Sistema de Gestión de Tareas. Instituto SISE.</p>
    </footer>
</div>
</body>
</html>