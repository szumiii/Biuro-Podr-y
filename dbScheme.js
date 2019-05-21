const faker = require('faker');
faker.locale = 'en';

const kraj = () => {
    faker.locale = 'pl';
    kraj['nazwa_kraju'] = faker.fake("{{address.country}}").replace(/'/g, "")
    return kraj;
}
const hotel = (liczbaKrajow, liczbaSieci) => {
    faker.locale = 'en';
    const hotel = [];
    adres = faker.fake("{{address.city}} {{address.streetAddress}}");
    email = faker.fake("{{internet.email}}");
    telefon = faker.fake("{{phone.phoneNumberFormat}}");

    hotel['adres'] = adres.replace(/'/g, "");
    hotel['email'] = email.replace(/'/g, "");
    hotel['telefon'] = telefon;
    hotel['id_kraju'] = losuj(1, liczbaKrajow);
    hotel['id_sieci_hotelu'] = losuj(1, liczbaSieci);
    return hotel;
}
const klient = (liczbaKatZarobkowej, liczbaStanuCywilnego) => {
    faker.locale = 'pl';

    const klient = [];    
    imie = faker.fake("{{name.firstName}}");
    nazwisko = faker.fake("{{name.lastName}}");
    adres = faker.fake("{{address.city}} {{address.streetAddress(true)}}");
    pesel = losuj(6000001234, 2200001234);
    email = faker.fake(`{{internet.email(${imie})}}`);
    telefon = faker.fake("{{phone.phoneNumberFormat}}");
    nr_dowodu = faker.fake("{{random.alphaNumeric(3)}}{{random.number}}");

    klient['imie'] = imie.replace(/'/g, "");
    klient['nazwisko'] = nazwisko.replace(/'/g, "");
    klient['adres'] = adres.replace(/'/g, "");
    klient['pesel'] = pesel;
    klient['email'] = email.replace(/'/g, "");
    klient['telefon'] = telefon;
    klient['nr_dowodu'] = nr_dowodu.toUpperCase();
    klient['id_kategorii_zarobkowej'] = losuj(1, liczbaKatZarobkowej);
    klient['id_stanu_cywilnego'] = losuj(1, liczbaStanuCywilnego);
    return klient;
}

const operator = () => {
    faker.locale = 'en';
    const operator = [];
    nazwa_firmy = faker.fake("{{company.companyName}}");
    nazwa_firmy = faker.company.companyName();
    telefon = faker.fake("{{phone.phoneNumberFormat}}");
    email = faker.fake(`{{internet.email(${nazwa_firmy})}}`);

    operator['nazwa_firmy'] = nazwa_firmy.replace(/'/g, "");
    operator['telefon'] = telefon;
    operator['email'] = email.replace(/'/g, "");
    return operator;
}

const siec_hoteli = () => {
    faker.locale = 'en';
    const siec_hoteli = [];
    nazwa_sieci = faker.fake("{{company.companyName}} Hotels");

    siec_hoteli['nazwa_sieci'] = nazwa_sieci.replace(/'/g, "");
    return siec_hoteli;
}

const wycieczka = (liczbaOperatorow, idUmowy, liczbaHoteli) => {
    const wycieczka = [];
    cena = faker.commerce.price(1000, 10000);

    const start = new Date('2017-05-08');
    const koniec = new Date();

    const dni = losuj(3, 14)
    const data_rozpoczecia = faker.date.between(start, koniec);
    const data_zakonczenia = data_rozpoczecia.addDays(dni)

    const id_operatora = losuj(1, liczbaOperatorow);
    const id_hotelu = losuj(1, liczbaHoteli);

    wycieczka['cena'] = cena;
    wycieczka['data_rozpoczecia'] = data_rozpoczecia.toISOString().slice(0, 10);
    wycieczka['data_zakonczenia'] = data_zakonczenia.toISOString().slice(0, 10);
    wycieczka['id_operatora'] = id_operatora;
    wycieczka['id_umowy'] = idUmowy;
    wycieczka['id_hotelu'] = id_hotelu;
    return wycieczka;
}

const umowy = (liczbaKlientow) => {
    const umowy = [];

    const start = new Date('2017-05-08');
    const koniec = new Date();
    const data = faker.date.between(start, koniec)

    const id_klienta = losuj(1, liczbaKlientow)

    umowy['data'] = data;
    umowy['id_klienta'] = id_klienta;
    return umowy;
}

const platnosci = (kwota, data, id_umowy) => {
    const platnosci = [];
    const typ = ['karta', 'przelew', 'gotówka']

    const dni = losuj(0, 7);
    platnosci['kwota'] = kwota;
    platnosci['data'] = data.addDays(dni).toISOString().slice(0, 10);
    platnosci['typ'] = typ[Math.floor(Math.random() * typ.length)];
    platnosci['id_umowy'] = id_umowy;
    return platnosci;
}


const losuj = (min, max) => Math.floor(Math.random() * (max - min + 1)) + min;

Date.prototype.addDays = function (days) {
    var date = new Date(this.valueOf());
    date.setDate(date.getDate() + days);
    return date;
}

module.exports = {
    kraj: kraj,
    hotel: hotel,
    klient: klient,
    operator: operator,
    siec_hoteli: siec_hoteli,
    wycieczka: wycieczka,
    umowy: umowy,
    platnosci: platnosci
}