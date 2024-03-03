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
        <h2>Productos Vendidos en el Trimestre 1 y 2 de 2021</h2>
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
          <xsl:apply-templates select="//año_2021/trimestre_1/pedido | //año_2021/trimestre_2/pedido" />
        </table>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="pedido">
    <xsl:apply-templates select="detalle_pedido/productos/producto" />
  </xsl:template>

  <xsl:template match="producto">
    <tr>
      <td><xsl:value-of select="../../cliente/nombre" /></td>
      <td><xsl:value-of select="../../../fecha_inclusion" /></td>
      <td><xsl:value-of select="../numero_pedido" /></td>
      <td><xsl:value-of select="nombre" /></td>
      <td><xsl:value-of select="referencia" /></td>
      <td><xsl:value-of select="precio" /></td>
      <td><xsl:value-of select="unidades" /></td>
      <td>
        <xsl:value-of select="number(precio) * number(unidades)" />
      </td>
    </tr>
  </xsl:template>

</xsl:stylesheet>
