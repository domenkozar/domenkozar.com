---
categories: ["english", "energy"]
author: Domen Kožar
date: 2026-08-17 09:00:00
title: "Buy Your Friends Batteries"
draft: false
slug: buy-your-friends-batteries
description: "Pool your money and give your friends batteries that lower their electricity bills and keep essential devices running during outages."
---

Your next group birthday gifts should be home batteries.

Most birthday gifts are forgotten within a year. Batteries save your friends
money every day and keep essential devices running when the power goes out.

A 5 kWh battery costs about €1,600. That is expensive for one person and easy
for a group:

- eight people contribute €200 each;
- sixteen people contribute €100 each;
- thirty-two people contribute €50 each.

Create a battery birthday club. Buy each friend a battery on their birthday
until everyone has one.

The idea is simple: buy electricity when it is cheap, store it, and use it
when it is expensive. Automatic price optimization reads tomorrow's prices
and handles the schedule for you.

The [EcoFlow STREAM 5000](https://eu.ecoflow.com/products/stream-series-solar-battery)
is one current example: about €1,600 for 5 kWh of storage and up to 3 kW of
output.

Germany and Spain are good places to do this. In the second half of 2025, the
average household electricity price was €0.3869/kWh in Germany and €0.2669/kWh
in Spain, including taxes. Those averages hide large changes during each day.

I calculated what would have happened on every day of 2025. The battery buys
5 kWh during the four cheapest hours before 17:00 and delivers 4.5 kWh during
the four most expensive evening hours. That assumes 90% round-trip efficiency
and only runs the battery when the cycle is profitable.

| Country | Average cheap price | Average expensive price | Average saving per day | Saving in 2025 | €1,600 payback |
| --- | ---: | ---: | ---: | ---: | ---: |
| Germany | €0.041/kWh | €0.133/kWh | €0.40 | €144 | 11.1 years |
| Spain | €0.026/kWh | €0.106/kWh | €0.34 | €126 | 12.7 years |

The calculation is:

**daily saving = 4.5 × expensive price − 5 × cheap price**

The table uses the market-linked part of a dynamic tariff, based on German
[SMARD](https://www.smard.de/en) and Spanish
[OMIE](https://www.omie.es/en/market-results/daily/daily-market/day-ahead-price)
day-ahead prices. Your bill also contains supplier charges, network fees, and
taxes. Some are fixed and some depend on time and location, so you should run
the same calculation against your actual tariff. The national household price
comparison comes from
[Eurostat](https://ec.europa.eu/eurostat/web/products-eurostat-news/w/ddn-20260505-1).

Grid arbitrage alone is therefore useful, but not yet an automatic five-year
payback. The economics improve when the same battery also stores your solar
power, earns grid-service payments, or replaces electricity bought at the full
retail price.

You are also safer during a power outage. The STREAM 5000 provides up to 3 kW
of off-grid output. Keep essential devices on its backup output and reserve
some battery capacity, and your refrigerator, lights, router, and laptop can
keep running when the grid goes down. An ordinary grid connection does not
back up the whole house automatically; the backup output must be configured
correctly.

And when the neighborhood goes dark but their lights stay on, they will
remember who gave them the battery.

A battery also decouples when electricity is produced from when it is used.
Spain can save abundant midday solar for the evening. Germany can save wind
power produced during low demand for the next peak. More low-carbon energy can
be used instead of wasted simply because it arrived at the wrong hour.

## Do this

1. Pick the friends with upcoming birthdays.
2. Confirm that their home, meter, and electricity contract are compatible.
3. Collect €50–€200 from each person.
4. Buy a battery with automatic tariff integration.
5. Configure price optimization and keep 20% available for outages.
6. Repeat for the next birthdays.

Ten million 5 kWh batteries would create 50 GWh of distributed storage and
30 GW of output. At one cycle per day, they could move about 16 TWh of
electricity each year.

**[EUROMAXXING.](https://eu-acc.com/)**

## Edits

1. A battery can lower the fixed part of the bill too. The STREAM 5000's peak
   shaving detects a surge and discharges automatically to keep grid draw below
   a limit. In markets such as Spain, this can let you contract less maximum
   power and pay a lower fixed capacity charge; Spain's
   [CNMC](https://www.cnmc.es/va/node/406175) confirms that this charge depends
   on contracted power. The reduction must fit the battery's permitted grid-tied
   output and available charge, or the grid limit can still trip.

2. It is a plug-in battery. The basic grid-connected setup plugs into an
   existing grounded wall socket, avoiding a separate electrician or
   installation bill. Higher-power input or output is a different configuration:
   EcoFlow says that requires a certified professional, and installing a
   compatible whole-home meter may also add a cost.

3. California does not allow this yet.
   [Senate Bill 868](https://leginfo.legislature.ca.gov/faces/billTextClient.xhtml?bill_id=202520260SB868),
   the Plug and Play Solar Act, would exempt a "portable solar generation
   device" from interconnection requirements: up to 1,200 watts through an
   ordinary socket. It passed the Senate 35 to 1 and the Assembly has until
   31 August 2026 to pass it. The exemption is written around photovoltaic
   generation, so a battery only qualifies with a panel attached, and a
   [10 watt panel](https://www.newpowa.com/10w-monocrystalline-12v-solar-panel/)
   costs $26.

4. Germany's law machine also has to catch up. The plug-in solar rules do not
   cover a battery you charge from the grid, and households outside the
   mandatory smart meter rollout cannot get hourly metering cheaply.
   [Petition 177835](https://epetitionen.bundestag.de/petitionen/_2025/_02/_13/Petition_177835.nc.html)
   asked for both. The
   [coalition programme](https://www.pv-magazine.de/2026/07/02/koalitionsausschuss-verteilnetzausbau-beschleunigen-smart-meter-light-aber-kein-wort-zum-eeg/)
   of 2 July 2026 promises a cheap "Smart Meter Light", and the
   [EEG 2027 draft](https://www.pv-magazine.de/2026/03/10/geleakter-eeg-entwurf-vereinfachungen-bei-stecksolargeraeten-mit-speicher-geplant/)
   covers a battery only behind the same inverter. Right direction, no date.
