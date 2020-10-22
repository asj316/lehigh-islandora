<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
  <!-- Spreadsheet ingest will pass in the contents of each cell, using column
       headers as parameter names. Note the use of the same label column used as
       a reserved field by spreadsheet ingest. It's being reused here to place
       in the MODS. Note also that not every column header is present here, as
       this is not necessary. -->
  <xsl:param name="Title"/>
  <xsl:param name="Creator-1"/>
  <xsl:param name="Creator-1-ORCID"/>
  <xsl:param name="Creator-1-Status"/>
  <xsl:param name="Creator-1-Email-Address"/>
  <xsl:param name="Creator-1-Institution"/>
  <xsl:param name="Creator-2"/>
  <xsl:param name="Creator-2-ORCID"/>
  <xsl:param name="Creator-2-Status"/>
  <xsl:param name="Creator-2-Email-Address"/>
  <xsl:param name="Creator-2-Institution"/>
  <xsl:param name="Creator-3"/>
  <xsl:param name="Creator-3-ORCID"/>
  <xsl:param name="Creator-3-Status"/>
  <xsl:param name="Creator-3-Email-Address"/>
  <xsl:param name="Creator-3-Institution"/>
  <xsl:param name="Creator-4"/>
  <xsl:param name="Creator-4-ORCID"/>
  <xsl:param name="Creator-4-Status"/>
  <xsl:param name="Creator-4-Email-Address"/>
  <xsl:param name="Creator-4-Institution"/>
  <xsl:param name="Creator-5"/>
  <xsl:param name="Creator-5-ORCID"/>
  <xsl:param name="Creator-5-Status"/>
  <xsl:param name="Creator-5-Email-Address"/>
  <xsl:param name="Creator-5-Institution"/>
  <xsl:param name="Creator-6"/>
  <xsl:param name="Creator-6-ORCID"/>
  <xsl:param name="Creator-6-Status"/>
  <xsl:param name="Creator-6-Email-Address"/>
  <xsl:param name="Creator-6-Institution"/>
  <xsl:param name="Creator-7"/>
  <xsl:param name="Creator-7-ORCID"/>
  <xsl:param name="Creator-7-Status"/>
  <xsl:param name="Creator-7-Email-Address"/>
  <xsl:param name="Creator-7-Institution"/>
  <xsl:param name="Creator-8"/>
  <xsl:param name="Creator-8-ORCID"/>
  <xsl:param name="Creator-8-Status"/>
  <xsl:param name="Creator-8-Email-Address"/>
  <xsl:param name="Creator-8-Institution"/>
  <xsl:param name="Creator-9"/>
  <xsl:param name="Creator-9-ORCID"/>
  <xsl:param name="Creator-9-Status"/>
  <xsl:param name="Creator-9-Email-Address"/>
  <xsl:param name="Creator-9-Institution"/>
  <xsl:param name="Creator-10"/>
  <xsl:param name="Creator-10-ORCID"/>
  <xsl:param name="Creator-10-Status"/>
  <xsl:param name="Creator-10-Email-Address"/>
  <xsl:param name="Creator-10-Institution"/>
  <xsl:param name="Creator-11"/>
  <xsl:param name="Creator-11-ORCID"/>
  <xsl:param name="Creator-11-Status"/>
  <xsl:param name="Creator-11-Email-Address"/>
  <xsl:param name="Creator-11-Institution"/>
  <xsl:param name="Creator-12"/>
  <xsl:param name="Creator-12-ORCID"/>
  <xsl:param name="Creator-12-Status"/>
  <xsl:param name="Creator-12-Email-Address"/>
  <xsl:param name="Creator-12-Institution"/>
  <xsl:param name="Creator-13"/>
  <xsl:param name="Creator-13-ORCID"/>
  <xsl:param name="Creator-13-Status"/>
  <xsl:param name="Creator-13-Email-Address"/>
  <xsl:param name="Creator-13-Institution"/>
  <xsl:param name="Creator-14"/>
  <xsl:param name="Creator-14-ORCID"/>
  <xsl:param name="Creator-14-Status"/>
  <xsl:param name="Creator-14-Email-Address"/>
  <xsl:param name="Creator-14-Institution"/>
  <xsl:param name="Creator-15"/>
  <xsl:param name="Creator-15-ORCID"/>
  <xsl:param name="Creator-15-Status"/>
  <xsl:param name="Creator-15-Email-Address"/>
  <xsl:param name="Creator-15-Institution"/>
  <xsl:param name="Department"/>
  <xsl:param name="Contributors"/>
  <xsl:param name="Type"/>
  <xsl:param name="Genre"/>
  <xsl:param name="Genre-URI"/>
  <xsl:param name="Date-Issued"/>
  <xsl:param name="Date-Issued-Qualifier"/>
  <xsl:param name="Year"/>
  <xsl:param name="Range-Start"/>
  <xsl:param name="Range-End"/>
  <xsl:param name="Date-Captured"/>
  <xsl:param name="Version"/>
  <xsl:param name="Publisher"/>
  <xsl:param name="Language-Code"/>
  <xsl:param name="Language-Text"/>
  <xsl:param name="Form"/>
  <xsl:param name="Form-URI"/>
  <xsl:param name="File-Format"/>
  <xsl:param name="Page-Count"/>
  <xsl:param name="Dimensions"/>
  <xsl:param name="Digital-Origin"/>
  <xsl:param name="Description"/>
  <xsl:param name="Abstract"/>
  <xsl:param name="Table-Of-Contents"/>
  <xsl:param name="Preferred-Citation"/>
  <xsl:param name="Comments"/>
  <xsl:param name="Capture-Device"/>
  <xsl:param name="Staff-Digitization"/>
  <xsl:param name="Staff-Metadata"/>
  <xsl:param name="Staff-QC"/>
  <xsl:param name="PPI"/>
  <xsl:param name="Box"/>
  <xsl:param name="Series"/>
  <xsl:param name="Folder"/>
  <xsl:param name="Subject-Topic"/>
  <xsl:param name="Subject-Keyword"/>
  <xsl:param name="Subject-Name"/>
  <xsl:param name="Subject-Geographic"/>
  <xsl:param name="Source-Publication-Title"/>
  <xsl:param name="Source-Publication-Volume"/>
  <xsl:param name="Source-Publication-Issue"/>
  <xsl:param name="Source-Publication-L-ISSN"/>
  <xsl:param name="Source-Collection"/>
  <xsl:param name="DOI"/>
  <xsl:param name="OCLC-Number"/>
  <xsl:param name="Catalog-URL"/>
  <xsl:param name="Rights"/>
  <xsl:param name="Volume-Number"/>
  <xsl:param name="Issue-Number"/>
  <xsl:param name="ETD-Degree-Granted"/>
  <xsl:param name="ETD-Degree-Level"/>
  <xsl:param name="ETD-Degree-Discipline"/>

  <xsl:template name="root">
    <mods xmlns="http://www.loc.gov/mods/v3"
          xmlns:mods="http://www.loc.gov/mods/v3"
          xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
          xmlns:xlink="http://www.w3.org/1999/xlink">
      <xsl:if test="string-length($Title)">
        <titleInfo>
          <title><xsl:value-of select="normalize-space($Title)"/></title>
        </titleInfo>
      </xsl:if>
      <xsl:if test="string-length($Creator-1)">
        <name>
          <namePart><xsl:value-of select="normalize-space($Creator-1)"/></namePart>
          <xsl:if test="string-length($Creator-1-ORCID)">
            <nameIdentifier type="orcid"><xsl:value-of select="normalize-space($Creator-1-ORCID)"/></nameIdentifier>
          </xsl:if>
          <xsl:if test="string-length($Creator-1-Status)">
            <description><xsl:value-of select="normalize-space($Creator-1-Status)"/></description>
          </xsl:if>
          <xsl:if test="string-length($Creator-1-Email-Address)">
            <affiliation><xsl:value-of select="normalize-space($Creator-1-Email-Address)"/></affiliation>
          </xsl:if>
          <xsl:if test="string-length($Creator-1-Institution)">
            <affiliation><xsl:value-of select="normalize-space($Creator-1-Institution)"/></affiliation>
          </xsl:if>
          <role>
            <roleTerm type="text" authority="marcrelator">creator</roleTerm>
            <roleTerm type="code" authority="marcrelator">cre</roleTerm>
          </role>
          <role>
            <roleTerm>1</roleTerm>
          </role>
        </name>
      </xsl:if>
      <xsl:if test="string-length($Creator-2)">
        <name>  
        <namePart><xsl:value-of select="normalize-space($Creator-2)"/></namePart>
          <xsl:if test="string-length($Creator-2-ORCID)">
            <nameIdentifier type="orcid"><xsl:value-of select="normalize-space($Creator-2-ORCID)"/></nameIdentifier>
          </xsl:if>
          <xsl:if test="string-length($Creator-2-Status)">
            <description><xsl:value-of select="normalize-space($Creator-2-Status)"/></description>
          </xsl:if>
          <xsl:if test="string-length($Creator-2-Email-Address)">
            <affiliation><xsl:value-of select="normalize-space($Creator-2-Email-Address)"/></affiliation>
          </xsl:if>
          <xsl:if test="string-length($Creator-2-Institution)">
            <affiliation><xsl:value-of select="normalize-space($Creator-2-Institution)"/></affiliation>
          </xsl:if>
          <role>
            <roleTerm type="text" authority="marcrelator">creator</roleTerm>
            <roleTerm type="code" authority="marcrelator">cre</roleTerm>
          </role>
          <role>
            <roleTerm>2</roleTerm>
          </role>
        </name>
      </xsl:if>
      <xsl:if test="string-length($Creator-3)">
        <name>
          <namePart><xsl:value-of select="normalize-space($Creator-3)"/></namePart>
          <xsl:if test="string-length($Creator-3-ORCID)">
            <nameIdentifier type="orcid"><xsl:value-of select="normalize-space($Creator-3-ORCID)"/></nameIdentifier>
          </xsl:if>
          <xsl:if test="string-length($Creator-3-Status)">
            <description><xsl:value-of select="normalize-space($Creator-3-Status)"/></description>
          </xsl:if>
          <xsl:if test="string-length($Creator-3-Email-Address)">
            <affiliation><xsl:value-of select="normalize-space($Creator-3-Email-Address)"/></affiliation>
          </xsl:if>
          <xsl:if test="string-length($Creator-3-Institution)">
            <affiliation><xsl:value-of select="normalize-space($Creator-3-Institution)"/></affiliation>
          </xsl:if>
          <role>
            <roleTerm type="text" authority="marcrelator">creator</roleTerm>
            <roleTerm type="code" authority="marcrelator">cre</roleTerm>
          </role>
          <role>
            <roleTerm>3</roleTerm>
          </role>
        </name>
      </xsl:if>
      <xsl:if test="string-length($Creator-4)">
        <name>
          <namePart><xsl:value-of select="normalize-space($Creator-4)"/></namePart>
          <xsl:if test="string-length($Creator-4-ORCID)">
            <nameIdentifier type="orcid"><xsl:value-of select="normalize-space($Creator-4-ORCID)"/></nameIdentifier>
          </xsl:if>
          <xsl:if test="string-length($Creator-4-Status)">
            <description><xsl:value-of select="normalize-space($Creator-4-Status)"/></description>
          </xsl:if>
          <xsl:if test="string-length($Creator-4-Email-Address)">
            <affiliation><xsl:value-of select="normalize-space($Creator-4-Email-Address)"/></affiliation>
          </xsl:if>
          <xsl:if test="string-length($Creator-4-Institution)">
            <affiliation><xsl:value-of select="normalize-space($Creator-4-Institution)"/></affiliation>
          </xsl:if>
          <role>
            <roleTerm type="text" authority="marcrelator">creator</roleTerm>
            <roleTerm type="code" authority="marcrelator">cre</roleTerm>
          </role>
          <role>
            <roleTerm>4</roleTerm>
          </role>
        </name>
      </xsl:if>
      <xsl:if test="string-length($Creator-5)">
        <name>
          <namePart><xsl:value-of select="normalize-space($Creator-5)"/></namePart>
          <xsl:if test="string-length($Creator-5-ORCID)">
            <nameIdentifier type="orcid"><xsl:value-of select="normalize-space($Creator-5-ORCID)"/></nameIdentifier>
          </xsl:if>
          <xsl:if test="string-length($Creator-5-Status)">
            <description><xsl:value-of select="normalize-space($Creator-5-Status)"/></description>
          </xsl:if>
          <xsl:if test="string-length($Creator-5-Email-Address)">
            <affiliation><xsl:value-of select="normalize-space($Creator-5-Email-Address)"/></affiliation>
          </xsl:if>
          <xsl:if test="string-length($Creator-5-Institution)">
            <affiliation><xsl:value-of select="normalize-space($Creator-5-Institution)"/></affiliation>
          </xsl:if>
          <role>
            <roleTerm type="text" authority="marcrelator">creator</roleTerm>
            <roleTerm type="code" authority="marcrelator">cre</roleTerm>
          </role>
          <role>
            <roleTerm>5</roleTerm>
          </role>
        </name>
      </xsl:if>
      <xsl:if test="string-length($Creator-6)">
        <name>
          <namePart><xsl:value-of select="normalize-space($Creator-6)"/></namePart>
          <xsl:if test="string-length($Creator-6-ORCID)">
            <nameIdentifier type="orcid"><xsl:value-of select="normalize-space($Creator-6-ORCID)"/></nameIdentifier>
          </xsl:if>
          <xsl:if test="string-length($Creator-6-Status)">
            <description><xsl:value-of select="normalize-space($Creator-6-Status)"/></description>
          </xsl:if>
          <xsl:if test="string-length($Creator-6-Email-Address)">
            <affiliation><xsl:value-of select="normalize-space($Creator-6-Email-Address)"/></affiliation>
          </xsl:if>
          <xsl:if test="string-length($Creator-6-Institution)">
            <affiliation><xsl:value-of select="normalize-space($Creator-6-Institution)"/></affiliation>
          </xsl:if>
          <role>
            <roleTerm type="text" authority="marcrelator">creator</roleTerm>
            <roleTerm type="code" authority="marcrelator">cre</roleTerm>
          </role>
          <role>
            <roleTerm>6</roleTerm>
          </role>
        </name>
      </xsl:if>
      <xsl:if test="string-length($Creator-7)">
        <name>
          <namePart><xsl:value-of select="normalize-space($Creator-7)"/></namePart>
          <xsl:if test="string-length($Creator-7-ORCID)">
            <nameIdentifier type="orcid"><xsl:value-of select="normalize-space($Creator-7-ORCID)"/></nameIdentifier>
          </xsl:if>
          <xsl:if test="string-length($Creator-7-Status)">
            <description><xsl:value-of select="normalize-space($Creator-7-Status)"/></description>
          </xsl:if>
          <xsl:if test="string-length($Creator-7-Email-Address)">
            <affiliation><xsl:value-of select="normalize-space($Creator-7-Email-Address)"/></affiliation>
          </xsl:if>
          <xsl:if test="string-length($Creator-7-Institution)">
            <affiliation><xsl:value-of select="normalize-space($Creator-7-Institution)"/></affiliation>
          </xsl:if>
          <role>
            <roleTerm type="text" authority="marcrelator">creator</roleTerm>
            <roleTerm type="code" authority="marcrelator">cre</roleTerm>
          </role>
          <role>
            <roleTerm>7</roleTerm>
          </role>
        </name>
      </xsl:if>
      <xsl:if test="string-length($Creator-8)">
        <name>
          <namePart><xsl:value-of select="normalize-space($Creator-8)"/></namePart>
          <xsl:if test="string-length($Creator-8-ORCID)">
            <nameIdentifier type="orcid"><xsl:value-of select="normalize-space($Creator-8-ORCID)"/></nameIdentifier>
          </xsl:if>
          <xsl:if test="string-length($Creator-8-Status)">
            <description><xsl:value-of select="normalize-space($Creator-8-Status)"/></description>
          </xsl:if>
          <xsl:if test="string-length($Creator-8-Email-Address)">
            <affiliation><xsl:value-of select="normalize-space($Creator-8-Email-Address)"/></affiliation>
          </xsl:if>
          <xsl:if test="string-length($Creator-8-Institution)">
            <affiliation><xsl:value-of select="normalize-space($Creator-8-Institution)"/></affiliation>
          </xsl:if>
          <role>
            <roleTerm type="text" authority="marcrelator">creator</roleTerm>
            <roleTerm type="code" authority="marcrelator">cre</roleTerm>
          </role>
          <role>
            <roleTerm>8</roleTerm>
          </role>
        </name>
      </xsl:if>
      <xsl:if test="string-length($Creator-9)">
        <name>
          <namePart><xsl:value-of select="normalize-space($Creator-9)"/></namePart>
          <xsl:if test="string-length($Creator-9-ORCID)">
            <nameIdentifier type="orcid"><xsl:value-of select="normalize-space($Creator-9-ORCID)"/></nameIdentifier>
          </xsl:if>
          <xsl:if test="string-length($Creator-9-Status)">
            <description><xsl:value-of select="normalize-space($Creator-9-Status)"/></description>
          </xsl:if>
          <xsl:if test="string-length($Creator-9-Email-Address)">
            <affiliation><xsl:value-of select="normalize-space($Creator-9-Email-Address)"/></affiliation>
          </xsl:if>
          <xsl:if test="string-length($Creator-9-Institution)">
            <affiliation><xsl:value-of select="normalize-space($Creator-9-Institution)"/></affiliation>
          </xsl:if>
          <role>
            <roleTerm type="text" authority="marcrelator">creator</roleTerm>
            <roleTerm type="code" authority="marcrelator">cre</roleTerm>
          </role>
          <role>
            <roleTerm>9</roleTerm>
          </role>
        </name>
      </xsl:if>
      <xsl:if test="string-length($Creator-10)">
        <name>
          <namePart><xsl:value-of select="normalize-space($Creator-10)"/></namePart>
          <xsl:if test="string-length($Creator-10-ORCID)">
            <nameIdentifier type="orcid"><xsl:value-of select="normalize-space($Creator-10-ORCID)"/></nameIdentifier>
          </xsl:if>
          <xsl:if test="string-length($Creator-10-Status)">
            <description><xsl:value-of select="normalize-space($Creator-10-Status)"/></description>
          </xsl:if>
          <xsl:if test="string-length($Creator-10-Email-Address)">
            <affiliation><xsl:value-of select="normalize-space($Creator-10-Email-Address)"/></affiliation>
          </xsl:if>
          <xsl:if test="string-length($Creator-10-Institution)">
            <affiliation><xsl:value-of select="normalize-space($Creator-10-Institution)"/></affiliation>
          </xsl:if>
          <role>
            <roleTerm type="text" authority="marcrelator">creator</roleTerm>
            <roleTerm type="code" authority="marcrelator">cre</roleTerm>
          </role>
          <role>
            <roleTerm>10</roleTerm>
          </role>
        </name>
      </xsl:if>
      <xsl:if test="string-length($Creator-11)">
        <name>
          <namePart><xsl:value-of select="normalize-space($Creator-11)"/></namePart>
          <xsl:if test="string-length($Creator-11-ORCID)">
            <nameIdentifier type="orcid"><xsl:value-of select="normalize-space($Creator-11-ORCID)"/></nameIdentifier>
          </xsl:if>
          <xsl:if test="string-length($Creator-11-Status)">
            <description><xsl:value-of select="normalize-space($Creator-11-Status)"/></description>
          </xsl:if>
          <xsl:if test="string-length($Creator-11-Email-Address)">
            <affiliation><xsl:value-of select="normalize-space($Creator-11-Email-Address)"/></affiliation>
          </xsl:if>
          <xsl:if test="string-length($Creator-11-Institution)">
            <affiliation><xsl:value-of select="normalize-space($Creator-11-Institution)"/></affiliation>
          </xsl:if>
          <role>
            <roleTerm type="text" authority="marcrelator">creator</roleTerm>
            <roleTerm type="code" authority="marcrelator">cre</roleTerm>
          </role>
          <role>
            <roleTerm>11</roleTerm>
          </role>
        </name>
      </xsl:if>
      <xsl:if test="string-length($Creator-12)">
        <name>
          <namePart><xsl:value-of select="normalize-space($Creator-12)"/></namePart>
          <xsl:if test="string-length($Creator-12-ORCID)">
            <nameIdentifier type="orcid"><xsl:value-of select="normalize-space($Creator-12-ORCID)"/></nameIdentifier>
          </xsl:if>
          <xsl:if test="string-length($Creator-12-Status)">
            <description><xsl:value-of select="normalize-space($Creator-12-Status)"/></description>
          </xsl:if>
          <xsl:if test="string-length($Creator-12-Email-Address)">
            <affiliation><xsl:value-of select="normalize-space($Creator-12-Email-Address)"/></affiliation>
          </xsl:if>
          <xsl:if test="string-length($Creator-12-Institution)">
            <affiliation><xsl:value-of select="normalize-space($Creator-12-Institution)"/></affiliation>
          </xsl:if>
          <role>
            <roleTerm type="text" authority="marcrelator">creator</roleTerm>
            <roleTerm type="code" authority="marcrelator">cre</roleTerm>
          </role>
          <role>
            <roleTerm>12</roleTerm>
          </role>
        </name>
      </xsl:if>
      <xsl:if test="string-length($Creator-13)">
        <name>
          <namePart><xsl:value-of select="normalize-space($Creator-13)"/></namePart>
          <xsl:if test="string-length($Creator-13-ORCID)">
            <nameIdentifier type="orcid"><xsl:value-of select="normalize-space($Creator-13-ORCID)"/></nameIdentifier>
          </xsl:if>
          <xsl:if test="string-length($Creator-13-Status)">
            <description><xsl:value-of select="normalize-space($Creator-13-Status)"/></description>
          </xsl:if>
          <xsl:if test="string-length($Creator-13-Email-Address)">
            <affiliation><xsl:value-of select="normalize-space($Creator-13-Email-Address)"/></affiliation>
          </xsl:if>
          <xsl:if test="string-length($Creator-13-Institution)">
            <affiliation><xsl:value-of select="normalize-space($Creator-13-Institution)"/></affiliation>
          </xsl:if>
          <role>
            <roleTerm type="text" authority="marcrelator">creator</roleTerm>
            <roleTerm type="code" authority="marcrelator">cre</roleTerm>
          </role>
          <role>
            <roleTerm>13</roleTerm>
          </role>
        </name>
      </xsl:if>
      <xsl:if test="string-length($Creator-14)">
        <name>
          <namePart><xsl:value-of select="normalize-space($Creator-14)"/></namePart>
          <xsl:if test="string-length($Creator-14-ORCID)">
            <nameIdentifier type="orcid"><xsl:value-of select="normalize-space($Creator-14-ORCID)"/></nameIdentifier>
          </xsl:if>
          <xsl:if test="string-length($Creator-14-Status)">
            <description><xsl:value-of select="normalize-space($Creator-14-Status)"/></description>
          </xsl:if>
          <xsl:if test="string-length($Creator-14-Email-Address)">
            <affiliation><xsl:value-of select="normalize-space($Creator-14-Email-Address)"/></affiliation>
          </xsl:if>
          <xsl:if test="string-length($Creator-14-Institution)">
            <affiliation><xsl:value-of select="normalize-space($Creator-14-Institution)"/></affiliation>
          </xsl:if>
          <role>
            <roleTerm type="text" authority="marcrelator">creator</roleTerm>
            <roleTerm type="code" authority="marcrelator">cre</roleTerm>
          </role>
          <role>
            <roleTerm>14</roleTerm>
          </role>
        </name>
      </xsl:if>
      <xsl:if test="string-length($Creator-15)">
        <name>
          <namePart><xsl:value-of select="normalize-space($Creator-15)"/></namePart>
          <xsl:if test="string-length($Creator-15-ORCID)">
            <nameIdentifier type="orcid"><xsl:value-of select="normalize-space($Creator-15-ORCID)"/></nameIdentifier>
          </xsl:if>
          <xsl:if test="string-length($Creator-15-Status)">
            <description><xsl:value-of select="normalize-space($Creator-15-Status)"/></description>
          </xsl:if>
          <xsl:if test="string-length($Creator-15-Email-Address)">
            <affiliation><xsl:value-of select="normalize-space($Creator-15-Email-Address)"/></affiliation>
          </xsl:if>
          <xsl:if test="string-length($Creator-15-Institution)">
            <affiliation><xsl:value-of select="normalize-space($Creator-15-Institution)"/></affiliation>
          </xsl:if>
          <role>
            <roleTerm type="text" authority="marcrelator">creator</roleTerm>
            <roleTerm type="code" authority="marcrelator">cre</roleTerm>
          </role>
          <role>
            <roleTerm>15</roleTerm>
          </role>
        </name>
      </xsl:if>
      <xsl:if test="string-length($Contributors)">
        <xsl:for-each select="tokenize($Contributors, ' ; ')">
          <name>
            <namePart><xsl:value-of select="normalize-space(.)"/></namePart>
            <role>
              <roleTerm type="text" authority="marcrelator">contributor</roleTerm>
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
        <genre authority="aat" valueURI="{normalize-space($Genre-URI)}"><xsl:value-of select="normalize-space($Genre)"/></genre>
      </xsl:if>
      <originInfo>
      <xsl:if test="string-length($Date-Issued)">
        <dateIssued encoding="iso8601" keyDate="yes"><xsl:value-of select="normalize-space($Date-Issued)"/></dateIssued>
      </xsl:if>
      <xsl:if test="string-length($Year)">
        <dateOther type="year"><xsl:value-of select="normalize-space($Year)"/></dateOther>
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
      <xsl:if test="string-length($Version)">
        <edition><xsl:value-of select="normalize-space($Version)"/></edition>
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
        <xsl:if test="string-length($Form)">
          <form authority="aat" valueURI="{normalize-space($Form-URI)}"><xsl:value-of select="normalize-space($Form)"/></form>
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
      </physicalDescription>
      <xsl:if test="string-length($Description)">
        <abstract type="description"><xsl:value-of select="normalize-space($Description)"/></abstract>
      </xsl:if>
      <xsl:if test="string-length($Abstract)">
        <abstract type="abstract"><xsl:value-of select="normalize-space($Abstract)"/></abstract>
      </xsl:if>
      <xsl:if test="string-length($Table-Of-Contents)">
        <tableOfContents><xsl:value-of select="normalize-space($Table-Of-Contents)"/></tableOfContents>
      </xsl:if>
      <xsl:if test="string-length($Preferred-Citation)">
        <note type="preferred citation">
          <xsl:value-of select="normalize-space($Preferred-Citation)"/>
        </note>
      </xsl:if>
      <xsl:if test="string-length($Comments)">
        <note type="comments"><xsl:value-of select="normalize-space($Comments)"/></note>
      </xsl:if>
      <xsl:if test="string-length($Capture-Device)">
        <note type="capture-device"><xsl:value-of select="normalize-space($Capture-Device)"/></note>
      </xsl:if>
      <xsl:if test="string-length($Staff-Digitization)">
        <note type="staff-digitization"><xsl:value-of select="normalize-space($Staff-Digitization)"/></note>
      </xsl:if>
      <xsl:if test="string-length($Staff-Metadata)">
        <note type="staff-metadata"><xsl:value-of select="normalize-space($Staff-Metadata)"/></note>
      </xsl:if>
      <xsl:if test="string-length($Staff-QC)">
        <note type="staff-qc"><xsl:value-of select="normalize-space($Staff-QC)"/></note>
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
      <xsl:if test="string-length($Subject-Keyword)">
        <xsl:for-each select="tokenize($Subject-Keyword, ' ; ')">
          <subject authority="user" displayLabel="Keyword">
            <topic><xsl:value-of select="normalize-space(.)"/></topic>
          </subject>
        </xsl:for-each>
      </xsl:if>
      <xsl:if test="string-length($Subject-Name)">
        <xsl:for-each select="tokenize($Subject-Name, ' ; ')">
          <subject>
            <name type="personal" authority="naf">
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
      <xsl:if test="string-length($Source-Publication-Title)">
        <relatedItem type="host">
          <titleInfo>
            <title><xsl:value-of select="normalize-space($Source-Publication-Title)"/></title>
          </titleInfo>
          <xsl:if test="string-length($Source-Publication-Volume)">
          <part>
            <detail type="volume">
              <number><xsl:value-of select="normalize-space($Source-Publication-Volume)"/></number>
            </detail>
          </part>
          </xsl:if>
          <xsl:if test="string-length($Source-Publication-Issue)">
            <part>
              <detail type="issue">
                <number><xsl:value-of select="normalize-space($Source-Publication-Issue)"/></number>
              </detail>
            </part>
          </xsl:if>
          <xsl:if test="string-length($Source-Publication-L-ISSN)">
            <identified type="l-issn"><xsl:value-of select="normalize-space($Source-Publication-L-ISSN)"/></identified>
          </xsl:if>
        </relatedItem>
        </xsl:if>
      <xsl:if test="string-length($Source-Collection)">
        <relatedItem type="host"  displayLabel="Archival Collection">
          <titleInfo>
            <title><xsl:value-of select="normalize-space($Source-Collection)"/></title>
          </titleInfo>
        </relatedItem>
      </xsl:if>
      <xsl:if test="string-length($DOI)">
        <identifier type="doi"><xsl:value-of select="normalize-space($DOI)"/></identifier>
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
      <xsl:if test="string-length($Volume-Number) or string-length($Issue-Number)">
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
        </part>
      </xsl:if>
    </mods>
  </xsl:template>
</xsl:stylesheet>
