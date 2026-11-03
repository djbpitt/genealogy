<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">
    <let name="genealogyXML" value="doc('genealogy.xml')"/>
    <pattern>
        <rule context="person">
            <let name="pointer" value="@id"/>
            <report
                test="$genealogyXML//marriage/children/child[@pointer = $pointer] and (not(parents) or not(parents/father) or not(parents/mother))"
                >This person is listed as a child, but does not have his/her parents
                listed.</report>
        </rule>
    </pattern>
    <pattern>
        <rule context="person/note">
            <assert test="doc-available(concat('notes/', @link))">This note points to a file that
                does not exist in the ./notes/ directory or is not a (valid) XML file.</assert>
        </rule>
    </pattern>
</schema>
