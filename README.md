# Kjøremester
![Road Ready/ Kjøremester – konseptillustrasjon](assets/logo/logo-full-no.png)


Første tekniske kjøreprototype i Godot **4.7.2.stable.official.ed1daf0bf**.

Åpne `project.godot` i Godot og trykk F6 på øvingsscenen eller F5 for prosjektet.

Kontroller: W/pil opp gass, S/pil ned brems, A/D eller piler styring, Q/E blinklys, R bytt mellom D og R når bilen står stille, mellomrom håndbrems, Backspace start på nytt og Esc pause.

Scenen bruker foreløpige testformer. De seks læringssituasjonene er beskrevet i `docs/scenarios` og har datautkast under `data/scenarios`, men er ennå ikke koblet til kjøringen.

## Verifikasjon

Kjør fra prosjektmappen med Godot 4.7.2:

```sh
godot --headless --path . --script tests/vehicles/test_vehicle.gd
godot --headless --path . --script tests/vehicles/test_training.gd
godot --headless --path . --quit-after 120
```

På denne Mac-en er Godot-programmet `/Applications/Godot.app/Contents/MacOS/Godot`.

Utviklingsplan og fremdrift finnes i `docs/plans/Utviklingsplan – Første spillbare prototype.md`.
