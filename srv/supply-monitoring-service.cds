using {com.at.bookshop as bookshop} from '../db/schema';

service SupplyMonitoringService {
    @readonly
    entity Books as projection on bookshop.Books;

    @readonly
    entity Suppliers as projection on bookshop.Suppliers;
}