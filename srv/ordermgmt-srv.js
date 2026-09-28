import cds from '@sap/cds'

export class OrderMgmtService extends cds.ApplicationService { init() {

  const { Orders, OrderItems, Products } = cds.entities('OrderMgmtService')

   this.before('CREATE',Orders,async (req)=>{
    var aItems=req.data.items;
    for(let i=0;i<aItems.length;i++){
      var fullPrice= aItems[i].quantity*aItems[i].price;
      if(aItems[i].discount>0){
        fullPrice=fullPrice-(fullPrice*aItems[i].discount/100);
      }
      aItems[i].totalPrice = fullPrice;
      req.data.netPrice=req.data.netPrice+fullPrice;
      console.log("Total Price: " + fullPrice);
    }

  });



  return super.init()
}}
