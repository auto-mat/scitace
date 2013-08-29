sčítače
=======

Generátor grafů z Pražských cyklosčítačů. Skript zajistí stažení dat z [Unicamu](https://unicam.camea.cz/Discoverer/BikeCounter/Index) a jejich zpracování do agregovaných grafů.

 spouštění
=======

Stažení dat a generování grafů (ve formátech PNG, SVG a HTML) se spustí pomocí:
   ./generate.sh

Denní generování grafů zajistíte pomocí cronu. Spustíte editaci pomocí `crontab -e` a přidáte řádek jako `42 4 * * * /home/username/scitace/generate.sh`, ve kterém změníte čas na nějakou jinou náhodnou noční hodinu a upravíte cestu ke skriptu podle umístění ve vašem počítači.
