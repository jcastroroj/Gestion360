<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Agregar Nuevo Equipo</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 font-sans flex flex-col min-h-screen">
    <header class="bg-blue-900 text-white text-center py-4 shadow-lg">
        <h1 class="text-3xl font-extrabold">Agregar Nuevo Equipo</h1>
    </header>

    <main class="flex-grow p-6">
        <div class="max-w-lg mx-auto bg-white p-6 rounded-lg shadow-lg">
            <form action="Equipos" method="POST">
                <input type="hidden" name="action" value="agregar">
                
                <!-- Nombre del Equipo -->
                <div class="mb-4">
                    <label for="nombre" class="block text-sm font-medium text-gray-700">Nombre del Equipo:</label>
                    <input type="text" id="nombre" name="nombre" required class="mt-1 block w-full px-4 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-2 focus:ring-blue-600 focus:border-transparent">
                </div>
                
                <!-- Descripción -->
                <div class="mb-4">
                    <label for="descripcion" class="block text-sm font-medium text-gray-700">Descripción:</label>
                    <textarea id="descripcion" name="descripcion" required class="mt-1 block w-full px-4 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-2 focus:ring-blue-600 focus:border-transparent"></textarea>
                </div>
                
                <!-- Botón Enviar -->
                <div class="mb-4 text-center">
                    <button type="submit" class="w-full bg-blue-600 text-white py-2 px-4 rounded-lg hover:bg-blue-700 transition duration-300">
                        Agregar Equipo
                    </button>
                </div>
            </form>

            <!-- Enlace para Volver -->
            <div class="text-center">
                <a href="Equipos" class="text-blue-600 hover:text-blue-800">Volver a la lista de equipos</a>
            </div>
        </div>
    </main>

    <footer class="bg-blue-900 text-white text-center py-3">
        <p>&copy; 2025 Gestión360 - Sistema de Gestión de Tareas. Instituto SISE.</p>
    </footer>
</body>
</html>