Giraffe!
======================================

Prostředí, závislosti
---------------------------------------------------------

 Překladač: ruby 1.9.2p290 
            gem antlr3

 BC Interpret: gcc 4.6.1 20110819

Build
---------------------------------------------------------   

 - Ruby postačí gem install antlr3, dále spouštět jak 
   je napsáno v příkladech níže
 
 - Bytecode interpret má v adresáři grf svůj Makefile


Doporučení
---------------------------------------------------------   
 
 - spouštět v terminálu s tmavým pozadím
   výpisy používají barvy, aby bylo 
   logování a ladění přehledné

Součásti
---------------------------------------------------------
    
    VM:         grf/grf
    Překladač:  bin/giraffe.rb

Použití
---------------------------------------------------------

 1.) Nejprve je potřeba soubor přeložit

    bin/giraffe.rb -giraffe_program-.grf

 Překladač má několik možností, které
 lze vypsat použitím přepínače -h

 Nejpodstatnější je asi přepínač -o 
 kterým lze specifikovat název výstupu.
 Výstupní soubor má příponu .grfc

    bin/giraffe.rb knapBaB.grf -o knapsack

 vygeneruje bytecode soubor

    knapsack.grfc

 což je vstupní soubor VM (default je out.grfc)

 Pokud je vše v pořádku, překladač vypíše

    BUILD SUCCESS ...

 V případě syntaktické chyby, je vypsán výpis
 z parser/lexer:

    in knapBaB.grf @ line 43:23 no viable alternative at input "\n"

 Pokud je problém v semantice, vypíše se (např.)

    Error: Variable 'v' is not declared
        in variable 'v' on line 52, column 8

 a samozřejmě 

    BUILD FAILED ...

 2.) Přeložené soubory se pustí na interpretu

    ./grf/grf testfiles/knapsack.grfc

 Interpret bytecodu má opět několik možností,
 jedná se hlavně o nastavení velikosti stacku (-s),
 heap (-m) a počtu file descriptorů (-f).

 Velikost stacku a heap se nastavuje v bytech

     ./grf/grf testfiles/knapsack.grfc -s 2000 -m 4000

Ladění
---------------------------------------------------------

 Součástí interpretu je i ladící část, kterou lze
 spustit přepínačem -d

    ./grf/grf testfiles/knapsack.grfc -s 2000 -m 4000 -d

 Tím se spustí program v jednoduchém ladícím režimu,
 který umí:

    - krokovat (s nebo step)
    - nastavit breakpoint na instrukci (b nebo break)
    - pokračovat v provádění kódu (c nebo cont)
    - vypsat zásobník (t nebo stack)
    - vypsat pamět (m nebo memory)
    - vypsat volné místo paměti (f nebo freespace)
    - spustit celý program znovu (run)

 Nastavení breakpoint na instrukci alloc (0x0c) - příklad:
 
    giraffe > b
    Enter instruction opcode: 0c
    setting breakpoint on instruction 0x0c
    giraffe >

 !!! - Debugger aktuálně vypisuje proběhlé instrukce,
       ne instrukci, která se bude provádět (jako GDB)

 Výpisy debuggeru jsou doplněny hodnotami, kde Mx je 
 hodnota paměťové buňky v relativním číslování od 
 počátku (ve výpisu paměti jsou i pevné adresy) a
 Lx, což jsou relativní adresy lokálních proměnných

 Například výpis 

    Byte: 0x0c -- alloc 8 + 1 slots (72 bytes) +M0

 znamená, že instrukce alloc s opcodem 0x0c alokovala
 9 slotů, tedy celkově 72B od paměti M0 - po vypsání 
 paměti pomocí příkazu 'm' 

    M0  @ 0x0x804f008:  20:0x00000008  ... 

 lze vidět, že M0 se nachází na adrese 0x0x804f008

 Výpis zásobníku je zpracovaný obdobně, navíc ukazuje
 pozice FP a SP, kde FP je slot s modrým pozadím a 
 SP je slot vypsaný žlutě.

Příklady
---------------------------------------------------------

 Na ukázku práce s Giraffe je tu několik programů, 
 pro jejich jednoduché přeložení je zde i skript
 build_exmpls.sh, který projde všechny zdrojáky v
 testfiles a přeloží je do odpovídajících grfc

 1.) arrays.grf     Zde je ukázána práce s poli
                    včetně jejich "rychlé" alokace
                    přes [] a "deklarované" alokace
                    přes instrukci alloc(-velikost-)

                    Pro kontrolu je tu vypis print, 
                    ktery rekurzivne vypisuje to, 
                    co se mu preda jako parametr

 2.) cycle.grf      Ukázky cyklů 

 3.) factorial.grf  Klasická prezentace rekurze

 4.) if.grf         Ukázka kontroly return statementu
                    překladač rekurzivně kontroluje,
                    zda každá větev má return, pokud
                    nemá, vyhodí chybu

 5.) file.grf       Práce se soubory, otevírání, čtení
                    zápis, apod.

 6.) knapBaB.grf    Úloha batohu - v debug režimu je
                    možné pozorovat práci GC, který 
                    hlásí kolik slotů se mu povedlo
                    uvolnit během scavenge. Např.:
                    
                        GC colleted 51 slots 
                        - resume alloc:  +M197

                    GC po scavenge pokračoval v alokaci
                    a nalokoval pole od mista 197

                    Algoritmus na sber odpadku je
                    použit Baker, který přesouvá 
                    mezi dvěma heapami
