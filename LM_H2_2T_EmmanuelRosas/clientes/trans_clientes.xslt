<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:template match="/">
    <html>
      <head>
        <style>
          table {
            border-collapse: collapse;
            width: 100%;
          }
          th, td {
            border: 1px solid #dddddd;
            text-align: left;
            padding: 8px;
          }
          th {
            background-color: #f2f2f2;
          }
        </style>
      </head>
      <body>
        <h2>Información de Clientes</h2>
        <table>
          <tr>
            <th>Nombre</th>
            <th>Apellidos</th>
            <th>Teléfono</th>
            <th>Dirección</th>
            <th>Correo Electrónico</th>
            <th>Fecha de Inclusión</th>
            <th>Número de Pedido</th>
            <th>Fecha de Compra</th>
            <th>Fecha de Entrega</th>
            <th>Total de Factura</th>
            <th>Producto</th>
            <th>Referencia</th>
            <th>Precio</th>
            <th>Unidades</th>
          </tr>
          <xsl:apply-templates select="//pedido/cliente" />
        </table>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="cliente">
    <xsl:variable name="cliente" select="."/>
    <xsl:apply-templates select="//pedido[cliente = $cliente]" />
  </xsl:template>

  <xsl:template match="pedido">
    <tr>
      <td><xsl:value-of select="cliente/nombre" /></td>
      <td><xsl:value-of select="cliente/apellidos" /></td>
      <td><xsl:value-of select="cliente/telefono" /></td>
      <td>
        <xsl:value-of select="concat(cliente/direccion/calle, ', ', cliente/direccion/ciudad, ', ', cliente/direccion/provincia, ' ', cliente/direccion/codigo_postal)" />
      </td>
      <td><xsl:value-of select="cliente/correo_electronico" /></td>
      <td><xsl:value-of select="fecha_inclusion" /></td>
      <td><xsl:value-of select="detalle_pedido/numero_pedido" /></td>
      <td><xsl:value-of select="detalle_pedido/fecha_compra" /></td>
      <td><xsl:value-of select="detalle_pedido/fecha_entrega" /></td>
      <td><xsl:value-of select="detalle_pedido/total_factura" /></td>
      <xsl:apply-templates select="detalle_pedido/productos/producto" />
    </tr>
  </xsl:template>

  <xsl:template match="producto">
    <td><xsl:value-of select="nombre" /></td>
    <td><xsl:value-of select="referencia" /></td>
    <td><xsl:value-of select="precio" /></td>
    <td><xsl:value-of select="unidades" /></td>
  </xsl:template>
  

</xsl:stylesheet>
