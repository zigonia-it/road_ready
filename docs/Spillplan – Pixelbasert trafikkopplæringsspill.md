# Spillplan – Pixelbasert trafikkopplæringsspill

**Arbeidstittel:** *RoadReady*  
**Sjanger:** Educational driving game / simulation / adventure  
**Primær målgruppe:** 15–20 år  
**Primær førerkortklasse:** Klasse B  
**Visuell stil:** Moderne pixel art  
**Plattform:** PC først, senere Web/Mac/Linux og eventuelt mobil  
**Foreslått spillmotor:** Godot 4  
**Hovedspråk:** Norsk bokmål

---

# 1. Visjon

Spillet skal gjøre trafikkopplæring mer engasjerende ved å plassere spilleren i faktiske trafikale situasjoner i stedet for hovedsakelig å presentere tradisjonelle teorispørsmål.

Spilleren skal lære gjennom:

- observasjon
- kjøring
- valg
- konsekvenser
- refleksjon
- spørsmål
- gjentakelse
- gradvis vanskeligere trafikksituasjoner

Målet er ikke å erstatte trafikkskole, øvelseskjøring eller offisiell teoriopplæring.

Spillet skal fungere som et **supplerende læringsverktøy** hvor spilleren kan øve på å forstå trafikk.

---

# 2. Pedagogisk fundament

Innholdet skal bygges rundt norsk føreropplæring og gjeldende regelverk.

Primær faglig referanse:

**Statens vegvesen – V851 Læreplan for førerkortklasse B.**

Spillets progresjon bør speile prinsippene i føreropplæringen:

## Trinn 1 – Grunnleggende trafikkforståelse

Spilleren introduseres til:

- trafikksystemet
- grunnleggende trafikkregler
- skilt
- risiko
- mennesker i trafikken
- ansvar
- oppmerksomhet
- rus
- fart
- sikkerhet

Dette kan være en kort introduksjonsdel før den egentlige kjøringen starter.

---

## Trinn 2 – Grunnleggende kjørekompetanse

Spilleren lærer bilen og grunnleggende kjøring.

Eksempler:

- starte bilen
- akselerere
- bremse
- styre
- plassering
- fartstilpasning
- speilbruk
- blinklys
- observasjon
- rygging
- parkering
- igangsetting
- stans

I spillet representerer dette de første kjøreturene i områder med lite trafikk.

---

## Trinn 3 – Trafikal kompetanse

Her åpnes hoveddelen av spillet.

Spilleren møter:

- kryss
- vikeplikt
- rundkjøringer
- fotgjengere
- syklister
- kollektivtrafikk
- flerfeltsvei
- enveiskjøring
- kø
- høyere hastigheter
- landevei
- forbikjøring
- tunneler
- motorvei
- komplekse trafikksituasjoner

Det skal gradvis stilles større krav til selvstendige avgjørelser.

---

## Trinn 4 – Selvstendig kjøring og risikoforståelse

Spilleren får lengre oppdrag hvor spillet gir mindre hjelp.

Eksempel:

> Kjør fra hjemmet ditt til hytta.

Spilleren må selv:

- velge riktig fart
- lese trafikkbildet
- følge skilting
- planlegge kjøringen
- håndtere andre trafikanter
- velge riktig kjørefelt
- håndtere endringer underveis
- oppdage potensielle farer

Denne delen skal teste **helhetlig trafikal kompetanse**, ikke bare kunnskap om enkeltregler.

---

# 3. Hovedkonsept

Spillet foregår i en fiktiv norsk by og områdene rundt den.

Kartet kan inneholde:

**Sentrum → boligområder → industriområde → landevei → tettsted → motorvei → fjellområde**

Spilleren starter som en person som snart skal begynne å øvelseskjøre.

Gjennom spillet utvikler spilleren seg fra nybegynner til en fører som kan håndtere komplekse situasjoner.

---

# 4. Core Gameplay Loop

Den viktigste spill-loopen skal være:

**Velg kjøretur**

↓

**Start kjøreturen**

↓

**Observer trafikken**

↓

**Trafikal situasjon oppstår**

↓

**Spilleren må reagere**

↓

**Spillet vurderer handlingen**

↓

**Eventuelt spørsmål/refleksjon**

↓

**Feedback**

↓

**Kjøringen fortsetter**

↓

**Oppsummering**

↓

**XP / progresjon / nye områder**

Dette gjør at læringen skjer gjennom kjøringen.

---

# 5. Ikke lag en quiz med bil rundt

Dette er et sentralt designprinsipp.

Dårlig løsning:

> Du nærmer deg et kryss.  
>   
> Hva gjør du?
>
> A: Stopper  
> B: Kjører  
> C: Gir gass  
> D: Rygger

Bedre løsning:

Spilleren **kjører faktisk mot krysset**.

Det står en bil på høyre side.

Spillet registrerer:

- hastighet
- plassering
- om spilleren observerer situasjonen
- bremsing
- tidspunkt for bremsing
- hvem spilleren slipper fram
- om spilleren skaper fare

Etter situasjonen kan spillet spørre:

> Hvorfor måtte du redusere farten før krysset?

Dermed kobles teori til noe spilleren akkurat har opplevd.

---

# 6. Kjøreperspektiv

Anbefalt løsning:

## Isometrisk / top-down pixel art

Kameraet følger bilen ovenfra i en lett vinklet perspektivstil.

Dette gir god oversikt over:

- veikryss
- kjørefelt
- fotgjengere
- syklister
- skilt
- biler
- plassering
- trafikkmønstre

Det gjør også spillet betydelig enklere å utvikle enn en full 3D-kjøresimulator.

Pixelgrafikken kan samtidig gi spillet en tydelig identitet.

---

# 7. Kjøremekanikk

Kontrollene skal være enkle, men kjøringen skal ha nok dybde til at spillerens valg betyr noe.

### Standard

**W / ↑:** Gass  
**S / ↓:** Brems  
**A/D:** Styring  
**Q/E:** Blinklys  
**Space:** Håndbrems  
**R:** Revers

Eventuelt:

**Shift:** Se venstre  
**Ctrl:** Se høyre

Gamepad skal støttes.

---

# 8. Observasjonssystem

Observasjon bør være en egen mekanikk.

Spillet kan registrere hva spilleren faktisk har hatt mulighet til å observere.

Eksempel:

Spilleren skal svinge til høyre.

En syklist kommer bakfra.

Dersom spilleren:

1. sjekker speilet
2. reduserer farten
3. bruker blinklys
4. oppdager syklisten
5. slipper syklisten forbi

registreres dette som en god trafikksituasjon.

Hvis spilleren bare svinger:

**⚠️ Risiko oppdaget**

Etterpå:

> Du svingte uten å kontrollere området på høyre side. En syklist befant seg ved siden av bilen.

Dette lærer spilleren *hvorfor* observasjon er viktig.

---

# 9. Scenario Engine

Dette bør bli en av spillets viktigste tekniske komponenter.

Et scenario består eksempelvis av:

```text
SCENARIO
├── Location
├── Traffic conditions
├── Weather
├── Speed limit
├── Player objective
├── NPC behaviour
├── Trigger
├── Expected behaviour
├── Risk factors
├── Possible mistakes
├── Evaluation
├── Feedback
└── Learning objective
```

Eksempel:

```text
Scenario: Pedestrian crossing

Speed limit: 40 km/h

Situation:
Pedestrian approaching crossing.

Expected:
Player detects pedestrian.
Reduces speed.
Stops if necessary.
Avoids creating danger.

Possible mistakes:
Too high speed.
Late observation.
Failure to stop.
Harsh braking.

Learning objective:
Interaction with pedestrians.
```

---

# 10. Dynamiske trafikksituasjoner

Situasjonene bør ikke være identiske hver gang.

Et kryss kan eksempelvis generere:

- ingen trafikk
- bil fra høyre
- bil fra venstre
- syklist
- fotgjenger
- buss
- utrykningskjøretøy
- sikthindring

Dermed kan spilleren ikke bare memorere:

> «I dette krysset kommer det alltid en bil.»

Spilleren må faktisk **observere trafikken**.

---

# 11. Trafikkskilt

Trafikkskilt skal eksistere fysisk i spillverdenen.

Eksempler:

- vikeplikt
- stopp
- forkjørsvei
- fartsgrense
- innkjøring forbudt
- enveiskjøring
- gangfelt
- parkering
- stans forbudt
- påbudt kjøreretning
- motorvei

Spilleren må lese og reagere på skiltene under kjøringen.

Det norske skiltsystemet skal baseres på offisielle kilder.

---

# 12. Navigasjon

Spilleren får oppdrag som:

> Kjør til kjøpesenteret.

Navigasjonen kan vise:

**← 300 m**

men spilleren må selv forstå hvordan man lovlig gjennomfører manøveren.

Eksempel:

GPS:

> Sving til venstre.

Men skiltet viser:

**Påbudt kjøreretning →**

Spilleren skal følge trafikkreglene, ikke GPS-en.

Dette gir mulighet for interessante læringssituasjoner.

---

# 13. Trafikk-AI

NPC-er skal ikke alltid oppføre seg perfekt.

Det er pedagogisk viktig.

NPC-er kan:

- kjøre for fort
- bremse plutselig
- unnlate å blinke
- feilplassere seg
- gå ut i veien
- sykle uforutsigbart
- kjøre ut foran spilleren

Spilleren skal lære:

**Andre trafikanters feil fritar ikke deg fra å prøve å unngå en farlig situasjon.**

Men feilene må være kontrollerte og pedagogisk begrunnede, ikke tilfeldig kaos.

---

# 14. Risikosystem

Spillet bør ha en intern risikomodell.

Eksempel:

```text
LOW
MEDIUM
HIGH
CRITICAL
```

Situasjonen vurderes ut fra blant annet:

- fart
- avstand
- sikt
- andre trafikanter
- vei
- vær
- reaksjonstid

Dette brukes til å avgjøre hvor alvorlig spillerens feil er.

---

# 15. Feil skal ikke bare gi minuspoeng

Feedback bør forklare sammenhengen.

I stedet for:

**-50 poeng**

bruk:

### ⚠️ Sen fartstilpasning

Du holdt 50 km/t inn mot krysset selv om sikten mot høyre var begrenset.

**Konsekvens:**  
Du hadde liten tid til å reagere da bilen dukket opp.

**Bedre strategi:**  
Reduser hastigheten tidligere når sikten er begrenset.

Dette er mye mer pedagogisk.

---

# 16. Spørsmålssystem

Spillet skal også inneholde tradisjonelle spørsmål, men disse skal brukes strategisk.

## Type A – Situasjonsspørsmål

Stopper kjøreturen midlertidig.

> Hvem har vikeplikt her?

## Type B – Etterrefleksjon

Etter en situasjon:

> Hvorfor var det nødvendig å redusere farten?

## Type C – Risikoforståelse

> Hva er den største potensielle faren i dette bildet?

## Type D – Regelverk

> Hva betyr dette skiltet?

## Type E – Planlegging

> Hvor bør du plassere bilen før denne svingen?

---

# 17. Hazard Perception

En egen spillmodus bør introduseres senere.

Spilleren ser en trafikal situasjon utvikle seg.

Oppgaven er å identifisere potensielle farer før de blir kritiske.

Eksempel:

En ball ruller ut i veien.

Erfarne spillere bør tenke:

> Det kan komme et barn etter ballen.

Spillet belønner dermed **prediksjon**, ikke bare reaksjon.

---

# 18. Oppdrag

Oppdragene skal føles som normale kjøreturer.

Eksempler:

### Første kjøretur

Kjør rundt på parkeringsplassen.

### Til butikken

Kjør gjennom boligområdet.

### Til skolen

Rushtrafikk og fotgjengere.

### Hent en venn

Bykjøring.

### Fotballtrening

Ettermiddagstrafikk og mange myke trafikanter.

### Hyttetur

Landevei, høyere fart og skiftende forhold.

### Flyplassen

Motorvei og komplekse kjørefelt.

### Vintertur

Snø, dårlig sikt og glatt vei.

---

# 19. Kartstruktur

Kartet bør utvikles modulært.

```text
WORLD
│
├── Training Area
│
├── Residential
│
├── Town Centre
│
├── Industrial Area
│
├── Country Road
│
├── Highway
│
├── Mountain Road
│
└── Winter Region
```

Områdene låses gradvis opp.

---

# 20. Vær og kjøreforhold

Senere versjoner kan introdusere:

☀️ Sol

🌧️ Regn

🌫️ Tåke

❄️ Snø

🌙 Mørke

Dette påvirker:

- sikt
- bremselengde
- hastighetsvalg
- risiko
- NPC-adferd

---

# 21. Dag og natt

Kjøring bør kunne foregå på:

- dagtid
- kveld
- natt
- skumring

Dette gir mulighet til å lære om blant annet synlighet og risikovurdering under forskjellige lysforhold.

---

# 22. Instruktør

Spilleren kan ha en virtuell trafikklærer.

Eksempel:

**Instruktør:**

> Se langt frem. Hva tror du kan skje ved bussholdeplassen?

Instruktøren skal gradvis si mindre.

### Tidlig spill

Mye hjelp.

### Midtspill

Enkelte hint.

### Sent spill

Nesten ingen hjelp.

Dette speiler utviklingen mot selvstendig kjøring.

---

# 23. Kompetansesystem

Spilleren skal ikke bare ha én XP-verdi.

Profilen kan vise:

```text
TRAFIKKOMPETANSE

Observasjon       ███████░░░ 72%
Fartstilpasning   ██████░░░░ 64%
Samhandling       ████████░░ 81%
Skilt             █████████░ 91%
Vikeplikt         ███████░░░ 75%
Plassering        ██████░░░░ 68%
Risikovurdering   █████░░░░░ 58%
Parkering         ████████░░ 84%
```

Dette gjør det mulig å identifisere områder spilleren bør øve mer på.

---

# 24. Adaptiv læring

Spillet bør registrere hvilke områder spilleren sliter med.

Hvis spilleren ofte gjør feil med:

**vikeplikt**

økes sannsynligheten for scenarioer som trener dette.

Hvis spilleren mestrer:

**fartsgrenser**

reduseres mengden grunnleggende spørsmål om dette.

Dermed tilpasses spillet automatisk spilleren.

---

# 25. Kjøretur-oppsummering

Etter hver tur vises:

## KJØRETUR FULLFØRT

**Tid:** 12:42  
**Distanse:** 7,4 km

### Sterke områder

✓ God observasjon  
✓ God fartstilpasning  
✓ God kommunikasjon

### Arbeid videre med

⚠ Plassering før kryss  
⚠ Observasjon av syklister

### Trafikksituasjoner

12 vurdert  
9 gode  
2 forbedringspunkter  
1 alvorlig feil

**Total vurdering: 82 %**

---

# 26. Ingen «game over» for normale feil

Pedagogisk bør feil hovedsakelig føre til læring.

En kollisjon kan:

1. fryse situasjonen
2. vise hva som skjedde
3. forklare årsaken
4. spole tilbake 10–15 sekunder

Spilleren prøver igjen.

Dette holder læringen i sentrum.

---

# 27. Pixel Art-retning

Stilen bør være:

**16/32-bit inspired modern pixel art**

Ikke ekstremt lavoppløst.

Prioriter:

- tydelige biler
- lesbare skilt
- tydelige veimerkinger
- sterke silhuetter
- god kontrast
- klare animasjoner

Trafikale elementer må alltid være lettere å lese enn dekorative elementer.

---

# 28. UI

HUD under kjøring bør være minimalistisk.

Eksempel:

```text
┌─────────────────────────────────────────┐
│ 50 km/t                    ← 250 m      │
│                                         │
│                                         │
│              GAME                       │
│                                         │
│                                         │
│ Gear D      43 km/t            ⚠        │
└─────────────────────────────────────────┘
```

Unngå for mange elementer som konkurrerer med trafikkbildet.

---

# 29. Teknisk arkitektur

Godot passer godt til prosjektet fordi spillet hovedsakelig kan bygges som et 2D-system.

Forslag:

```text
Game
│
├── World
├── Roads
├── TrafficManager
├── VehicleController
├── PlayerVehicle
├── NPCVehicles
├── Pedestrians
├── TrafficLights
├── Signs
│
├── ScenarioManager
├── QuestionManager
├── EvaluationEngine
├── LearningSystem
│
├── MissionManager
├── ProgressionManager
│
└── UI
```

Systemene bør være modulære slik at nytt læringsinnhold kan legges til uten å programmere hele spillet på nytt.

---

# 30. Innholdsdata

Spørsmål og scenarioer bør ligge utenfor selve programkoden.

Eksempel:

```json
{
  "id": "VPL_0012",
  "category": "vikeplikt",
  "difficulty": 2,
  "learning_objective": "right_hand_rule",
  "scenario": "intersection_residential",
  "question": "Hvem har vikeplikt i denne situasjonen?",
  "correct_answer": "player",
  "explanation": "..."
}
```

Dette gjør det mulig å bygge en stor kunnskapsbank.

---

# 31. Kategorier

Innholdsbanken bør minst dekke:

- trafikksystemet
- fører og ansvar
- kjøretøy
- observasjon
- fart
- plassering
- vikeplikt
- kryss
- rundkjøring
- skilt
- veioppmerking
- fotgjengere
- syklister
- kollektivtrafikk
- parkering
- forbikjøring
- landevei
- motorvei
- tunnel
- mørkekjøring
- vær og føre
- risiko
- rus
- tretthet
- ulykker
- førstehjelp
- miljø
- samhandling

Den endelige kategoriseringen skal kvalitetssikres mot gjeldende læreplan.

---

# 32. Faglig kvalitetssikring

Dette er spesielt viktig fordi spillet lærer bort faktisk trafikkompetanse.

Alt regelbasert innhold skal ha:

```text
SOURCE
SOURCE_VERSION
LAST_VERIFIED
LEARNING_OBJECTIVE
```

Eksempel:

```text
Source: V851
Version: 2026
Verified: 2026-09-12
```

Dette gjør det mulig å oppdatere innhold dersom regelverk eller læreplan endres.

---

# 33. MVP

Første versjon skal være liten.

Ikke bygg hele Norge.

## MVP-kart

Ett lite område:

- parkeringsplass
- boligområde
- hovedvei
- 4–5 kryss
- rundkjøring
- gangfelt
- bussholdeplass

## MVP-kjøretøy

Én bil.

## MVP-trafikk

- biler
- fotgjengere
- syklist

## MVP-systemer

- kjøring
- fart
- kollisjon
- blinklys
- skilt
- trafikklys
- vikeplikt
- scenarioer
- spørsmål
- feedback
- kjøretur-oppsummering

---

# 34. MVP-scenarioer

Lag først omtrent **20 svært gode situasjoner**.

Eksempel:

1. Høyreregel
2. Vikepliktsskilt
3. Stoppskilt
4. Gangfelt
5. Fotgjenger nær veien
6. Syklist
7. Rundkjøring
8. Fartsgrense
9. Endring av fartsgrense
10. Bussholdeplass
11. Parkert bil som sikthindring
12. Rygging
13. Parkering
14. Trafikklys
15. Venstresving
16. Høyresving
17. Feltvalg
18. Møtende trafikk
19. Dårlig sikt i kryss
20. Uventet hendelse

Dette er nok til å teste om selve konseptet fungerer.

---

# 35. Utviklingsfaser

## Fase 0 – Faglig design

Definer:

- læringsmål
- kategorier
- scenarioformat
- vurderingsmodell
- kildekrav
- progresjon

**Ingen stor innholdsproduksjon før dette er ferdig.**

---

## Fase 1 – Driving Prototype

Bygg:

- bil
- kamera
- veier
- kollisjon
- fart
- brems
- styring
- blinklys

Mål:

**Er det morsomt og forståelig å kjøre bilen?**

---

## Fase 2 – Traffic Prototype

Legg til:

- NPC-biler
- kryss
- trafikklys
- fotgjengere
- skilt

Mål:

**Kan spillverdenen produsere troverdige trafikksituasjoner?**

---

## Fase 3 – Learning Engine

Implementer:

- scenario triggers
- evaluering
- spørsmål
- feedback
- kompetanseområder

Dette transformerer prosjektet fra kjørespill til læringsspill.

---

## Fase 4 – Første komplette kjøretur

Lag én 10–15 minutters kjøretur.

Den skal inneholde:

- start
- navigasjon
- flere trafikksituasjoner
- spørsmål
- feedback
- mål
- oppsummering

Denne versjonen brukes til playtesting.

---

## Fase 5 – MVP

Utvid til:

- 20+ scenarioer
- progresjon
- kompetanseprofil
- lagring
- flere oppdrag
- forbedret AI
- ferdig pixel-art-retning

---

## Fase 6 – Alpha

Utvid verden.

Legg til:

- sentrum
- landevei
- motorvei
- flere NPC-er
- vær
- mørke
- hazard perception
- adaptiv læring

---

## Fase 7 – Full læringsprogresjon

Koble spillets progresjon tydeligere til kompetanseutviklingen i norsk føreropplæring.

Spilleren beveger seg fra:

**NYBEGYNNER**

↓

**GRUNNLEGGENDE KJØRING**

↓

**TRAFIKAL KOMPETANSE**

↓

**SELVSTENDIG FØRER**

---

# 36. Senere funksjoner

Mulige utvidelser:

### Driving Challenges

Spesifikke utfordringer:

> Kjør gjennom sentrum uten alvorlige feil.

### Daily Drive

En tilfeldig kjøretur hver dag.

### Theory Challenge

Mer tradisjonell teoritrening.

### Hazard Challenge

Finn farene raskest mulig.

### Driving School

Trafikklærere kan tildele elever scenarioer.

### Classroom Mode

Bruk spillet i trafikalt grunnkurs eller annen undervisning.

### Teacher Dashboard

Instruktør kan se:

- gjennomførte oppgaver
- sterke områder
- gjentakende feil
- kompetanseutvikling

---

# 37. Det som kan gjøre spillet unikt

Spillets sterkeste idé bør være:

> **Du lærer ikke trafikkreglene for å svare riktig på spørsmål. Du lærer dem fordi du trenger dem for å komme trygt frem.**

En spiller som har lært at et stoppskilt betyr at bilen skal stanse, har lært en regel.

En spiller som kommer kjørende mot et stoppskilt, vurderer sikten, stanser bilen på riktig sted, observerer kryssende trafikk og velger et sikkert tidspunkt å kjøre videre, har begynt å lære **trafikal kompetanse**.

Det er denne forskjellen spillet bør bygges rundt.

---

# 38. Prioritert utviklingsrekkefølge

```text
1. Faglig rammeverk
      ↓
2. Kjøremekanikk
      ↓
3. Lite testkart
      ↓
4. Trafikk-AI
      ↓
5. Scenario Engine
      ↓
6. Evaluation Engine
      ↓
7. Feedback-system
      ↓
8. 20 MVP-scenarioer
      ↓
9. Komplett kjøretur
      ↓
10. Playtesting med målgruppen
      ↓
11. Justering av gameplay
      ↓
12. Utvidelse av læringsinnhold
      ↓
13. Progresjonssystem
      ↓
14. Større spillverden
```

---

# 39. Viktigste designregel

Ved utvikling av hver funksjon skal spørsmålet være:

> **«Kan spilleren lære dette gjennom å oppleve situasjonen?»**

Hvis svaret er ja, bør situasjonen normalt løses gjennom gameplay.

Hvis svaret er nei, kan et spørsmål, en forklaring eller annen undervisning brukes.

Dette skal hindre at prosjektet utvikler seg til en tradisjonell teoriprøve med et kjørespill lagt utenpå.

---

# 40. Faglige hovedkilder

Innholdet skal primært kvalitetssikres mot:

- Statens vegvesen – V851 Læreplan for førerkortklasse B, B kode 96 og BE
- Statens vegvesen – informasjon om føreropplæring klasse B
- Statens vegvesen – trafikkskilt
- Gjeldende skiltforskrift
- Gjeldende trafikkregler
- Statens vegvesen – parkeringsregler

Regelverk og læreplan må kontrolleres ved hver større innholdsoppdatering.

---

# 41. Første konkrete milepæl

Den første spillbare prototypen trenger bare å demonstrere følgende:

**En pixelbil kjører gjennom et lite norsk boligområde.**

På kjøreturen møter spilleren:

1. fartsgrense
2. kryss med høyreregel
3. vikepliktsskilt
4. gangfelt
5. syklist
6. rundkjøring

Spillet registrerer hvordan spilleren håndterer situasjonene.

Etter kjøreturen får spilleren en pedagogisk vurdering av:

- observasjon
- fart
- vikeplikt
- plassering
- samhandling
- risikovurdering

Hvis denne 5–10 minutters opplevelsen både er **morsom å spille og faktisk lærer spilleren noe**, har prosjektet bevist at hovedkonseptet fungerer.