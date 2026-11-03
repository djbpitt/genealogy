xquery version "3.1";
declare namespace m = "http://www.obdurodon.org/model";
(: =====
Retrieve controller parameters
Default path to data is xmldb:exist:///db/apps/exist-mvc/data
===== :)
declare variable $exist:root as xs:string := request:get-parameter("exist:root", "xmldb:exist:///db/apps");
declare variable $exist:controller as xs:string := request:get-parameter("exist:controller", "/genealogy");
declare variable $path-to-data as xs:string := $exist:root || $exist:controller || '/data';
declare variable $level as xs:string? := request:get-parameter('level', ());

<m:index>
  <m:title>Main page</m:title>
  <m:items>
    <m:item>Person</m:item>
  </m:items>
</m:index>
