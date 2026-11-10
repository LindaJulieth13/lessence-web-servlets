
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.lessence.modelo.Perfume" %>

<%!
    private String escapar(String texto) {
        if (texto == null) return "";

        return texto.replace("&", "&amp;")
                    .replace("<", "&lt;")
                    .replace(">", "&gt;")
                    .replace("\"", "&quot;")
                    .replace("'", "&#39;");
    }
%>

<%
    List<Perfume> perfumes =
        (List<Perfume>) request.getAttribute("perfumes");

    String mensaje = (String) request.getAttribute("mensaje");
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Inventario | L'ESSENCE</title>

    <style>
        * {
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }

        body {
            background: #111;
            color: white;
            margin: 0;
            padding: 25px;
        }

        header {
            text-align: center;
            padding: 20px;
            border-bottom: 2px solid #c5a45b;
        }

        h1 {
            color: #c5a45b;
            letter-spacing: 4px;
        }

        .contenedor {
            max-width: 1000px;
            margin: 35px auto;
        }

        .mensaje {
            background: #254b35;
            color: white;
            padding: 14px;
            border-radius: 6px;
            margin-bottom: 20px;
        }

        .tabla-contenedor {
            overflow-x: auto;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background: #202020;
        }

        th, td {
            padding: 14px;
            border-bottom: 1px solid #444;
            text-align: left;
        }

        th {
            color: #c5a45b;
        }

        a {
            display: inline-block;
            margin-top: 25px;
            padding: 12px 20px;
            background: #c5a45b;
            color: #111;
            text-decoration: none;
            border-radius: 6px;
            font-weight: bold;
        }
    </style>
</head>

<body>

    <header>
        <h1>L'ESSENCE</h1>
        <p>Inventario de perfumes</p>
    </header>

    <main class="contenedor">

        <h2>Perfumes registrados</h2>

        <% if (mensaje != null) { %>
            <div class="mensaje">
                <%= escapar(mensaje) %>
            </div>
        <% } %>

        <div class="tabla-contenedor">
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Nombre</th>
                        <th>Marca</th>
                        <th>Categoría</th>
                        <th>Precio</th>
                        <th>Stock</th>
                    </tr>
                </thead>

                <tbody>
                    <% if (perfumes != null && !perfumes.isEmpty()) { %>

                        <% for (Perfume perfume : perfumes) { %>
                            <tr>
                                <td><%= perfume.getId() %></td>
                                <td><%= escapar(perfume.getNombre()) %></td>
                                <td><%= escapar(perfume.getMarca()) %></td>
                                <td><%= escapar(perfume.getCategoria()) %></td>
                                <td>$<%= perfume.getPrecio() %></td>
                                <td><%= perfume.getStock() %></td>
                            </tr>
                        <% } %>

                    <% } else { %>
                        <tr>
                            <td colspan="6">
                                No hay perfumes registrados.
                            </td>
                        </tr>
                    <% } %>
                </tbody>
            </table>
        </div>

        <a href="<%= request.getContextPath() %>/index.html">
            Volver al inicio
        </a>

    </main>

</body>
</html>
