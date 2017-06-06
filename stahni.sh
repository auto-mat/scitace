#!/bin/bash
declare -A typ
typ["BC_PT-ZOVO"]="2011-03-23"
typ["BC_KR-RAZB"]="2011-03-24"
typ["BC_KO-LEPR"]="2011-03-22"
typ["BC_NM-CEKV"]="2011-03-22"
typ["BC_HZ-CE"]="2011-03-22"
typ["BC_DS-KJVL"]="2011-03-22"
typ["BC_VK-HRUP"]="2011-03-22"
typ["BC_VF-ARUE"]="2011-03-22"
typ["BC_VK-MOKO"]="2011-03-22"
typ["BC_DE-EVSA"]="2011-03-22"
typ["BC_CB-CHTU"]="2011-03-22"
typ["BC_NS-PAVL"]="2011-03-22"
typ["BC_PP-ROJP"]="2011-03-22"
typ["BC_JG-PNPC"]="2011-03-22"
typ["BC_VS-CE"]="2011-03-22"
typ["BC_SH-SEKU"]="2011-03-22"
typ["BC_BS-BMZL"]="2011-03-22"
typ["BC_CT-OTPB"]="2012-01-01"
typ["BC_DU-KRST"]="2009-10-27"
typ["BC_KJ-HRHO"]="2009-10-27"
typ["BC_KO-VYHO"]="2009-10-27"
typ["BC_PN-VYBR"]="2009-11-03"
typ["BC_RN-JK"]="2009-12-01"
typ["BC_SU-VS"]="2009-05-04"
typ["BC_ST-RABA"]="2010-01-01"
typ["BC_TL-TRHO"]="2009-11-04"
typ["BC_VR-ST"]="2009-10-27"
typ["BC_SU-KRKA"]="2010-01-01"
typ["BC_PM-MHJA"]="2014-12-01"
typ["BC_PN-VYBR2"]="2015-10-01"
typ["BC_EU-KTOT"]="2016-11-01"

declare -A nazev
nazev["BC_PT-ZOVO"]="Povltavská"
nazev["BC_KR-RAZB"]="Radotín"
nazev["BC_KO-LEPR"]="Letňany"
nazev["BC_NM-CEKV"]="Nuselský_most"
nazev["BC_HZ-CE"]="Hlubočepská"
nazev["BC_DS-KJVL"]="Dukelských_hrdinů"
nazev["BC_VK-HRUP"]="Vítkov"
nazev["BC_VF-ARUE"]="Vysočany"
nazev["BC_VK-MOKO"]="Modřany-Komořany"
nazev["BC_DE-EVSA"]="Divoká_šárka"
nazev["BC_CB-CHTU"]="Chodov"
nazev["BC_NS-PAVL"]="Střešovice"
nazev["BC_PP-ROJP"]="Podbabská"
nazev["BC_JG-PNPC"]="Podolí"
nazev["BC_VS-CE"]="Košíře"
nazev["BC_SH-SEKU"]="Šeberov"
nazev["BC_BS-BMZL"]="Barandovský_most"
nazev["BC_CT-OTPB"]="Celetná"
nazev["BC_DU-KRST"]="Dubeč"
nazev["BC_KJ-HRHO"]="Nábřeží_kapitána_jaroše"
nazev["BC_KO-VYHO"]="Kolčavka"
nazev["BC_PN-VYBR"]="Podolské_nábřeží"
nazev["BC_RN-JK"]="Rohanské_nábřeží"
nazev["BC_SU-VS"]="Šárecké_údolí"
nazev["BC_ST-RABA"]="Lahovičky_(Strakonická)"
nazev["BC_TL-TRHO"]="Císařský_ostrov"
nazev["BC_VR-ST"]="Vršovická"
nazev["BC_SU-KRKA"]="Krč_(Sulická)"
nazev["BC_PM-MHJA"]="Pelléova"
nazev["BC_PN-VYBR2"]="Podolské_nábřeží_-_vozovka"
nazev["BC_EU-KTOT"]="Elsnicovo_náměstí"

mista="${!typ[@]}"

for i in $mista; do
    year_from=`echo ${typ[$i]} | sed s/-.*//g`
    year_to=`date +%Y`
    for y in `seq $year_from $year_to`; do
       if [ $y = $year_from ]; then
          date_from=${typ[$i]}
       else
          date_from="$y-01-01"
       fi

       if [ $y = $year_to ]; then
          date_to=`date +%Y-%m-%d`
       else
          date_to="$y-12-31"
       fi

       if [ $y = $year_to ]; then
          wget "https://unicam.camea.cz/Discoverer/StatsReports/bike-counter/stats-customer-hour-content/df/$date_from%2000:00:00/dt/$date_to%2000:00:00/sn/$i/format/csv" -O "data/${nazev[$i]}_$y.csv"
       fi
    done
    sed -i -e '$a\' data/${nazev[$i]}_*.csv
    cat data/${nazev[$i]}_*.csv | grep "^[^Č].*" > data-combined/${nazev[$i]}.csv
    echo ----------------------------

done
