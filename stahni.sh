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

mista="${!typ[@]}"

mkdir data grafy grafy-png csv
for i in $mista; do
    wget "https://unicam.camea.cz/Discoverer/StatsReports/bike-counter/stats-customer-hour-content/df/${typ[$i]}%2000:00:00/dt/`date +%Y-%m-%d`%2000:00:00/sn/$i/format/csv" -O "data/${nazev[$i]}.csv"
done
