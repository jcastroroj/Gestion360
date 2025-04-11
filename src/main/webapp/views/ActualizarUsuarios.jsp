<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="models.Usuarios" %>
<%@ page import="java.text.SimpleDateFormat" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestión360 - Actualizar Usuario</title>
    <script src="https://unpkg.com/@tailwindcss/browser@4"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/js/all.min.js" defer></script>
</head>
<body class="bg-gray-100 font-sans">
    <div>
        <header class="bg-blue-900 text-white text-center py-5 shadow-lg">
            <h1 class="text-3xl font-extrabold flex items-center justify-center gap-3">
                <i class="fas fa-user-edit"></i> Gestión360 - Actualizar Usuario
            </h1>
        </header>

        <main class="max-w-3xl mx-auto mt-10 bg-white p-8 shadow-md rounded">
            <%
                Usuarios usuario = (Usuarios) request.getAttribute("usuario");

                if (usuario == null) {
                    out.println("<p class='text-red-600 font-semibold'>No se encontró el usuario.</p>");
                    return;
                }

                String fechaNacimientoStr = "";
                if (usuario.getFechaNacimiento() != null) {
                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                    fechaNacimientoStr = sdf.format(usuario.getFechaNacimiento());
                }
            %>

            <form action="/Gestion360/Usuarios" method="post" class="grid grid-cols-1 gap-4">
                <!-- ✅ Correcciones importantes -->
                <input type="hidden" name="action" value="actualizar">
                <input type="hidden" name="idUsuario" value="<%= usuario.getIdUsuario() %>">
                <input type="hidden" name="idRol" value="<%= usuario.getIdRol() %>"> <!-- Si no estás mostrando un select -->

                <label class="font-semibold">Tipo Documento:
                    <input type="text" name="tipoDocumento" value="<%= usuario.getTipoDocumento() %>" required class="input input-bordered w-full">
                </label>

                <label class="font-semibold">Número Documento:
                    <input type="text" name="numeroDocumento" value="<%= usuario.getNumeroDocumento() %>" required class="input input-bordered w-full">
                </label>

                <label class="font-semibold">Usuario:
                    <input type="text" name="username" value="<%= usuario.getUsername() %>" required class="input input-bordered w-full">
                </label>

                <label class="font-semibold">Contraseña:
                    <input type="password" name="password" value="<%= usuario.getPassword() %>" required class="input input-bordered w-full">
                </label>

                <label class="font-semibold">Nombre:
                    <input type="text" name="nombre" value="<%= usuario.getNombre() != null ? usuario.getNombre() : "" %>" required class="input input-bordered w-full">
                </label>

                <label class="font-semibold">Apellido Paterno:
                    <input type="text" name="apellidoPaterno" value="<%= usuario.getApellidoPaterno() != null ? usuario.getApellidoPaterno() : "" %>" required class="input input-bordered w-full">
                </label>

                <label class="font-semibold">Apellido Materno:
                    <input type="text" name="apellidoMaterno" value="<%= usuario.getApellidoMaterno() != null ? usuario.getApellidoMaterno() : "" %>" required class="input input-bordered w-full">
                </label>

                <label class="font-semibold">Correo:
                    <input type="email" name="correo" value="<%= usuario.getCorreo() != null ? usuario.getCorreo() : "" %>" required class="input input-bordered w-full">
                </label>

                <label class="font-semibold">Teléfono:
                    <input type="text" name="telefono" value="<%= usuario.getTelefono() != null ? usuario.getTelefono() : "" %>" required class="input input-bordered w-full">
                </label>

                <label class="font-semibold">Sexo:
                    <select name="sexo" required class="input input-bordered w-full">
                        <option value="M" <%= "M".equals(usuario.getSexo()) ? "selected" : "" %>>Masculino</option>
                        <option value="F" <%= "F".equals(usuario.getSexo()) ? "selected" : "" %>>Femenino</option>
                    </select>
                </label>

                <label class="font-semibold">Fecha de Nacimiento:
                    <input type="date" name="fechaNacimiento" value="<%= fechaNacimientoStr %>" required class="input input-bordered w-full">
                </label>

                <button type="submit" class="bg-blue-600 hover:bg-blue-700 text-white font-semibold py-2 px-4 rounded transition-all mt-4">
                    <i class="fas fa-save mr-2"></i>Actualizar
                </button>
            </form>
        </main>

        <footer class="bg-blue-600 text-white text-center py-3 mt-10">
            <p>&copy; 2025 Gestión360 - Sistema de Gestión de Tareas. Instituto SISE.</p>
        </footer>
    </div>
</body>
</html>