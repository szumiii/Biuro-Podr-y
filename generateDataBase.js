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

const generateKategorieZarobkowe = () => {
    let text = '\r\n';
    text += insertInto('KATEGORIE_ZAROBKOWE', 'ID,KATEGORIA_ZAROBKOWA', "1,'niska'")
    text += insertInto('KATEGORIE_ZAROBKOWE', 'ID,KATEGORIA_ZAROBKOWA', "2,'średnia'")
    text += insertInto('KATEGORIE_ZAROBKOWE', 'ID,KATEGORIA_ZAROBKOWA', "3,'wysoka'")
    text += insertInto('KATEGORIE_ZAROBKOWE', 'ID,KATEGORIA_ZAROBKOWA', "4,'bardzo wysoka'")

    return text;
}

const generateStanCywilny = () => {
    let stanCywilny = insertInto('STANY_CYWILNE', 'ID,STAN_CYWILNY', "1,'kawaler/panna'");
    stanCywilny += insertInto('STANY_CYWILNE', 'ID,STAN_CYWILNY', "2,'żonaty/mężatka'");
    stanCywilny += insertInto('STANY_CYWILNE', 'ID,STAN_CYWILNY', "3,'rozwiedziony/rozwiedziona'");
    stanCywilny += insertInto('STANY_CYWILNE', 'ID,STAN_CYWILNY', "4,'wdowiec/wdowa'");

    return stanCywilny;
}

const generateKlienci = (times, liczbaKatZar, liczbaStanuCywilnego) => {
    let text = '\r\n';
    for (let i = 1; i <= times; i++) {
        const k = scheme.klient(liczbaKatZar, liczbaStanuCywilnego);
        text += insertInto(
            'KLIENCI',
            'id_klienta,imie,nazwisko,adres,PESEL,telefon,email,nr_dowodu,id_kategorii_zarobkowej,id_stanu_cywilnego',
            `${i},'${k['imie']}','${k['nazwisko']}','${k['adres']}','${k['pesel']}','${k['email']}','${k['nr_dowodu']}',${k['id_kategorii_zarobkowej']},${k['id_stanu_cywilnego']}`);
    }
    return text;
}

const generateKraje = (times) => {
    let text = '\r\n';
    for (let i = 1; i <= times; i++) {
        const k = scheme.kraj();
        text += insertInto('KRAJE',
            'id_kraju,nazwa_kraju',
            `${i},'${k['nazwa_kraju']}'`);
    }
    return text;
}

const generateSieciHoteli = (times) => {
    let text = '\r\n';
    for (let i = 1; i <= times; i++) {
        const sh = scheme.siec_hoteli();
        text += insertInto('SIECI_HOTELI', 'nazwa_sieci', `'${sh['nazwa_sieci']}'`);
    }
    return text;
}

const generateHotel = (times, liczbaKrajow, liczbaSieci) => {
    let text = '\r\n';
    for (let i = 1; i <= times; i++) {
        const h = scheme.hotel(liczbaKrajow, liczbaSieci);
        text += insertInto(
            'HOTELE',
            'id_hotelu,adres,email,telefon,id_kraju,id_sieci_hotelu',
            `${i},'${h['adres']}','${h['email']}','${h['telefon']}','${h['id_kraju']}','${h['id_sieci_hotelu']}'`);
    }
    return text;
}

const generateUmowyPlatnosciWycieczki = (times, liczbaKlientow, liczbaOperatorow, liczbaHoteli) => {
    let text = '\r\n';
    for (let i = 1; i <= times; i++) {
        const k = scheme.umowy(liczbaKlientow);
        kData = k['data'].toISOString().slice(0, 10)
        text += insertInto('UMOWY',
            'id_umowy,data,id_klienta',
            `${i},'${kData}',${k['id_klienta']}`);

        const w = scheme.wycieczka(liczbaOperatorow, i, liczbaHoteli);
        text += insertInto('WYCIECZKI',
            'id_wycieczki,cena,data_rozpoczecia,data_zakonczenia,id_operatora,id_umowy,id_hotelu',
            `${i}, ${w['cena']},'${w['data_rozpoczecia']}','${w['data_zakonczenia']}',${w['id_operatora']},${w['id_umowy']},${w['id_hotelu']}`);

        const p = scheme.platnosci(w['cena'], k['data'], i);
        text += insertInto('PLATNOSCI',
            'id_platnosci,kwota,data_czas_platnosci,typ,id_umowy ',
            `${i},${p['kwota']},'${p['data']}','${p['typ']}',${i}`);
    }
    return text;
}


const generateOperatorzy = (times) => {
    let text = '\r\n';
    for (let i = 1; i <= times; i++) {
        const o = scheme.operator();
        text += insertInto(
            'OPERATORZY',
            'id_operatora,nazwa_firmy,telefon,email',
            `${i},'${o['nazwa_firmy']}','${o['telefon']}','${o['email']}'`);
    }
    return text;
}

const generateAll = () => {
    const LICZBA_OPERATOROW = 100;
    const LICZBA_KRAJOW = 25;
    const LICZBA_HOTELI = 300;
    const LICZBA_SIECI_HOTELI = 50;
    const LICZBA_WYCIECZEK = 2000;
    const LICZBA_KLIENTOW = 500;


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