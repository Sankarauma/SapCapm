using { product.db as db } from '../db/schema';

service ProductService {
  // entity Products as projection on db.Products excluding {stock,};

  //go with the object syntax for projection and exclude the few fields from the entity
  @odata.draft.enabled
  entity Products as projection on db.Products{
    *,
    case 
       when stock = 0 then 'Out of Stock' 
       when stock < 10 then 'Low Stock' 
       else 'Available'
       end as status : String(20),
    case
       when stock = 0 then 1
       when stock < 10 then 2
       else 3
       end as statusColour : Integer,
  };
  // {

  //   key ID,
  //   name,

  // want few database  and 1,2 your own fields that are not in the database entity
  //  virtual fullName: String(200),
  // };

}
