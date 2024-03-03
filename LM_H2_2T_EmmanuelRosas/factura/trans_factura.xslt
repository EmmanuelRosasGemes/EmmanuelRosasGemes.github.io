<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:template match="/">
    <html>
      <head>
        <style>
          table {
            border-collapse: collapse;
            width: 50%;
            margin-top: 20px;
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
        <h2>Factura</h2>
        <table>
          <tr>
            <th>Cliente</th>
            <th>Fecha de Compra</th>
            <th>Número de Pedido</th>
            <th>Producto</th>
            <th>Referencia</th>
            <th>Precio Unitario</th>
            <th>Unidades</th>
            <th>Total</th>
          </tr>
          <xsl:apply-templates select="//pedido[1]" />
        </table>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="pedido">
    <tr>
      <td><xsl:value-of select="cliente/nombre" /></td>
      <td><xsl:value-of select="detalle_pedido/fecha_compra" /></td>
      <td><xsl:value-of select="detalle_pedido/numero_pedido" /></td>
      <td><xsl:value-of select="detalle_pedido/productos/producto/nombre" /></td>
      <td><xsl:value-of select="detalle_pedido/productos/producto/referencia" /></td>
      <td><xsl:value-of select="detalle_pedido/productos/producto/precio" /></td>
      <td><xsl:value-of select="detalle_pedido/productos/producto/unidades" /></td>
      <td>
        <xsl:value-of select="number(detalle_pedido/productos/producto/precio) * number(detalle_pedido/productos/producto/unidades)" />
      </td>
    </tr>
  </xsl:template>

</xsl:stylesheet>
