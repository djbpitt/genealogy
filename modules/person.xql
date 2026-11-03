xquery version "3.1";

declare namespace m = "http://www.obdurodon.org/model";
declare namespace util = "http://exist-db.org/xquery/util";
declare namespace request = "http://exist-db.org/xquery/request";
declare variable $document as document-node() := doc("/db/apps/genealogy/data/genealogy.xml");

let $target := (request:get-parameter("target", "vladimir1"), "vladimir1")[1]
let $current := id($target, $document)
let $marriages := $document/descendant::marriage[$target = (@male, @female)]

return
  <m:results>
    <m:target>{$target}</m:target>
    <m:firstName>{data($current/descendant::firstName)}</m:firstName>
    {
      if ($current/descendant::epithet) then
        <m:epithet>{data($current/descendant::epithet)}</m:epithet>
      else
        ()
    }
    <m:patronymic>{data($current/descendant::patronymic)}</m:patronymic>
    {
      if ($current/descendant::christian) then
        <m:christian>{data($current/descendant::chrristian)}</m:christian>
      else
        ()
    }
    <m:birthDate>{data($current/descendant::birthDate/date)}</m:birthDate>
    <m:birthDateCirca>{data($current/descendant::birthDate/date/@circa)}</m:birthDateCirca>
    <m:birthSource>{data($current/descendant::birth/source)}</m:birthSource>
    <m:birthSourcePointer>{data($current/descendant::birth/source/@pointer)}</m:birthSourcePointer>
    <m:deathDate>{data($current/descendant::deathDate/date)}</m:deathDate>
    <m:deathDateCirca>{data($current/descendant::deathDate/date/@circa)}</m:deathDateCirca>
    <m:deathSource>{data($current/descendant::death/source)}</m:deathSource>
    <m:deathSourcePointer>{data($current/descendant::death/source/@pointer)}</m:deathSourcePointer>
    {
      if ($current/descendant::note) then
        <m:noteLink>{$current/descendant::note/data(@link)}</m:noteLink>
      else
        ()
    }
  </m:results>
  (:  <section
    id="person">
    <section>
      <h2>
        {
          data((
          $current//Q{}firstName,
          if ($current//epithet) then
            <span> “{data($current//epithet)}” </span>
          else
            " ",
          $current//patronymic,
          if ($current//christian) then
            <span> ({data($current//christian)}) </span>
          else
            " ",
          "(b. ",
          <span
            title="{data($current//birth/source)}">{data($current//birthDate/date)}</span>,
          "–",
          <span
            title="{data($current//death/source)}">d. {data($current//deathDate/date)}</span>,
          ")",
          if ($current//note) then
            <span> (<a
                href="{$current//note/data(@link)}"
                target="_blank">note</a>) </span>
          else
            ""
          ))
        }</h2>
      (\:{
        if ($current//ruled) then
          <h3>{data($current//title)} of {data($current//place)}
            (r. <span
              title="{data($current//startYear/source)}">{data($current//startYear/date)}</span>–<span
              title="{data($current//endYear/source)}">{data($current//endYear/date)}</span>)</h3>
        else
          ""
      }:\)
      (\:{
        for $i in $document//person[not(@id eq $target)]
          where $i/@id = $marriages/@female or $i/@id = $marriages/@male
        return
          <div>
            <h4>
              <a
                href="genealogy.xq?target={$i/@id}">{data($i//firstName)}</a>
              (m. <span
                title="{$marriages[(@male eq $target and @female eq $i/@id) or (@female eq $target and @male = $i/@id)]//source}">
                {$marriages[(@male eq $target and @female eq $i/@id) or (@female eq $target and @male = $i/@id)]//date}</span>)
            </h4>
            <ul>{
                for $j in $marriages
                  where (@male eq $target and @female eq $i/@id) or (@female eq $target and @male eq $i/@id)
                return
                  <span>{
                      for $k in $document/descendant::person
                        where $k/@id = $j//child/data(@pointer)
                      return
                        <li><a
                            href="genealogy.xq?target={$k/@id}">{$k//firstName}</a></li>
                    }</span>
              }</ul>
          </div>
      }:\)
    </section>
  </section>
 :)