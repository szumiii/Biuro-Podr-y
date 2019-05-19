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

const generateStanCywilny = () => {
    let stanCywilny = insertInto('STANY_CYWILNE', 'ID,STAN_CYWILNY', "1,'kawaler/panna'");
    stanCywilny += insertInto('STANY_CYWILNE', 'ID,STAN_CYWILNY', "2,'żonaty/mężatka'");
    stanCywilny += insertInto('STANY_CYWILNE', 'ID,STAN_CYWILNY', "3,'rozwiedziony/rozwiedziona'");
    stanCywilny += insertInto('STANY_CYWILNE', 'ID,STAN_CYWILNY', "4,'wdowiec/wdowa'");

    return stanCywilny;
}

const generateKategorieZarobkowe = () => {
    let text = '\r\n';
    text += insertInto('KATEGORIE_ZAROBKOWE', 'ID,KATEGORIA_ZAROBKOWA', "1,'niska'")
    text += insertInto('KATEGORIE_ZAROBKOWE', 'ID,KATEGORIA_ZAROBKOWA', "2,'przeciętna'")
    text += insertInto('KATEGORIE_ZAROBKOWE', 'ID,KATEGORIA_ZAROBKOWA', "3,'ponadprzeciętna'")
    text += insertInto('KATEGORIE_ZAROBKOWE', 'ID,KATEGORIA_ZAROBKOWA', "4,'wysoka'")

    return text;
}

const generateSieciHoteli = (times) => {
    let text = '\r\n';
    for (let i = 0; i <= times; i++) {
        const sh = scheme.siec_hoteli();
        text += insertInto('SIECI_HOTELI', 'nazwa_sieci', `${sh['nazwa_sieci']}`);
    }
    return text;
}

const generateHotel = (times) => {
    let text = '\r\n';
    for (let i = 1; i <= times; i++) {
        const h = scheme.hotel(25, 100);
        text += insertInto(
            'HOTELE_TEST_2',
            'id_hotelu,adres,email,telefon,id_kraju,id_sieci_hotelu',
            `${i},'${h['adres']}','${h['email']}','${h['telefon']}','${h['id_kraju']}','${h['id_sieci_hotelu']}'`);
    }
    return text;
}


// const generateWycieczki = (times) => {
//     const wycieczki = ''
//     for (let i = 1; i <= times; i++) {
//         const wycieczka = scheme.wycieczka();
//         wycieczki += 
//     }
// }

const generateAll = () => {
    let all = '';
    all += generateStanCywilny();
    all += generateKategorieZarobkowe();
    all += generateHotel(200);

    saveToFile('datebase', all)
}

generateAll()