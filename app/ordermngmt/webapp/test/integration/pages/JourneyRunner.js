sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"com/demo/ordermngmt/test/integration/pages/OrdersList.gen",
	"com/demo/ordermngmt/test/integration/pages/OrdersObjectPage.gen",
	"com/demo/ordermngmt/test/integration/pages/OrderItemsObjectPage.gen"
], function (JourneyRunner, OrdersListGenerated, OrdersObjectPageGenerated, OrderItemsObjectPageGenerated) {
    'use strict';

    const runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('com/demo/ordermngmt') + '/test/flp.html#app-preview',
        pages: {
			onTheOrdersListGenerated: OrdersListGenerated,
			onTheOrdersObjectPageGenerated: OrdersObjectPageGenerated,
			onTheOrderItemsObjectPageGenerated: OrderItemsObjectPageGenerated
        },
        async: true
    });

    return runner;
});

