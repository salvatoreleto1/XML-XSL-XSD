<?xml version="1.0" encoding="UTF-8" ?>
<!--
create_bills.xsl document
Student Name: Salvatore Leto
Student ID: 18633649
-->
<xsl:stylesheet version="1.0"
     xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

   <xsl:output method="html"
      doctype-system="about:legacy-compat"
      encoding="UTF-8"
      indent="yes" />

<xsl:variable name="customerInfo" select="document('customers.xml')/customers/customer" />

<xsl:template match="/">
   <html>
      <head>
         <title>Customer Bills</title>
         <link href="vwstyles.css" rel="stylesheet" type="text/css" />
      </head>

      <body>
            <h1>Customer Information</h1>

            <section id="customer">
               <xsl:apply-templates select="customers/customer" />
            </section>

            <!-- Selecting customer name/address and account number-->
            <p><xsl:variable name="customerNumber" select="customerNumber"/></p> <br></br>
            <p><xsl:variable name="firstName" select="firstName"/></p> <br></br>
            <p><xsl:variable name="lastName" select="lastName"/></p> <br></br>
            <p><xsl:variable name="address" select="address"/></p> <br></br>
      </body>
   </html>
</xsl:template>

<xsl:template match="meter">
      <h2>Meter Section</h2>
      <table class="meterTable">
         <thead>
            <tr>
               <th>Meter Number</th>
               <th>This Read</th>
               <th>Previous Read</th>
               <th>Usage (kWh)</th>
            </tr>
         </thead>
         <tbody>
            <xsl:apply-templates select="customers/customer" />
         </tbody>
      </table>
   </xsl:template>