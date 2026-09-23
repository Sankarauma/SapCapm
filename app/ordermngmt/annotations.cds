using OrderMgmtService as service from '../../srv/ordermgmt-srv';

annotate service.Orders with @(
    UI.SelectionFields        : [
        ID,
        storeName,
        customerName,
        netPrice,
    ],
    UI.LineItem               : [
        {
            $Type: 'UI.DataField',
            Value: ID,
        },
        {
            $Type: 'UI.DataField',
            Value: storeName,
        },
        {
            $Type: 'UI.DataField',
            Value: customerName,
        },
        {
            $Type: 'UI.DataField',
            Value: customerMobile,
        },
        {
            $Type: 'UI.DataField',
            Value: netPrice,
        },
    ],
    UI.HeaderInfo             : {
        TypeName      : 'Order',
        TypeNamePlural: 'Orders',
        Title         : {
            $Type: 'UI.DataField',
            Value: ID,
        },
        Description   : {
            $Type: 'UI.DataField',
            Value: netPrice,
        },
        TypeImageUrl  : 'sap-icon://sales-order',
    },
    //#createdBy ---qualifier for the annotation to be used in the service
    UI.DataPoint #createdBy   : {
        $Type: 'UI.DataPointType',
        Value: createdBy,
        Title: 'createdBy',
    },
     UI.DataPoint #storeName: {
        $Type: 'UI.DataPointType',
        Value: storeName,
        Title: 'storeName',
    },
    UI.DataPoint #customerName: {
        $Type: 'UI.DataPointType',
        Value: customerName,
        Title: 'customerName',
    },
    UI.HeaderFacets           : [
        {
            $Type : 'UI.ReferenceFacet',
            ID    : 'createdBy',
            Target: '@UI.DataPoint#createdBy',
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID    : 'storeName',
            Target: '@UI.DataPoint#storeName',
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID    : 'customerName',
            Target: '@UI.DataPoint#customerName',
        },
    ],
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Order Information',
            ID : 'OrderInformation',
            Target : '@UI.FieldGroup#OrderInformation',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Item Details',
            ID : 'ItemDetails',
            Target : 'items/@UI.LineItem#ItemDetails',
        },
    ],
    UI.FieldGroup #OrderInformation : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : ID,
            },
            {
                $Type : 'UI.DataField',
                Value : storeName,
            },
            {
                $Type : 'UI.DataField',
                Value : customerName,
            },
            {
                $Type : 'UI.DataField',
                Value : customerMobile,
            },
            {
                $Type : 'UI.DataField',
                Value : netPrice,
            },
        ],
    },
);

annotate service.Orders with {
    ID             @Common.Label: 'Customer ID';
    storeName      @Common.Label: 'Store Name';
    customerName   @Common.Label: 'Customer Name';
    netPrice       @Common.Label: 'Net Price';
    customerMobile @Common.Label: 'Customer Mobile';
};
annotate service.OrderItems with @(
    UI.LineItem #ItemDetails : [
        {
            $Type : 'UI.DataField',
            Value : order_ID,
            Label : 'order_ID',
        },
        {
            $Type : 'UI.DataField',
            Value : product_ID,
            Label : 'product_ID',
        },
        {
            $Type : 'UI.DataField',
            Value : quantity,
            Label : 'quantity',
        },
        {
            $Type : 'UI.DataField',
            Value : price,
            Label : 'price',
        },
        {
            $Type : 'UI.DataField',
            Value : discount,
            Label : 'discount',
        },
        {
            $Type : 'UI.DataField',
            Value : totalPrice,
            Label : 'totalPrice',
        },
        {
            $Type : 'UI.DataField',
            Value : ID,
            Label : 'ID',
        },
    ]
);

annotate service.OrderItems with {
    product @(
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Products',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : product_ID,
                    ValueListProperty : 'ID',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'name',
                },
                {
                    $Type : 'Common.ValueListParameterOut',
                    ValueListProperty : 'price',
                    LocalDataProperty : price,
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'stock',
                },
                {
                    $Type : 'Common.ValueListParameterOut',
                    ValueListProperty : 'discount',
                    LocalDataProperty : discount,
                },
            ],
            Label : 'Select Product',
        },
        Common.ValueListWithFixedValues : false,
)};

