import cds from '@sap/cds'
import { INSERT } from '@sap/cds/lib/ql/cds-ql.js';
//on handler - replace the default hanlder 
//before - run before the default handler ---create ,update
//after - run after the default handler ---not use for update and create ,it use for read operation only

export class ProductService extends cds.ApplicationService { init() {

  const { Products } = cds.entities('ProductService')
  const { Orders } = cds.entities('OrderMgmtService')
//CQN - cds query notation 
  // this.on('CREATE',Products, async (req) => {
  //   console.log(req.data); 
  //   await INSERT.into(Products).entries(req.data)
  
  // });
  // this.on("DELETE",Products,async (req)=>{
  //   await DELETE.from(Products).where({ID:req.data.ID})
  // })
  // this.before('CREATE',Products,async (req)=>{
  //   if(req.data.discount>=100){
  //     req.data.discount=90;
  //   }
  // })

  this.before('CREATE',Products,async (req)=>{
    if(req.data.discount>=100){
      req.data.discount=90;
    }
  });
  this.after('READ',Products,async (result)=>{
    for(let i=0;i<result.length;i++){
      let finalPrice=result[i].price-(result[i].price*result[i].discount/100);
      result[i].description=result[i].description+" Final Price: "+finalPrice;
    }
  });



  return super.init()
}}
