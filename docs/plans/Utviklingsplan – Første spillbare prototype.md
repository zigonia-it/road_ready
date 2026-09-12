# RoadReady – utviklingsplan for første spillbare prototype

Dato: 12. september 2026  
Status: Under utvikling. ✅ betyr implementert og kontrollert på angitt nivå; ⬜ betyr gjenstående eller ikke tilstrekkelig verifisert. Hele milepæler er åpne til alle ferdigkriterier er oppfylt.

Siste kontroll: 2026-09-12. Se [verifikasjonslogg](Verifikasjon.md), [scenarioavtale](../scenarios/README.md) og [kilderegister](../scenarios/Kilder.md).

## 1. Mål og avgrensning

Bygg en sammenhengende kjøretur på omtrent 5–10 minutter i et lite norsk boligområde. Spilleren skal styre bilen selv, møte seks trafikksituasjoner og få forståelig tilbakemelding knyttet til egne handlinger.

Prototypen skal gi svar på tre spørsmål:

1. Er bilen enkel å forstå og tilfredsstillende å kjøre?
2. Kan spilleren lese trafikkbildet tidsnok til å ta meningsfulle valg?
3. Forklarer tilbakemeldingen hva som skjedde og hvordan spilleren kan forbedre seg?

Dette er milepælen før den større MVP-en med rundt 20 scenarioer. Den skal ikke dokumentere faktisk førerkompetanse eller gi inntrykk av en godkjent førerprøve.

## 2. Utgangspunkt

Planen bygger på:

- [Spillplanen](../Spillplan%20–%20Pixelbasert%20trafikkopplæringsspill.md), særlig første konkrete milepæl.
- [Visuell stil](VISUAL_STYLE.md): Modern Chunky Pixel, med lesbarhet foran dekorasjon.
- Eksisterende kildemateriale i `assets/traffic_signs/source/`.

Ved gjennomgangen ble det ikke funnet `project.godot`, GDScript-filer eller Godot-scener. Planen tar derfor utgangspunkt i at spillprosjektet opprettes fra grunnen av under `road_ready/`.

Skiltarkivet er et utgangspunkt for videre arbeid. At en kilde er lastet ned, betyr ikke at scenarioenes regler eller vurderinger er faglig kvalitetssikret.

## 3. Arbeidsvalg for prototypen

| Område | Valg |
|---|---|
| Motor | Godot 4 med GDScript. Eksakt stabil versjon velges og låses ved oppstart. |
| Perspektiv | 2D ovenfra med fast kameraretning og kamera som følger bilen. |
| Plattform | Lokal desktop-versjon på utviklingsmaskinen først; Windows-bygg før ekstern PC-testing. |
| Kjøring | Forenklet bilmodell med automatgir, tydelig bremsing og hastighetsavhengig styring. |
| Styring | Tastatur først. Input-handlinger skilles fra fysiske taster for senere gamepad-støtte. |
| Verden | Ett håndlaget kart, dagslys og tørt føre. |
| Trafikk | Biler, én type fotgjenger og én type syklist på forhåndsdefinerte ruter. |
| Scenarioer | Faste, repeterbare situasjoner først; noen kontrollerte variasjoner etter at vurderingen fungerer. |
| Grafikk | Enkle testformer først, deretter et lite sammenhengende sett med pixelgrafikk. |
| Språk | Norsk bokmål i all spillerrettet tekst. |
| Lagring | Lokal lagring av innstillinger og siste turresultat. Ingen konto eller skytjeneste. |

Fri bytrafikk, isometrisk perspektiv, vær, døgnsyklus, motorvei, adaptiv læring, XP, opplåsinger, lærerportal og full teoribank legges etter prototypen. Trafikklys inngår i den større MVP-en, men trengs ikke for de seks første situasjonene.

## 4. Den første kjøreturen

Oppdrag: **Kjør fra øvingsplassen til nærbutikken.**

Turen begynner med kort, praktisk innføring i gass, brems, styring og blinklys. Spilleren kjører deretter en tydelig rute gjennom boligområdet og stanser i målområdet ved butikken.

| Rekkefølge | Situasjon | Hva spillet skal registrere |
|---|---|---|
| 1 | Fartsgrense | Fart over tid, passering av skilt og tilpasning før neste situasjon. |
| 2 | Kryss med høyreregel | Innkjøringsfart, plassering, kryssende trafikant og passering av konfliktområdet. |
| 3 | Vikepliktsskilt | Tilnærming, eventuell venting og avstand i tid til kryssende trafikk. |
| 4 | Gangfelt | Fotgjengerens posisjon, spillerens fart, bremsing og passering. |
| 5 | Syklist ved høyresving | Blinklys, observasjonshandling, relative posisjoner og tidspunkt for sving. |
| 6 | Enkel rundkjøring | Tilnærming, samhandling, kjørebane, blinklys og valgt avkjøring. |

Tabellen angir måledata, ikke ferdige juridiske vurderingsregler. Hver situasjon skal beskrives presist og kontrolleres faglig før den brukes som læringsinnhold. Særlig syklistens trasé og skiltingen ved kryss og rundkjøring må være entydige.

Ruten skal ha rolige strekninger mellom situasjonene. Det er et mål at spilleren får tid til å forstå forrige hendelse før neste starter. Kartets lengde justeres etter faktisk spilletid.

## 5. Milepæler og ferdigkriterier

### ⬜ M0 – Faglig rammeverk og scenarioavtale

**Leveranse:** Et kort faglig grunnlag og seks scenarioark.

- ✅ Beskriv ett hovedlæringsmål per situasjon.
- ⬜ Tegn trafikantenes ruter, relevante skilt, siktområder og konfliktområder.
- ✅ Definer hva som er god håndtering, forbedringspunkt, alvorlig hendelse og utilstrekkelig datagrunnlag.
- ✅ Skill lovkrav fra pedagogiske råd og spilltekniske toleranser.
- ⬜ Registrer kilde, aktuell bestemmelse/læreplanmål, kildeversjon, verifiseringsdato og kontrollstatus.
- ⬜ Kontroller gjeldende kilder hos Statens vegvesen og Lovdata. Ingen kildeversjon eller kontrollstatus fylles inn ut fra antakelser.

**Ferdig når:** Hvert scenario har en konkret situasjonsbeskrivelse, målebare kriterier og minst ett eksempel på god og uheldig håndtering. Uavklart innhold er tydelig merket og holdes utenfor faglig evaluering.

### ⬜ M1 – Kjørbar bil og testbane

**Leveranse:** Et Godot-prosjekt med bil, kamera og liten øvingsplass.

- ✅ Opprett prosjekt, input-handlinger og enkel startscene.
- ⬜ Implementer akselerasjon, bremsing, styring, revers og blinklys.
- ⬜ Legg inn kollisjon og trygg tilbakestilling av bilen.
- ⬜ Vis hastighet og blinklysstatus.
- ✅ Definer en konsistent omregning mellom spillavstand, meter og km/t.
- ⬜ Juster kamera og skala slik at spilleren rekker å se relevante hindringer før bremsing blir nødvendig.

**Ferdig når:** En ny spiller kan starte, svinge, bremse, rygge og blinke etter en kort introduksjon. Bilen trenger ikke gjennom faste hindringer ved maksimal tillatt spillhastighet, og kjørefølelsen er stabil ved ulike bildefrekvenser.

### ⬜ M2 – Én komplett læringssituasjon

**Leveranse:** Et gangfelt med fotgjenger, evaluering, tilbakemelding og nytt forsøk.

- ⬜ Lag scenarioets tilstander: klargjort, aktivt, avsluttet og avbrutt.
- ⬜ La fotgjengeren følge en fast rute med kontrollert starttidspunkt.
- ⬜ Samle hendelser fra bilen og fotgjengeren.
- ⬜ Evaluer handlingene etter gjennomført situasjon.
- ⬜ Vis hva spilleren gjorde, hvilken betydning det hadde og et konkret råd.
- ⬜ Ved kollisjon: frys situasjonen, forklar hendelsen og tilby omstart fra scenarioets startpunkt.

**Ferdig når:** God håndtering, sen reaksjon og kollisjon gir ulike, etterprøvbare resultater. En omstart nullstiller trafikanter, hendelser og resultat. Samme hendelsesforløp gir samme vurdering.

**Beslutningspunkt:** Test kjøring og læringssløyfe før de fem øvrige scenarioene bygges. Juster grunnsystemet dersom situasjonen er vanskelig å lese eller tilbakemeldingen oppleves som urimelig.

### ⬜ M3 – Sammenhengende kart og trafikk

**Leveranse:** Hele ruten fra øvingsplassen til butikken.

- ⬜ Bygg veikryss, gangfelt, syklisttrasé og enkel rundkjøring som gjenbrukbare kartdeler.
- ⬜ Definer kjøreruter, stopposisjoner og konfliktområder for NPC-er.
- ⬜ Implementer enkel trafikklogikk: følg rute, hold avstand, vent og fortsett.
- ⬜ Legg inn oppdragsstart, veivisning og målområde.
- ⬜ Håndter feilkjøring med tydelig veiledning eller tilbud om å starte aktuell del på nytt.

**Ferdig når:** Hele ruten kan kjøres uten fastlåst trafikk, NPC-er starter uten å overlappe bilen, og veivisningen er synlig uten å skjule trafikken.

### ⬜ M4 – Alle seks situasjoner og turresultat

**Leveranse:** Første komplette læringstur.

- ⬜ Implementer de øvrige scenarioene i samme format som gangfeltet.
- ⬜ Skill måledata fra vurderingsregler og spillerrettet tekst.
- ⬜ Gi korte tilbakemeldinger etter situasjoner, på steder hvor lesing ikke konkurrerer med nødvendig kjøring.
- ⬜ Legg inn et lite antall refleksjonsspørsmål etter relevante hendelser. Spørsmål pauser simuleringen.
- ⬜ Oppsummer sterke handlinger og høyst tre prioriterte forbedringspunkter.
- ⬜ La spilleren starte hele turen eller en bestemt situasjon på nytt.

**Ferdig når:** Alle seks scenarioene fullføres og vurderes én gang per forsøk. Oppsummeringen stemmer med hendelsesloggen, og avbrutte eller ikke observerbare situasjoner blir ikke registrert som mestring.

### ⬜ M5 – Lesbar pixelgrafikk, lyd og brukervennlighet

**Leveranse:** En visuelt sammenhengende prototype som kan testes av målgruppen.

- ⬜ Bruk eksisterende visuell stil for bil, veier, bygninger, skilt og trafikanter.
- ⬜ Prioriter trafikantenes silhuetter, kjørefelt, skilt og blinklys før dekorasjon.
- ⬜ Test skilt i faktisk spillstørrelse og kamerazoom før flere produseres.
- ⬜ Legg til enkel motor-, blinklys- og tilbakemeldingslyd med volumkontroll.
- ⬜ Ferdigstill startskjerm, pause, kontrolloversikt og turresultat.
- ⬜ Sørg for lesbar tekst og at viktige beskjeder også forstås uten lyd eller farge alene.

**Ferdig når:** En ny spiller finner kontrollene og forstår neste handling uten utviklerhjelp. Grafikken skjuler ikke trafikk som skal være synlig. Testoppløsning og referansemaskin dokumenteres.

### ⬜ M6 – Verifikasjon, spilletesting og leveranse

**Leveranse:** Kjørbart bygg, kjente begrensninger og prioritert liste over forbedringer.

- ⬜ Test hver situasjon med god håndtering, grensetilfeller, feil og avbrudd.
- ⬜ Kjør hele turen minst tre ganger sammenhengende uten blokkering eller krasj.
- ⬜ Test pause, gjenopptakelse, nytt forsøk, feil rute og innlasting av siste resultat.
- ⬜ Mål bildefrekvens på dokumentert referansemaskin; målsettingen er stabilt 60 FPS.
- ⬜ Gjennomfør en liten formativ test med 3–5 personer i målgruppen.
- ⬜ Noter hvor de misforstår styring, overser trafikk eller ikke forstår tilbakemeldingen.
- ⬜ Rett problemer med kjøring, lesbarhet og urimelige vurderinger før nytt innhold prioriteres.

**Ferdig når:** Testerne kan gjennomføre turen, sentrale blokkeringer er rettet, og de kan forklare minst ett forbedringspunkt med egne ord. En slik liten test gir retning for videre utvikling, ikke dokumentasjon av læringseffekt.

## 6. Teknisk ansvarsdeling

Hold arkitekturen liten. Opprett systemene når milepælene trenger dem.

| Komponent | Ansvar |
|---|---|
| VehicleController | Bevegelse, styring, blinklys og bilens målbare tilstand. |
| World | Kart, kollisjonsgeometri, skilt, ruter og scenarioområder. |
| TrafficManager | NPC-ruter, enkel samhandling og tilbakestilling av trafikk. |
| ScenarioManager | Oppstart, tilstand, hendelsesinnsamling og avslutning av scenario. |
| EvaluationEngine | Vurdering av hendelser mot scenarioets kriterier. Ingen UI-avhengighet. |
| MissionManager | Rekkefølge, veivisning, start, mål og turresultat. |
| UI | HUD, pause, spørsmål, tilbakemelding og oppsummering. |
| LocalSave | Innstillinger og siste resultat med formatversjon. |

Foreslått struktur under `road_ready/`:

```text
project.godot
scenes/
  game/ vehicles/ world/ traffic/ ui/
scripts/
  vehicles/ traffic/ scenarios/ evaluation/ missions/ persistence/
data/
  scenarios/ feedback/ sources/
assets/
  vehicles/ environment/ traffic_signs/ audio/
tests/
  evaluation/ scenarios/
docs/
  plans/ scenarios/ playtests/
```

Scenarioer lagres som JSON med stabile ID-er. Hvert scenario beskriver kartreferanse, læringsmål, aktører, startbetingelse, avslutning, måledata, kriterier, tilbakemeldinger og kildestatus. Formatet valideres ved innlasting, slik at manglende referanser oppdages før kjøringen starter.

Hendelser får simuleringstid og scenario-/aktør-ID. Avstands- og tidsgrenser samles i konfigurasjon, med forklaring på om de er pedagogiske valg eller tekniske toleranser. De skal ikke presenteres som lovbestemte tall uten kildestøtte.

## 7. Observasjon og rettferdig evaluering

Et kamera ovenfra viser mer enn en virkelig fører ville sett. Spillet kan derfor ikke slutte at spilleren har sett en syklist bare fordi syklisten er på skjermen.

Prototypen skal:

- Skille mellom at informasjon var synlig, at spilleren utførte en observasjonshandling, og at spilleren faktisk tilpasset kjøringen.
- Bruke en enkel sidekontroll som gir nyttig visuell informasjon ved syklist-situasjonen. Taster velges og forklares når kontrollene testes.
- Vurdere observasjonshandlingen sammen med fart, timing og samhandling. Et tastetrykk alene gir ikke godkjent håndtering.
- Bruke «ikke vurdert» når datagrunnlaget er utilstrekkelig.
- Unngå prosentvis total førerkompetanse basert på én kort tur. Vis konkrete hendelser og kompetanseområder som er øvd på.

Full tilbakespoling av simuleringen utsettes. Omstart fra et kjent scenario-startpunkt gir en enklere og mer pålitelig første løsning.

## 8. Verifikasjon som bygges inn underveis

Automatiser kontroller av scenarioformat og vurderingslogikk. Bruk lagrede hendelsesforløp for god håndtering, sen reaksjon, kollisjon og avbrudd. Ta med grenseverdier, gjentatte triggere og nullstilling etter nytt forsøk.

Kjørefølelse, kamerautsikt, skiltlesbarhet og forståelsen av tilbakemeldinger testes manuelt i spillet. Disse forholdene kan ikke avgjøres av automatiske tester alene.

For hvert scenario registreres hvilke tilfeller som er kontrollert, resultatet og eventuelle åpne feil. Feil i juridisk innhold eller vurderinger som straffer korrekt håndtering blokkerer ekstern læringstesting av det aktuelle scenarioet.

## 9. Viktigste risikoer og tiltak

| Risiko | Tiltak |
|---|---|
| Kjøringen er vanskelig eller lite engasjerende | Test M1 tidlig og juster før kartet utvides. |
| Spilleren ser skilt og trafikanter for sent | Kalibrer skala, kamera og bremsing sammen. |
| Vurderingen virker vilkårlig | Behold hendelsesgrunnlaget og test både gode og uheldige forløp. |
| NPC-er låser hverandre eller spillerens rute | Bruk få aktører og kontrollerte scenarioer med trygg nullstilling. |
| Grafikkproduksjon tar over prosjektet | Produser bare ressursene prototyperuten bruker. |
| Første versjon blir for stor | Fullfør gangfeltets læringssløyfe før de øvrige situasjonene bygges. |
| Faglig innhold er uklart eller foreldet | Kildekontroll i M0 og ny kontroll når vurderingsregler endres. |

## 10. Rekkefølge og første arbeidsøkt

Arbeidet følger **M0 → M1 → M2 → M3 → M4 → M5 → M6**. Visuell lesbarhet prøves allerede i M1 og M2, selv om grafikken ferdigstilles i M5.

Første arbeidsøkt skal gi:

1. Scenarioark for gangfeltet og en felles mal for de fem andre situasjonene.
2. Dokumenterte faglige spørsmål og kildestatus.
3. Valgt Godot-versjon og prosjektstruktur.
4. Et lite testområde med kjørbar bil og kamera som neste implementeringsleveranse.

Tidsestimat settes etter M2, når kjøremodellen og én komplett læringssløyfe er prøvd. Deretter kan de resterende fem scenarioene estimeres ut fra faktisk arbeid og kjente tekniske begrensninger.

Etter M6 tas neste beslutning ut fra spilletestingen: forbedre prototypen eller utvide til MVP med flere oppdrag, rundt 20 scenarioer og progresjon.
