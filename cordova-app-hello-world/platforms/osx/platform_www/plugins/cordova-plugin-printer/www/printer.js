cordova.define("cordova-plugin-printer.printer", function(require, exports, module) {
/*global cordova, module*/

module.exports = {
    getAvailablePrinters: function (successCallback, errorCallback) {
        cordova.exec(successCallback, errorCallback, "Printer", "getAvailablePrinters");
    }
};

});
