namespace product.db;

using { cuid, managed } from '@sap/cds/common';

type amount : Decimal(10,2);


//user defined data type for address
// type address {
//   streetName: String(100);
//   areaName: String(100);
//   City: String(100);
//   Country: String(100);
// }

//having fixed values enum ,if give some other values will throw error -enumeration 
// type category : String enum {
//   Electronics;
//   Fashion;
//   Home;
//   Sports;
//   Books;
//   Others;
// }
// type status : String enum {
//   Active;
//   Inactive;
//   Discontinued;
// }

// entity Products {
//   key ID: Integer;
//   Title: String(100);
//   Price: amount;
//   Stock: Integer;
//   deliveryAddress: address;
//   category: category;
//   status: status;
// }

// Aspects is cuid and managed ---collection of fields in all tables (cuid,managed)
// aspect myAspects {
//   amount: amount;
//   discount: Integer;
// }

//Association - relationship between two entities loosely coupled relatiion (child can exist without parent entity)
//EG - Authors ,and book

//Composition -- Tightly coupled relationship between two entities (child cannot exist without parent entity)
//EG- - Order and OrderItems. if delete a parent entity then child entity will also be deleted automatically

entity Products: cuid, managed {
    name: String(100) @mandatory @assert.format : '^[A-Za-z0-9 ]+$';
    description: String(500);
    price: amount @mandatory;
    discount: Integer;
    stock: Integer @mandatory;
    image:LargeBinary @Core.MediaType: 'image/png';

}

entity Orders: cuid, managed {
    customerName: String(100);
    customerMobile: String(15);
    storeName: String(100);
    netPrice: amount;
    items: Composition of many OrderItems on items.order = $self;
}

entity OrderItems: cuid, managed {
    order:Association to Orders;
    product: Association to Products;
    quantity: Integer;
    price: amount;
    discount: Integer;
    totalPrice: amount;
   
}