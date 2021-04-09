(window["webpackJsonp"] = window["webpackJsonp"] || []).push([[4],{

/***/ "./Resources/Private/Assets/JavaScript/components/lightbox.js":
/*!********************************************************************!*\
  !*** ./Resources/Private/Assets/JavaScript/components/lightbox.js ***!
  \********************************************************************/
/*! no exports provided */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* WEBPACK VAR INJECTION */(function(global) {/* harmony import */ var photoswipe__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! photoswipe */ "./node_modules/photoswipe/dist/photoswipe.js");
/* harmony import */ var photoswipe__WEBPACK_IMPORTED_MODULE_0___default = /*#__PURE__*/__webpack_require__.n(photoswipe__WEBPACK_IMPORTED_MODULE_0__);
/* harmony import */ var photoswipe_src_js_ui_photoswipe_ui_default__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! photoswipe/src/js/ui/photoswipe-ui-default */ "./node_modules/photoswipe/src/js/ui/photoswipe-ui-default.js");
/* harmony import */ var photoswipe_src_js_ui_photoswipe_ui_default__WEBPACK_IMPORTED_MODULE_1___default = /*#__PURE__*/__webpack_require__.n(photoswipe_src_js_ui_photoswipe_ui_default__WEBPACK_IMPORTED_MODULE_1__);
/* harmony import */ var photoswipe_src_css_main_scss__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! photoswipe/src/css/main.scss */ "./node_modules/photoswipe/src/css/main.scss");
/* harmony import */ var photoswipe_src_css_main_scss__WEBPACK_IMPORTED_MODULE_2___default = /*#__PURE__*/__webpack_require__.n(photoswipe_src_css_main_scss__WEBPACK_IMPORTED_MODULE_2__);
/* harmony import */ var photoswipe_src_css_default_skin_default_skin_scss__WEBPACK_IMPORTED_MODULE_3__ = __webpack_require__(/*! photoswipe/src/css/default-skin/default-skin.scss */ "./node_modules/photoswipe/src/css/default-skin/default-skin.scss");
/* harmony import */ var photoswipe_src_css_default_skin_default_skin_scss__WEBPACK_IMPORTED_MODULE_3___default = /*#__PURE__*/__webpack_require__.n(photoswipe_src_css_default_skin_default_skin_scss__WEBPACK_IMPORTED_MODULE_3__);




global.PhotoSwipe = photoswipe__WEBPACK_IMPORTED_MODULE_0___default.a;
global.PhotoSwipeUI_Default = photoswipe_src_js_ui_photoswipe_ui_default__WEBPACK_IMPORTED_MODULE_1___default.a; // Not imported statically, because it needs to be loaded after the global PhotoSwipe prototype

__webpack_require__.e(/*! import() */ 2).then(__webpack_require__.t.bind(null, /*! ../../../../../../../public/typo3conf/ext/bootstrap_package/Resources/Public/JavaScript/Src/bootstrap.lightbox */ "../../public/typo3conf/ext/bootstrap_package/Resources/Public/JavaScript/Src/bootstrap.lightbox.js", 7));
/* WEBPACK VAR INJECTION */}.call(this, __webpack_require__(/*! ./../../../../../node_modules/webpack/buildin/global.js */ "./node_modules/webpack/buildin/global.js")))

/***/ })

}]);
//# sourceMappingURL=data:application/json;charset=utf-8;base64,eyJ2ZXJzaW9uIjozLCJzb3VyY2VzIjpbIndlYnBhY2s6Ly8vLi9SZXNvdXJjZXMvUHJpdmF0ZS9Bc3NldHMvSmF2YVNjcmlwdC9jb21wb25lbnRzL2xpZ2h0Ym94LmpzIl0sIm5hbWVzIjpbImdsb2JhbCIsIlBob3RvU3dpcGUiLCJQaG90b1N3aXBlVUlfRGVmYXVsdCIsIlBob3RvU3dpcGVVSURlZmF1bHQiXSwibWFwcGluZ3MiOiI7Ozs7Ozs7Ozs7QUFBQTtBQUFBO0FBQUE7QUFBQTtBQUFBO0FBQUE7QUFBQTtBQUFBO0FBQUE7QUFBQTtBQUNBO0FBQ0E7QUFDQTtBQUVBQSxNQUFNLENBQUNDLFVBQVAsR0FBb0JBLGlEQUFwQjtBQUNBRCxNQUFNLENBQUNFLG9CQUFQLEdBQThCQyxpRkFBOUIsQyxDQUVBOztBQUNBLCtTIiwiZmlsZSI6IjQuanMiLCJzb3VyY2VzQ29udGVudCI6WyJpbXBvcnQgUGhvdG9Td2lwZSBmcm9tICdwaG90b3N3aXBlJ1xuaW1wb3J0IFBob3RvU3dpcGVVSURlZmF1bHQgZnJvbSAncGhvdG9zd2lwZS9zcmMvanMvdWkvcGhvdG9zd2lwZS11aS1kZWZhdWx0J1xuaW1wb3J0ICdwaG90b3N3aXBlL3NyYy9jc3MvbWFpbi5zY3NzJ1xuaW1wb3J0ICdwaG90b3N3aXBlL3NyYy9jc3MvZGVmYXVsdC1za2luL2RlZmF1bHQtc2tpbi5zY3NzJ1xuXG5nbG9iYWwuUGhvdG9Td2lwZSA9IFBob3RvU3dpcGVcbmdsb2JhbC5QaG90b1N3aXBlVUlfRGVmYXVsdCA9IFBob3RvU3dpcGVVSURlZmF1bHRcblxuLy8gTm90IGltcG9ydGVkIHN0YXRpY2FsbHksIGJlY2F1c2UgaXQgbmVlZHMgdG8gYmUgbG9hZGVkIGFmdGVyIHRoZSBnbG9iYWwgUGhvdG9Td2lwZSBwcm90b3R5cGVcbmltcG9ydCgnLi4vLi4vLi4vLi4vLi4vLi4vLi4vcHVibGljL3R5cG8zY29uZi9leHQvYm9vdHN0cmFwX3BhY2thZ2UvUmVzb3VyY2VzL1B1YmxpYy9KYXZhU2NyaXB0L1NyYy9ib290c3RyYXAubGlnaHRib3gnKVxuIl0sInNvdXJjZVJvb3QiOiIifQ==