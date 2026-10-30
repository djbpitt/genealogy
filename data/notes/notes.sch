<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">
    <let name="genealogyXML" value="doc('../genealogy.xml')" />
    <pattern>
        <rule context="link" xml:space="preserve">
            <let name="followingText" value="following-sibling::text()[1]"/>
            <assert test="true() = (for $char in (' ', '.', ',', ']', ')', ';', '’', '&#x0a;')
                return starts-with($followingText, $char))">Element should be followed by a space or other punctuation.</assert>
            <let name="pointer" value="@target"/>
            <assert test="$genealogyXML/root/persons/person[@id eq $pointer]">@Target must point to a valid person in the genealogy project.</assert>
        </rule>
    </pattern>
</schema>