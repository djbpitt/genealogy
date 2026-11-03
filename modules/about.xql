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

<section
  xmlns="http://www.w3.org/1999/xhtml"
  id="about">
  <section>
    <h2>About the project</h2>
    <p>The research, writing, and methodology behind the genealogical information on this site is the work of
      Christian Raffensperger (<a
        href="mailto:craffensperger@wittenberg.edu">craffensperger@wittenberg.edu</a>, <a
        href="https://craffensperger.com/">https://craffensperger.com/</a>), and
      a hard copy monograph based on this information has been published as his <a
        href="https://www.hup.harvard.edu/books/9781932650136"><i>Ties of kinship.
          Genealogy and dynastic marriage in Kyivan Rus´</i></a> (Cambridge, MA: Harvard University Press, 2016, ISBN 9781932650136). 
          Chris has been assisted in a variety of ways, specifically data entry and data collection,
      by faculty aides (paid for through the faculty aide program at Wittenberg University and supported by the Russian
      and Central Eurasian Studies Program), including Adam Matthews, Kelsey Mazur and Jaymi Green, whose help has been
      invaluable.</p>
      <p>The translation of this work to an interactive Internet-based workstation environment was initially
      designed, developed, and implemented by David J. Birnbaum (<a
        href="mailto:djbpitt@gmail.com">djbpitt@gmail.com</a>,
      <a
        href="http://www.obdurodon.org">http://www.obdurodon.org</a>), and
      subsequently improved and expanded in collaboration with Alec Deitloff, who also designed and implemented the
      family-tree visualization system. The site was reimplemented with newer technology by David in 2026. A discussion of the 
      underlying methodology and technology was published as Christian Raffensperger and David J. Birnbaum, <q>Mapping history: using 
      technology to showcase medieval familial interconnectivity</q>. Festschrift in Honor of Orysia Karapinka in <cite>Russian 
      History/Histoire Russe</cite> 37:4 (2010), 305–21.</p>
  </section>
</section>
