const cds = require("@sap/cds");

class OrderService extends cds.ApplicationService {
    init() {
        this.on('submitOrder', async req => {
            const { Books } = cds.entities('com.at.bookshop')
            let { book: id, quantity } = req.data
            let book = await SELECT.from(Books, id, b => b.stock)

            // Validate input data
            if (!book) return req.error(404, `Book #${id} doesn't exist`)
            if (quantity < 1) return req.error(400, `quantity has to be 1 or more`)
            if (quantity > book.stock) return req.error(409, `${quantity} exceeds stock for book #${id}`)

            // Reduce stock in database and return updated stock value
            await UPDATE(Books, id).with({ stock: book.stock -= quantity })
            return book
        })

        return super.init();
    }
}

module.exports = OrderService;