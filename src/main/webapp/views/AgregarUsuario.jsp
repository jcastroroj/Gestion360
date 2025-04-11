<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Agregar usuario</title>
    <script src="https://unpkg.com/@tailwindcss/browser@4"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/js/all.min.js" defer></script>
</head>
<body class="bg-gray-100 font-sans min-h-screen flex flex-col">
    <!-- Encabezado -->
    <header class="bg-blue-900 text-white text-center py-5 shadow-lg">
        <h1 class="text-3xl font-extrabold flex items-center justify-center gap-3">
            <i class="fas fa-user-plus"></i> Gestión360 - Agregar Usuario
        </h1>
    </header>

    <!-- Contenido centrado -->
    <main class="flex-grow flex items-center justify-center p-4">
        <div class="bg-white p-8 rounded-2xl shadow-xl w-full max-w-xl">
            <h2 class="text-2xl font-bold text-center text-gray-800 mb-6">Formulario de registro</h2>
            <form action="/Gestion360/Usuarios" method="post" class="space-y-4">
                <input type="hidden" name="action" value="agregar">
                <div>
                    <label class="block text-sm font-medium text-gray-700">Nombre:</label>
                    <input type="text" name="nombre" required class="mt-1 w-full rounded-xl border-gray-300 shadow-sm focus:ring-blue-500 focus:border-blue-500">
                </div>
                <div class="grid grid-cols-2 gap-4">
                    <div>
                        <label class="block text-sm font-medium text-gray-700">Apellido Paterno:</label>
                        <input type="text" name="apellidoPaterno" required class="mt-1 w-full rounded-xl border-gray-300 shadow-sm focus:ring-blue-500 focus:border-blue-500">
                    </div>
                    <div>
                        <label class="block text-sm font-medium text-gray-700">Apellido Materno:</label>
                        <input type="text" name="apellidoMaterno" required class="mt-1 w-full rounded-xl border-gray-300 shadow-sm focus:ring-blue-500 focus:border-blue-500">
                    </div>
                </div>
                <div>
                    <label class="block text-sm font-medium text-gray-700">Correo:</label>
                    <input type="email" name="correo" required class="mt-1 w-full rounded-xl border-gray-300 shadow-sm focus:ring-blue-500 focus:border-blue-500">
                </div>
                <div>
                    <label class="block text-sm font-medium text-gray-700">Teléfono:</label>
                    <input type="text" name="telefono" required class="mt-1 w-full rounded-xl border-gray-300 shadow-sm focus:ring-blue-500 focus:border-blue-500">
                </div>
                <div class="grid grid-cols-2 gap-4">
                    <div>
                        <label class="block text-sm font-medium text-gray-700">Sexo:</label>
                        <select name="sexo" required class="mt-1 w-full rounded-xl border-gray-300 shadow-sm focus:ring-blue-500 focus:border-blue-500">
                            <option value="M">Masculino</option>
                            <option value="F">Femenino</option>
                        </select>
                    </div>
                    <div>
                        <label class="block text-sm font-medium text-gray-700">Tipo de documento:</label>
                        <select name="tipoDocumento" required class="mt-1 w-full rounded-xl border-gray-300 shadow-sm focus:ring-blue-500 focus:border-blue-500">
                            <option value="DNI">DNI</option>
                            <option value="CE">CE</option>
                            <option value="RUC">RUC</option>
                        </select>
                    </div>
                </div>
                <div>
                    <label class="block text-sm font-medium text-gray-700">Número de documento:</label>
                    <input type="text" name="numeroDocumento" required class="mt-1 w-full rounded-xl border-gray-300 shadow-sm focus:ring-blue-500 focus:border-blue-500">
                </div>
                <div class="grid grid-cols-2 gap-4">
                    <div>
                        <label class="block text-sm font-medium text-gray-700">Nombre de usuario:</label>
                        <input type="text" name="username" required class="mt-1 w-full rounded-xl border-gray-300 shadow-sm focus:ring-blue-500 focus:border-blue-500">
                    </div>
                    <div>
                        <label class="block text-sm font-medium text-gray-700">Contraseña:</label>
                        <input type="password" name="password" required class="mt-1 w-full rounded-xl border-gray-300 shadow-sm focus:ring-blue-500 focus:border-blue-500">
                    </div>
                </div>
                <div>
                    <label class="block text-sm font-medium text-gray-700">Rol:</label>
                    <select name="idRol" required class="mt-1 w-full rounded-xl border-gray-300 shadow-sm focus:ring-blue-500 focus:border-blue-500">
                        <option value="1">Administrador</option>
                        <option value="2">Usuario</option>
                    </select>
                </div>
                <div>
                    <label class="block text-sm font-medium text-gray-700">Fecha de nacimiento:</label>
                    <input type="date" name="fechaNacimiento" required class="mt-1 w-full rounded-xl border-gray-300 shadow-sm focus:ring-blue-500 focus:border-blue-500">
                </div>
                <div class="text-center">
                    <button type="submit" class="mt-4 px-6 py-2 bg-blue-600 text-white font-semibold rounded-xl hover:bg-blue-700 transition duration-300">
                        Agregar usuario
                    </button>
                </div>
            </form>
        </div>
    </main>

    <!-- Pie de página -->
    <footer class="bg-blue-600 text-white text-center py-3">
        <p>&copy; 2025 Gestión360 - Sistema de Gestión de Tareas. Instituto SISE</p>
    </footer>
</body>
</html>