<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="html" encoding="UTF-8" indent="yes" doctype-system="about:legacy-compat"/>

    <!-- Página principal -->
    <xsl:template match="/blog">
        <html>
            <head>
                <meta charset="UTF-8"/>
                <title>Blog de reseñas de libros</title>
                <style>
                    body {
                    font-family: Georgia, serif;
                    max-width: 800px;
                    margin: 0 auto;
                    padding: 20px;
                    background: #f5f5f5;
                    color: #222;
                    }
                    h1 { text-align: center; color: #2b3a67; }
                    .entrada {
                    background: white;
                    border: 1px solid #ccc;
                    border-radius: 8px;
                    padding: 20px;
                    margin-bottom: 25px;
                    }
                    .entrada h2 { color: #2b3a67; margin-top: 0; }
                    .entrada img { max-width: 150px; }
                    .nota-general { font-size: 1.3em; font-weight: bold; color: #2b3a67; }
                    .final { text-align: center; }
                    .final img { max-width: 200px; }
                </style>
            </head>
            <body>
                <h1>Reseñas de libros de Rubén</h1>
                <p><xsl:value-of select="resumen"/></p>

                <xsl:apply-templates select="entrada"/>

                <p class="final"><img src="{imagen-final}" alt="Imagen final"/></p>
            </body>
        </html>
    </xsl:template>

    <!-- Cada entrada -->
    <xsl:template match="entrada">
        <div class="entrada">
            <h2><xsl:value-of select="libro/titulo"/></h2>
            <img src="{libro/imagen}" alt="Portada"/>
            <p>
                <strong>Autor:</strong> <xsl:value-of select="libro/autor"/><br/>
                <strong>Género:</strong> <xsl:value-of select="libro/genero"/><br/>
                <strong>Año:</strong> <xsl:value-of select="libro/fecha_publicacion"/><br/>
                <strong>Precio:</strong> <xsl:value-of select="libro/precio"/><xsl:text> </xsl:text><xsl:value-of select="libro/precio/@moneda"/>
            </p>

            <h3>Edición (<xsl:value-of select="review/edicion/@formato"/>)</h3>
            <img src="{review/edicion/imagen-edicion}" alt="Edición"/>
            <p><em><xsl:value-of select="review/edicion/editorial"/></em></p>
            <p><strong>Nota: <xsl:value-of select="review/edicion/nota"/></strong></p>
            <p><xsl:value-of select="review/edicion/critica"/></p>

            <h3>Ritmo</h3>
            <p><strong>Nota: <xsl:value-of select="review/ritmo/nota"/></strong></p>
            <p><xsl:value-of select="review/ritmo/critica"/></p>

            <h3>Historia</h3>
            <p><strong>Nota: <xsl:value-of select="review/historia/nota"/></strong></p>
            <p><xsl:value-of select="review/historia/critica"/></p>

            <h3>Opinión general</h3>
            <p class="nota-general">Nota general: <xsl:value-of select="review/nota-general"/></p>
            <p><xsl:value-of select="review/reseña-general"/></p>
        </div>
    </xsl:template>

</xsl:stylesheet>
