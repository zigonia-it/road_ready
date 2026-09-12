# Scenarioavtale – prototype

Status: ✅ Scenarioformat, seks situasjonsutkast og vurderingsklasser definert. ⬜ Endelig faglig kontroll.

## Felles avtale

Scenarioene har én hovedoppgave hver. Klargjort → aktivt → avsluttet er normal flyt; avbrutt brukes ved omstart eller feil rute. Hvert forsøk har egen ID. Avbrutt forsøk teller ikke som mestring. Hendelser registreres med simuleringstid, aktør-ID og scenario-ID. Pause stopper simuleringstiden.

Resultater: `good` (god håndtering), `improve` (pedagogisk forbedring), `serious` (konkret fare/kollisjon eller dokumentert regelbrudd), `not_assessed` (manglende data eller ukontrollert regelgrunnlag). Resultatet ledsages av observerbar handling, betydning og neste øvingsråd. Ingen samlet kompetanseprosent.

Avstander, bremsestyrke og tidsluker er simuleringsparametre, ikke lovbestemte terskler. Endelig konfigurasjon settes først etter kalibrering av bil og kamera. Lav fart eller stans er ikke alene bevis på god håndtering; aktørposisjoner og konflikt må inngå.

Kildekontroll holdes atskilt fra spilletest og trafikkfaglig gjennomgang. JSON-utkast i `data/scenarios` har `assessment_enabled: false` til den relevante regelen og geometrien er kontrollert. Man kan teste bevegelse uten å gi læringsvurdering.

## Kartkonvensjon

Nord er opp. Spiller P, bil B, fotgjenger F og syklist S. Piler viser kjøreretning; X er konfliktområde. Detaljert geometri og siktpolygoner kommer med kartet, før scenario aktiveres.

| ID | Oppsett og ruter | Sikt og konflikt | Godt eksempel | Uheldig eksempel |
|---|---|---|---|---|
| speed_01 | P kjører nordover på rett vei, passerer fysisk fartsgrenseskilt. Ingen NPC. | Skilt synlig før passering; målegrense ved skilt. | Tilpasser farten innen grensen begynner. | Holder høyere fart videre etter skiltet. |
| right_01 | Uregulert firearmet kryss: P ↑, B fra øst mot vest ←. P fortsetter rett fram. | Hus utenfor sikttriangel; X i kryssende kjørefelt. | Avpasser innkjøring og lar B passere. | Kjører inn slik at B må nødstoppe. |
| yield_01 | T-kryss: P ↑ skal til høyre →. Vikepliktsskilt og vikelinje på P sin arm. B kjører vest→øst. | Fri sikt langs hovedveien, X ved innfletting. | Venter ved konflikt og kjører når tilstrekkelig rom er tilgjengelig. | Tvinger B til kraftig bremsing. |
| crossing_01 | P ↑ på rett tofeltsvei. F går fra østre fortau ← over gangfeltet. Ingen trafikklys. | Fri sikt mot begge fortau. X omfatter begge felt og gangfeltets bredde. | Reduserer tidlig, venter mens F krysser og fortsetter etter frigjort konflikt. | Passerer gjennom fotgjengerens bane eller kolliderer. |
| cyclist_01 | P ↑ svinger til høyre →. S ↑ fortsetter rett fram i samme kjørebane, til høyre for bilen. Ingen separat sykkelvei eller fortauskryssing. | Sidekontroll gjør syklisten tydelig; X der bilen krysser S sin bane. | Kontrollerer siden og lar S passere før svingen. | Svinger over S sin bane; blinklys alene endrer ikke konflikten. |
| roundabout_01 | Enfelts rundkjøring med vikeplikt på tilfart. P inn fra sør og ut andre avkjøring nord. B i sirkulasjon fra vest. | Fri sikt til sirkulasjonsfeltet. X ved innkjøring; egen utkjøringssone. | Tilpasser innkjøring, slipper B fram og varsler avkjøring. | Tvinger seg inn foran B eller kjører over sentraløya. |

## Særlig om gangfeltet – første komplette læringssløyfe

Læringsmål: Oppdage og håndtere gående ved et uregulert gangfelt gjennom fartstilpasning og samhandling.

1. Start bilen i tilstrekkelig avstand til å kunne bremse normalt. Fotgjengeren starter synlig på østre fortau.
2. Aktiver situasjonen når bilen passerer startsonen i riktig retning.
3. Fotgjengeren nærmer seg og krysser langs fast rute. Bevegelsen følger simuleringstid.
4. Logg bilens frontposisjon, fart, bremseinput, fotgjengerposisjon og eventuell kollisjon.
5. Avslutt når bilens bakende har forlatt gangfeltområdet. Avbryt ved utkjøring fra scenarioområdet.
6. Ved kollisjon fryses hendelsen. Omstart gjenoppretter begge aktørers starttilstand og tømmer forrige forsøks hendelser.

Godt forløp: tidlig fartstilpasning og konfliktfri passering etter fotgjengeren. Forbedring: svært sen bremsing som fortsatt unngår konflikt, med terskel merket pedagogisk. Alvorlig: kollisjon eller at fotgjengeren må unnamanøvrere. Ikke vurdert: manglende posisjonsdata, avbrutt forsøk eller ikke verifisert regelgrunnlag.

Kontroller også tomt gangfelt, fotgjenger på motsatt fortau etter fullført kryssing, gjentatt trigger, pause, nytt forsøk og bil som rygger inn i sluttsonen. Tomt gangfelt skal ikke automatisk kreve stans.

## Åpne faglige spørsmål

- ✅ Kontroller konkret ordlyd og vilkår i trafikkreglene §§ 7, 9, 13 og 14 mot tilgjengelig konsolidert Lovdata-tekst.
- ⬜ Knytt hvert læringsmål til eksakt punkt i den digitale V851:2026-utgaven.
- ⬜ Kontroller skiltutforming og plassering for kartets konkrete geometri.
- ⬜ Gjennomgå vurderingsterskler etter M1-kalibrering; unngå automatisk likestilling av hard bremsing og lovbrudd.
- ⬜ Trafikkfaglig gjennomgang av scenario og tilbakemelding før ekstern læringstest.
