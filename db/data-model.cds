/*namespace my.bookshop;

entity Books {
  key ID : Integer;
  title  : String;
  stock  : Integer;
}
entity Authors {
  key BOOKID : Integer;
  bookTitle  : String;
  bookAuthorName  : String;
}
*/

namespace my.salesorder;
//------------------------------------------------------------------------------------------
//Association & Composition Example
//------------------------------------------------------------------------------------------
entity SalesOrders {
  key ID          : Integer;
      description : String(50) not null;
      salesOrg    : String(4);
      customerNo  : String(10);
      customer    : Association to Customers                //unmanaged association
                      on customer.customerNo = customerNo;
      items        : Composition of  many SalesOrderItems   //managed composition (to many)
                      on items.salesOrder = $self;
      virtual overBookingInd : Boolean;
      virtual totalQuantity  : Decimal(10, 2);
}

entity SalesOrderItems {
  key salesOrder : Association to one SalesOrders;          //managed association (to one)
  key item       : Integer;
      material   : String(18);
      quantity   : Decimal(10, 2);                          //Precision , scale
}


entity Customers {
  key customerNo   : String(10);
      customerName : String(50);
      addresses    : Composition of one Addresses;        //managed composition (to one)
}

entity Addresses {
  key ID      : Integer;
      city    : String(50);
      country : String(10);
      contact : ContactType;
}

type ContactType {
  phonenumber : String(10);
  email       : String(50);
}


