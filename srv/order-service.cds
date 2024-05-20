using my.salesorder as my from '../db/data-model.cds'; // or '../db/order-data-model';
// added this comment to see in GIT auto released or not
service CatalogService @(path:'/catalog', requires:'authenticated-user') 
{
    @(restrict:[
        {
            grant:'READ',
            to:'SalesOrderViewer'
        },
        {
            grant:[
                'READ',
                'CREATE',
                'UPDATE',
                'DELETE'
            ],
            to :'SalesOrderAdmin',
            where : 'salesOrg = $user.SalesOrgAttribute'
        }
    ])
    
    entity SalesOrders     as projection on my.SalesOrders;
    entity SalesOrderItems as projection on my.SalesOrderItems;
    entity Customers as projection on my.Customers;
    entity Addresses as projection on my.Addresses; 
    /*
    //function - GET
    function getSomeText() returns String;
    
    //Action - POST
    action doSomeThing(x:String, y:Integer) returns String;
    */
}