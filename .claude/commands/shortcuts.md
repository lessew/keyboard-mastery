---
name: shortcuts
description: Geeft een overzicht van alle keyboard shortcuts uit tmux en zmk-toucan.
---

Lees beide bronbestanden en presenteer een overzichtelijke cheatsheet van alle shortcuts.

**Stap 1** — Lees `tmux/.tmux.conf` en extraheer alle `bind-key` regels.

**Stap 2** — Lees `zmk-toucan/config/toucan.keymap` en extraheer per layer de bindings. De lagen zijn:
- `base` (DEFAULT 0) — thuislaag
- `nav` (EXCEL_APPS 1) — nummers & apps, geactiveerd via linker duimknop
- `sym` (SPECIAL_WINDOWS 2) — symbolen & vensters, geactiveerd via rechter duimknop
- `adj` (PERIPHERALS 3) — Bluetooth & media, geactiveerd via combo

**Stap 3** — Presenteer het resultaat in twee blokken:

### tmux
Tabel: Shortcut | Actie

### Toucan (ZMK)
Per layer: naam, hoe te activeren, en een leesbare weergave van de bindings (niet de raw dtsi-syntax — vertaal `&kp`, `&mt`, `&lt`, macronamen naar leesbare termen). Sla lege of `&none` posities over.

Houd de output compact. Geen bestandspaden of technische details tenzij relevant.
