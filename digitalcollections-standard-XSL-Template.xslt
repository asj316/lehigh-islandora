<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
  <!-- Spreadsheet ingest will pass in the contents of each cell, using column
       headers as parameter names. Note the use of the same label column used as
       a reserved field by spreadsheet ingest. It's being reused here to place
       in the MODS. Note also that not every column header is present here, as
       this is not necessary. -->
  <xsl:param name="Title"/>
  <xsl:param name="Creator"/>
  <xsl:param name="Contributors"/>
  <xsl:param name="Department"/>
  <xsl:param name="Type"/>
  <xsl:param name="Genre"/>
  <xsl:param name="Genre-URI"/>
  <xsl:param name="Date-Created"/>
  <xsl:param name="Date-Created-Qualifier"/>
  <xsl:param name="Year"/>
  <xsl:param name="Season"/>
  <xsl:param name="Range-Start"/>
  <xsl:param name="Range-End"/>
  <xsl:param name="Date-Captured"/>
  <xsl:param name="Publisher"/>
  <xsl:param name="Language-Code"/>
  <xsl:param name="Language-Text"/>
  <xsl:param name="Format"/>
  <xsl:param name="Format-URI"/>
  <xsl:param name="Original-Coloration-Size"/>
  <xsl:param name="File-Format"/>
  <xsl:param name="Page-Count"/>
  <xsl:param name="Dimensions"/>
  <xsl:param name="Digital-Origin"/>
  <xsl:param name="Description-Abstract"/>
  <xsl:param name="Table-Of-Contents"/>
  <xsl:param name="Preferred-Citation"/>
  <xsl:param name="Capture-Device"/>
  <xsl:param name="Staff"/>
  <xsl:param name="PPI"/>
  <xsl:param name="Box"/>
  <xsl:param name="Series"/>
  <xsl:param name="Folder"/>
  <xsl:param name="Subject-Topic"/>
  <xsl:param name="Subject-Name"/>
  <xsl:param name="Subject-Geographic"/>
  <xsl:param name="Subject-Local-Place"/>
  <xsl:param name="Continent"/>
  <xsl:param name="Country"/>
  <xsl:param name="Region"/>
  <xsl:param name="State"/>
  <xsl:param name="Territory"/>
  <xsl:param name="County"/>
  <xsl:param name="City"/>
  <xsl:param name="City-Section"/>
  <xsl:param name="Island"/>
  <xsl:param name="Area"/>
  <xsl:param name="Extraterrestrial-Area"/>
  <xsl:param name="Hierarchical-Geographic-URI"/>
  <xsl:param name="Collection"/>
  <xsl:param name="Call-Number"/>
  <xsl:param name="OCLC-Number"/>
  <xsl:param name="Catalog-URL"/>
  <xsl:param name="Rights"/>
  <xsl:param name="Volume-Number"/>
  <xsl:param name="Issue-Number"/>
  <xsl:param name="Article-Number"/>
  <!-- Spreadsheet ingest calls the template named "root" to get the resultant
       XML document to be attached to each object; without a "root" template,
       metadata generation will fail. -->
  <xsl:template name="root">
    <mods xmlns="http://www.loc.gov/mods/v3"
          xmlns:mods="http://www.loc.gov/mods/v3"
          xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
          xmlns:xlink="http://www.w3.org/1999/xlink">
      <!-- Best practices typically involve testing the contents of a cell
           before adding it to the resultant document, and using normalize-space
           to trim whitespace from the edges of the cell contents. -->
      <xsl:if test="string-length($Title)">
        <titleInfo>
          <title><xsl:value-of select="normalize-space($Title)"/></title>
        </titleInfo>
      </xsl:if>
      <xsl:if test="string-length($Creator)">
        <name>
          <namePart><xsl:value-of select="normalize-space($Creator)"/></namePart>
          <role>
            <roleTerm type="text" authority="marcrelator">Creator</roleTerm>
            <roleTerm type="code" authority="marcrelator">cre</roleTerm>
          </role>
        </name>
      </xsl:if>
      <xsl:if test="string-length($Contributors)">
        <xsl:for-each select="tokenize($Contributors, ' ; ')">
          <name>
            <namePart><xsl:value-of select="normalize-space(.)"/></namePart>
            <role>
              <roleTerm type="text" authority="marcrelator">Contributor</roleTerm>
              <roleTerm type="code" authority="marcrelator">ctb</roleTerm>
            </role>
          </name>
        </xsl:for-each>  
      </xsl:if>
      <xsl:if test="string-length($Department)">
        <xsl:for-each select="tokenize($Department, ' ; ')">
          <name type="corporate">
            <namePart><xsl:value-of select="normalize-space(.)"/></namePart>
            <role>
              <roleTerm>Department</roleTerm>
            </role>
          </name>
        </xsl:for-each>
      </xsl:if>
      <xsl:if test="string-length($Type)">
        <typeOfResource><xsl:value-of select="normalize-space($Type)"/></typeOfResource>
      </xsl:if>
      <xsl:if test="string-length($Genre)">
        <genre authority="aat"><xsl:value-of select="normalize-space($Genre)"/></genre>
      </xsl:if>
      <originInfo>
      <xsl:if test="string-length($Date-Created)">
        <dateCreated encoding="iso8601" keyDate="yes"><xsl:value-of select="normalize-space($Date-Created)"/></dateCreated>
      </xsl:if>
      <xsl:if test="string-length($Year)">
        <dateOther type="year"><xsl:value-of select="normalize-space($Year)"/></dateOther>
      </xsl:if>
      <xsl:if test="string-length($Season)">
          <dateOther type="season"><xsl:value-of select="normalize-space($Season)"/></dateOther>
      </xsl:if>
      <xsl:if test="string-length($Range-Start)">
        <dateOther point="start"><xsl:value-of select="normalize-space($Range-Start)"/></dateOther>
      </xsl:if>
      <xsl:if test="string-length($Range-End)">
        <dateOther point="end"><xsl:value-of select="normalize-space($Range-End)"/></dateOther>
      </xsl:if>
      <xsl:if test="string-length($Date-Captured)">
          <dateCaptured><xsl:value-of select="normalize-space($Date-Captured)"/></dateCaptured>
      </xsl:if>
      <xsl:if test="string-length($Publisher)">
          <publisher><xsl:value-of select="normalize-space($Publisher)"/></publisher>
      </xsl:if>
      </originInfo>
      <xsl:if test="string-length($Language-Code)">
        <language>
          <languageTerm type="code" authority="iso639-2b"><xsl:value-of select="normalize-space($Language-Code)"/></languageTerm>
          <xsl:if test="string-length($Language-Text)">
            <languageTerm type="text" authority="iso639-2b"><xsl:value-of select="normalize-space($Language-Text)"/></languageTerm>
          </xsl:if>
        </language>
      </xsl:if>
      <physicalDescription>
        <xsl:if test="string-length($Format)">
          <form authority="aat"><xsl:value-of select="normalize-space($Format)"/></form>
        </xsl:if>
        <xsl:if test="string-length($File-Format)">
          <internetMediaType><xsl:value-of select="normalize-space($File-Format)"/></internetMediaType>
        </xsl:if>
        <xsl:if test="string-length($Page-Count)">
          <extent unit="page"><xsl:value-of select="normalize-space($Page-Count)"/></extent>
        </xsl:if>
        <xsl:if test="string-length($Dimensions)">
          <extent unit="dimensions"><xsl:value-of select="normalize-space($Dimensions)"/></extent>
        </xsl:if>
        <xsl:if test="string-length($Digital-Origin)">
          <digitalOrigin><xsl:value-of select="normalize-space($Digital-Origin)"/></digitalOrigin>
        </xsl:if>
        <xsl:if test="string-length($Original-Coloration-Size)">
          <note type="Original Coloration, Size,and Support"><xsl:value-of select="normalize-space($Original-Coloration-Size)"/></note>
        </xsl:if>
      </physicalDescription>
      <xsl:if test="string-length($Description-Abstract)">
        <abstract><xsl:value-of select="normalize-space($Description-Abstract)"/></abstract>
      </xsl:if>
      <xsl:if test="string-length($Table-Of-Contents)">
        <tableOfContents><xsl:value-of select="normalize-space($Table-Of-Contents)"/></tableOfContents>
      </xsl:if>
      <xsl:if test="string-length($Preferred-Citation)">
        <note type="preferred citation">
          <xsl:value-of select="normalize-space($Preferred-Citation)"/>
        </note>
      </xsl:if>
      <xsl:if test="string-length($Capture-Device)">
        <note type="capture-device"><xsl:value-of select="normalize-space($Capture-Device)"/></note>
      </xsl:if>
      <xsl:if test="string-length($Staff)">
        <note type="staff"><xsl:value-of select="normalize-space($Staff)"/></note>
      </xsl:if>
      <xsl:if test="string-length($PPI)">
        <note type="ppi"><xsl:value-of select="normalize-space($PPI)"/></note>
      </xsl:if>
      <xsl:if test="string-length($Box)">
        <note type="box"><xsl:value-of select="normalize-space($Box)"/></note>
      </xsl:if>
      <xsl:if test="string-length($Series)">
        <note type="series"><xsl:value-of select="normalize-space($Series)"/></note>
      </xsl:if>
      <xsl:if test="string-length($Folder)">
        <note type="folder"><xsl:value-of select="normalize-space($Folder)"/></note>
      </xsl:if>
      <xsl:if test="string-length($Subject-Topic)">
        <xsl:for-each select="tokenize($Subject-Topic, ' ; ')">
          <subject authority="lcsh">
            <topic><xsl:value-of select="normalize-space(.)"/></topic>
          </subject>
        </xsl:for-each>
      </xsl:if>
      <xsl:if test="string-length($Subject-Name)">
        <xsl:for-each select="tokenize($Subject-Name, ' ; ')">
          <subject>
            <name type="personal">
              <namePart><xsl:value-of select="normalize-space(.)"/></namePart>
            </name>
          </subject>
        </xsl:for-each>
      </xsl:if>
      <xsl:if test="string-length($Subject-Geographic)">
        <xsl:for-each select="tokenize($Subject-Geographic, ' ; ')">
          <subject authority="naf">
            <geographic><xsl:value-of select="normalize-space(.)"/></geographic>
          </subject>
        </xsl:for-each>
      </xsl:if>
      <xsl:if test="string-length($Subject-Local-Place)">
        <xsl:for-each select="tokenize($Subject-Local-Place, ' ; ')">
          <subject authority="local">
            <geographic><xsl:value-of select="normalize-space(.)"/></geographic>
          </subject>
        </xsl:for-each>
      </xsl:if>
      <xsl:if test="string-length($Continent) or string-length($Country) or string-length($Region) or string-length($State) or string-length($Territory) or string-length($County) or string-length($City) or string-length($City-Section) or string-length($Island) or string-length($Area) or string-length($Extraterrestrial-Area)">
        <subject authority="tgn">
          <hierarchicalGeographic>
            <xsl:if test="string-length($Continent)">
              <continent><xsl:value-of select="normalize-space($Continent)"/></continent>
            </xsl:if>
            <xsl:if test="string-length($Country)">
            <country><xsl:value-of select="normalize-space($Country)"/></country>
            </xsl:if>
            <xsl:if test="string-length($Region)">
              <region><xsl:value-of select="normalize-space($Region)"/></region>
            </xsl:if>
            <xsl:if test="string-length($State)">
            <state><xsl:value-of select="normalize-space($State)"/></state>
            </xsl:if>
            <xsl:if test="string-length($Territory)">
              <territory><xsl:value-of select="normalize-space($Territory)"/></territory>
            </xsl:if>
            <xsl:if test="string-length($County)">
              <county><xsl:value-of select="normalize-space($County)"/></county>
            </xsl:if>
            <xsl:if test="string-length($City)">
              <city><xsl:value-of select="normalize-space($City)"/></city>
            </xsl:if>
            <xsl:if test="string-length($City-Section)">
              <citySection><xsl:value-of select="normalize-space($City-Section)"/></citySection>
            </xsl:if>
            <xsl:if test="string-length($Island)">
              <island><xsl:value-of select="normalize-space($Island)"/></island>
            </xsl:if>
            <xsl:if test="string-length($Area)">
              <area><xsl:value-of select="normalize-space($Area)"/></area>
            </xsl:if>
            <xsl:if test="string-length($Extraterrestrial-Area)">
              <extraterrestrialArea><xsl:value-of select="normalize-space($Extraterrestrial-Area)"/></extraterrestrialArea>
            </xsl:if>
            </hierarchicalGeographic>
        </subject>
      </xsl:if>
      <xsl:if test="string-length($Collection)">
        <relatedItem type="host"  displayLabel="Archival Collection">
          <titleInfo>
            <title><xsl:value-of select="normalize-space($Collection)"/></title>
          </titleInfo>
        </relatedItem>
      </xsl:if>
      <xsl:if test="string-length($Call-Number)">
        <identifier type="call-number"><xsl:value-of select="normalize-space($Call-Number)"/></identifier>
      </xsl:if>
      <xsl:if test="string-length($OCLC-Number)">
        <identifier type="oclc"><xsl:value-of select="normalize-space($OCLC-Number)"/></identifier>
      </xsl:if>
      <xsl:if test="string-length($Catalog-URL)">
        <identifier type="uri" displayLabel="Catalog Record"><xsl:value-of select="normalize-space($Catalog-URL)"/></identifier>
      </xsl:if>
      <xsl:if test="string-length($Rights)">
        <accessCondition type="use and reproduction"><xsl:value-of select="normalize-space($Rights)"/></accessCondition>
      </xsl:if>
      <xsl:if test="string-length($Volume-Number) or string-length($Issue-Number) or string-length($Article-Number)">
        <part>
          <xsl:if test="string-length($Volume-Number)">
            <detail type="volume">
              <number><xsl:value-of select="normalize-space($Volume-Number)"/></number>
            </detail>
          </xsl:if>
          <xsl:if test="string-length($Issue-Number)">
            <detail type="issue">
              <number><xsl:value-of select="normalize-space($Issue-Number)"/></number>
            </detail>
          </xsl:if>
          <xsl:if test="string-length($Article-Number)">
            <detail type="article">
              <number><xsl:value-of select="normalize-space($Article-Number)"/></number>
            </detail>
          </xsl:if>
        </part>
      </xsl:if>
    </mods>
  </xsl:template>
</xsl:stylesheet>
