const faker = require('faker');
const fs = require('fs');
const scheme = require('./dbScheme')

faker.locale = 'pl';

function saveToFile(name, data) {
    fs.writeFile(`./${name}.sql`, data, err => {
        if (err) { console.log(err); }
        else { console.log("Succes"); }
    })
}

function generateKraje(len) {
    let kraje = ""
    for (let i = 1; i <= len; i++) {
        kraje += `EXEC updateKRAJ @id=${i}, @nazwa_kraju="${scheme.kraj()}"\r\n`
    }
    saveToFile("kraje", kraje);
}

function generateHotele(len) {
    let hotele = ""
    for (let i = 1; i <= len; i++) {
        const hotel = scheme.hotel();
        hotele += `
        EXEC updateHOTEL @id=${i},
        @adres="${hotel['adres']}",
        @email="${hotel['email']}",
        @telefon="${hotel['telefon']}"
        \r\n`
    }
    saveToFile("hotele", hotele);
}

function generateKlienci(len) {
    let klienci = ""
    for (let i = 1; i <= len; i++) {
        const klient = scheme.klient();
        klienci += `
        EXEC updateKLIENT
        @id=${i},
        @imie="${klient['imie']}",
        @nazwisko="${klient['nazwisko']}",
        @adres="${klient['adres']}",
        @PESEL="${klient['pesel']}",
        @telefon="${klient['telefon']}",
        @email="${klient['email']}",
        @nr_dowodu="${klient['nr_dowodu']}"
        \r\n`
    }
    saveToFile("klienci", klienci);
}

function generateOperatorzy(len) {
    let operatorzy = ""
    for (let i = 1; i <= len; i++) {
        const operator = scheme.operator();
        operatorzy += `EXEC updateOPERATOR
        @id=${i},
        @nazwa_firmy="${operator['nazwa_firmy']}",
        @telefon="${operator['telefon']}",
        @email="${operator['email']}"
        \r\n`
    }
    saveToFile("operatorzy", operatorzy);
}

function generateSieciHoteli(len) {
    let sieci_hoteli = ""
    for (let i = 1; i <= len; i++) {
        const siec_hoteli = scheme.siec_hoteli();
        sieci_hoteli += `EXEC updateSIECI_HOTELI
        @id=${i},
        @nazwa_sieci="${siec_hoteli['nazwa_sieci']}"
        \r\n`
    }
    saveToFile("sieci_hoteli", sieci_hoteli);
}

function generateWycieczki(len) {
    let wycieczki = ""
    for (let i = 1; i <= len; i++) {
        const wycieczka = scheme.wycieczka();
        wycieczki += `EXEC updateWycieczki
        @id=${i},
        @cena="${wycieczka['cena']}",
        @data_rozpoczecia="${wycieczka['data_rozpoczecia']}",
        @data_zakonczenia="${wycieczka['data_zakonczenia']}"
        \r\n`
    }
    saveToFile("wycieczki", wycieczki);
}


function generateFakeData() {
    generateHotele(1000);
    generateKlienci(10000);
    generateOperatorzy(1000);
    generateSieciHoteli(1000);
    generateWycieczki(1000)
}

generateFakeData()
