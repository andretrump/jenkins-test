using {com.at.bookshop as bookshop} from '../db/schema';

@requires: 'admin'
service SupplyMonitoringService {
    @readonly
    entity Books as projection on bookshop.Books;

    @readonly
    entity Suppliers as projection on bookshop.Suppliers;
}