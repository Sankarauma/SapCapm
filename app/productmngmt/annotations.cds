using ProductService as service from '../../srv/prd-srv';
// Annotate means who can see what in the UI. The annotations are used to define the UI behavior and presentation of the data model.
annotate service.Products with @(
    UI.SelectionFields : [
        ID,
        name,
        price,
        stock,
        discount,
    ],
    UI.LineItem : {
    $value: [
        {
            $Type : 'UI.DataField',
            Value : ID,
        },
        {
            $Type : 'UI.DataField',
            Value : name,
        },
        {
            $Type : 'UI.DataField',
            Value : createdBy,
        },
        {
            $Type : 'UI.DataField',
            Value : discount,
        },
        {
            $Type : 'UI.DataField',
            Value : image,
            Label : 'Image',
        },
        {
            $Type : 'UI.DataField',
            Value : modifiedAt,
        },
        {
            $Type : 'UI.DataField',
            Value : price,
        },
        {
            $Type : 'UI.DataField',
            Value : stock,
        },
        {
            $Type : 'UI.DataField',
            Value : status,
            Criticality : statusColour,
        },
    ],
    @UI.Criticality: statusColour,
    },

    UI.HeaderInfo : {
        TypeName : 'Product',
        TypeNamePlural : 'Products',
        Title : {
            $Type : 'UI.DataField',
            Value : name,
        },
        Description : {
            $Type : 'UI.DataField',
            Value : description,
        },
        TypeImageUrl : 'sap-icon://product',
        ImageUrl : image,
    },
    UI.DataPoint #ID : {
        $Type : 'UI.DataPointType',
        Value : ID,
        Title : 'Product ID',
    },
     UI.DataPoint #IPrice: {
        $Type : 'UI.DataPointType',
        Value : price,
        Title : 'Product Price',
    },
    UI.DataPoint #Status: {
        $Type : 'UI.DataPointType',
        Value : status,
        Title : 'Product Status',
        Criticality : statusColour,
    },

    //Header Facet annotation is used to define the header information of the entity. It is used to display the header information in the UI.
    //Data Point annotation is used to define the data point information of the entity. It is used to display the data point information in the UI.odata Field
    UI.HeaderFacets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'ID',
            Target : '@UI.DataPoint#ID',
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'IPrice',
            Target : '@UI.DataPoint#IPrice',
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'Status',
            Target : '@UI.DataPoint#Status',
        },
    ],
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Product Information',
            ID : 'ProductInformation',
            Target : '@UI.FieldGroup#ProductInformation',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Product Image',
            ID : 'ProductImage',
            Target : '@UI.FieldGroup#ProductImage',
        },
    ],
    UI.FieldGroup #ProductInformation : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : ID,
            },
            {
                $Type : 'UI.DataField',
                Value : name,
            },
            {
                $Type : 'UI.DataField',
                Value : description,
                Label : 'description',
            },
            {
                $Type : 'UI.DataField',
                Value : discount,
            },
            {
                $Type : 'UI.DataField',
                Value : price,
            },
            {
                $Type : 'UI.DataField',
                Value : stock,
            },
        ],
    },
    UI.FieldGroup #ProductImage : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : image,
                Label : 'image',
            },
        ],
    },
);



annotate service.Products with {
    ID @Common.Label : 'Product ID';
    name @Common.Label : 'Product Name';
    price @Common.Label : 'Product Price';
    stock @Common.Label : 'Product Stock';
    discount @Common.Label : 'Product Discount';
    status @Common.Label : 'Product Status';

};

