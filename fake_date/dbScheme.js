const faker = require('faker');

const kraj = () => {
    return faker.fake("{{address.country}}")
}
const hotel = () => {
    const hotel = [];
    adres = faker.fake("{{address.city}} {{address.streetAddress}}");
    email = faker.fake("{{internet.email}}");
    telefon = faker.fake("{{phone.phoneNumberFormat}}");

    hotel['adres'] = adres;
    hotel['email'] = email;
    hotel['telefon'] = telefon;

    return hotel;
}
const klient = () => {
    const klient = [];
    imie = faker.fake("{{name.firstName}}");
    nazwisko = faker.fake("{{name.lastName}}");
    adres = faker.fake("{{address.city}} {{address.streetAddress(true)}}");
    pesel = losuj(6000001234, 2200001234);
    email = faker.fake(`{{internet.email(${imie})}}`);
    telefon = faker.fake("{{phone.phoneNumberFormat}}");
    nr_dowodu = faker.fake("{{random.alphaNumeric(3)}}{{random.number}}");

    klient['imie'] = imie;
    klient['nazwisko'] = nazwisko;
    klient['adres'] = adres;
    klient['pesel'] = pesel;
    klient['email'] = email;
    klient['telefon'] = telefon;
    klient['nr_dowodu'] = nr_dowodu;
    return klient;
}

const operator = () => {
    faker.locale = 'en';
    const operator = [];
    nazwa_firmy = faker.fake("{{company.companyName}}");
    telefon = faker.fake("{{phone.phoneNumberFormat}}");
    email = faker.fake(`{{internet.email(${nazwa_firmy})}}`);

    operator['nazwa_firmy'] = nazwa_firmy;
    operator['telefon'] = telefon;
    operator['email'] = email;
    return operator;
}

const siec_hoteli = () => {
    faker.locale = 'en';
    const siec_hoteli = [];
    nazwa_sieci = faker.fake("{{company.companyName}} Hotels");

    siec_hoteli['nazwa_sieci'] = nazwa_sieci;
    return siec_hoteli;
}

const wycieczka = () => {
    const wycieczka = [];
    cena = faker.commerce.price(1000, 10000);

    const start = new Date('2017-05-08');
    const koniec = new Date();

    const dni = losuj(3, 14)
    data_rozpoczecia = faker.date.between(start, koniec);
    data_zakonczenia = data_rozpoczecia.addDays(dni)

    const id_operatora = losuj(1, 1000);
    const id_umowy = losuj(1, 1000);
    const id_hotelu = losuj(1, 1000);

    wycieczka['cena'] = cena;
    wycieczka['data_rozpoczecia'] = data_rozpoczecia.toISOString().slice(0, 10);
    wycieczka['data_zakonczenia'] = data_zakonczenia.toISOString().slice(0, 10);
    wycieczka['id_operatora'] = id_operatora;
    wycieczka['id_umowy'] = id_umowy;
    wycieczka['id_hotelu'] = id_hotelu;


    return wycieczka;
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
    wycieczka: wycieczka
}