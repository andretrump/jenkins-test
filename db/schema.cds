using {
    Currency,
    managed,
} from '@sap/cds/common';

namespace com.at.bookshop;

entity Books : managed {
    key ID       : Integer;
        title    : String(111)                @mandatory;
        descr    : String(1111);
        author   : Association to one Authors @mandatory;
        stock    : Integer;
        price    : Decimal;
        currency : Currency;
        supplier : Association to one Suppliers
}

entity Authors : managed {
    key ID           : Integer;
        name         : String(111) @mandatory;
        dateOfBirth  : Date;
        dateOfDeath  : Date;
        placeOfBirth : String;
        placeOfDeath : String;
        books        : Association to many Books
                           on books.author = $self;
}

using {API_BUSINESS_PARTNER as bupa} from '../srv/external/API_BUSINESS_PARTNER';

entity Suppliers as
    projection on bupa.A_BusinessPartner {
        key BusinessPartner          as ID,
            BusinessPartnerFullName  as fullName,
            BusinessPartnerIsBlocked as isBlocked,
            books : Association to many Books on books.supplier = $self
    }