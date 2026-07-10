<!-- schema/promessi-sposi.sch -->
<schema xmlns="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt">
  <ns prefix="t" uri="http://www.tei-c.org/ns/1.0"/>
  <ns prefix="xml" uri="http://www.w3.org/XML/1998/namespace"/>

  <pattern id="zone-type">
    <rule context="t:zone">
      <assert test="@type='line' or @type='illustration' or @type='runningHead' or @type='pageNum' or @type='signature'">zone <value-of select="@xml:id"/> has invalid @type "<value-of select="@type"/>"</assert>
      <assert test="number(@ulx) &lt; number(@lrx)">zone <value-of select="@xml:id"/> bbox not left-to-right (ulx &gt;= lrx)</assert>
      <assert test="number(@uly) &lt; number(@lry)">zone <value-of select="@xml:id"/> bbox not top-to-bottom (uly &gt;= lry)</assert>
    </rule>
  </pattern>

  <pattern id="line-needs-n">
    <rule context="t:zone[@type='line']">
      <assert test="@n">line zone <value-of select="@xml:id"/> missing @n</assert>
    </rule>
  </pattern>

  <pattern id="marginalia-no-text">
    <rule context="t:zone[@type='pageNum' or @type='signature' or @type='runningHead']">
      <assert test="normalize-space(.)=''">marginalia zone <value-of select="@xml:id"/> unexpectedly carries transcribed text</assert>
    </rule>
  </pattern>

  <pattern id="facs-syntax">
    <rule context="*[@facs]">
      <assert test="starts-with(@facs,'facsimile.xml#')">@facs not a facsimile.xml fragment: <value-of select="@facs"/></assert>
    </rule>
  </pattern>
</schema>
