# Verifikasjon og fremdrift

Dato: 2026-09-12. Motor: Godot 4.7.2.stable.official.ed1daf0bf, macOS.

## Kontrollert

- ✅ Seks JSON-utkast med stabile ID-er og separate læringsmål skrevet; ikke aktivert for vurdering.
- ✅ Scenarioavtale med aktørruter, konfliktbeskrivelser, gode/uheldige eksempler og fire resultatklasser.
- ✅ Godot-prosjekt, startscene og input-handlinger opprettet.
- ✅ SI-basert fart og akselerasjon: 12 piksler per meter, km/t = m/s × 3,6.
- ✅ `godot --headless --path . --script tests/vehicles/test_vehicle.gd`: exit 0, ingen feil. Kontrollerer akselerasjon, brems uten utilsiktet revers, reversretning, nullstilling, maksimal hastighet og ingen rotasjon ved stillstand.
- ✅ `godot --headless --path . --script tests/vehicles/test_training.gd`: exit 0, ingen feil. Faktisk scene, fysikksteg og input: hindring stopper bilen ved maksimal fart, gass flytter bilen, pause fryser posisjon.
- ✅ `godot --headless --path . --quit-after 120`: exit 0, ingen feil i oppstart eller kjøring.

Godot ble først kjørt i sandkassen. Tester passerte der, men motoren meldte feil ved skriving av brukerdata/cache. Kjøring med tillatt tilgang til Godots normale brukerdata ga rene logger for testene og oppstarten. Importmetadata ved bilder er generert av Godot og beholdes som prosjektressurser.

## Ikke ferdig

- ⬜ M0: full regelverkskontroll og eksakte læreplanpunkter. Kilderegisteret beskriver konkret kontrollstatus.
- ⬜ M1: visuell gjennomgang, kjørefølelse, kamerakalibrering, kontroll av blinklys/gir via brukerinput og test med ny spiller. Kode finnes, men disse punktene har ennå ikke tilstrekkelig bevis for grønn hake.
- ⬜ M2–M6: scenarioimplementering, sammenhengende rute, grafikk/lyd, eksport og målgruppetesting.

Neste arbeid: fullfør M0-kildeoppslag via nettleser, kontroller M1 visuelt og bygg deretter gangfeltets komplette læringssløyfe. Ikke merk hele M0/M1 ferdig ut fra kode eller headless-tester alene.
