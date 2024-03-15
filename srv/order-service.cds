using {com.at.bookshop as bookshop} from '../db/schema';

service OrderService {
    @readonly
    entity Books   as
        projection on bookshop.Books
        excluding {
            supplier
        };

    @readonly
    entity Authors as projection on bookshop.Authors;

    @requires: 'authenticated-user'
    action submitOrder(book : Integer, quantity : Integer) returns {
        stock : Integer
    };
}
