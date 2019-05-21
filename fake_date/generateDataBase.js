const fs = require('fs');
const scheme = require('./dbScheme')


function saveToFile(name, data) {
    fs.writeFile(`./${name}.sql`, data, err => {
        if (err) { console.log(err); }
        else { console.log("Succes"); }
    })
}

const insertInto = (tableName, tableColumn, values) => {
    return `INSERT INTO [dbo].[${tableName}] (${tableColumn}) VALUES (${values})\r\n`;
}

const sqlFormater = (name, tab) => {
    let keys = '';
    let values = '';

    const retValue = (v) => {
        if (typeof v === 'string') {
            return `'${v}'`;
        } else {
            return v;
        }
    }

    for (let i in tab) {
        keys += `${i},`
        values += `${retValue(tab[i])},`
    }

    return `INSERT INTO [dbo].[${name}] (${keys.substring(0, keys.length - 1)}) VALUES (${values.substring(0, values.length - 1)})\r\n`;
}

const generateKategorieZarobkowe = () => {
    let text = '\r\n';
    text += insertInto('KATEGORIE_ZAROBKOWE', 'KATEGORIA_ZAROBKOWA', "'niska'")
    text += insertInto('KATEGORIE_ZAROBKOWE', 'KATEGORIA_ZAROBKOWA', "'średnia'")
    text += insertInto('KATEGORIE_ZAROBKOWE', 'KATEGORIA_ZAROBKOWA', "'wysoka'")
    text += insertInto('KATEGORIE_ZAROBKOWE', 'KATEGORIA_ZAROBKOWA', "'bardzo wysoka'")

    return text;
}

const generateStanCywilny = () => {
    let stanCywilny = insertInto('STANY_CYWILNE', 'STAN_CYWILNY', "'kawaler/panna'");
    stanCywilny += insertInto('STANY_CYWILNE', 'STAN_CYWILNY', "'żonaty/mężatka'");
    stanCywilny += insertInto('STANY_CYWILNE', 'STAN_CYWILNY', "'rozwiedziony/rozwiedziona'");
    stanCywilny += insertInto('STANY_CYWILNE', 'STAN_CYWILNY', "'wdowiec/wdowa'");

    return stanCywilny;
}

const generateKlienci = (times, liczbaKatZar, liczbaStanuCywilnego) => {
    let text = '\r\n';
    for (let i = 1; i <= times; i++) {
        const k = scheme.klient(liczbaKatZar, liczbaStanuCywilnego);
        text += sqlFormater('KLIENCI', k)

    }
    return text;
}

const generateKraje = (times) => {
    let text = '\r\n';
    for (let i = 1; i <= times; i++) {
        const k = scheme.kraj();
        text += sqlFormater('KRAJE', k)
    }
    return text;
}

const generateSieciHoteli = (times) => {
    let text = '\r\n';
    for (let i = 1; i <= times; i++) {
        const sh = scheme.siec_hoteli();
        text += sqlFormater('SIECI_HOTELI', sh)
    }
    return text;
}

const generateHotel = (times, liczbaKrajow, liczbaSieci) => {
    let text = '\r\n';
    for (let i = 1; i <= times; i++) {
        const h = scheme.hotel(liczbaKrajow, liczbaSieci);
        text += sqlFormater('HOTELE', h)
    }
    return text;
}

const generateUmowyPlatnosciWycieczki = (times, liczbaKlientow, liczbaOperatorow, liczbaHoteli) => {
    let text = '\r\n';
    for (let i = 1; i <= times; i++) {
        const k = scheme.umowy(liczbaKlientow);
        text += sqlFormater('UMOWY', k)

        const w = scheme.wycieczka(liczbaOperatorow, i, liczbaHoteli);
        text += sqlFormater('WYCIECZKI', w)

        const p = scheme.platnosci(w['cena'], i);
        text += sqlFormater('PLATNOSCI', p)

    }
    return text;
}


const generateOperatorzy = (times) => {
    let text = '\r\n';
    for (let i = 1; i <= times; i++) {
        const o = scheme.operator();
        text += sqlFormater('OPERATORZY', o)

    }
    return text;
}

const generateAll = () => {
    const LICZBA_OPERATOROW = 600;
    const LICZBA_KRAJOW = 25;
    const LICZBA_HOTELI = 600;
    const LICZBA_SIECI_HOTELI = 150;
    const LICZBA_WYCIECZEK = 10000;
    const LICZBA_KLIENTOW = 1000;


    let all = '';
    all += generateStanCywilny();
    all += generateKategorieZarobkowe();

    all += generateOperatorzy(LICZBA_OPERATOROW);
    all += generateKraje(LICZBA_KRAJOW);
    all += generateKlienci(LICZBA_KLIENTOW, 4, 4);

    all += generateSieciHoteli(LICZBA_SIECI_HOTELI);
    all += generateHotel(LICZBA_HOTELI, LICZBA_KRAJOW, LICZBA_SIECI_HOTELI);

    all += generateUmowyPlatnosciWycieczki(LICZBA_WYCIECZEK, LICZBA_KLIENTOW, LICZBA_OPERATOROW, LICZBA_HOTELI);
    saveToFile('datebase', all)
}

generateAll()