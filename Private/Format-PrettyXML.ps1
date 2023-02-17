function Format-PrettyXML($XML) {
    [System.Reflection.Assembly]::LoadWithPartialName("System.Xml") > $null
    $PRIVATE:tempString = ""
    if ($XML.GetType().Name -eq "XmlDocument") {
        $PRIVATE:tempString = $XML.get_outerXml()
    }
    if ($XML.GetType().Name -eq "String") {
        $PRIVATE:tempString = $XML
    }
    $r = new-object System.Xml.XmlTextReader(new-object System.IO.StringReader($PRIVATE:tempString))
    $sw = new-object System.IO.StringWriter
    $w = new-object System.Xml.XmlTextWriter($sw)
    $w.Formatting = [System.Xml.Formatting]::Indented
    do { $w.WriteNode($r, $false) } while ($r.Read())
    $w.Close()
    $r.Close()
    $sw.ToString()
}
