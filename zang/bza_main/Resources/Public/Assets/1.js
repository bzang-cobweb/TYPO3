(window["webpackJsonp"] = window["webpackJsonp"] || []).push([[1],{

/***/ "./node_modules/photoswipe/dist/photoswipe.js":
/*!****************************************************!*\
  !*** ./node_modules/photoswipe/dist/photoswipe.js ***!
  \****************************************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

var __WEBPACK_AMD_DEFINE_FACTORY__, __WEBPACK_AMD_DEFINE_RESULT__;/*! PhotoSwipe - v4.1.3 - 2019-01-08
* http://photoswipe.com
* Copyright (c) 2019 Dmitry Semenov; */
(function (root, factory) { 
	if (true) {
		!(__WEBPACK_AMD_DEFINE_FACTORY__ = (factory),
				__WEBPACK_AMD_DEFINE_RESULT__ = (typeof __WEBPACK_AMD_DEFINE_FACTORY__ === 'function' ?
				(__WEBPACK_AMD_DEFINE_FACTORY__.call(exports, __webpack_require__, exports, module)) :
				__WEBPACK_AMD_DEFINE_FACTORY__),
				__WEBPACK_AMD_DEFINE_RESULT__ !== undefined && (module.exports = __WEBPACK_AMD_DEFINE_RESULT__));
	} else {}
})(this, function () {

	'use strict';
	var PhotoSwipe = function(template, UiClass, items, options){

/*>>framework-bridge*/
/**
 *
 * Set of generic functions used by gallery.
 * 
 * You're free to modify anything here as long as functionality is kept.
 * 
 */
var framework = {
	features: null,
	bind: function(target, type, listener, unbind) {
		var methodName = (unbind ? 'remove' : 'add') + 'EventListener';
		type = type.split(' ');
		for(var i = 0; i < type.length; i++) {
			if(type[i]) {
				target[methodName]( type[i], listener, false);
			}
		}
	},
	isArray: function(obj) {
		return (obj instanceof Array);
	},
	createEl: function(classes, tag) {
		var el = document.createElement(tag || 'div');
		if(classes) {
			el.className = classes;
		}
		return el;
	},
	getScrollY: function() {
		var yOffset = window.pageYOffset;
		return yOffset !== undefined ? yOffset : document.documentElement.scrollTop;
	},
	unbind: function(target, type, listener) {
		framework.bind(target,type,listener,true);
	},
	removeClass: function(el, className) {
		var reg = new RegExp('(\\s|^)' + className + '(\\s|$)');
		el.className = el.className.replace(reg, ' ').replace(/^\s\s*/, '').replace(/\s\s*$/, ''); 
	},
	addClass: function(el, className) {
		if( !framework.hasClass(el,className) ) {
			el.className += (el.className ? ' ' : '') + className;
		}
	},
	hasClass: function(el, className) {
		return el.className && new RegExp('(^|\\s)' + className + '(\\s|$)').test(el.className);
	},
	getChildByClass: function(parentEl, childClassName) {
		var node = parentEl.firstChild;
		while(node) {
			if( framework.hasClass(node, childClassName) ) {
				return node;
			}
			node = node.nextSibling;
		}
	},
	arraySearch: function(array, value, key) {
		var i = array.length;
		while(i--) {
			if(array[i][key] === value) {
				return i;
			} 
		}
		return -1;
	},
	extend: function(o1, o2, preventOverwrite) {
		for (var prop in o2) {
			if (o2.hasOwnProperty(prop)) {
				if(preventOverwrite && o1.hasOwnProperty(prop)) {
					continue;
				}
				o1[prop] = o2[prop];
			}
		}
	},
	easing: {
		sine: {
			out: function(k) {
				return Math.sin(k * (Math.PI / 2));
			},
			inOut: function(k) {
				return - (Math.cos(Math.PI * k) - 1) / 2;
			}
		},
		cubic: {
			out: function(k) {
				return --k * k * k + 1;
			}
		}
		/*
			elastic: {
				out: function ( k ) {

					var s, a = 0.1, p = 0.4;
					if ( k === 0 ) return 0;
					if ( k === 1 ) return 1;
					if ( !a || a < 1 ) { a = 1; s = p / 4; }
					else s = p * Math.asin( 1 / a ) / ( 2 * Math.PI );
					return ( a * Math.pow( 2, - 10 * k) * Math.sin( ( k - s ) * ( 2 * Math.PI ) / p ) + 1 );

				},
			},
			back: {
				out: function ( k ) {
					var s = 1.70158;
					return --k * k * ( ( s + 1 ) * k + s ) + 1;
				}
			}
		*/
	},

	/**
	 * 
	 * @return {object}
	 * 
	 * {
	 *  raf : request animation frame function
	 *  caf : cancel animation frame function
	 *  transfrom : transform property key (with vendor), or null if not supported
	 *  oldIE : IE8 or below
	 * }
	 * 
	 */
	detectFeatures: function() {
		if(framework.features) {
			return framework.features;
		}
		var helperEl = framework.createEl(),
			helperStyle = helperEl.style,
			vendor = '',
			features = {};

		// IE8 and below
		features.oldIE = document.all && !document.addEventListener;

		features.touch = 'ontouchstart' in window;

		if(window.requestAnimationFrame) {
			features.raf = window.requestAnimationFrame;
			features.caf = window.cancelAnimationFrame;
		}

		features.pointerEvent = !!(window.PointerEvent) || navigator.msPointerEnabled;

		// fix false-positive detection of old Android in new IE
		// (IE11 ua string contains "Android 4.0")
		
		if(!features.pointerEvent) { 

			var ua = navigator.userAgent;

			// Detect if device is iPhone or iPod and if it's older than iOS 8
			// http://stackoverflow.com/a/14223920
			// 
			// This detection is made because of buggy top/bottom toolbars
			// that don't trigger window.resize event.
			// For more info refer to _isFixedPosition variable in core.js

			if (/iP(hone|od)/.test(navigator.platform)) {
				var v = (navigator.appVersion).match(/OS (\d+)_(\d+)_?(\d+)?/);
				if(v && v.length > 0) {
					v = parseInt(v[1], 10);
					if(v >= 1 && v < 8 ) {
						features.isOldIOSPhone = true;
					}
				}
			}

			// Detect old Android (before KitKat)
			// due to bugs related to position:fixed
			// http://stackoverflow.com/questions/7184573/pick-up-the-android-version-in-the-browser-by-javascript
			
			var match = ua.match(/Android\s([0-9\.]*)/);
			var androidversion =  match ? match[1] : 0;
			androidversion = parseFloat(androidversion);
			if(androidversion >= 1 ) {
				if(androidversion < 4.4) {
					features.isOldAndroid = true; // for fixed position bug & performance
				}
				features.androidVersion = androidversion; // for touchend bug
			}	
			features.isMobileOpera = /opera mini|opera mobi/i.test(ua);

			// p.s. yes, yes, UA sniffing is bad, propose your solution for above bugs.
		}
		
		var styleChecks = ['transform', 'perspective', 'animationName'],
			vendors = ['', 'webkit','Moz','ms','O'],
			styleCheckItem,
			styleName;

		for(var i = 0; i < 4; i++) {
			vendor = vendors[i];

			for(var a = 0; a < 3; a++) {
				styleCheckItem = styleChecks[a];

				// uppercase first letter of property name, if vendor is present
				styleName = vendor + (vendor ? 
										styleCheckItem.charAt(0).toUpperCase() + styleCheckItem.slice(1) : 
										styleCheckItem);
			
				if(!features[styleCheckItem] && styleName in helperStyle ) {
					features[styleCheckItem] = styleName;
				}
			}

			if(vendor && !features.raf) {
				vendor = vendor.toLowerCase();
				features.raf = window[vendor+'RequestAnimationFrame'];
				if(features.raf) {
					features.caf = window[vendor+'CancelAnimationFrame'] || 
									window[vendor+'CancelRequestAnimationFrame'];
				}
			}
		}
			
		if(!features.raf) {
			var lastTime = 0;
			features.raf = function(fn) {
				var currTime = new Date().getTime();
				var timeToCall = Math.max(0, 16 - (currTime - lastTime));
				var id = window.setTimeout(function() { fn(currTime + timeToCall); }, timeToCall);
				lastTime = currTime + timeToCall;
				return id;
			};
			features.caf = function(id) { clearTimeout(id); };
		}

		// Detect SVG support
		features.svg = !!document.createElementNS && 
						!!document.createElementNS('http://www.w3.org/2000/svg', 'svg').createSVGRect;

		framework.features = features;

		return features;
	}
};

framework.detectFeatures();

// Override addEventListener for old versions of IE
if(framework.features.oldIE) {

	framework.bind = function(target, type, listener, unbind) {
		
		type = type.split(' ');

		var methodName = (unbind ? 'detach' : 'attach') + 'Event',
			evName,
			_handleEv = function() {
				listener.handleEvent.call(listener);
			};

		for(var i = 0; i < type.length; i++) {
			evName = type[i];
			if(evName) {

				if(typeof listener === 'object' && listener.handleEvent) {
					if(!unbind) {
						listener['oldIE' + evName] = _handleEv;
					} else {
						if(!listener['oldIE' + evName]) {
							return false;
						}
					}

					target[methodName]( 'on' + evName, listener['oldIE' + evName]);
				} else {
					target[methodName]( 'on' + evName, listener);
				}

			}
		}
	};
	
}

/*>>framework-bridge*/

/*>>core*/
//function(template, UiClass, items, options)

var self = this;

/**
 * Static vars, don't change unless you know what you're doing.
 */
var DOUBLE_TAP_RADIUS = 25, 
	NUM_HOLDERS = 3;

/**
 * Options
 */
var _options = {
	allowPanToNext:true,
	spacing: 0.12,
	bgOpacity: 1,
	mouseUsed: false,
	loop: true,
	pinchToClose: true,
	closeOnScroll: true,
	closeOnVerticalDrag: true,
	verticalDragRange: 0.75,
	hideAnimationDuration: 333,
	showAnimationDuration: 333,
	showHideOpacity: false,
	focus: true,
	escKey: true,
	arrowKeys: true,
	mainScrollEndFriction: 0.35,
	panEndFriction: 0.35,
	isClickableElement: function(el) {
        return el.tagName === 'A';
    },
    getDoubleTapZoom: function(isMouseClick, item) {
    	if(isMouseClick) {
    		return 1;
    	} else {
    		return item.initialZoomLevel < 0.7 ? 1 : 1.33;
    	}
    },
    maxSpreadZoom: 1.33,
	modal: true,

	// not fully implemented yet
	scaleMode: 'fit' // TODO
};
framework.extend(_options, options);


/**
 * Private helper variables & functions
 */

var _getEmptyPoint = function() { 
		return {x:0,y:0}; 
	};

var _isOpen,
	_isDestroying,
	_closedByScroll,
	_currentItemIndex,
	_containerStyle,
	_containerShiftIndex,
	_currPanDist = _getEmptyPoint(),
	_startPanOffset = _getEmptyPoint(),
	_panOffset = _getEmptyPoint(),
	_upMoveEvents, // drag move, drag end & drag cancel events array
	_downEvents, // drag start events array
	_globalEventHandlers,
	_viewportSize = {},
	_currZoomLevel,
	_startZoomLevel,
	_translatePrefix,
	_translateSufix,
	_updateSizeInterval,
	_itemsNeedUpdate,
	_currPositionIndex = 0,
	_offset = {},
	_slideSize = _getEmptyPoint(), // size of slide area, including spacing
	_itemHolders,
	_prevItemIndex,
	_indexDiff = 0, // difference of indexes since last content update
	_dragStartEvent,
	_dragMoveEvent,
	_dragEndEvent,
	_dragCancelEvent,
	_transformKey,
	_pointerEventEnabled,
	_isFixedPosition = true,
	_likelyTouchDevice,
	_modules = [],
	_requestAF,
	_cancelAF,
	_initalClassName,
	_initalWindowScrollY,
	_oldIE,
	_currentWindowScrollY,
	_features,
	_windowVisibleSize = {},
	_renderMaxResolution = false,
	_orientationChangeTimeout,


	// Registers PhotoSWipe module (History, Controller ...)
	_registerModule = function(name, module) {
		framework.extend(self, module.publicMethods);
		_modules.push(name);
	},

	_getLoopedId = function(index) {
		var numSlides = _getNumItems();
		if(index > numSlides - 1) {
			return index - numSlides;
		} else  if(index < 0) {
			return numSlides + index;
		}
		return index;
	},
	
	// Micro bind/trigger
	_listeners = {},
	_listen = function(name, fn) {
		if(!_listeners[name]) {
			_listeners[name] = [];
		}
		return _listeners[name].push(fn);
	},
	_shout = function(name) {
		var listeners = _listeners[name];

		if(listeners) {
			var args = Array.prototype.slice.call(arguments);
			args.shift();

			for(var i = 0; i < listeners.length; i++) {
				listeners[i].apply(self, args);
			}
		}
	},

	_getCurrentTime = function() {
		return new Date().getTime();
	},
	_applyBgOpacity = function(opacity) {
		_bgOpacity = opacity;
		self.bg.style.opacity = opacity * _options.bgOpacity;
	},

	_applyZoomTransform = function(styleObj,x,y,zoom,item) {
		if(!_renderMaxResolution || (item && item !== self.currItem) ) {
			zoom = zoom / (item ? item.fitRatio : self.currItem.fitRatio);	
		}
			
		styleObj[_transformKey] = _translatePrefix + x + 'px, ' + y + 'px' + _translateSufix + ' scale(' + zoom + ')';
	},
	_applyCurrentZoomPan = function( allowRenderResolution ) {
		if(_currZoomElementStyle) {

			if(allowRenderResolution) {
				if(_currZoomLevel > self.currItem.fitRatio) {
					if(!_renderMaxResolution) {
						_setImageSize(self.currItem, false, true);
						_renderMaxResolution = true;
					}
				} else {
					if(_renderMaxResolution) {
						_setImageSize(self.currItem);
						_renderMaxResolution = false;
					}
				}
			}
			

			_applyZoomTransform(_currZoomElementStyle, _panOffset.x, _panOffset.y, _currZoomLevel);
		}
	},
	_applyZoomPanToItem = function(item) {
		if(item.container) {

			_applyZoomTransform(item.container.style, 
								item.initialPosition.x, 
								item.initialPosition.y, 
								item.initialZoomLevel,
								item);
		}
	},
	_setTranslateX = function(x, elStyle) {
		elStyle[_transformKey] = _translatePrefix + x + 'px, 0px' + _translateSufix;
	},
	_moveMainScroll = function(x, dragging) {

		if(!_options.loop && dragging) {
			var newSlideIndexOffset = _currentItemIndex + (_slideSize.x * _currPositionIndex - x) / _slideSize.x,
				delta = Math.round(x - _mainScrollPos.x);

			if( (newSlideIndexOffset < 0 && delta > 0) || 
				(newSlideIndexOffset >= _getNumItems() - 1 && delta < 0) ) {
				x = _mainScrollPos.x + delta * _options.mainScrollEndFriction;
			} 
		}
		
		_mainScrollPos.x = x;
		_setTranslateX(x, _containerStyle);
	},
	_calculatePanOffset = function(axis, zoomLevel) {
		var m = _midZoomPoint[axis] - _offset[axis];
		return _startPanOffset[axis] + _currPanDist[axis] + m - m * ( zoomLevel / _startZoomLevel );
	},
	
	_equalizePoints = function(p1, p2) {
		p1.x = p2.x;
		p1.y = p2.y;
		if(p2.id) {
			p1.id = p2.id;
		}
	},
	_roundPoint = function(p) {
		p.x = Math.round(p.x);
		p.y = Math.round(p.y);
	},

	_mouseMoveTimeout = null,
	_onFirstMouseMove = function() {
		// Wait until mouse move event is fired at least twice during 100ms
		// We do this, because some mobile browsers trigger it on touchstart
		if(_mouseMoveTimeout ) { 
			framework.unbind(document, 'mousemove', _onFirstMouseMove);
			framework.addClass(template, 'pswp--has_mouse');
			_options.mouseUsed = true;
			_shout('mouseUsed');
		}
		_mouseMoveTimeout = setTimeout(function() {
			_mouseMoveTimeout = null;
		}, 100);
	},

	_bindEvents = function() {
		framework.bind(document, 'keydown', self);

		if(_features.transform) {
			// don't bind click event in browsers that don't support transform (mostly IE8)
			framework.bind(self.scrollWrap, 'click', self);
		}
		

		if(!_options.mouseUsed) {
			framework.bind(document, 'mousemove', _onFirstMouseMove);
		}

		framework.bind(window, 'resize scroll orientationchange', self);

		_shout('bindEvents');
	},

	_unbindEvents = function() {
		framework.unbind(window, 'resize scroll orientationchange', self);
		framework.unbind(window, 'scroll', _globalEventHandlers.scroll);
		framework.unbind(document, 'keydown', self);
		framework.unbind(document, 'mousemove', _onFirstMouseMove);

		if(_features.transform) {
			framework.unbind(self.scrollWrap, 'click', self);
		}

		if(_isDragging) {
			framework.unbind(window, _upMoveEvents, self);
		}

		clearTimeout(_orientationChangeTimeout);

		_shout('unbindEvents');
	},
	
	_calculatePanBounds = function(zoomLevel, update) {
		var bounds = _calculateItemSize( self.currItem, _viewportSize, zoomLevel );
		if(update) {
			_currPanBounds = bounds;
		}
		return bounds;
	},
	
	_getMinZoomLevel = function(item) {
		if(!item) {
			item = self.currItem;
		}
		return item.initialZoomLevel;
	},
	_getMaxZoomLevel = function(item) {
		if(!item) {
			item = self.currItem;
		}
		return item.w > 0 ? _options.maxSpreadZoom : 1;
	},

	// Return true if offset is out of the bounds
	_modifyDestPanOffset = function(axis, destPanBounds, destPanOffset, destZoomLevel) {
		if(destZoomLevel === self.currItem.initialZoomLevel) {
			destPanOffset[axis] = self.currItem.initialPosition[axis];
			return true;
		} else {
			destPanOffset[axis] = _calculatePanOffset(axis, destZoomLevel); 

			if(destPanOffset[axis] > destPanBounds.min[axis]) {
				destPanOffset[axis] = destPanBounds.min[axis];
				return true;
			} else if(destPanOffset[axis] < destPanBounds.max[axis] ) {
				destPanOffset[axis] = destPanBounds.max[axis];
				return true;
			}
		}
		return false;
	},

	_setupTransforms = function() {

		if(_transformKey) {
			// setup 3d transforms
			var allow3dTransform = _features.perspective && !_likelyTouchDevice;
			_translatePrefix = 'translate' + (allow3dTransform ? '3d(' : '(');
			_translateSufix = _features.perspective ? ', 0px)' : ')';	
			return;
		}

		// Override zoom/pan/move functions in case old browser is used (most likely IE)
		// (so they use left/top/width/height, instead of CSS transform)
	
		_transformKey = 'left';
		framework.addClass(template, 'pswp--ie');

		_setTranslateX = function(x, elStyle) {
			elStyle.left = x + 'px';
		};
		_applyZoomPanToItem = function(item) {

			var zoomRatio = item.fitRatio > 1 ? 1 : item.fitRatio,
				s = item.container.style,
				w = zoomRatio * item.w,
				h = zoomRatio * item.h;

			s.width = w + 'px';
			s.height = h + 'px';
			s.left = item.initialPosition.x + 'px';
			s.top = item.initialPosition.y + 'px';

		};
		_applyCurrentZoomPan = function() {
			if(_currZoomElementStyle) {

				var s = _currZoomElementStyle,
					item = self.currItem,
					zoomRatio = item.fitRatio > 1 ? 1 : item.fitRatio,
					w = zoomRatio * item.w,
					h = zoomRatio * item.h;

				s.width = w + 'px';
				s.height = h + 'px';


				s.left = _panOffset.x + 'px';
				s.top = _panOffset.y + 'px';
			}
			
		};
	},

	_onKeyDown = function(e) {
		var keydownAction = '';
		if(_options.escKey && e.keyCode === 27) { 
			keydownAction = 'close';
		} else if(_options.arrowKeys) {
			if(e.keyCode === 37) {
				keydownAction = 'prev';
			} else if(e.keyCode === 39) { 
				keydownAction = 'next';
			}
		}

		if(keydownAction) {
			// don't do anything if special key pressed to prevent from overriding default browser actions
			// e.g. in Chrome on Mac cmd+arrow-left returns to previous page
			if( !e.ctrlKey && !e.altKey && !e.shiftKey && !e.metaKey ) {
				if(e.preventDefault) {
					e.preventDefault();
				} else {
					e.returnValue = false;
				} 
				self[keydownAction]();
			}
		}
	},

	_onGlobalClick = function(e) {
		if(!e) {
			return;
		}

		// don't allow click event to pass through when triggering after drag or some other gesture
		if(_moved || _zoomStarted || _mainScrollAnimating || _verticalDragInitiated) {
			e.preventDefault();
			e.stopPropagation();
		}
	},

	_updatePageScrollOffset = function() {
		self.setScrollOffset(0, framework.getScrollY());		
	};
	


	



// Micro animation engine
var _animations = {},
	_numAnimations = 0,
	_stopAnimation = function(name) {
		if(_animations[name]) {
			if(_animations[name].raf) {
				_cancelAF( _animations[name].raf );
			}
			_numAnimations--;
			delete _animations[name];
		}
	},
	_registerStartAnimation = function(name) {
		if(_animations[name]) {
			_stopAnimation(name);
		}
		if(!_animations[name]) {
			_numAnimations++;
			_animations[name] = {};
		}
	},
	_stopAllAnimations = function() {
		for (var prop in _animations) {

			if( _animations.hasOwnProperty( prop ) ) {
				_stopAnimation(prop);
			} 
			
		}
	},
	_animateProp = function(name, b, endProp, d, easingFn, onUpdate, onComplete) {
		var startAnimTime = _getCurrentTime(), t;
		_registerStartAnimation(name);

		var animloop = function(){
			if ( _animations[name] ) {
				
				t = _getCurrentTime() - startAnimTime; // time diff
				//b - beginning (start prop)
				//d - anim duration

				if ( t >= d ) {
					_stopAnimation(name);
					onUpdate(endProp);
					if(onComplete) {
						onComplete();
					}
					return;
				}
				onUpdate( (endProp - b) * easingFn(t/d) + b );

				_animations[name].raf = _requestAF(animloop);
			}
		};
		animloop();
	};
	


var publicMethods = {

	// make a few local variables and functions public
	shout: _shout,
	listen: _listen,
	viewportSize: _viewportSize,
	options: _options,

	isMainScrollAnimating: function() {
		return _mainScrollAnimating;
	},
	getZoomLevel: function() {
		return _currZoomLevel;
	},
	getCurrentIndex: function() {
		return _currentItemIndex;
	},
	isDragging: function() {
		return _isDragging;
	},	
	isZooming: function() {
		return _isZooming;
	},
	setScrollOffset: function(x,y) {
		_offset.x = x;
		_currentWindowScrollY = _offset.y = y;
		_shout('updateScrollOffset', _offset);
	},
	applyZoomPan: function(zoomLevel,panX,panY,allowRenderResolution) {
		_panOffset.x = panX;
		_panOffset.y = panY;
		_currZoomLevel = zoomLevel;
		_applyCurrentZoomPan( allowRenderResolution );
	},

	init: function() {

		if(_isOpen || _isDestroying) {
			return;
		}

		var i;

		self.framework = framework; // basic functionality
		self.template = template; // root DOM element of PhotoSwipe
		self.bg = framework.getChildByClass(template, 'pswp__bg');

		_initalClassName = template.className;
		_isOpen = true;
				
		_features = framework.detectFeatures();
		_requestAF = _features.raf;
		_cancelAF = _features.caf;
		_transformKey = _features.transform;
		_oldIE = _features.oldIE;
		
		self.scrollWrap = framework.getChildByClass(template, 'pswp__scroll-wrap');
		self.container = framework.getChildByClass(self.scrollWrap, 'pswp__container');

		_containerStyle = self.container.style; // for fast access

		// Objects that hold slides (there are only 3 in DOM)
		self.itemHolders = _itemHolders = [
			{el:self.container.children[0] , wrap:0, index: -1},
			{el:self.container.children[1] , wrap:0, index: -1},
			{el:self.container.children[2] , wrap:0, index: -1}
		];

		// hide nearby item holders until initial zoom animation finishes (to avoid extra Paints)
		_itemHolders[0].el.style.display = _itemHolders[2].el.style.display = 'none';

		_setupTransforms();

		// Setup global events
		_globalEventHandlers = {
			resize: self.updateSize,

			// Fixes: iOS 10.3 resize event
			// does not update scrollWrap.clientWidth instantly after resize
			// https://github.com/dimsemenov/PhotoSwipe/issues/1315
			orientationchange: function() {
				clearTimeout(_orientationChangeTimeout);
				_orientationChangeTimeout = setTimeout(function() {
					if(_viewportSize.x !== self.scrollWrap.clientWidth) {
						self.updateSize();
					}
				}, 500);
			},
			scroll: _updatePageScrollOffset,
			keydown: _onKeyDown,
			click: _onGlobalClick
		};

		// disable show/hide effects on old browsers that don't support CSS animations or transforms, 
		// old IOS, Android and Opera mobile. Blackberry seems to work fine, even older models.
		var oldPhone = _features.isOldIOSPhone || _features.isOldAndroid || _features.isMobileOpera;
		if(!_features.animationName || !_features.transform || oldPhone) {
			_options.showAnimationDuration = _options.hideAnimationDuration = 0;
		}

		// init modules
		for(i = 0; i < _modules.length; i++) {
			self['init' + _modules[i]]();
		}
		
		// init
		if(UiClass) {
			var ui = self.ui = new UiClass(self, framework);
			ui.init();
		}

		_shout('firstUpdate');
		_currentItemIndex = _currentItemIndex || _options.index || 0;
		// validate index
		if( isNaN(_currentItemIndex) || _currentItemIndex < 0 || _currentItemIndex >= _getNumItems() ) {
			_currentItemIndex = 0;
		}
		self.currItem = _getItemAt( _currentItemIndex );

		
		if(_features.isOldIOSPhone || _features.isOldAndroid) {
			_isFixedPosition = false;
		}
		
		template.setAttribute('aria-hidden', 'false');
		if(_options.modal) {
			if(!_isFixedPosition) {
				template.style.position = 'absolute';
				template.style.top = framework.getScrollY() + 'px';
			} else {
				template.style.position = 'fixed';
			}
		}

		if(_currentWindowScrollY === undefined) {
			_shout('initialLayout');
			_currentWindowScrollY = _initalWindowScrollY = framework.getScrollY();
		}
		
		// add classes to root element of PhotoSwipe
		var rootClasses = 'pswp--open ';
		if(_options.mainClass) {
			rootClasses += _options.mainClass + ' ';
		}
		if(_options.showHideOpacity) {
			rootClasses += 'pswp--animate_opacity ';
		}
		rootClasses += _likelyTouchDevice ? 'pswp--touch' : 'pswp--notouch';
		rootClasses += _features.animationName ? ' pswp--css_animation' : '';
		rootClasses += _features.svg ? ' pswp--svg' : '';
		framework.addClass(template, rootClasses);

		self.updateSize();

		// initial update
		_containerShiftIndex = -1;
		_indexDiff = null;
		for(i = 0; i < NUM_HOLDERS; i++) {
			_setTranslateX( (i+_containerShiftIndex) * _slideSize.x, _itemHolders[i].el.style);
		}

		if(!_oldIE) {
			framework.bind(self.scrollWrap, _downEvents, self); // no dragging for old IE
		}	

		_listen('initialZoomInEnd', function() {
			self.setContent(_itemHolders[0], _currentItemIndex-1);
			self.setContent(_itemHolders[2], _currentItemIndex+1);

			_itemHolders[0].el.style.display = _itemHolders[2].el.style.display = 'block';

			if(_options.focus) {
				// focus causes layout, 
				// which causes lag during the animation, 
				// that's why we delay it untill the initial zoom transition ends
				template.focus();
			}
			 

			_bindEvents();
		});

		// set content for center slide (first time)
		self.setContent(_itemHolders[1], _currentItemIndex);
		
		self.updateCurrItem();

		_shout('afterInit');

		if(!_isFixedPosition) {

			// On all versions of iOS lower than 8.0, we check size of viewport every second.
			// 
			// This is done to detect when Safari top & bottom bars appear, 
			// as this action doesn't trigger any events (like resize). 
			// 
			// On iOS8 they fixed this.
			// 
			// 10 Nov 2014: iOS 7 usage ~40%. iOS 8 usage 56%.
			
			_updateSizeInterval = setInterval(function() {
				if(!_numAnimations && !_isDragging && !_isZooming && (_currZoomLevel === self.currItem.initialZoomLevel)  ) {
					self.updateSize();
				}
			}, 1000);
		}

		framework.addClass(template, 'pswp--visible');
	},

	// Close the gallery, then destroy it
	close: function() {
		if(!_isOpen) {
			return;
		}

		_isOpen = false;
		_isDestroying = true;
		_shout('close');
		_unbindEvents();

		_showOrHide(self.currItem, null, true, self.destroy);
	},

	// destroys the gallery (unbinds events, cleans up intervals and timeouts to avoid memory leaks)
	destroy: function() {
		_shout('destroy');

		if(_showOrHideTimeout) {
			clearTimeout(_showOrHideTimeout);
		}
		
		template.setAttribute('aria-hidden', 'true');
		template.className = _initalClassName;

		if(_updateSizeInterval) {
			clearInterval(_updateSizeInterval);
		}

		framework.unbind(self.scrollWrap, _downEvents, self);

		// we unbind scroll event at the end, as closing animation may depend on it
		framework.unbind(window, 'scroll', self);

		_stopDragUpdateLoop();

		_stopAllAnimations();

		_listeners = null;
	},

	/**
	 * Pan image to position
	 * @param {Number} x     
	 * @param {Number} y     
	 * @param {Boolean} force Will ignore bounds if set to true.
	 */
	panTo: function(x,y,force) {
		if(!force) {
			if(x > _currPanBounds.min.x) {
				x = _currPanBounds.min.x;
			} else if(x < _currPanBounds.max.x) {
				x = _currPanBounds.max.x;
			}

			if(y > _currPanBounds.min.y) {
				y = _currPanBounds.min.y;
			} else if(y < _currPanBounds.max.y) {
				y = _currPanBounds.max.y;
			}
		}
		
		_panOffset.x = x;
		_panOffset.y = y;
		_applyCurrentZoomPan();
	},
	
	handleEvent: function (e) {
		e = e || window.event;
		if(_globalEventHandlers[e.type]) {
			_globalEventHandlers[e.type](e);
		}
	},


	goTo: function(index) {

		index = _getLoopedId(index);

		var diff = index - _currentItemIndex;
		_indexDiff = diff;

		_currentItemIndex = index;
		self.currItem = _getItemAt( _currentItemIndex );
		_currPositionIndex -= diff;
		
		_moveMainScroll(_slideSize.x * _currPositionIndex);
		

		_stopAllAnimations();
		_mainScrollAnimating = false;

		self.updateCurrItem();
	},
	next: function() {
		self.goTo( _currentItemIndex + 1);
	},
	prev: function() {
		self.goTo( _currentItemIndex - 1);
	},

	// update current zoom/pan objects
	updateCurrZoomItem: function(emulateSetContent) {
		if(emulateSetContent) {
			_shout('beforeChange', 0);
		}

		// itemHolder[1] is middle (current) item
		if(_itemHolders[1].el.children.length) {
			var zoomElement = _itemHolders[1].el.children[0];
			if( framework.hasClass(zoomElement, 'pswp__zoom-wrap') ) {
				_currZoomElementStyle = zoomElement.style;
			} else {
				_currZoomElementStyle = null;
			}
		} else {
			_currZoomElementStyle = null;
		}
		
		_currPanBounds = self.currItem.bounds;	
		_startZoomLevel = _currZoomLevel = self.currItem.initialZoomLevel;

		_panOffset.x = _currPanBounds.center.x;
		_panOffset.y = _currPanBounds.center.y;

		if(emulateSetContent) {
			_shout('afterChange');
		}
	},


	invalidateCurrItems: function() {
		_itemsNeedUpdate = true;
		for(var i = 0; i < NUM_HOLDERS; i++) {
			if( _itemHolders[i].item ) {
				_itemHolders[i].item.needsUpdate = true;
			}
		}
	},

	updateCurrItem: function(beforeAnimation) {

		if(_indexDiff === 0) {
			return;
		}

		var diffAbs = Math.abs(_indexDiff),
			tempHolder;

		if(beforeAnimation && diffAbs < 2) {
			return;
		}


		self.currItem = _getItemAt( _currentItemIndex );
		_renderMaxResolution = false;
		
		_shout('beforeChange', _indexDiff);

		if(diffAbs >= NUM_HOLDERS) {
			_containerShiftIndex += _indexDiff + (_indexDiff > 0 ? -NUM_HOLDERS : NUM_HOLDERS);
			diffAbs = NUM_HOLDERS;
		}
		for(var i = 0; i < diffAbs; i++) {
			if(_indexDiff > 0) {
				tempHolder = _itemHolders.shift();
				_itemHolders[NUM_HOLDERS-1] = tempHolder; // move first to last

				_containerShiftIndex++;
				_setTranslateX( (_containerShiftIndex+2) * _slideSize.x, tempHolder.el.style);
				self.setContent(tempHolder, _currentItemIndex - diffAbs + i + 1 + 1);
			} else {
				tempHolder = _itemHolders.pop();
				_itemHolders.unshift( tempHolder ); // move last to first

				_containerShiftIndex--;
				_setTranslateX( _containerShiftIndex * _slideSize.x, tempHolder.el.style);
				self.setContent(tempHolder, _currentItemIndex + diffAbs - i - 1 - 1);
			}
			
		}

		// reset zoom/pan on previous item
		if(_currZoomElementStyle && Math.abs(_indexDiff) === 1) {

			var prevItem = _getItemAt(_prevItemIndex);
			if(prevItem.initialZoomLevel !== _currZoomLevel) {
				_calculateItemSize(prevItem , _viewportSize );
				_setImageSize(prevItem);
				_applyZoomPanToItem( prevItem ); 				
			}

		}

		// reset diff after update
		_indexDiff = 0;

		self.updateCurrZoomItem();

		_prevItemIndex = _currentItemIndex;

		_shout('afterChange');
		
	},



	updateSize: function(force) {
		
		if(!_isFixedPosition && _options.modal) {
			var windowScrollY = framework.getScrollY();
			if(_currentWindowScrollY !== windowScrollY) {
				template.style.top = windowScrollY + 'px';
				_currentWindowScrollY = windowScrollY;
			}
			if(!force && _windowVisibleSize.x === window.innerWidth && _windowVisibleSize.y === window.innerHeight) {
				return;
			}
			_windowVisibleSize.x = window.innerWidth;
			_windowVisibleSize.y = window.innerHeight;

			//template.style.width = _windowVisibleSize.x + 'px';
			template.style.height = _windowVisibleSize.y + 'px';
		}



		_viewportSize.x = self.scrollWrap.clientWidth;
		_viewportSize.y = self.scrollWrap.clientHeight;

		_updatePageScrollOffset();

		_slideSize.x = _viewportSize.x + Math.round(_viewportSize.x * _options.spacing);
		_slideSize.y = _viewportSize.y;

		_moveMainScroll(_slideSize.x * _currPositionIndex);

		_shout('beforeResize'); // even may be used for example to switch image sources


		// don't re-calculate size on inital size update
		if(_containerShiftIndex !== undefined) {

			var holder,
				item,
				hIndex;

			for(var i = 0; i < NUM_HOLDERS; i++) {
				holder = _itemHolders[i];
				_setTranslateX( (i+_containerShiftIndex) * _slideSize.x, holder.el.style);

				hIndex = _currentItemIndex+i-1;

				if(_options.loop && _getNumItems() > 2) {
					hIndex = _getLoopedId(hIndex);
				}

				// update zoom level on items and refresh source (if needsUpdate)
				item = _getItemAt( hIndex );

				// re-render gallery item if `needsUpdate`,
				// or doesn't have `bounds` (entirely new slide object)
				if( item && (_itemsNeedUpdate || item.needsUpdate || !item.bounds) ) {

					self.cleanSlide( item );
					
					self.setContent( holder, hIndex );

					// if "center" slide
					if(i === 1) {
						self.currItem = item;
						self.updateCurrZoomItem(true);
					}

					item.needsUpdate = false;

				} else if(holder.index === -1 && hIndex >= 0) {
					// add content first time
					self.setContent( holder, hIndex );
				}
				if(item && item.container) {
					_calculateItemSize(item, _viewportSize);
					_setImageSize(item);
					_applyZoomPanToItem( item );
				}
				
			}
			_itemsNeedUpdate = false;
		}	

		_startZoomLevel = _currZoomLevel = self.currItem.initialZoomLevel;
		_currPanBounds = self.currItem.bounds;

		if(_currPanBounds) {
			_panOffset.x = _currPanBounds.center.x;
			_panOffset.y = _currPanBounds.center.y;
			_applyCurrentZoomPan( true );
		}
		
		_shout('resize');
	},
	
	// Zoom current item to
	zoomTo: function(destZoomLevel, centerPoint, speed, easingFn, updateFn) {
		/*
			if(destZoomLevel === 'fit') {
				destZoomLevel = self.currItem.fitRatio;
			} else if(destZoomLevel === 'fill') {
				destZoomLevel = self.currItem.fillRatio;
			}
		*/

		if(centerPoint) {
			_startZoomLevel = _currZoomLevel;
			_midZoomPoint.x = Math.abs(centerPoint.x) - _panOffset.x ;
			_midZoomPoint.y = Math.abs(centerPoint.y) - _panOffset.y ;
			_equalizePoints(_startPanOffset, _panOffset);
		}

		var destPanBounds = _calculatePanBounds(destZoomLevel, false),
			destPanOffset = {};

		_modifyDestPanOffset('x', destPanBounds, destPanOffset, destZoomLevel);
		_modifyDestPanOffset('y', destPanBounds, destPanOffset, destZoomLevel);

		var initialZoomLevel = _currZoomLevel;
		var initialPanOffset = {
			x: _panOffset.x,
			y: _panOffset.y
		};

		_roundPoint(destPanOffset);

		var onUpdate = function(now) {
			if(now === 1) {
				_currZoomLevel = destZoomLevel;
				_panOffset.x = destPanOffset.x;
				_panOffset.y = destPanOffset.y;
			} else {
				_currZoomLevel = (destZoomLevel - initialZoomLevel) * now + initialZoomLevel;
				_panOffset.x = (destPanOffset.x - initialPanOffset.x) * now + initialPanOffset.x;
				_panOffset.y = (destPanOffset.y - initialPanOffset.y) * now + initialPanOffset.y;
			}

			if(updateFn) {
				updateFn(now);
			}

			_applyCurrentZoomPan( now === 1 );
		};

		if(speed) {
			_animateProp('customZoomTo', 0, 1, speed, easingFn || framework.easing.sine.inOut, onUpdate);
		} else {
			onUpdate(1);
		}
	}


};


/*>>core*/

/*>>gestures*/
/**
 * Mouse/touch/pointer event handlers.
 * 
 * separated from @core.js for readability
 */

var MIN_SWIPE_DISTANCE = 30,
	DIRECTION_CHECK_OFFSET = 10; // amount of pixels to drag to determine direction of swipe

var _gestureStartTime,
	_gestureCheckSpeedTime,

	// pool of objects that are used during dragging of zooming
	p = {}, // first point
	p2 = {}, // second point (for zoom gesture)
	delta = {},
	_currPoint = {},
	_startPoint = {},
	_currPointers = [],
	_startMainScrollPos = {},
	_releaseAnimData,
	_posPoints = [], // array of points during dragging, used to determine type of gesture
	_tempPoint = {},

	_isZoomingIn,
	_verticalDragInitiated,
	_oldAndroidTouchEndTimeout,
	_currZoomedItemIndex = 0,
	_centerPoint = _getEmptyPoint(),
	_lastReleaseTime = 0,
	_isDragging, // at least one pointer is down
	_isMultitouch, // at least two _pointers are down
	_zoomStarted, // zoom level changed during zoom gesture
	_moved,
	_dragAnimFrame,
	_mainScrollShifted,
	_currentPoints, // array of current touch points
	_isZooming,
	_currPointsDistance,
	_startPointsDistance,
	_currPanBounds,
	_mainScrollPos = _getEmptyPoint(),
	_currZoomElementStyle,
	_mainScrollAnimating, // true, if animation after swipe gesture is running
	_midZoomPoint = _getEmptyPoint(),
	_currCenterPoint = _getEmptyPoint(),
	_direction,
	_isFirstMove,
	_opacityChanged,
	_bgOpacity,
	_wasOverInitialZoom,

	_isEqualPoints = function(p1, p2) {
		return p1.x === p2.x && p1.y === p2.y;
	},
	_isNearbyPoints = function(touch0, touch1) {
		return Math.abs(touch0.x - touch1.x) < DOUBLE_TAP_RADIUS && Math.abs(touch0.y - touch1.y) < DOUBLE_TAP_RADIUS;
	},
	_calculatePointsDistance = function(p1, p2) {
		_tempPoint.x = Math.abs( p1.x - p2.x );
		_tempPoint.y = Math.abs( p1.y - p2.y );
		return Math.sqrt(_tempPoint.x * _tempPoint.x + _tempPoint.y * _tempPoint.y);
	},
	_stopDragUpdateLoop = function() {
		if(_dragAnimFrame) {
			_cancelAF(_dragAnimFrame);
			_dragAnimFrame = null;
		}
	},
	_dragUpdateLoop = function() {
		if(_isDragging) {
			_dragAnimFrame = _requestAF(_dragUpdateLoop);
			_renderMovement();
		}
	},
	_canPan = function() {
		return !(_options.scaleMode === 'fit' && _currZoomLevel ===  self.currItem.initialZoomLevel);
	},
	
	// find the closest parent DOM element
	_closestElement = function(el, fn) {
	  	if(!el || el === document) {
	  		return false;
	  	}

	  	// don't search elements above pswp__scroll-wrap
	  	if(el.getAttribute('class') && el.getAttribute('class').indexOf('pswp__scroll-wrap') > -1 ) {
	  		return false;
	  	}

	  	if( fn(el) ) {
	  		return el;
	  	}

	  	return _closestElement(el.parentNode, fn);
	},

	_preventObj = {},
	_preventDefaultEventBehaviour = function(e, isDown) {
	    _preventObj.prevent = !_closestElement(e.target, _options.isClickableElement);

		_shout('preventDragEvent', e, isDown, _preventObj);
		return _preventObj.prevent;

	},
	_convertTouchToPoint = function(touch, p) {
		p.x = touch.pageX;
		p.y = touch.pageY;
		p.id = touch.identifier;
		return p;
	},
	_findCenterOfPoints = function(p1, p2, pCenter) {
		pCenter.x = (p1.x + p2.x) * 0.5;
		pCenter.y = (p1.y + p2.y) * 0.5;
	},
	_pushPosPoint = function(time, x, y) {
		if(time - _gestureCheckSpeedTime > 50) {
			var o = _posPoints.length > 2 ? _posPoints.shift() : {};
			o.x = x;
			o.y = y; 
			_posPoints.push(o);
			_gestureCheckSpeedTime = time;
		}
	},

	_calculateVerticalDragOpacityRatio = function() {
		var yOffset = _panOffset.y - self.currItem.initialPosition.y; // difference between initial and current position
		return 1 -  Math.abs( yOffset / (_viewportSize.y / 2)  );
	},

	
	// points pool, reused during touch events
	_ePoint1 = {},
	_ePoint2 = {},
	_tempPointsArr = [],
	_tempCounter,
	_getTouchPoints = function(e) {
		// clean up previous points, without recreating array
		while(_tempPointsArr.length > 0) {
			_tempPointsArr.pop();
		}

		if(!_pointerEventEnabled) {
			if(e.type.indexOf('touch') > -1) {

				if(e.touches && e.touches.length > 0) {
					_tempPointsArr[0] = _convertTouchToPoint(e.touches[0], _ePoint1);
					if(e.touches.length > 1) {
						_tempPointsArr[1] = _convertTouchToPoint(e.touches[1], _ePoint2);
					}
				}
				
			} else {
				_ePoint1.x = e.pageX;
				_ePoint1.y = e.pageY;
				_ePoint1.id = '';
				_tempPointsArr[0] = _ePoint1;//_ePoint1;
			}
		} else {
			_tempCounter = 0;
			// we can use forEach, as pointer events are supported only in modern browsers
			_currPointers.forEach(function(p) {
				if(_tempCounter === 0) {
					_tempPointsArr[0] = p;
				} else if(_tempCounter === 1) {
					_tempPointsArr[1] = p;
				}
				_tempCounter++;

			});
		}
		return _tempPointsArr;
	},

	_panOrMoveMainScroll = function(axis, delta) {

		var panFriction,
			overDiff = 0,
			newOffset = _panOffset[axis] + delta[axis],
			startOverDiff,
			dir = delta[axis] > 0,
			newMainScrollPosition = _mainScrollPos.x + delta.x,
			mainScrollDiff = _mainScrollPos.x - _startMainScrollPos.x,
			newPanPos,
			newMainScrollPos;

		// calculate fdistance over the bounds and friction
		if(newOffset > _currPanBounds.min[axis] || newOffset < _currPanBounds.max[axis]) {
			panFriction = _options.panEndFriction;
			// Linear increasing of friction, so at 1/4 of viewport it's at max value. 
			// Looks not as nice as was expected. Left for history.
			// panFriction = (1 - (_panOffset[axis] + delta[axis] + panBounds.min[axis]) / (_viewportSize[axis] / 4) );
		} else {
			panFriction = 1;
		}
		
		newOffset = _panOffset[axis] + delta[axis] * panFriction;

		// move main scroll or start panning
		if(_options.allowPanToNext || _currZoomLevel === self.currItem.initialZoomLevel) {


			if(!_currZoomElementStyle) {
				
				newMainScrollPos = newMainScrollPosition;

			} else if(_direction === 'h' && axis === 'x' && !_zoomStarted ) {
				
				if(dir) {
					if(newOffset > _currPanBounds.min[axis]) {
						panFriction = _options.panEndFriction;
						overDiff = _currPanBounds.min[axis] - newOffset;
						startOverDiff = _currPanBounds.min[axis] - _startPanOffset[axis];
					}
					
					// drag right
					if( (startOverDiff <= 0 || mainScrollDiff < 0) && _getNumItems() > 1 ) {
						newMainScrollPos = newMainScrollPosition;
						if(mainScrollDiff < 0 && newMainScrollPosition > _startMainScrollPos.x) {
							newMainScrollPos = _startMainScrollPos.x;
						}
					} else {
						if(_currPanBounds.min.x !== _currPanBounds.max.x) {
							newPanPos = newOffset;
						}
						
					}

				} else {

					if(newOffset < _currPanBounds.max[axis] ) {
						panFriction =_options.panEndFriction;
						overDiff = newOffset - _currPanBounds.max[axis];
						startOverDiff = _startPanOffset[axis] - _currPanBounds.max[axis];
					}

					if( (startOverDiff <= 0 || mainScrollDiff > 0) && _getNumItems() > 1 ) {
						newMainScrollPos = newMainScrollPosition;

						if(mainScrollDiff > 0 && newMainScrollPosition < _startMainScrollPos.x) {
							newMainScrollPos = _startMainScrollPos.x;
						}

					} else {
						if(_currPanBounds.min.x !== _currPanBounds.max.x) {
							newPanPos = newOffset;
						}
					}

				}


				//
			}

			if(axis === 'x') {

				if(newMainScrollPos !== undefined) {
					_moveMainScroll(newMainScrollPos, true);
					if(newMainScrollPos === _startMainScrollPos.x) {
						_mainScrollShifted = false;
					} else {
						_mainScrollShifted = true;
					}
				}

				if(_currPanBounds.min.x !== _currPanBounds.max.x) {
					if(newPanPos !== undefined) {
						_panOffset.x = newPanPos;
					} else if(!_mainScrollShifted) {
						_panOffset.x += delta.x * panFriction;
					}
				}

				return newMainScrollPos !== undefined;
			}

		}

		if(!_mainScrollAnimating) {
			
			if(!_mainScrollShifted) {
				if(_currZoomLevel > self.currItem.fitRatio) {
					_panOffset[axis] += delta[axis] * panFriction;
				
				}
			}

			
		}
		
	},

	// Pointerdown/touchstart/mousedown handler
	_onDragStart = function(e) {

		// Allow dragging only via left mouse button.
		// As this handler is not added in IE8 - we ignore e.which
		// 
		// http://www.quirksmode.org/js/events_properties.html
		// https://developer.mozilla.org/en-US/docs/Web/API/event.button
		if(e.type === 'mousedown' && e.button > 0  ) {
			return;
		}

		if(_initialZoomRunning) {
			e.preventDefault();
			return;
		}

		if(_oldAndroidTouchEndTimeout && e.type === 'mousedown') {
			return;
		}

		if(_preventDefaultEventBehaviour(e, true)) {
			e.preventDefault();
		}



		_shout('pointerDown');

		if(_pointerEventEnabled) {
			var pointerIndex = framework.arraySearch(_currPointers, e.pointerId, 'id');
			if(pointerIndex < 0) {
				pointerIndex = _currPointers.length;
			}
			_currPointers[pointerIndex] = {x:e.pageX, y:e.pageY, id: e.pointerId};
		}
		


		var startPointsList = _getTouchPoints(e),
			numPoints = startPointsList.length;

		_currentPoints = null;

		_stopAllAnimations();

		// init drag
		if(!_isDragging || numPoints === 1) {

			

			_isDragging = _isFirstMove = true;
			framework.bind(window, _upMoveEvents, self);

			_isZoomingIn = 
				_wasOverInitialZoom = 
				_opacityChanged = 
				_verticalDragInitiated = 
				_mainScrollShifted = 
				_moved = 
				_isMultitouch = 
				_zoomStarted = false;

			_direction = null;

			_shout('firstTouchStart', startPointsList);

			_equalizePoints(_startPanOffset, _panOffset);

			_currPanDist.x = _currPanDist.y = 0;
			_equalizePoints(_currPoint, startPointsList[0]);
			_equalizePoints(_startPoint, _currPoint);

			//_equalizePoints(_startMainScrollPos, _mainScrollPos);
			_startMainScrollPos.x = _slideSize.x * _currPositionIndex;

			_posPoints = [{
				x: _currPoint.x,
				y: _currPoint.y
			}];

			_gestureCheckSpeedTime = _gestureStartTime = _getCurrentTime();

			//_mainScrollAnimationEnd(true);
			_calculatePanBounds( _currZoomLevel, true );
			
			// Start rendering
			_stopDragUpdateLoop();
			_dragUpdateLoop();
			
		}

		// init zoom
		if(!_isZooming && numPoints > 1 && !_mainScrollAnimating && !_mainScrollShifted) {
			_startZoomLevel = _currZoomLevel;
			_zoomStarted = false; // true if zoom changed at least once

			_isZooming = _isMultitouch = true;
			_currPanDist.y = _currPanDist.x = 0;

			_equalizePoints(_startPanOffset, _panOffset);

			_equalizePoints(p, startPointsList[0]);
			_equalizePoints(p2, startPointsList[1]);

			_findCenterOfPoints(p, p2, _currCenterPoint);

			_midZoomPoint.x = Math.abs(_currCenterPoint.x) - _panOffset.x;
			_midZoomPoint.y = Math.abs(_currCenterPoint.y) - _panOffset.y;
			_currPointsDistance = _startPointsDistance = _calculatePointsDistance(p, p2);
		}


	},

	// Pointermove/touchmove/mousemove handler
	_onDragMove = function(e) {

		e.preventDefault();

		if(_pointerEventEnabled) {
			var pointerIndex = framework.arraySearch(_currPointers, e.pointerId, 'id');
			if(pointerIndex > -1) {
				var p = _currPointers[pointerIndex];
				p.x = e.pageX;
				p.y = e.pageY; 
			}
		}

		if(_isDragging) {
			var touchesList = _getTouchPoints(e);
			if(!_direction && !_moved && !_isZooming) {

				if(_mainScrollPos.x !== _slideSize.x * _currPositionIndex) {
					// if main scroll position is shifted – direction is always horizontal
					_direction = 'h';
				} else {
					var diff = Math.abs(touchesList[0].x - _currPoint.x) - Math.abs(touchesList[0].y - _currPoint.y);
					// check the direction of movement
					if(Math.abs(diff) >= DIRECTION_CHECK_OFFSET) {
						_direction = diff > 0 ? 'h' : 'v';
						_currentPoints = touchesList;
					}
				}
				
			} else {
				_currentPoints = touchesList;
			}
		}	
	},
	// 
	_renderMovement =  function() {

		if(!_currentPoints) {
			return;
		}

		var numPoints = _currentPoints.length;

		if(numPoints === 0) {
			return;
		}

		_equalizePoints(p, _currentPoints[0]);

		delta.x = p.x - _currPoint.x;
		delta.y = p.y - _currPoint.y;

		if(_isZooming && numPoints > 1) {
			// Handle behaviour for more than 1 point

			_currPoint.x = p.x;
			_currPoint.y = p.y;
		
			// check if one of two points changed
			if( !delta.x && !delta.y && _isEqualPoints(_currentPoints[1], p2) ) {
				return;
			}

			_equalizePoints(p2, _currentPoints[1]);


			if(!_zoomStarted) {
				_zoomStarted = true;
				_shout('zoomGestureStarted');
			}
			
			// Distance between two points
			var pointsDistance = _calculatePointsDistance(p,p2);

			var zoomLevel = _calculateZoomLevel(pointsDistance);

			// slightly over the of initial zoom level
			if(zoomLevel > self.currItem.initialZoomLevel + self.currItem.initialZoomLevel / 15) {
				_wasOverInitialZoom = true;
			}

			// Apply the friction if zoom level is out of the bounds
			var zoomFriction = 1,
				minZoomLevel = _getMinZoomLevel(),
				maxZoomLevel = _getMaxZoomLevel();

			if ( zoomLevel < minZoomLevel ) {
				
				if(_options.pinchToClose && !_wasOverInitialZoom && _startZoomLevel <= self.currItem.initialZoomLevel) {
					// fade out background if zooming out
					var minusDiff = minZoomLevel - zoomLevel;
					var percent = 1 - minusDiff / (minZoomLevel / 1.2);

					_applyBgOpacity(percent);
					_shout('onPinchClose', percent);
					_opacityChanged = true;
				} else {
					zoomFriction = (minZoomLevel - zoomLevel) / minZoomLevel;
					if(zoomFriction > 1) {
						zoomFriction = 1;
					}
					zoomLevel = minZoomLevel - zoomFriction * (minZoomLevel / 3);
				}
				
			} else if ( zoomLevel > maxZoomLevel ) {
				// 1.5 - extra zoom level above the max. E.g. if max is x6, real max 6 + 1.5 = 7.5
				zoomFriction = (zoomLevel - maxZoomLevel) / ( minZoomLevel * 6 );
				if(zoomFriction > 1) {
					zoomFriction = 1;
				}
				zoomLevel = maxZoomLevel + zoomFriction * minZoomLevel;
			}

			if(zoomFriction < 0) {
				zoomFriction = 0;
			}

			// distance between touch points after friction is applied
			_currPointsDistance = pointsDistance;

			// _centerPoint - The point in the middle of two pointers
			_findCenterOfPoints(p, p2, _centerPoint);
		
			// paning with two pointers pressed
			_currPanDist.x += _centerPoint.x - _currCenterPoint.x;
			_currPanDist.y += _centerPoint.y - _currCenterPoint.y;
			_equalizePoints(_currCenterPoint, _centerPoint);

			_panOffset.x = _calculatePanOffset('x', zoomLevel);
			_panOffset.y = _calculatePanOffset('y', zoomLevel);

			_isZoomingIn = zoomLevel > _currZoomLevel;
			_currZoomLevel = zoomLevel;
			_applyCurrentZoomPan();

		} else {

			// handle behaviour for one point (dragging or panning)

			if(!_direction) {
				return;
			}

			if(_isFirstMove) {
				_isFirstMove = false;

				// subtract drag distance that was used during the detection direction  

				if( Math.abs(delta.x) >= DIRECTION_CHECK_OFFSET) {
					delta.x -= _currentPoints[0].x - _startPoint.x;
				}
				
				if( Math.abs(delta.y) >= DIRECTION_CHECK_OFFSET) {
					delta.y -= _currentPoints[0].y - _startPoint.y;
				}
			}

			_currPoint.x = p.x;
			_currPoint.y = p.y;

			// do nothing if pointers position hasn't changed
			if(delta.x === 0 && delta.y === 0) {
				return;
			}

			if(_direction === 'v' && _options.closeOnVerticalDrag) {
				if(!_canPan()) {
					_currPanDist.y += delta.y;
					_panOffset.y += delta.y;

					var opacityRatio = _calculateVerticalDragOpacityRatio();

					_verticalDragInitiated = true;
					_shout('onVerticalDrag', opacityRatio);

					_applyBgOpacity(opacityRatio);
					_applyCurrentZoomPan();
					return ;
				}
			}

			_pushPosPoint(_getCurrentTime(), p.x, p.y);

			_moved = true;
			_currPanBounds = self.currItem.bounds;
			
			var mainScrollChanged = _panOrMoveMainScroll('x', delta);
			if(!mainScrollChanged) {
				_panOrMoveMainScroll('y', delta);

				_roundPoint(_panOffset);
				_applyCurrentZoomPan();
			}

		}

	},
	
	// Pointerup/pointercancel/touchend/touchcancel/mouseup event handler
	_onDragRelease = function(e) {

		if(_features.isOldAndroid ) {

			if(_oldAndroidTouchEndTimeout && e.type === 'mouseup') {
				return;
			}

			// on Android (v4.1, 4.2, 4.3 & possibly older) 
			// ghost mousedown/up event isn't preventable via e.preventDefault,
			// which causes fake mousedown event
			// so we block mousedown/up for 600ms
			if( e.type.indexOf('touch') > -1 ) {
				clearTimeout(_oldAndroidTouchEndTimeout);
				_oldAndroidTouchEndTimeout = setTimeout(function() {
					_oldAndroidTouchEndTimeout = 0;
				}, 600);
			}
			
		}

		_shout('pointerUp');

		if(_preventDefaultEventBehaviour(e, false)) {
			e.preventDefault();
		}

		var releasePoint;

		if(_pointerEventEnabled) {
			var pointerIndex = framework.arraySearch(_currPointers, e.pointerId, 'id');
			
			if(pointerIndex > -1) {
				releasePoint = _currPointers.splice(pointerIndex, 1)[0];

				if(navigator.msPointerEnabled) {
					var MSPOINTER_TYPES = {
						4: 'mouse', // event.MSPOINTER_TYPE_MOUSE
						2: 'touch', // event.MSPOINTER_TYPE_TOUCH 
						3: 'pen' // event.MSPOINTER_TYPE_PEN
					};
					releasePoint.type = MSPOINTER_TYPES[e.pointerType];

					if(!releasePoint.type) {
						releasePoint.type = e.pointerType || 'mouse';
					}
				} else {
					releasePoint.type = e.pointerType || 'mouse';
				}

			}
		}

		var touchList = _getTouchPoints(e),
			gestureType,
			numPoints = touchList.length;

		if(e.type === 'mouseup') {
			numPoints = 0;
		}

		// Do nothing if there were 3 touch points or more
		if(numPoints === 2) {
			_currentPoints = null;
			return true;
		}

		// if second pointer released
		if(numPoints === 1) {
			_equalizePoints(_startPoint, touchList[0]);
		}				


		// pointer hasn't moved, send "tap release" point
		if(numPoints === 0 && !_direction && !_mainScrollAnimating) {
			if(!releasePoint) {
				if(e.type === 'mouseup') {
					releasePoint = {x: e.pageX, y: e.pageY, type:'mouse'};
				} else if(e.changedTouches && e.changedTouches[0]) {
					releasePoint = {x: e.changedTouches[0].pageX, y: e.changedTouches[0].pageY, type:'touch'};
				}		
			}

			_shout('touchRelease', e, releasePoint);
		}

		// Difference in time between releasing of two last touch points (zoom gesture)
		var releaseTimeDiff = -1;

		// Gesture completed, no pointers left
		if(numPoints === 0) {
			_isDragging = false;
			framework.unbind(window, _upMoveEvents, self);

			_stopDragUpdateLoop();

			if(_isZooming) {
				// Two points released at the same time
				releaseTimeDiff = 0;
			} else if(_lastReleaseTime !== -1) {
				releaseTimeDiff = _getCurrentTime() - _lastReleaseTime;
			}
		}
		_lastReleaseTime = numPoints === 1 ? _getCurrentTime() : -1;
		
		if(releaseTimeDiff !== -1 && releaseTimeDiff < 150) {
			gestureType = 'zoom';
		} else {
			gestureType = 'swipe';
		}

		if(_isZooming && numPoints < 2) {
			_isZooming = false;

			// Only second point released
			if(numPoints === 1) {
				gestureType = 'zoomPointerUp';
			}
			_shout('zoomGestureEnded');
		}

		_currentPoints = null;
		if(!_moved && !_zoomStarted && !_mainScrollAnimating && !_verticalDragInitiated) {
			// nothing to animate
			return;
		}
	
		_stopAllAnimations();

		
		if(!_releaseAnimData) {
			_releaseAnimData = _initDragReleaseAnimationData();
		}
		
		_releaseAnimData.calculateSwipeSpeed('x');


		if(_verticalDragInitiated) {

			var opacityRatio = _calculateVerticalDragOpacityRatio();

			if(opacityRatio < _options.verticalDragRange) {
				self.close();
			} else {
				var initalPanY = _panOffset.y,
					initialBgOpacity = _bgOpacity;

				_animateProp('verticalDrag', 0, 1, 300, framework.easing.cubic.out, function(now) {
					
					_panOffset.y = (self.currItem.initialPosition.y - initalPanY) * now + initalPanY;

					_applyBgOpacity(  (1 - initialBgOpacity) * now + initialBgOpacity );
					_applyCurrentZoomPan();
				});

				_shout('onVerticalDrag', 1);
			}

			return;
		}


		// main scroll 
		if(  (_mainScrollShifted || _mainScrollAnimating) && numPoints === 0) {
			var itemChanged = _finishSwipeMainScrollGesture(gestureType, _releaseAnimData);
			if(itemChanged) {
				return;
			}
			gestureType = 'zoomPointerUp';
		}

		// prevent zoom/pan animation when main scroll animation runs
		if(_mainScrollAnimating) {
			return;
		}
		
		// Complete simple zoom gesture (reset zoom level if it's out of the bounds)  
		if(gestureType !== 'swipe') {
			_completeZoomGesture();
			return;
		}
	
		// Complete pan gesture if main scroll is not shifted, and it's possible to pan current image
		if(!_mainScrollShifted && _currZoomLevel > self.currItem.fitRatio) {
			_completePanGesture(_releaseAnimData);
		}
	},


	// Returns object with data about gesture
	// It's created only once and then reused
	_initDragReleaseAnimationData  = function() {
		// temp local vars
		var lastFlickDuration,
			tempReleasePos;

		// s = this
		var s = {
			lastFlickOffset: {},
			lastFlickDist: {},
			lastFlickSpeed: {},
			slowDownRatio:  {},
			slowDownRatioReverse:  {},
			speedDecelerationRatio:  {},
			speedDecelerationRatioAbs:  {},
			distanceOffset:  {},
			backAnimDestination: {},
			backAnimStarted: {},
			calculateSwipeSpeed: function(axis) {
				

				if( _posPoints.length > 1) {
					lastFlickDuration = _getCurrentTime() - _gestureCheckSpeedTime + 50;
					tempReleasePos = _posPoints[_posPoints.length-2][axis];
				} else {
					lastFlickDuration = _getCurrentTime() - _gestureStartTime; // total gesture duration
					tempReleasePos = _startPoint[axis];
				}
				s.lastFlickOffset[axis] = _currPoint[axis] - tempReleasePos;
				s.lastFlickDist[axis] = Math.abs(s.lastFlickOffset[axis]);
				if(s.lastFlickDist[axis] > 20) {
					s.lastFlickSpeed[axis] = s.lastFlickOffset[axis] / lastFlickDuration;
				} else {
					s.lastFlickSpeed[axis] = 0;
				}
				if( Math.abs(s.lastFlickSpeed[axis]) < 0.1 ) {
					s.lastFlickSpeed[axis] = 0;
				}
				
				s.slowDownRatio[axis] = 0.95;
				s.slowDownRatioReverse[axis] = 1 - s.slowDownRatio[axis];
				s.speedDecelerationRatio[axis] = 1;
			},

			calculateOverBoundsAnimOffset: function(axis, speed) {
				if(!s.backAnimStarted[axis]) {

					if(_panOffset[axis] > _currPanBounds.min[axis]) {
						s.backAnimDestination[axis] = _currPanBounds.min[axis];
						
					} else if(_panOffset[axis] < _currPanBounds.max[axis]) {
						s.backAnimDestination[axis] = _currPanBounds.max[axis];
					}

					if(s.backAnimDestination[axis] !== undefined) {
						s.slowDownRatio[axis] = 0.7;
						s.slowDownRatioReverse[axis] = 1 - s.slowDownRatio[axis];
						if(s.speedDecelerationRatioAbs[axis] < 0.05) {

							s.lastFlickSpeed[axis] = 0;
							s.backAnimStarted[axis] = true;

							_animateProp('bounceZoomPan'+axis,_panOffset[axis], 
								s.backAnimDestination[axis], 
								speed || 300, 
								framework.easing.sine.out, 
								function(pos) {
									_panOffset[axis] = pos;
									_applyCurrentZoomPan();
								}
							);

						}
					}
				}
			},

			// Reduces the speed by slowDownRatio (per 10ms)
			calculateAnimOffset: function(axis) {
				if(!s.backAnimStarted[axis]) {
					s.speedDecelerationRatio[axis] = s.speedDecelerationRatio[axis] * (s.slowDownRatio[axis] + 
												s.slowDownRatioReverse[axis] - 
												s.slowDownRatioReverse[axis] * s.timeDiff / 10);

					s.speedDecelerationRatioAbs[axis] = Math.abs(s.lastFlickSpeed[axis] * s.speedDecelerationRatio[axis]);
					s.distanceOffset[axis] = s.lastFlickSpeed[axis] * s.speedDecelerationRatio[axis] * s.timeDiff;
					_panOffset[axis] += s.distanceOffset[axis];

				}
			},

			panAnimLoop: function() {
				if ( _animations.zoomPan ) {
					_animations.zoomPan.raf = _requestAF(s.panAnimLoop);

					s.now = _getCurrentTime();
					s.timeDiff = s.now - s.lastNow;
					s.lastNow = s.now;
					
					s.calculateAnimOffset('x');
					s.calculateAnimOffset('y');

					_applyCurrentZoomPan();
					
					s.calculateOverBoundsAnimOffset('x');
					s.calculateOverBoundsAnimOffset('y');


					if (s.speedDecelerationRatioAbs.x < 0.05 && s.speedDecelerationRatioAbs.y < 0.05) {

						// round pan position
						_panOffset.x = Math.round(_panOffset.x);
						_panOffset.y = Math.round(_panOffset.y);
						_applyCurrentZoomPan();
						
						_stopAnimation('zoomPan');
						return;
					}
				}

			}
		};
		return s;
	},

	_completePanGesture = function(animData) {
		// calculate swipe speed for Y axis (paanning)
		animData.calculateSwipeSpeed('y');

		_currPanBounds = self.currItem.bounds;
		
		animData.backAnimDestination = {};
		animData.backAnimStarted = {};

		// Avoid acceleration animation if speed is too low
		if(Math.abs(animData.lastFlickSpeed.x) <= 0.05 && Math.abs(animData.lastFlickSpeed.y) <= 0.05 ) {
			animData.speedDecelerationRatioAbs.x = animData.speedDecelerationRatioAbs.y = 0;

			// Run pan drag release animation. E.g. if you drag image and release finger without momentum.
			animData.calculateOverBoundsAnimOffset('x');
			animData.calculateOverBoundsAnimOffset('y');
			return true;
		}

		// Animation loop that controls the acceleration after pan gesture ends
		_registerStartAnimation('zoomPan');
		animData.lastNow = _getCurrentTime();
		animData.panAnimLoop();
	},


	_finishSwipeMainScrollGesture = function(gestureType, _releaseAnimData) {
		var itemChanged;
		if(!_mainScrollAnimating) {
			_currZoomedItemIndex = _currentItemIndex;
		}


		
		var itemsDiff;

		if(gestureType === 'swipe') {
			var totalShiftDist = _currPoint.x - _startPoint.x,
				isFastLastFlick = _releaseAnimData.lastFlickDist.x < 10;

			// if container is shifted for more than MIN_SWIPE_DISTANCE, 
			// and last flick gesture was in right direction
			if(totalShiftDist > MIN_SWIPE_DISTANCE && 
				(isFastLastFlick || _releaseAnimData.lastFlickOffset.x > 20) ) {
				// go to prev item
				itemsDiff = -1;
			} else if(totalShiftDist < -MIN_SWIPE_DISTANCE && 
				(isFastLastFlick || _releaseAnimData.lastFlickOffset.x < -20) ) {
				// go to next item
				itemsDiff = 1;
			}
		}

		var nextCircle;

		if(itemsDiff) {
			
			_currentItemIndex += itemsDiff;

			if(_currentItemIndex < 0) {
				_currentItemIndex = _options.loop ? _getNumItems()-1 : 0;
				nextCircle = true;
			} else if(_currentItemIndex >= _getNumItems()) {
				_currentItemIndex = _options.loop ? 0 : _getNumItems()-1;
				nextCircle = true;
			}

			if(!nextCircle || _options.loop) {
				_indexDiff += itemsDiff;
				_currPositionIndex -= itemsDiff;
				itemChanged = true;
			}
			

			
		}

		var animateToX = _slideSize.x * _currPositionIndex;
		var animateToDist = Math.abs( animateToX - _mainScrollPos.x );
		var finishAnimDuration;


		if(!itemChanged && animateToX > _mainScrollPos.x !== _releaseAnimData.lastFlickSpeed.x > 0) {
			// "return to current" duration, e.g. when dragging from slide 0 to -1
			finishAnimDuration = 333; 
		} else {
			finishAnimDuration = Math.abs(_releaseAnimData.lastFlickSpeed.x) > 0 ? 
									animateToDist / Math.abs(_releaseAnimData.lastFlickSpeed.x) : 
									333;

			finishAnimDuration = Math.min(finishAnimDuration, 400);
			finishAnimDuration = Math.max(finishAnimDuration, 250);
		}

		if(_currZoomedItemIndex === _currentItemIndex) {
			itemChanged = false;
		}
		
		_mainScrollAnimating = true;
		
		_shout('mainScrollAnimStart');

		_animateProp('mainScroll', _mainScrollPos.x, animateToX, finishAnimDuration, framework.easing.cubic.out, 
			_moveMainScroll,
			function() {
				_stopAllAnimations();
				_mainScrollAnimating = false;
				_currZoomedItemIndex = -1;
				
				if(itemChanged || _currZoomedItemIndex !== _currentItemIndex) {
					self.updateCurrItem();
				}
				
				_shout('mainScrollAnimComplete');
			}
		);

		if(itemChanged) {
			self.updateCurrItem(true);
		}

		return itemChanged;
	},

	_calculateZoomLevel = function(touchesDistance) {
		return  1 / _startPointsDistance * touchesDistance * _startZoomLevel;
	},

	// Resets zoom if it's out of bounds
	_completeZoomGesture = function() {
		var destZoomLevel = _currZoomLevel,
			minZoomLevel = _getMinZoomLevel(),
			maxZoomLevel = _getMaxZoomLevel();

		if ( _currZoomLevel < minZoomLevel ) {
			destZoomLevel = minZoomLevel;
		} else if ( _currZoomLevel > maxZoomLevel ) {
			destZoomLevel = maxZoomLevel;
		}

		var destOpacity = 1,
			onUpdate,
			initialOpacity = _bgOpacity;

		if(_opacityChanged && !_isZoomingIn && !_wasOverInitialZoom && _currZoomLevel < minZoomLevel) {
			//_closedByScroll = true;
			self.close();
			return true;
		}

		if(_opacityChanged) {
			onUpdate = function(now) {
				_applyBgOpacity(  (destOpacity - initialOpacity) * now + initialOpacity );
			};
		}

		self.zoomTo(destZoomLevel, 0, 200,  framework.easing.cubic.out, onUpdate);
		return true;
	};


_registerModule('Gestures', {
	publicMethods: {

		initGestures: function() {

			// helper function that builds touch/pointer/mouse events
			var addEventNames = function(pref, down, move, up, cancel) {
				_dragStartEvent = pref + down;
				_dragMoveEvent = pref + move;
				_dragEndEvent = pref + up;
				if(cancel) {
					_dragCancelEvent = pref + cancel;
				} else {
					_dragCancelEvent = '';
				}
			};

			_pointerEventEnabled = _features.pointerEvent;
			if(_pointerEventEnabled && _features.touch) {
				// we don't need touch events, if browser supports pointer events
				_features.touch = false;
			}

			if(_pointerEventEnabled) {
				if(navigator.msPointerEnabled) {
					// IE10 pointer events are case-sensitive
					addEventNames('MSPointer', 'Down', 'Move', 'Up', 'Cancel');
				} else {
					addEventNames('pointer', 'down', 'move', 'up', 'cancel');
				}
			} else if(_features.touch) {
				addEventNames('touch', 'start', 'move', 'end', 'cancel');
				_likelyTouchDevice = true;
			} else {
				addEventNames('mouse', 'down', 'move', 'up');	
			}

			_upMoveEvents = _dragMoveEvent + ' ' + _dragEndEvent  + ' ' +  _dragCancelEvent;
			_downEvents = _dragStartEvent;

			if(_pointerEventEnabled && !_likelyTouchDevice) {
				_likelyTouchDevice = (navigator.maxTouchPoints > 1) || (navigator.msMaxTouchPoints > 1);
			}
			// make variable public
			self.likelyTouchDevice = _likelyTouchDevice; 
			
			_globalEventHandlers[_dragStartEvent] = _onDragStart;
			_globalEventHandlers[_dragMoveEvent] = _onDragMove;
			_globalEventHandlers[_dragEndEvent] = _onDragRelease; // the Kraken

			if(_dragCancelEvent) {
				_globalEventHandlers[_dragCancelEvent] = _globalEventHandlers[_dragEndEvent];
			}

			// Bind mouse events on device with detected hardware touch support, in case it supports multiple types of input.
			if(_features.touch) {
				_downEvents += ' mousedown';
				_upMoveEvents += ' mousemove mouseup';
				_globalEventHandlers.mousedown = _globalEventHandlers[_dragStartEvent];
				_globalEventHandlers.mousemove = _globalEventHandlers[_dragMoveEvent];
				_globalEventHandlers.mouseup = _globalEventHandlers[_dragEndEvent];
			}

			if(!_likelyTouchDevice) {
				// don't allow pan to next slide from zoomed state on Desktop
				_options.allowPanToNext = false;
			}
		}

	}
});


/*>>gestures*/

/*>>show-hide-transition*/
/**
 * show-hide-transition.js:
 *
 * Manages initial opening or closing transition.
 *
 * If you're not planning to use transition for gallery at all,
 * you may set options hideAnimationDuration and showAnimationDuration to 0,
 * and just delete startAnimation function.
 * 
 */


var _showOrHideTimeout,
	_showOrHide = function(item, img, out, completeFn) {

		if(_showOrHideTimeout) {
			clearTimeout(_showOrHideTimeout);
		}

		_initialZoomRunning = true;
		_initialContentSet = true;
		
		// dimensions of small thumbnail {x:,y:,w:}.
		// Height is optional, as calculated based on large image.
		var thumbBounds; 
		if(item.initialLayout) {
			thumbBounds = item.initialLayout;
			item.initialLayout = null;
		} else {
			thumbBounds = _options.getThumbBoundsFn && _options.getThumbBoundsFn(_currentItemIndex);
		}

		var duration = out ? _options.hideAnimationDuration : _options.showAnimationDuration;

		var onComplete = function() {
			_stopAnimation('initialZoom');
			if(!out) {
				_applyBgOpacity(1);
				if(img) {
					img.style.display = 'block';
				}
				framework.addClass(template, 'pswp--animated-in');
				_shout('initialZoom' + (out ? 'OutEnd' : 'InEnd'));
			} else {
				self.template.removeAttribute('style');
				self.bg.removeAttribute('style');
			}

			if(completeFn) {
				completeFn();
			}
			_initialZoomRunning = false;
		};

		// if bounds aren't provided, just open gallery without animation
		if(!duration || !thumbBounds || thumbBounds.x === undefined) {

			_shout('initialZoom' + (out ? 'Out' : 'In') );

			_currZoomLevel = item.initialZoomLevel;
			_equalizePoints(_panOffset,  item.initialPosition );
			_applyCurrentZoomPan();

			template.style.opacity = out ? 0 : 1;
			_applyBgOpacity(1);

			if(duration) {
				setTimeout(function() {
					onComplete();
				}, duration);
			} else {
				onComplete();
			}

			return;
		}

		var startAnimation = function() {
			var closeWithRaf = _closedByScroll,
				fadeEverything = !self.currItem.src || self.currItem.loadError || _options.showHideOpacity;
			
			// apply hw-acceleration to image
			if(item.miniImg) {
				item.miniImg.style.webkitBackfaceVisibility = 'hidden';
			}

			if(!out) {
				_currZoomLevel = thumbBounds.w / item.w;
				_panOffset.x = thumbBounds.x;
				_panOffset.y = thumbBounds.y - _initalWindowScrollY;

				self[fadeEverything ? 'template' : 'bg'].style.opacity = 0.001;
				_applyCurrentZoomPan();
			}

			_registerStartAnimation('initialZoom');
			
			if(out && !closeWithRaf) {
				framework.removeClass(template, 'pswp--animated-in');
			}

			if(fadeEverything) {
				if(out) {
					framework[ (closeWithRaf ? 'remove' : 'add') + 'Class' ](template, 'pswp--animate_opacity');
				} else {
					setTimeout(function() {
						framework.addClass(template, 'pswp--animate_opacity');
					}, 30);
				}
			}

			_showOrHideTimeout = setTimeout(function() {

				_shout('initialZoom' + (out ? 'Out' : 'In') );
				

				if(!out) {

					// "in" animation always uses CSS transitions (instead of rAF).
					// CSS transition work faster here, 
					// as developer may also want to animate other things, 
					// like ui on top of sliding area, which can be animated just via CSS
					
					_currZoomLevel = item.initialZoomLevel;
					_equalizePoints(_panOffset,  item.initialPosition );
					_applyCurrentZoomPan();
					_applyBgOpacity(1);

					if(fadeEverything) {
						template.style.opacity = 1;
					} else {
						_applyBgOpacity(1);
					}

					_showOrHideTimeout = setTimeout(onComplete, duration + 20);
				} else {

					// "out" animation uses rAF only when PhotoSwipe is closed by browser scroll, to recalculate position
					var destZoomLevel = thumbBounds.w / item.w,
						initialPanOffset = {
							x: _panOffset.x,
							y: _panOffset.y
						},
						initialZoomLevel = _currZoomLevel,
						initalBgOpacity = _bgOpacity,
						onUpdate = function(now) {
							
							if(now === 1) {
								_currZoomLevel = destZoomLevel;
								_panOffset.x = thumbBounds.x;
								_panOffset.y = thumbBounds.y  - _currentWindowScrollY;
							} else {
								_currZoomLevel = (destZoomLevel - initialZoomLevel) * now + initialZoomLevel;
								_panOffset.x = (thumbBounds.x - initialPanOffset.x) * now + initialPanOffset.x;
								_panOffset.y = (thumbBounds.y - _currentWindowScrollY - initialPanOffset.y) * now + initialPanOffset.y;
							}
							
							_applyCurrentZoomPan();
							if(fadeEverything) {
								template.style.opacity = 1 - now;
							} else {
								_applyBgOpacity( initalBgOpacity - now * initalBgOpacity );
							}
						};

					if(closeWithRaf) {
						_animateProp('initialZoom', 0, 1, duration, framework.easing.cubic.out, onUpdate, onComplete);
					} else {
						onUpdate(1);
						_showOrHideTimeout = setTimeout(onComplete, duration + 20);
					}
				}
			
			}, out ? 25 : 90); // Main purpose of this delay is to give browser time to paint and
					// create composite layers of PhotoSwipe UI parts (background, controls, caption, arrows).
					// Which avoids lag at the beginning of scale transition.
		};
		startAnimation();

		
	};

/*>>show-hide-transition*/

/*>>items-controller*/
/**
*
* Controller manages gallery items, their dimensions, and their content.
* 
*/

var _items,
	_tempPanAreaSize = {},
	_imagesToAppendPool = [],
	_initialContentSet,
	_initialZoomRunning,
	_controllerDefaultOptions = {
		index: 0,
		errorMsg: '<div class="pswp__error-msg"><a href="%url%" target="_blank">The image</a> could not be loaded.</div>',
		forceProgressiveLoading: false, // TODO
		preload: [1,1],
		getNumItemsFn: function() {
			return _items.length;
		}
	};


var _getItemAt,
	_getNumItems,
	_initialIsLoop,
	_getZeroBounds = function() {
		return {
			center:{x:0,y:0}, 
			max:{x:0,y:0}, 
			min:{x:0,y:0}
		};
	},
	_calculateSingleItemPanBounds = function(item, realPanElementW, realPanElementH ) {
		var bounds = item.bounds;

		// position of element when it's centered
		bounds.center.x = Math.round((_tempPanAreaSize.x - realPanElementW) / 2);
		bounds.center.y = Math.round((_tempPanAreaSize.y - realPanElementH) / 2) + item.vGap.top;

		// maximum pan position
		bounds.max.x = (realPanElementW > _tempPanAreaSize.x) ? 
							Math.round(_tempPanAreaSize.x - realPanElementW) : 
							bounds.center.x;
		
		bounds.max.y = (realPanElementH > _tempPanAreaSize.y) ? 
							Math.round(_tempPanAreaSize.y - realPanElementH) + item.vGap.top : 
							bounds.center.y;
		
		// minimum pan position
		bounds.min.x = (realPanElementW > _tempPanAreaSize.x) ? 0 : bounds.center.x;
		bounds.min.y = (realPanElementH > _tempPanAreaSize.y) ? item.vGap.top : bounds.center.y;
	},
	_calculateItemSize = function(item, viewportSize, zoomLevel) {

		if (item.src && !item.loadError) {
			var isInitial = !zoomLevel;
			
			if(isInitial) {
				if(!item.vGap) {
					item.vGap = {top:0,bottom:0};
				}
				// allows overriding vertical margin for individual items
				_shout('parseVerticalMargin', item);
			}


			_tempPanAreaSize.x = viewportSize.x;
			_tempPanAreaSize.y = viewportSize.y - item.vGap.top - item.vGap.bottom;

			if (isInitial) {
				var hRatio = _tempPanAreaSize.x / item.w;
				var vRatio = _tempPanAreaSize.y / item.h;

				item.fitRatio = hRatio < vRatio ? hRatio : vRatio;
				//item.fillRatio = hRatio > vRatio ? hRatio : vRatio;

				var scaleMode = _options.scaleMode;

				if (scaleMode === 'orig') {
					zoomLevel = 1;
				} else if (scaleMode === 'fit') {
					zoomLevel = item.fitRatio;
				}

				if (zoomLevel > 1) {
					zoomLevel = 1;
				}

				item.initialZoomLevel = zoomLevel;
				
				if(!item.bounds) {
					// reuse bounds object
					item.bounds = _getZeroBounds(); 
				}
			}

			if(!zoomLevel) {
				return;
			}

			_calculateSingleItemPanBounds(item, item.w * zoomLevel, item.h * zoomLevel);

			if (isInitial && zoomLevel === item.initialZoomLevel) {
				item.initialPosition = item.bounds.center;
			}

			return item.bounds;
		} else {
			item.w = item.h = 0;
			item.initialZoomLevel = item.fitRatio = 1;
			item.bounds = _getZeroBounds();
			item.initialPosition = item.bounds.center;

			// if it's not image, we return zero bounds (content is not zoomable)
			return item.bounds;
		}
		
	},

	


	_appendImage = function(index, item, baseDiv, img, preventAnimation, keepPlaceholder) {
		

		if(item.loadError) {
			return;
		}

		if(img) {

			item.imageAppended = true;
			_setImageSize(item, img, (item === self.currItem && _renderMaxResolution) );
			
			baseDiv.appendChild(img);

			if(keepPlaceholder) {
				setTimeout(function() {
					if(item && item.loaded && item.placeholder) {
						item.placeholder.style.display = 'none';
						item.placeholder = null;
					}
				}, 500);
			}
		}
	},
	


	_preloadImage = function(item) {
		item.loading = true;
		item.loaded = false;
		var img = item.img = framework.createEl('pswp__img', 'img');
		var onComplete = function() {
			item.loading = false;
			item.loaded = true;

			if(item.loadComplete) {
				item.loadComplete(item);
			} else {
				item.img = null; // no need to store image object
			}
			img.onload = img.onerror = null;
			img = null;
		};
		img.onload = onComplete;
		img.onerror = function() {
			item.loadError = true;
			onComplete();
		};		

		img.src = item.src;// + '?a=' + Math.random();

		return img;
	},
	_checkForError = function(item, cleanUp) {
		if(item.src && item.loadError && item.container) {

			if(cleanUp) {
				item.container.innerHTML = '';
			}

			item.container.innerHTML = _options.errorMsg.replace('%url%',  item.src );
			return true;
			
		}
	},
	_setImageSize = function(item, img, maxRes) {
		if(!item.src) {
			return;
		}

		if(!img) {
			img = item.container.lastChild;
		}

		var w = maxRes ? item.w : Math.round(item.w * item.fitRatio),
			h = maxRes ? item.h : Math.round(item.h * item.fitRatio);
		
		if(item.placeholder && !item.loaded) {
			item.placeholder.style.width = w + 'px';
			item.placeholder.style.height = h + 'px';
		}

		img.style.width = w + 'px';
		img.style.height = h + 'px';
	},
	_appendImagesPool = function() {

		if(_imagesToAppendPool.length) {
			var poolItem;

			for(var i = 0; i < _imagesToAppendPool.length; i++) {
				poolItem = _imagesToAppendPool[i];
				if( poolItem.holder.index === poolItem.index ) {
					_appendImage(poolItem.index, poolItem.item, poolItem.baseDiv, poolItem.img, false, poolItem.clearPlaceholder);
				}
			}
			_imagesToAppendPool = [];
		}
	};
	


_registerModule('Controller', {

	publicMethods: {

		lazyLoadItem: function(index) {
			index = _getLoopedId(index);
			var item = _getItemAt(index);

			if(!item || ((item.loaded || item.loading) && !_itemsNeedUpdate)) {
				return;
			}

			_shout('gettingData', index, item);

			if (!item.src) {
				return;
			}

			_preloadImage(item);
		},
		initController: function() {
			framework.extend(_options, _controllerDefaultOptions, true);
			self.items = _items = items;
			_getItemAt = self.getItemAt;
			_getNumItems = _options.getNumItemsFn; //self.getNumItems;



			_initialIsLoop = _options.loop;
			if(_getNumItems() < 3) {
				_options.loop = false; // disable loop if less then 3 items
			}

			_listen('beforeChange', function(diff) {

				var p = _options.preload,
					isNext = diff === null ? true : (diff >= 0),
					preloadBefore = Math.min(p[0], _getNumItems() ),
					preloadAfter = Math.min(p[1], _getNumItems() ),
					i;


				for(i = 1; i <= (isNext ? preloadAfter : preloadBefore); i++) {
					self.lazyLoadItem(_currentItemIndex+i);
				}
				for(i = 1; i <= (isNext ? preloadBefore : preloadAfter); i++) {
					self.lazyLoadItem(_currentItemIndex-i);
				}
			});

			_listen('initialLayout', function() {
				self.currItem.initialLayout = _options.getThumbBoundsFn && _options.getThumbBoundsFn(_currentItemIndex);
			});

			_listen('mainScrollAnimComplete', _appendImagesPool);
			_listen('initialZoomInEnd', _appendImagesPool);



			_listen('destroy', function() {
				var item;
				for(var i = 0; i < _items.length; i++) {
					item = _items[i];
					// remove reference to DOM elements, for GC
					if(item.container) {
						item.container = null; 
					}
					if(item.placeholder) {
						item.placeholder = null;
					}
					if(item.img) {
						item.img = null;
					}
					if(item.preloader) {
						item.preloader = null;
					}
					if(item.loadError) {
						item.loaded = item.loadError = false;
					}
				}
				_imagesToAppendPool = null;
			});
		},


		getItemAt: function(index) {
			if (index >= 0) {
				return _items[index] !== undefined ? _items[index] : false;
			}
			return false;
		},

		allowProgressiveImg: function() {
			// 1. Progressive image loading isn't working on webkit/blink 
			//    when hw-acceleration (e.g. translateZ) is applied to IMG element.
			//    That's why in PhotoSwipe parent element gets zoom transform, not image itself.
			//    
			// 2. Progressive image loading sometimes blinks in webkit/blink when applying animation to parent element.
			//    That's why it's disabled on touch devices (mainly because of swipe transition)
			//    
			// 3. Progressive image loading sometimes doesn't work in IE (up to 11).

			// Don't allow progressive loading on non-large touch devices
			return _options.forceProgressiveLoading || !_likelyTouchDevice || _options.mouseUsed || screen.width > 1200; 
			// 1200 - to eliminate touch devices with large screen (like Chromebook Pixel)
		},

		setContent: function(holder, index) {

			if(_options.loop) {
				index = _getLoopedId(index);
			}

			var prevItem = self.getItemAt(holder.index);
			if(prevItem) {
				prevItem.container = null;
			}
	
			var item = self.getItemAt(index),
				img;
			
			if(!item) {
				holder.el.innerHTML = '';
				return;
			}

			// allow to override data
			_shout('gettingData', index, item);

			holder.index = index;
			holder.item = item;

			// base container DIV is created only once for each of 3 holders
			var baseDiv = item.container = framework.createEl('pswp__zoom-wrap'); 

			

			if(!item.src && item.html) {
				if(item.html.tagName) {
					baseDiv.appendChild(item.html);
				} else {
					baseDiv.innerHTML = item.html;
				}
			}

			_checkForError(item);

			_calculateItemSize(item, _viewportSize);
			
			if(item.src && !item.loadError && !item.loaded) {

				item.loadComplete = function(item) {

					// gallery closed before image finished loading
					if(!_isOpen) {
						return;
					}

					// check if holder hasn't changed while image was loading
					if(holder && holder.index === index ) {
						if( _checkForError(item, true) ) {
							item.loadComplete = item.img = null;
							_calculateItemSize(item, _viewportSize);
							_applyZoomPanToItem(item);

							if(holder.index === _currentItemIndex) {
								// recalculate dimensions
								self.updateCurrZoomItem();
							}
							return;
						}
						if( !item.imageAppended ) {
							if(_features.transform && (_mainScrollAnimating || _initialZoomRunning) ) {
								_imagesToAppendPool.push({
									item:item,
									baseDiv:baseDiv,
									img:item.img,
									index:index,
									holder:holder,
									clearPlaceholder:true
								});
							} else {
								_appendImage(index, item, baseDiv, item.img, _mainScrollAnimating || _initialZoomRunning, true);
							}
						} else {
							// remove preloader & mini-img
							if(!_initialZoomRunning && item.placeholder) {
								item.placeholder.style.display = 'none';
								item.placeholder = null;
							}
						}
					}

					item.loadComplete = null;
					item.img = null; // no need to store image element after it's added

					_shout('imageLoadComplete', index, item);
				};

				if(framework.features.transform) {
					
					var placeholderClassName = 'pswp__img pswp__img--placeholder'; 
					placeholderClassName += (item.msrc ? '' : ' pswp__img--placeholder--blank');

					var placeholder = framework.createEl(placeholderClassName, item.msrc ? 'img' : '');
					if(item.msrc) {
						placeholder.src = item.msrc;
					}
					
					_setImageSize(item, placeholder);

					baseDiv.appendChild(placeholder);
					item.placeholder = placeholder;

				}
				

				

				if(!item.loading) {
					_preloadImage(item);
				}


				if( self.allowProgressiveImg() ) {
					// just append image
					if(!_initialContentSet && _features.transform) {
						_imagesToAppendPool.push({
							item:item, 
							baseDiv:baseDiv, 
							img:item.img, 
							index:index, 
							holder:holder
						});
					} else {
						_appendImage(index, item, baseDiv, item.img, true, true);
					}
				}
				
			} else if(item.src && !item.loadError) {
				// image object is created every time, due to bugs of image loading & delay when switching images
				img = framework.createEl('pswp__img', 'img');
				img.style.opacity = 1;
				img.src = item.src;
				_setImageSize(item, img);
				_appendImage(index, item, baseDiv, img, true);
			}
			

			if(!_initialContentSet && index === _currentItemIndex) {
				_currZoomElementStyle = baseDiv.style;
				_showOrHide(item, (img ||item.img) );
			} else {
				_applyZoomPanToItem(item);
			}

			holder.el.innerHTML = '';
			holder.el.appendChild(baseDiv);
		},

		cleanSlide: function( item ) {
			if(item.img ) {
				item.img.onload = item.img.onerror = null;
			}
			item.loaded = item.loading = item.img = item.imageAppended = false;
		}

	}
});

/*>>items-controller*/

/*>>tap*/
/**
 * tap.js:
 *
 * Displatches tap and double-tap events.
 * 
 */

var tapTimer,
	tapReleasePoint = {},
	_dispatchTapEvent = function(origEvent, releasePoint, pointerType) {		
		var e = document.createEvent( 'CustomEvent' ),
			eDetail = {
				origEvent:origEvent, 
				target:origEvent.target, 
				releasePoint: releasePoint, 
				pointerType:pointerType || 'touch'
			};

		e.initCustomEvent( 'pswpTap', true, true, eDetail );
		origEvent.target.dispatchEvent(e);
	};

_registerModule('Tap', {
	publicMethods: {
		initTap: function() {
			_listen('firstTouchStart', self.onTapStart);
			_listen('touchRelease', self.onTapRelease);
			_listen('destroy', function() {
				tapReleasePoint = {};
				tapTimer = null;
			});
		},
		onTapStart: function(touchList) {
			if(touchList.length > 1) {
				clearTimeout(tapTimer);
				tapTimer = null;
			}
		},
		onTapRelease: function(e, releasePoint) {
			if(!releasePoint) {
				return;
			}

			if(!_moved && !_isMultitouch && !_numAnimations) {
				var p0 = releasePoint;
				if(tapTimer) {
					clearTimeout(tapTimer);
					tapTimer = null;

					// Check if taped on the same place
					if ( _isNearbyPoints(p0, tapReleasePoint) ) {
						_shout('doubleTap', p0);
						return;
					}
				}

				if(releasePoint.type === 'mouse') {
					_dispatchTapEvent(e, releasePoint, 'mouse');
					return;
				}

				var clickedTagName = e.target.tagName.toUpperCase();
				// avoid double tap delay on buttons and elements that have class pswp__single-tap
				if(clickedTagName === 'BUTTON' || framework.hasClass(e.target, 'pswp__single-tap') ) {
					_dispatchTapEvent(e, releasePoint);
					return;
				}

				_equalizePoints(tapReleasePoint, p0);

				tapTimer = setTimeout(function() {
					_dispatchTapEvent(e, releasePoint);
					tapTimer = null;
				}, 300);
			}
		}
	}
});

/*>>tap*/

/*>>desktop-zoom*/
/**
 *
 * desktop-zoom.js:
 *
 * - Binds mousewheel event for paning zoomed image.
 * - Manages "dragging", "zoomed-in", "zoom-out" classes.
 *   (which are used for cursors and zoom icon)
 * - Adds toggleDesktopZoom function.
 * 
 */

var _wheelDelta;
	
_registerModule('DesktopZoom', {

	publicMethods: {

		initDesktopZoom: function() {

			if(_oldIE) {
				// no zoom for old IE (<=8)
				return;
			}

			if(_likelyTouchDevice) {
				// if detected hardware touch support, we wait until mouse is used,
				// and only then apply desktop-zoom features
				_listen('mouseUsed', function() {
					self.setupDesktopZoom();
				});
			} else {
				self.setupDesktopZoom(true);
			}

		},

		setupDesktopZoom: function(onInit) {

			_wheelDelta = {};

			var events = 'wheel mousewheel DOMMouseScroll';
			
			_listen('bindEvents', function() {
				framework.bind(template, events,  self.handleMouseWheel);
			});

			_listen('unbindEvents', function() {
				if(_wheelDelta) {
					framework.unbind(template, events, self.handleMouseWheel);
				}
			});

			self.mouseZoomedIn = false;

			var hasDraggingClass,
				updateZoomable = function() {
					if(self.mouseZoomedIn) {
						framework.removeClass(template, 'pswp--zoomed-in');
						self.mouseZoomedIn = false;
					}
					if(_currZoomLevel < 1) {
						framework.addClass(template, 'pswp--zoom-allowed');
					} else {
						framework.removeClass(template, 'pswp--zoom-allowed');
					}
					removeDraggingClass();
				},
				removeDraggingClass = function() {
					if(hasDraggingClass) {
						framework.removeClass(template, 'pswp--dragging');
						hasDraggingClass = false;
					}
				};

			_listen('resize' , updateZoomable);
			_listen('afterChange' , updateZoomable);
			_listen('pointerDown', function() {
				if(self.mouseZoomedIn) {
					hasDraggingClass = true;
					framework.addClass(template, 'pswp--dragging');
				}
			});
			_listen('pointerUp', removeDraggingClass);

			if(!onInit) {
				updateZoomable();
			}
			
		},

		handleMouseWheel: function(e) {

			if(_currZoomLevel <= self.currItem.fitRatio) {
				if( _options.modal ) {

					if (!_options.closeOnScroll || _numAnimations || _isDragging) {
						e.preventDefault();
					} else if(_transformKey && Math.abs(e.deltaY) > 2) {
						// close PhotoSwipe
						// if browser supports transforms & scroll changed enough
						_closedByScroll = true;
						self.close();
					}

				}
				return true;
			}

			// allow just one event to fire
			e.stopPropagation();

			// https://developer.mozilla.org/en-US/docs/Web/Events/wheel
			_wheelDelta.x = 0;

			if('deltaX' in e) {
				if(e.deltaMode === 1 /* DOM_DELTA_LINE */) {
					// 18 - average line height
					_wheelDelta.x = e.deltaX * 18;
					_wheelDelta.y = e.deltaY * 18;
				} else {
					_wheelDelta.x = e.deltaX;
					_wheelDelta.y = e.deltaY;
				}
			} else if('wheelDelta' in e) {
				if(e.wheelDeltaX) {
					_wheelDelta.x = -0.16 * e.wheelDeltaX;
				}
				if(e.wheelDeltaY) {
					_wheelDelta.y = -0.16 * e.wheelDeltaY;
				} else {
					_wheelDelta.y = -0.16 * e.wheelDelta;
				}
			} else if('detail' in e) {
				_wheelDelta.y = e.detail;
			} else {
				return;
			}

			_calculatePanBounds(_currZoomLevel, true);

			var newPanX = _panOffset.x - _wheelDelta.x,
				newPanY = _panOffset.y - _wheelDelta.y;

			// only prevent scrolling in nonmodal mode when not at edges
			if (_options.modal ||
				(
				newPanX <= _currPanBounds.min.x && newPanX >= _currPanBounds.max.x &&
				newPanY <= _currPanBounds.min.y && newPanY >= _currPanBounds.max.y
				) ) {
				e.preventDefault();
			}

			// TODO: use rAF instead of mousewheel?
			self.panTo(newPanX, newPanY);
		},

		toggleDesktopZoom: function(centerPoint) {
			centerPoint = centerPoint || {x:_viewportSize.x/2 + _offset.x, y:_viewportSize.y/2 + _offset.y };

			var doubleTapZoomLevel = _options.getDoubleTapZoom(true, self.currItem);
			var zoomOut = _currZoomLevel === doubleTapZoomLevel;
			
			self.mouseZoomedIn = !zoomOut;

			self.zoomTo(zoomOut ? self.currItem.initialZoomLevel : doubleTapZoomLevel, centerPoint, 333);
			framework[ (!zoomOut ? 'add' : 'remove') + 'Class'](template, 'pswp--zoomed-in');
		}

	}
});


/*>>desktop-zoom*/

/*>>history*/
/**
 *
 * history.js:
 *
 * - Back button to close gallery.
 * 
 * - Unique URL for each slide: example.com/&pid=1&gid=3
 *   (where PID is picture index, and GID and gallery index)
 *   
 * - Switch URL when slides change.
 * 
 */


var _historyDefaultOptions = {
	history: true,
	galleryUID: 1
};

var _historyUpdateTimeout,
	_hashChangeTimeout,
	_hashAnimCheckTimeout,
	_hashChangedByScript,
	_hashChangedByHistory,
	_hashReseted,
	_initialHash,
	_historyChanged,
	_closedFromURL,
	_urlChangedOnce,
	_windowLoc,

	_supportsPushState,

	_getHash = function() {
		return _windowLoc.hash.substring(1);
	},
	_cleanHistoryTimeouts = function() {

		if(_historyUpdateTimeout) {
			clearTimeout(_historyUpdateTimeout);
		}

		if(_hashAnimCheckTimeout) {
			clearTimeout(_hashAnimCheckTimeout);
		}
	},

	// pid - Picture index
	// gid - Gallery index
	_parseItemIndexFromURL = function() {
		var hash = _getHash(),
			params = {};

		if(hash.length < 5) { // pid=1
			return params;
		}

		var i, vars = hash.split('&');
		for (i = 0; i < vars.length; i++) {
			if(!vars[i]) {
				continue;
			}
			var pair = vars[i].split('=');	
			if(pair.length < 2) {
				continue;
			}
			params[pair[0]] = pair[1];
		}
		if(_options.galleryPIDs) {
			// detect custom pid in hash and search for it among the items collection
			var searchfor = params.pid;
			params.pid = 0; // if custom pid cannot be found, fallback to the first item
			for(i = 0; i < _items.length; i++) {
				if(_items[i].pid === searchfor) {
					params.pid = i;
					break;
				}
			}
		} else {
			params.pid = parseInt(params.pid,10)-1;
		}
		if( params.pid < 0 ) {
			params.pid = 0;
		}
		return params;
	},
	_updateHash = function() {

		if(_hashAnimCheckTimeout) {
			clearTimeout(_hashAnimCheckTimeout);
		}


		if(_numAnimations || _isDragging) {
			// changing browser URL forces layout/paint in some browsers, which causes noticable lag during animation
			// that's why we update hash only when no animations running
			_hashAnimCheckTimeout = setTimeout(_updateHash, 500);
			return;
		}
		
		if(_hashChangedByScript) {
			clearTimeout(_hashChangeTimeout);
		} else {
			_hashChangedByScript = true;
		}


		var pid = (_currentItemIndex + 1);
		var item = _getItemAt( _currentItemIndex );
		if(item.hasOwnProperty('pid')) {
			// carry forward any custom pid assigned to the item
			pid = item.pid;
		}
		var newHash = _initialHash + '&'  +  'gid=' + _options.galleryUID + '&' + 'pid=' + pid;

		if(!_historyChanged) {
			if(_windowLoc.hash.indexOf(newHash) === -1) {
				_urlChangedOnce = true;
			}
			// first time - add new hisory record, then just replace
		}

		var newURL = _windowLoc.href.split('#')[0] + '#' +  newHash;

		if( _supportsPushState ) {

			if('#' + newHash !== window.location.hash) {
				history[_historyChanged ? 'replaceState' : 'pushState']('', document.title, newURL);
			}

		} else {
			if(_historyChanged) {
				_windowLoc.replace( newURL );
			} else {
				_windowLoc.hash = newHash;
			}
		}
		
		

		_historyChanged = true;
		_hashChangeTimeout = setTimeout(function() {
			_hashChangedByScript = false;
		}, 60);
	};



	

_registerModule('History', {

	

	publicMethods: {
		initHistory: function() {

			framework.extend(_options, _historyDefaultOptions, true);

			if( !_options.history ) {
				return;
			}


			_windowLoc = window.location;
			_urlChangedOnce = false;
			_closedFromURL = false;
			_historyChanged = false;
			_initialHash = _getHash();
			_supportsPushState = ('pushState' in history);


			if(_initialHash.indexOf('gid=') > -1) {
				_initialHash = _initialHash.split('&gid=')[0];
				_initialHash = _initialHash.split('?gid=')[0];
			}
			

			_listen('afterChange', self.updateURL);
			_listen('unbindEvents', function() {
				framework.unbind(window, 'hashchange', self.onHashChange);
			});


			var returnToOriginal = function() {
				_hashReseted = true;
				if(!_closedFromURL) {

					if(_urlChangedOnce) {
						history.back();
					} else {

						if(_initialHash) {
							_windowLoc.hash = _initialHash;
						} else {
							if (_supportsPushState) {

								// remove hash from url without refreshing it or scrolling to top
								history.pushState('', document.title,  _windowLoc.pathname + _windowLoc.search );
							} else {
								_windowLoc.hash = '';
							}
						}
					}
					
				}

				_cleanHistoryTimeouts();
			};


			_listen('unbindEvents', function() {
				if(_closedByScroll) {
					// if PhotoSwipe is closed by scroll, we go "back" before the closing animation starts
					// this is done to keep the scroll position
					returnToOriginal();
				}
			});
			_listen('destroy', function() {
				if(!_hashReseted) {
					returnToOriginal();
				}
			});
			_listen('firstUpdate', function() {
				_currentItemIndex = _parseItemIndexFromURL().pid;
			});

			

			
			var index = _initialHash.indexOf('pid=');
			if(index > -1) {
				_initialHash = _initialHash.substring(0, index);
				if(_initialHash.slice(-1) === '&') {
					_initialHash = _initialHash.slice(0, -1);
				}
			}
			

			setTimeout(function() {
				if(_isOpen) { // hasn't destroyed yet
					framework.bind(window, 'hashchange', self.onHashChange);
				}
			}, 40);
			
		},
		onHashChange: function() {

			if(_getHash() === _initialHash) {

				_closedFromURL = true;
				self.close();
				return;
			}
			if(!_hashChangedByScript) {

				_hashChangedByHistory = true;
				self.goTo( _parseItemIndexFromURL().pid );
				_hashChangedByHistory = false;
			}
			
		},
		updateURL: function() {

			// Delay the update of URL, to avoid lag during transition, 
			// and to not to trigger actions like "refresh page sound" or "blinking favicon" to often
			
			_cleanHistoryTimeouts();
			

			if(_hashChangedByHistory) {
				return;
			}

			if(!_historyChanged) {
				_updateHash(); // first time
			} else {
				_historyUpdateTimeout = setTimeout(_updateHash, 800);
			}
		}
	
	}
});


/*>>history*/
	framework.extend(self, publicMethods); };
	return PhotoSwipe;
});

/***/ }),

/***/ "./node_modules/photoswipe/src/css/default-skin/default-skin.scss":
/*!************************************************************************!*\
  !*** ./node_modules/photoswipe/src/css/default-skin/default-skin.scss ***!
  \************************************************************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

// extracted by mini-css-extract-plugin

/***/ }),

/***/ "./node_modules/photoswipe/src/css/main.scss":
/*!***************************************************!*\
  !*** ./node_modules/photoswipe/src/css/main.scss ***!
  \***************************************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

// extracted by mini-css-extract-plugin

/***/ }),

/***/ "./node_modules/photoswipe/src/js/ui/photoswipe-ui-default.js":
/*!********************************************************************!*\
  !*** ./node_modules/photoswipe/src/js/ui/photoswipe-ui-default.js ***!
  \********************************************************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

var __WEBPACK_AMD_DEFINE_FACTORY__, __WEBPACK_AMD_DEFINE_RESULT__;/**
*
* UI on top of main sliding area (caption, arrows, close button, etc.).
* Built just using public methods/properties of PhotoSwipe.
* 
*/
(function (root, factory) { 
	if (true) {
		!(__WEBPACK_AMD_DEFINE_FACTORY__ = (factory),
				__WEBPACK_AMD_DEFINE_RESULT__ = (typeof __WEBPACK_AMD_DEFINE_FACTORY__ === 'function' ?
				(__WEBPACK_AMD_DEFINE_FACTORY__.call(exports, __webpack_require__, exports, module)) :
				__WEBPACK_AMD_DEFINE_FACTORY__),
				__WEBPACK_AMD_DEFINE_RESULT__ !== undefined && (module.exports = __WEBPACK_AMD_DEFINE_RESULT__));
	} else {}
})(this, function () {

	'use strict';



var PhotoSwipeUI_Default =
 function(pswp, framework) {

	var ui = this;
	var _overlayUIUpdated = false,
		_controlsVisible = true,
		_fullscrenAPI,
		_controls,
		_captionContainer,
		_fakeCaptionContainer,
		_indexIndicator,
		_shareButton,
		_shareModal,
		_shareModalHidden = true,
		_initalCloseOnScrollValue,
		_isIdle,
		_listen,

		_loadingIndicator,
		_loadingIndicatorHidden,
		_loadingIndicatorTimeout,

		_galleryHasOneSlide,

		_options,
		_defaultUIOptions = {
			barsSize: {top:44, bottom:'auto'},
			closeElClasses: ['item', 'caption', 'zoom-wrap', 'ui', 'top-bar'], 
			timeToIdle: 4000, 
			timeToIdleOutside: 1000,
			loadingIndicatorDelay: 1000, // 2s
			
			addCaptionHTMLFn: function(item, captionEl /*, isFake */) {
				if(!item.title) {
					captionEl.children[0].innerHTML = '';
					return false;
				}
				captionEl.children[0].innerHTML = item.title;
				return true;
			},

			closeEl:true,
			captionEl: true,
			fullscreenEl: true,
			zoomEl: true,
			shareEl: true,
			counterEl: true,
			arrowEl: true,
			preloaderEl: true,

			tapToClose: false,
			tapToToggleControls: true,

			clickToCloseNonZoomable: true,

			shareButtons: [
				{id:'facebook', label:'Share on Facebook', url:'https://www.facebook.com/sharer/sharer.php?u={{url}}'},
				{id:'twitter', label:'Tweet', url:'https://twitter.com/intent/tweet?text={{text}}&url={{url}}'},
				{id:'pinterest', label:'Pin it', url:'http://www.pinterest.com/pin/create/button/'+
													'?url={{url}}&media={{image_url}}&description={{text}}'},
				{id:'download', label:'Download image', url:'{{raw_image_url}}', download:true}
			],
			getImageURLForShare: function( /* shareButtonData */ ) {
				return pswp.currItem.src || '';
			},
			getPageURLForShare: function( /* shareButtonData */ ) {
				return window.location.href;
			},
			getTextForShare: function( /* shareButtonData */ ) {
				return pswp.currItem.title || '';
			},
				
			indexIndicatorSep: ' / ',
			fitControlsWidth: 1200

		},
		_blockControlsTap,
		_blockControlsTapTimeout;



	var _onControlsTap = function(e) {
			if(_blockControlsTap) {
				return true;
			}


			e = e || window.event;

			if(_options.timeToIdle && _options.mouseUsed && !_isIdle) {
				// reset idle timer
				_onIdleMouseMove();
			}


			var target = e.target || e.srcElement,
				uiElement,
				clickedClass = target.getAttribute('class') || '',
				found;

			for(var i = 0; i < _uiElements.length; i++) {
				uiElement = _uiElements[i];
				if(uiElement.onTap && clickedClass.indexOf('pswp__' + uiElement.name ) > -1 ) {
					uiElement.onTap();
					found = true;

				}
			}

			if(found) {
				if(e.stopPropagation) {
					e.stopPropagation();
				}
				_blockControlsTap = true;

				// Some versions of Android don't prevent ghost click event 
				// when preventDefault() was called on touchstart and/or touchend.
				// 
				// This happens on v4.3, 4.2, 4.1, 
				// older versions strangely work correctly, 
				// but just in case we add delay on all of them)	
				var tapDelay = framework.features.isOldAndroid ? 600 : 30;
				_blockControlsTapTimeout = setTimeout(function() {
					_blockControlsTap = false;
				}, tapDelay);
			}

		},
		_fitControlsInViewport = function() {
			return !pswp.likelyTouchDevice || _options.mouseUsed || screen.width > _options.fitControlsWidth;
		},
		_togglePswpClass = function(el, cName, add) {
			framework[ (add ? 'add' : 'remove') + 'Class' ](el, 'pswp__' + cName);
		},

		// add class when there is just one item in the gallery
		// (by default it hides left/right arrows and 1ofX counter)
		_countNumItems = function() {
			var hasOneSlide = (_options.getNumItemsFn() === 1);

			if(hasOneSlide !== _galleryHasOneSlide) {
				_togglePswpClass(_controls, 'ui--one-slide', hasOneSlide);
				_galleryHasOneSlide = hasOneSlide;
			}
		},
		_toggleShareModalClass = function() {
			_togglePswpClass(_shareModal, 'share-modal--hidden', _shareModalHidden);
		},
		_toggleShareModal = function() {

			_shareModalHidden = !_shareModalHidden;
			
			
			if(!_shareModalHidden) {
				_toggleShareModalClass();
				setTimeout(function() {
					if(!_shareModalHidden) {
						framework.addClass(_shareModal, 'pswp__share-modal--fade-in');
					}
				}, 30);
			} else {
				framework.removeClass(_shareModal, 'pswp__share-modal--fade-in');
				setTimeout(function() {
					if(_shareModalHidden) {
						_toggleShareModalClass();
					}
				}, 300);
			}
			
			if(!_shareModalHidden) {
				_updateShareURLs();
			}
			return false;
		},

		_openWindowPopup = function(e) {
			e = e || window.event;
			var target = e.target || e.srcElement;

			pswp.shout('shareLinkClick', e, target);

			if(!target.href) {
				return false;
			}

			if( target.hasAttribute('download') ) {
				return true;
			}

			window.open(target.href, 'pswp_share', 'scrollbars=yes,resizable=yes,toolbar=no,'+
										'location=yes,width=550,height=420,top=100,left=' + 
										(window.screen ? Math.round(screen.width / 2 - 275) : 100)  );

			if(!_shareModalHidden) {
				_toggleShareModal();
			}
			
			return false;
		},
		_updateShareURLs = function() {
			var shareButtonOut = '',
				shareButtonData,
				shareURL,
				image_url,
				page_url,
				share_text;

			for(var i = 0; i < _options.shareButtons.length; i++) {
				shareButtonData = _options.shareButtons[i];

				image_url = _options.getImageURLForShare(shareButtonData);
				page_url = _options.getPageURLForShare(shareButtonData);
				share_text = _options.getTextForShare(shareButtonData);

				shareURL = shareButtonData.url.replace('{{url}}', encodeURIComponent(page_url) )
									.replace('{{image_url}}', encodeURIComponent(image_url) )
									.replace('{{raw_image_url}}', image_url )
									.replace('{{text}}', encodeURIComponent(share_text) );

				shareButtonOut += '<a href="' + shareURL + '" target="_blank" '+
									'class="pswp__share--' + shareButtonData.id + '"' +
									(shareButtonData.download ? 'download' : '') + '>' + 
									shareButtonData.label + '</a>';

				if(_options.parseShareButtonOut) {
					shareButtonOut = _options.parseShareButtonOut(shareButtonData, shareButtonOut);
				}
			}
			_shareModal.children[0].innerHTML = shareButtonOut;
			_shareModal.children[0].onclick = _openWindowPopup;

		},
		_hasCloseClass = function(target) {
			for(var  i = 0; i < _options.closeElClasses.length; i++) {
				if( framework.hasClass(target, 'pswp__' + _options.closeElClasses[i]) ) {
					return true;
				}
			}
		},
		_idleInterval,
		_idleTimer,
		_idleIncrement = 0,
		_onIdleMouseMove = function() {
			clearTimeout(_idleTimer);
			_idleIncrement = 0;
			if(_isIdle) {
				ui.setIdle(false);
			}
		},
		_onMouseLeaveWindow = function(e) {
			e = e ? e : window.event;
			var from = e.relatedTarget || e.toElement;
			if (!from || from.nodeName === 'HTML') {
				clearTimeout(_idleTimer);
				_idleTimer = setTimeout(function() {
					ui.setIdle(true);
				}, _options.timeToIdleOutside);
			}
		},
		_setupFullscreenAPI = function() {
			if(_options.fullscreenEl && !framework.features.isOldAndroid) {
				if(!_fullscrenAPI) {
					_fullscrenAPI = ui.getFullscreenAPI();
				}
				if(_fullscrenAPI) {
					framework.bind(document, _fullscrenAPI.eventK, ui.updateFullscreen);
					ui.updateFullscreen();
					framework.addClass(pswp.template, 'pswp--supports-fs');
				} else {
					framework.removeClass(pswp.template, 'pswp--supports-fs');
				}
			}
		},
		_setupLoadingIndicator = function() {
			// Setup loading indicator
			if(_options.preloaderEl) {
			
				_toggleLoadingIndicator(true);

				_listen('beforeChange', function() {

					clearTimeout(_loadingIndicatorTimeout);

					// display loading indicator with delay
					_loadingIndicatorTimeout = setTimeout(function() {

						if(pswp.currItem && pswp.currItem.loading) {

							if( !pswp.allowProgressiveImg() || (pswp.currItem.img && !pswp.currItem.img.naturalWidth)  ) {
								// show preloader if progressive loading is not enabled, 
								// or image width is not defined yet (because of slow connection)
								_toggleLoadingIndicator(false); 
								// items-controller.js function allowProgressiveImg
							}
							
						} else {
							_toggleLoadingIndicator(true); // hide preloader
						}

					}, _options.loadingIndicatorDelay);
					
				});
				_listen('imageLoadComplete', function(index, item) {
					if(pswp.currItem === item) {
						_toggleLoadingIndicator(true);
					}
				});

			}
		},
		_toggleLoadingIndicator = function(hide) {
			if( _loadingIndicatorHidden !== hide ) {
				_togglePswpClass(_loadingIndicator, 'preloader--active', !hide);
				_loadingIndicatorHidden = hide;
			}
		},
		_applyNavBarGaps = function(item) {
			var gap = item.vGap;

			if( _fitControlsInViewport() ) {
				
				var bars = _options.barsSize; 
				if(_options.captionEl && bars.bottom === 'auto') {
					if(!_fakeCaptionContainer) {
						_fakeCaptionContainer = framework.createEl('pswp__caption pswp__caption--fake');
						_fakeCaptionContainer.appendChild( framework.createEl('pswp__caption__center') );
						_controls.insertBefore(_fakeCaptionContainer, _captionContainer);
						framework.addClass(_controls, 'pswp__ui--fit');
					}
					if( _options.addCaptionHTMLFn(item, _fakeCaptionContainer, true) ) {

						var captionSize = _fakeCaptionContainer.clientHeight;
						gap.bottom = parseInt(captionSize,10) || 44;
					} else {
						gap.bottom = bars.top; // if no caption, set size of bottom gap to size of top
					}
				} else {
					gap.bottom = bars.bottom === 'auto' ? 0 : bars.bottom;
				}
				
				// height of top bar is static, no need to calculate it
				gap.top = bars.top;
			} else {
				gap.top = gap.bottom = 0;
			}
		},
		_setupIdle = function() {
			// Hide controls when mouse is used
			if(_options.timeToIdle) {
				_listen('mouseUsed', function() {
					
					framework.bind(document, 'mousemove', _onIdleMouseMove);
					framework.bind(document, 'mouseout', _onMouseLeaveWindow);

					_idleInterval = setInterval(function() {
						_idleIncrement++;
						if(_idleIncrement === 2) {
							ui.setIdle(true);
						}
					}, _options.timeToIdle / 2);
				});
			}
		},
		_setupHidingControlsDuringGestures = function() {

			// Hide controls on vertical drag
			_listen('onVerticalDrag', function(now) {
				if(_controlsVisible && now < 0.95) {
					ui.hideControls();
				} else if(!_controlsVisible && now >= 0.95) {
					ui.showControls();
				}
			});

			// Hide controls when pinching to close
			var pinchControlsHidden;
			_listen('onPinchClose' , function(now) {
				if(_controlsVisible && now < 0.9) {
					ui.hideControls();
					pinchControlsHidden = true;
				} else if(pinchControlsHidden && !_controlsVisible && now > 0.9) {
					ui.showControls();
				}
			});

			_listen('zoomGestureEnded', function() {
				pinchControlsHidden = false;
				if(pinchControlsHidden && !_controlsVisible) {
					ui.showControls();
				}
			});

		};



	var _uiElements = [
		{ 
			name: 'caption', 
			option: 'captionEl',
			onInit: function(el) {  
				_captionContainer = el; 
			} 
		},
		{ 
			name: 'share-modal', 
			option: 'shareEl',
			onInit: function(el) {  
				_shareModal = el;
			},
			onTap: function() {
				_toggleShareModal();
			} 
		},
		{ 
			name: 'button--share', 
			option: 'shareEl',
			onInit: function(el) { 
				_shareButton = el;
			},
			onTap: function() {
				_toggleShareModal();
			} 
		},
		{ 
			name: 'button--zoom', 
			option: 'zoomEl',
			onTap: pswp.toggleDesktopZoom
		},
		{ 
			name: 'counter', 
			option: 'counterEl',
			onInit: function(el) {  
				_indexIndicator = el;
			} 
		},
		{ 
			name: 'button--close', 
			option: 'closeEl',
			onTap: pswp.close
		},
		{ 
			name: 'button--arrow--left', 
			option: 'arrowEl',
			onTap: pswp.prev
		},
		{ 
			name: 'button--arrow--right', 
			option: 'arrowEl',
			onTap: pswp.next
		},
		{ 
			name: 'button--fs', 
			option: 'fullscreenEl',
			onTap: function() {  
				if(_fullscrenAPI.isFullscreen()) {
					_fullscrenAPI.exit();
				} else {
					_fullscrenAPI.enter();
				}
			} 
		},
		{ 
			name: 'preloader', 
			option: 'preloaderEl',
			onInit: function(el) {  
				_loadingIndicator = el;
			} 
		}

	];

	var _setupUIElements = function() {
		var item,
			classAttr,
			uiElement;

		var loopThroughChildElements = function(sChildren) {
			if(!sChildren) {
				return;
			}

			var l = sChildren.length;
			for(var i = 0; i < l; i++) {
				item = sChildren[i];
				classAttr = item.className;

				for(var a = 0; a < _uiElements.length; a++) {
					uiElement = _uiElements[a];

					if(classAttr.indexOf('pswp__' + uiElement.name) > -1  ) {

						if( _options[uiElement.option] ) { // if element is not disabled from options
							
							framework.removeClass(item, 'pswp__element--disabled');
							if(uiElement.onInit) {
								uiElement.onInit(item);
							}
							
							//item.style.display = 'block';
						} else {
							framework.addClass(item, 'pswp__element--disabled');
							//item.style.display = 'none';
						}
					}
				}
			}
		};
		loopThroughChildElements(_controls.children);

		var topBar =  framework.getChildByClass(_controls, 'pswp__top-bar');
		if(topBar) {
			loopThroughChildElements( topBar.children );
		}
	};


	

	ui.init = function() {

		// extend options
		framework.extend(pswp.options, _defaultUIOptions, true);

		// create local link for fast access
		_options = pswp.options;

		// find pswp__ui element
		_controls = framework.getChildByClass(pswp.scrollWrap, 'pswp__ui');

		// create local link
		_listen = pswp.listen;


		_setupHidingControlsDuringGestures();

		// update controls when slides change
		_listen('beforeChange', ui.update);

		// toggle zoom on double-tap
		_listen('doubleTap', function(point) {
			var initialZoomLevel = pswp.currItem.initialZoomLevel;
			if(pswp.getZoomLevel() !== initialZoomLevel) {
				pswp.zoomTo(initialZoomLevel, point, 333);
			} else {
				pswp.zoomTo(_options.getDoubleTapZoom(false, pswp.currItem), point, 333);
			}
		});

		// Allow text selection in caption
		_listen('preventDragEvent', function(e, isDown, preventObj) {
			var t = e.target || e.srcElement;
			if(
				t && 
				t.getAttribute('class') && e.type.indexOf('mouse') > -1 && 
				( t.getAttribute('class').indexOf('__caption') > 0 || (/(SMALL|STRONG|EM)/i).test(t.tagName) ) 
			) {
				preventObj.prevent = false;
			}
		});

		// bind events for UI
		_listen('bindEvents', function() {
			framework.bind(_controls, 'pswpTap click', _onControlsTap);
			framework.bind(pswp.scrollWrap, 'pswpTap', ui.onGlobalTap);

			if(!pswp.likelyTouchDevice) {
				framework.bind(pswp.scrollWrap, 'mouseover', ui.onMouseOver);
			}
		});

		// unbind events for UI
		_listen('unbindEvents', function() {
			if(!_shareModalHidden) {
				_toggleShareModal();
			}

			if(_idleInterval) {
				clearInterval(_idleInterval);
			}
			framework.unbind(document, 'mouseout', _onMouseLeaveWindow);
			framework.unbind(document, 'mousemove', _onIdleMouseMove);
			framework.unbind(_controls, 'pswpTap click', _onControlsTap);
			framework.unbind(pswp.scrollWrap, 'pswpTap', ui.onGlobalTap);
			framework.unbind(pswp.scrollWrap, 'mouseover', ui.onMouseOver);

			if(_fullscrenAPI) {
				framework.unbind(document, _fullscrenAPI.eventK, ui.updateFullscreen);
				if(_fullscrenAPI.isFullscreen()) {
					_options.hideAnimationDuration = 0;
					_fullscrenAPI.exit();
				}
				_fullscrenAPI = null;
			}
		});


		// clean up things when gallery is destroyed
		_listen('destroy', function() {
			if(_options.captionEl) {
				if(_fakeCaptionContainer) {
					_controls.removeChild(_fakeCaptionContainer);
				}
				framework.removeClass(_captionContainer, 'pswp__caption--empty');
			}

			if(_shareModal) {
				_shareModal.children[0].onclick = null;
			}
			framework.removeClass(_controls, 'pswp__ui--over-close');
			framework.addClass( _controls, 'pswp__ui--hidden');
			ui.setIdle(false);
		});
		

		if(!_options.showAnimationDuration) {
			framework.removeClass( _controls, 'pswp__ui--hidden');
		}
		_listen('initialZoomIn', function() {
			if(_options.showAnimationDuration) {
				framework.removeClass( _controls, 'pswp__ui--hidden');
			}
		});
		_listen('initialZoomOut', function() {
			framework.addClass( _controls, 'pswp__ui--hidden');
		});

		_listen('parseVerticalMargin', _applyNavBarGaps);
		
		_setupUIElements();

		if(_options.shareEl && _shareButton && _shareModal) {
			_shareModalHidden = true;
		}

		_countNumItems();

		_setupIdle();

		_setupFullscreenAPI();

		_setupLoadingIndicator();
	};

	ui.setIdle = function(isIdle) {
		_isIdle = isIdle;
		_togglePswpClass(_controls, 'ui--idle', isIdle);
	};

	ui.update = function() {
		// Don't update UI if it's hidden
		if(_controlsVisible && pswp.currItem) {
			
			ui.updateIndexIndicator();

			if(_options.captionEl) {
				_options.addCaptionHTMLFn(pswp.currItem, _captionContainer);

				_togglePswpClass(_captionContainer, 'caption--empty', !pswp.currItem.title);
			}

			_overlayUIUpdated = true;

		} else {
			_overlayUIUpdated = false;
		}

		if(!_shareModalHidden) {
			_toggleShareModal();
		}

		_countNumItems();
	};

	ui.updateFullscreen = function(e) {

		if(e) {
			// some browsers change window scroll position during the fullscreen
			// so PhotoSwipe updates it just in case
			setTimeout(function() {
				pswp.setScrollOffset( 0, framework.getScrollY() );
			}, 50);
		}
		
		// toogle pswp--fs class on root element
		framework[ (_fullscrenAPI.isFullscreen() ? 'add' : 'remove') + 'Class' ](pswp.template, 'pswp--fs');
	};

	ui.updateIndexIndicator = function() {
		if(_options.counterEl) {
			_indexIndicator.innerHTML = (pswp.getCurrentIndex()+1) + 
										_options.indexIndicatorSep + 
										_options.getNumItemsFn();
		}
	};
	
	ui.onGlobalTap = function(e) {
		e = e || window.event;
		var target = e.target || e.srcElement;

		if(_blockControlsTap) {
			return;
		}

		if(e.detail && e.detail.pointerType === 'mouse') {

			// close gallery if clicked outside of the image
			if(_hasCloseClass(target)) {
				pswp.close();
				return;
			}

			if(framework.hasClass(target, 'pswp__img')) {
				if(pswp.getZoomLevel() === 1 && pswp.getZoomLevel() <= pswp.currItem.fitRatio) {
					if(_options.clickToCloseNonZoomable) {
						pswp.close();
					}
				} else {
					pswp.toggleDesktopZoom(e.detail.releasePoint);
				}
			}
			
		} else {

			// tap anywhere (except buttons) to toggle visibility of controls
			if(_options.tapToToggleControls) {
				if(_controlsVisible) {
					ui.hideControls();
				} else {
					ui.showControls();
				}
			}

			// tap to close gallery
			if(_options.tapToClose && (framework.hasClass(target, 'pswp__img') || _hasCloseClass(target)) ) {
				pswp.close();
				return;
			}
			
		}
	};
	ui.onMouseOver = function(e) {
		e = e || window.event;
		var target = e.target || e.srcElement;

		// add class when mouse is over an element that should close the gallery
		_togglePswpClass(_controls, 'ui--over-close', _hasCloseClass(target));
	};

	ui.hideControls = function() {
		framework.addClass(_controls,'pswp__ui--hidden');
		_controlsVisible = false;
	};

	ui.showControls = function() {
		_controlsVisible = true;
		if(!_overlayUIUpdated) {
			ui.update();
		}
		framework.removeClass(_controls,'pswp__ui--hidden');
	};

	ui.supportsFullscreen = function() {
		var d = document;
		return !!(d.exitFullscreen || d.mozCancelFullScreen || d.webkitExitFullscreen || d.msExitFullscreen);
	};

	ui.getFullscreenAPI = function() {
		var dE = document.documentElement,
			api,
			tF = 'fullscreenchange';

		if (dE.requestFullscreen) {
			api = {
				enterK: 'requestFullscreen',
				exitK: 'exitFullscreen',
				elementK: 'fullscreenElement',
				eventK: tF
			};

		} else if(dE.mozRequestFullScreen ) {
			api = {
				enterK: 'mozRequestFullScreen',
				exitK: 'mozCancelFullScreen',
				elementK: 'mozFullScreenElement',
				eventK: 'moz' + tF
			};

			

		} else if(dE.webkitRequestFullscreen) {
			api = {
				enterK: 'webkitRequestFullscreen',
				exitK: 'webkitExitFullscreen',
				elementK: 'webkitFullscreenElement',
				eventK: 'webkit' + tF
			};

		} else if(dE.msRequestFullscreen) {
			api = {
				enterK: 'msRequestFullscreen',
				exitK: 'msExitFullscreen',
				elementK: 'msFullscreenElement',
				eventK: 'MSFullscreenChange'
			};
		}

		if(api) {
			api.enter = function() { 
				// disable close-on-scroll in fullscreen
				_initalCloseOnScrollValue = _options.closeOnScroll; 
				_options.closeOnScroll = false; 

				if(this.enterK === 'webkitRequestFullscreen') {
					pswp.template[this.enterK]( Element.ALLOW_KEYBOARD_INPUT );
				} else {
					return pswp.template[this.enterK](); 
				}
			};
			api.exit = function() { 
				_options.closeOnScroll = _initalCloseOnScrollValue;

				return document[this.exitK](); 

			};
			api.isFullscreen = function() { return document[this.elementK]; };
		}

		return api;
	};



};
return PhotoSwipeUI_Default;


});


/***/ })

}]);
//# sourceMappingURL=data:application/json;charset=utf-8;base64,eyJ2ZXJzaW9uIjozLCJzb3VyY2VzIjpbIndlYnBhY2s6Ly8vLi9ub2RlX21vZHVsZXMvcGhvdG9zd2lwZS9kaXN0L3Bob3Rvc3dpcGUuanMiLCJ3ZWJwYWNrOi8vLy4vbm9kZV9tb2R1bGVzL3Bob3Rvc3dpcGUvc3JjL2Nzcy9kZWZhdWx0LXNraW4vZGVmYXVsdC1za2luLnNjc3MiLCJ3ZWJwYWNrOi8vLy4vbm9kZV9tb2R1bGVzL3Bob3Rvc3dpcGUvc3JjL2Nzcy9tYWluLnNjc3MiLCJ3ZWJwYWNrOi8vLy4vbm9kZV9tb2R1bGVzL3Bob3Rvc3dpcGUvc3JjL2pzL3VpL3Bob3Rvc3dpcGUtdWktZGVmYXVsdC5qcyJdLCJuYW1lcyI6W10sIm1hcHBpbmdzIjoiOzs7Ozs7Ozs7QUFBQTtBQUNBO0FBQ0Esb0NBQW9DO0FBQ3BDLDJCO0FBQ0EsS0FBSyxJQUEwQztBQUMvQyxFQUFFLG9DQUFPLE9BQU87QUFBQTtBQUFBO0FBQUE7QUFBQSxvR0FBQztBQUNqQixFQUFFLE1BQU0sRUFJTjtBQUNGLENBQUM7O0FBRUQ7QUFDQTs7QUFFQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBLGdCQUFnQixpQkFBaUI7QUFDakM7QUFDQTtBQUNBO0FBQ0E7QUFDQSxFQUFFO0FBQ0Y7QUFDQTtBQUNBLEVBQUU7QUFDRjtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQSxFQUFFO0FBQ0Y7QUFDQTtBQUNBO0FBQ0EsRUFBRTtBQUNGO0FBQ0E7QUFDQSxFQUFFO0FBQ0Y7QUFDQTtBQUNBLDRGO0FBQ0EsRUFBRTtBQUNGO0FBQ0E7QUFDQTtBQUNBO0FBQ0EsRUFBRTtBQUNGO0FBQ0E7QUFDQSxFQUFFO0FBQ0Y7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBLEVBQUU7QUFDRjtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0EsSTtBQUNBO0FBQ0E7QUFDQSxFQUFFO0FBQ0Y7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFD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Q0E7QUFDQSxFQUFFO0FBQ0Y7QUFDQTtBQUNBO0FBQ0EsRUFBRTs7QUFFRjtBQUNBO0FBQ0EsaUU7QUFDQTs7QUFFQTtBQUNBLEVBQUU7QUFDRjtBQUNBOztBQUVBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBLEtBQUs7QUFDTDtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7OztBQUdBO0FBQ0E7QUFDQSxFQUFFO0FBQ0Y7QUFDQTs7QUFFQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQSxFQUFFO0FBQ0Y7QUFDQTtBQUNBLEVBQUU7QUFDRjs7QUFFQTtBQUNBO0FBQ0E7O0FBRUE7QUFDQTtBQUNBO0FBQ0EsSTtBQUNBOztBQUVBO0FBQ0E7QUFDQSxFQUFFO0FBQ0Y7QUFDQTtBQUNBO0FBQ0EsRUFBRTs7QUFFRjtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQSxFQUFFO0FBQ0Y7QUFDQTtBQUNBO0FBQ0EsRUFBRTs7QUFFRjtBQUNBO0FBQ0E7QUFDQTtBQUNBLDBCO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQSxHQUFHO0FBQ0gsRUFBRTs7QUFFRjtBQUNBOztBQUVBO0FBQ0E7QUFDQTtBQUNBOzs7QUFHQTtBQUNBO0FBQ0E7O0FBRUE7O0FBRUE7QUFDQSxFQUFFOztBQUVGO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7O0FBRUE7QUFDQTtBQUNBOztBQUVBO0FBQ0E7QUFDQTs7QUFFQTs7QUFFQTtBQUNBLEVBQUU7O0FBRUY7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0EsRUFBRTs7QUFFRjtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0EsRUFBRTtBQUNGO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQSxFQUFFOztBQUVGO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQSxHQUFHO0FBQ0gsa0U7O0FBRUE7QUFDQTtBQUNBO0FBQ0EsSUFBSTtBQUNKO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQSxFQUFFOztBQUVGOztBQUVBO0FBQ0E7QUFDQTtBQUNBO0FBQ0EsNEQ7QUFDQTtBQUNBOztBQUVBO0FBQ0E7O0FBRUE7QUFDQTs7QUFFQTtBQUNBO0FBQ0E7QUFDQTs7QUFFQTtBQUNBO0FBQ0E7QUFDQTs7QUFFQTtBQUNBO0FBQ0E7QUFDQTs7QUFFQTtBQUNBO0FBQ0E7O0FBRUE7QUFDQTtBQUNBO0FBQ0E7QUFDQTs7QUFFQTtBQUNBOzs7QUFHQTtBQUNBO0FBQ0E7O0FBRUE7QUFDQSxFQUFFOztBQUVGO0FBQ0E7QUFDQSwyQztBQUNBO0FBQ0EsR0FBRztBQUNIO0FBQ0E7QUFDQSxJQUFJLDRCO0FBQ0o7QUFDQTtBQUNBOztBQUVBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBLEtBQUs7QUFDTDtBQUNBLEs7QUFDQTtBQUNBO0FBQ0E7QUFDQSxFQUFFOztBQUVGO0FBQ0E7QUFDQTtBQUNBOztBQUVBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQSxFQUFFOztBQUVGO0FBQ0Esa0Q7QUFDQTs7Ozs7Ozs7QUFRQTtBQUNBLG9CQUFvQjtBQUNwQjtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQSxFQUFFO0FBQ0Y7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBLEVBQUU7QUFDRjtBQUNBOztBQUVBO0FBQ0E7QUFDQSxJOztBQUVBO0FBQ0EsRUFBRTtBQUNGO0FBQ0E7QUFDQTs7QUFFQTtBQUNBOztBQUVBLDBDQUEwQztBQUMxQztBQUNBOztBQUVBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTs7QUFFQTtBQUNBO0FBQ0E7QUFDQTtBQUNBOzs7O0FBSUE7O0FBRUE7QUFDQTtBQUNBO0FBQ0E7QUFDQTs7QUFFQTtBQUNBO0FBQ0EsRUFBRTtBQUNGO0FBQ0E7QUFDQSxFQUFFO0FBQ0Y7QUFDQTtBQUNBLEVBQUU7QUFDRjtBQUNBO0FBQ0EsRUFBRTtBQUNGO0FBQ0E7QUFDQSxFQUFFO0FBQ0Y7QUFDQTtBQUNBO0FBQ0E7QUFDQSxFQUFFO0FBQ0Y7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBLEVB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Q0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBOztBQUVBO0FBQ0E7QUFDQSxFQUFFO0FBQ0Y7QUFDQTtBQUNBLEVBQUU7QUFDRjtBQUNBO0FBQ0E7QUFDQTtBQUNBLEVBQUU7QUFDRjtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0EsRUFBRTtBQUNGO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQSxFQUFFO0FBQ0Y7QUFDQTtBQUNBLEVBQUU7O0FBRUY7QUFDQTtBQUNBO0FBQ0E7QUFDQTs7QUFFQTtBQUNBO0FBQ0E7QUFDQTs7QUFFQTtBQUNBO0FBQ0E7O0FBRUE7QUFDQSxFQUFFOztBQUVGLGlCQUFpQjtBQUNqQjtBQUNBOztBQUVBO0FBQ0E7O0FBRUEsRUFBRTtBQUNGO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQSxFQUFFO0FBQ0Y7QUFDQTtBQUNBO0FBQ0EsRUFBRTtBQUNGO0FBQ0E7QUFDQTtBQUNBO0FBQ0EsVztBQUNBO0FBQ0E7QUFDQTtBQUNBLEVBQUU7O0FBRUY7QUFDQSwrREFBK0Q7QUFDL0Q7QUFDQSxFQUFFOzs7QUFHRjtBQUNBLGNBQWM7QUFDZCxjQUFjO0FBQ2Q7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7O0FBRUE7QUFDQTs7QUFFQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7O0FBRUEsSUFBSTtBQUNKO0FBQ0E7QUFDQTtBQUNBLGlDQUFpQztBQUNqQztBQUNBLEdBQUc7QUFDSDtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0EsS0FBSztBQUNMO0FBQ0E7QUFDQTs7QUFFQSxJQUFJO0FBQ0o7QUFDQTtBQUNBLEVBQUU7O0FBRUY7O0FBRUE7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBOztBQUVBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBLEdBQUc7QUFDSDtBQUNBOztBQUVBOztBQUVBO0FBQ0E7OztBQUdBOztBQUVBOztBQUVBLElBQUk7O0FBRUo7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBOztBQUVBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBLE1BQU07QUFDTjtBQUNBO0FBQ0E7O0FBRUE7O0FBRUEsS0FBSzs7QUFFTDtBQUNBO0FBQ0E7QUFDQTtBQUNBOztBQUVBO0FBQ0E7O0FBRUE7QUFDQTtBQUNBOztBQUVBLE1BQU07QUFDTjtBQUNBO0FBQ0E7QUFDQTs7QUFFQTs7O0FBR0E7QUFDQTs7QUFFQTs7QUFFQTtBQUNBO0FBQ0E7QUFDQTtBQUNBLE1BQU07QUFDTjtBQUNBO0FBQ0E7O0FBRUE7QUFDQTtBQUNBO0FBQ0EsTUFBTTtBQUNOO0FBQ0E7QUFDQTs7QUFFQTtBQUNBOztBQUVBOztBQUVBOztBQUVBO0FBQ0E7QUFDQTs7QUFFQTtBQUNBOzs7QUFHQTs7QUFFQSxFQUFFOztBQUVGO0FBQ0E7O0FBRUE7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTs7QUFFQTtBQUNBO0FBQ0E7QUFDQTs7QUFFQTtBQUNBO0FBQ0E7O0FBRUE7QUFDQTtBQUNBOzs7O0FBSUE7O0FBRUE7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBLGtDQUFrQztBQUNsQzs7OztBQUlBO0FBQ0E7O0FBRUE7O0FBRUE7O0FBRUE7QUFDQTs7OztBQUlBO0FBQ0E7O0FBRUE7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTs7QUFFQTs7QUFFQTs7QUFFQTs7QUFFQTtBQUNBO0FBQ0E7O0FBRUE7QUFDQTs7QUFFQTtBQUNBO0FBQ0E7QUFDQSxJQUFJOztBQUVKOztBQUVBO0FBQ0E7O0FBRUE7QUFDQTtBQUNBOztBQUVBOztBQUVBO0FBQ0E7QUFDQTtBQUNBLHdCQUF3Qjs7QUFFeEI7QUFDQTs7QUFFQTs7QUFFQTtBQUNBOztBQUVBOztBQUVBO0FBQ0E7QUFDQTtBQUNBOzs7QUFHQSxFQUFFOztBQUVGO0FBQ0E7O0FBRUE7O0FBRUE7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBLGtCO0FBQ0E7QUFDQTs7QUFFQTtBQUNBO0FBQ0E7O0FBRUE7QUFDQTtBQUNBO0FBQ0EsS0FBSztBQUNMO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBOztBQUVBLElBQUk7QUFDSjtBQUNBO0FBQ0EsRztBQUNBLEVBQUU7QUFDRjtBQUNBOztBQUVBO0FBQ0E7QUFDQTs7QUFFQTs7QUFFQTtBQUNBO0FBQ0E7O0FBRUE7O0FBRUE7QUFDQTs7QUFFQTtBQUNBOztBQUVBO0FBQ0E7O0FBRUE7QUFDQTtBQUNBO0FBQ0E7O0FBRUE7OztBQUdBO0FBQ0E7QUFDQTtBQUNBOztBQUVBO0FBQ0E7O0FBRUE7O0FBRUE7QUFDQTtBQUNBO0FBQ0E7O0FBRUE7QUFDQTtBQUNBO0FBQ0E7O0FBRUE7O0FBRUE7QUFDQTtBQUNBO0FBQ0E7O0FBRUE7QUFDQTtBQUNBO0FBQ0EsS0FBSztBQUNMO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTs7QUFFQSxJQUFJO0FBQ0o7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7O0FBRUE7QUFDQTtBQUNBOztBQUVBO0FBQ0E7O0FBRUE7QUFDQTs7QUFFQTtBQUNBO0FBQ0E7QUFDQTs7QUFFQTtBQUNBOztBQUVBO0FBQ0E7QUFDQTs7QUFFQSxHQUFHOztBQUVIOztBQUVBO0FBQ0E7QUFDQTs7QUFFQTtBQUNBOztBQUVBOztBQUVBO0FBQ0E7QUFDQTs7QUFFQTtBQUNBO0FBQ0E7QUFDQTs7QUFFQTtBQUNBOztBQUVBO0FBQ0E7QUFDQTtBQUNBOztBQUVBO0FBQ0E7QUFDQTtBQUNBOztBQUVBOztBQUVBO0FBQ0E7O0FBRUE7QUFDQTtBQUNBO0FBQ0E7QUFDQTs7QUFFQTs7QUFFQTtBQUNBOztBQUVBO0FBQ0E7QUFDQTs7QUFFQTtBQUNBO0FBQ0E7O0FBRUE7O0FBRUEsRUFBRTs7QUFFRjtBQUNBOztBQUVBOztBQUVBO0FBQ0E7QUFDQTs7QUFFQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0EsS0FBSztBQUNMOztBQUVBOztBQUVBOztBQUVBO0FBQ0E7QUFDQTs7QUFFQTs7QUFFQTtBQUNBOztBQUVBO0FBQ0E7O0FBRUE7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7O0FBRUE7QUFDQTtBQUNBO0FBQ0EsS0FBSztBQUNMO0FBQ0E7O0FBRUE7QUFDQTs7QUFFQTtBQUNBO0FBQ0E7O0FBRUE7QUFDQTtBQUNBOztBQUVBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7O0FBRUE7QUFDQTtBQUNBO0FBQ0EsRzs7O0FBR0E7QUFDQTtBQUNBO0FBQ0E7QUFDQSxxQkFBcUI7QUFDckIsS0FBSztBQUNMLHFCQUFxQjtBQUNyQixLO0FBQ0E7O0FBRUE7QUFDQTs7QUFFQTtBQUNBOztBQUVBO0FBQ0E7QUFDQTtBQUNBOztBQUVBOztBQUVBO0FBQ0E7QUFDQTtBQUNBLElBQUk7QUFDSjtBQUNBO0FBQ0E7QUFDQTs7QUFFQTtBQUNBO0FBQ0EsR0FBRztBQUNIO0FBQ0E7O0FBRUE7QUFDQTs7QUFFQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7O0FBRUE7QUFDQTtBQUNBO0FBQ0E7QUFDQTs7QUFFQTs7O0FBR0E7QUFDQTtBQUNBOztBQUVBOzs7QUFHQTs7QUFFQTs7QUFFQTtBQUNBO0FBQ0EsSUFBSTtBQUNKO0FBQ0E7O0FBRUE7O0FBRUE7O0FBRUE7QUFDQTtBQUNBLEtBQUs7O0FBRUw7QUFDQTs7QUFFQTtBQUNBOzs7QUFHQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBOztBQUVBO0FBQ0E7QUFDQTtBQUNBOztBQUVBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7O0FBRUE7QUFDQTtBQUNBO0FBQ0E7QUFDQSxFQUFFOzs7QUFHRjtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7O0FBRUE7QUFDQTtBQUNBLHNCQUFzQjtBQUN0QixvQkFBb0I7QUFDcEIscUJBQXFCO0FBQ3JCLHFCQUFxQjtBQUNyQiw0QkFBNEI7QUFDNUIsOEJBQThCO0FBQzlCLGlDQUFpQztBQUNqQyxzQkFBc0I7QUFDdEIsMEJBQTBCO0FBQzFCLHNCQUFzQjtBQUN0Qjs7O0FBR0E7QUFDQTtBQUNBO0FBQ0EsS0FBSztBQUNMLCtEQUErRDtBQUMvRDtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQSxLQUFLO0FBQ0w7QUFDQTtBQUNBO0FBQ0E7QUFDQTs7QUFFQTtBQUNBO0FBQ0E7QUFDQSxJQUFJOztBQUVKO0FBQ0E7O0FBRUE7QUFDQTs7QUFFQSxNQUFNO0FBQ047QUFDQTs7QUFFQTtBQUNBO0FBQ0E7QUFDQTs7QUFFQTtBQUNBOztBQUVBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTs7QUFFQTtBQUNBO0FBQ0E7QUFDQSxJQUFJOztBQUVKO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTs7QUFFQTtBQUNBO0FBQ0E7O0FBRUE7QUFDQSxJQUFJOztBQUVKO0FBQ0E7QUFDQTs7QUFFQTtBQUNBO0FBQ0E7O0FBRUE7QUFDQTs7QUFFQTs7QUFFQTtBQUNBOzs7QUFHQTs7QUFFQTtBQUNBO0FBQ0E7QUFDQTs7QUFFQTtBQUNBO0FBQ0E7QUFDQTs7QUFFQTtBQUNBO0FBQ0E7QUFDQSxFQUFFOztBQUVGO0FBQ0E7QUFDQTs7QUFFQTs7QUFFQTtBQUNBOztBQUVBO0FBQ0E7QUFDQTs7QUFFQTtBQUNBO0FBQ0E7QUFDQTtBQUNBOztBQUVBO0FBQ0E7QUFDQTtBQUNBO0FBQ0EsRUFBRTs7O0FBR0Y7QUFDQTtBQUNBO0FBQ0E7QUFDQTs7OztBQUlBOztBQUVBO0FBQ0E7QUFDQTs7QUFFQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQSxJQUFJO0FBQ0o7QUFDQTtBQUNBO0FBQ0E7QUFDQTs7QUFFQTs7QUFFQTs7QUFFQTs7QUFFQTtBQUNBO0FBQ0E7QUFDQSxJQUFJO0FBQ0o7QUFDQTtBQUNBOztBQUVBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7Ozs7QUFJQTs7QUFFQTtBQUNBO0FBQ0E7OztBQUdBO0FBQ0E7QUFDQSw0QjtBQUNBLEdBQUc7QUFDSDtBQUNBO0FBQ0E7O0FBRUE7QUFDQTtBQUNBOztBQUVBO0FBQ0E7QUFDQTs7QUFFQTs7QUFFQTs7QUFFQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7O0FBRUE7QUFDQTtBQUNBOztBQUVBO0FBQ0E7QUFDQTs7QUFFQTtBQUNBO0FBQ0E7O0FBRUE7QUFDQSxFQUFFOztBQUVGO0FBQ0E7QUFDQSxFQUFFOztBQUVGO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7O0FBRUE7QUFDQTtBQUNBLEdBQUc7QUFDSDtBQUNBOztBQUVBO0FBQ0E7QUFDQTs7QUFFQTtBQUNBO0FBQ0E7QUFDQTtBQUNBOztBQUVBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7O0FBRUE7QUFDQTtBQUNBOzs7QUFHQTtBQUNBOztBQUVBOztBQUVBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0EsS0FBSztBQUNMO0FBQ0E7QUFDQTs7QUFFQTtBQUNBO0FBQ0E7QUFDQTtBQUNBOztBQUVBO0FBQ0E7QUFDQTtBQUNBO0FBQ0EsS0FBSztBQUNMO0FBQ0E7QUFDQSxJQUFJO0FBQ0o7QUFDQTtBQUNBLElBQUk7QUFDSixpRDtBQUNBOztBQUVBO0FBQ0E7O0FBRUE7QUFDQTtBQUNBO0FBQ0E7QUFDQSwrQzs7QUFFQTtBQUNBO0FBQ0Esd0RBQXdEOztBQUV4RDtBQUNBO0FBQ0E7O0FBRUE7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTs7QUFFQTtBQUNBO0FBQ0E7QUFDQTtBQUNBOztBQUVBO0FBQ0EsQ0FBQzs7O0FBR0Q7O0FBRUE7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTs7O0FBR0E7QUFDQTs7QUFFQTtBQUNBO0FBQ0E7O0FBRUE7QUFDQTs7QUFFQSxvQ0FBb0MsU0FBUztBQUM3QztBQUNBLGtCO0FBQ0E7QUFDQTtBQUNBO0FBQ0EsR0FBRztBQUNIO0FBQ0E7O0FBRUE7O0FBRUE7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0EsSUFBSTtBQUNKO0FBQ0E7QUFDQTs7QUFFQTtBQUNBO0FBQ0E7QUFDQTtBQUNBOztBQUVBO0FBQ0E7O0FBRUE7O0FBRUE7QUFDQTtBQUNBOztBQUVBO0FBQ0E7O0FBRUE7QUFDQTtBQUNBO0FBQ0EsS0FBSztBQUNMLElBQUk7QUFDSjtBQUNBOztBQUVBO0FBQ0E7O0FBRUE7QUFDQTtBQUNBOztBQUVBO0FBQ0E7QUFDQTtBQUNBOztBQUVBO0FBQ0E7QUFDQTtBQUNBOztBQUVBO0FBQ0E7QUFDQTs7QUFFQTs7QUFFQTtBQUNBO0FBQ0E7O0FBRUE7QUFDQTtBQUNBO0FBQ0EsS0FBSztBQUNMO0FBQ0E7QUFDQSxNQUFNO0FBQ047QUFDQTs7QUFFQTs7QUFFQTs7O0FBR0E7O0FBRUE7QUFDQTtBQUNBO0FBQ0E7O0FBRUE7QUFDQTtBQUNBO0FBQ0E7O0FBRUE7QUFDQTtBQUNBLE1BQU07QUFDTjtBQUNBOztBQUVBO0FBQ0EsS0FBSzs7QUFFTDtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0EsT0FBTztBQUNQO0FBQ0E7QUFDQTs7QUFFQTtBQUNBO0FBQ0E7QUFDQTtBQUNBLFFBQVE7QUFDUjtBQUNBO0FBQ0E7QUFDQTs7QUFFQTtBQUNBO0FBQ0E7QUFDQSxRQUFRO0FBQ1I7QUFDQTtBQUNBOztBQUVBO0FBQ0E7QUFDQSxNQUFNO0FBQ047QUFDQTtBQUNBO0FBQ0E7O0FBRUEsSUFBSSxpQkFBaUI7QUFDckI7QUFDQTtBQUNBO0FBQ0E7OztBQUdBOztBQUVBOztBQUVBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTs7QUFFQTtBQUNBLHNCQUFzQjtBQUN0QjtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7OztBQUdBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQSxXQUFXLFFBQVE7QUFDbkIsUUFBUSxRQUFRO0FBQ2hCLFFBQVE7QUFDUjtBQUNBLEVBQUU7QUFDRjtBQUNBOztBQUVBO0FBQ0E7QUFDQTs7QUFFQTtBQUNBO0FBQ0E7QUFDQTs7QUFFQTtBQUNBO0FBQ0E7O0FBRUE7QUFDQTtBQUNBO0FBQ0EsRUFBRTtBQUNGOztBQUVBO0FBQ0E7O0FBRUE7QUFDQTtBQUNBLGtCQUFrQjtBQUNsQjtBQUNBO0FBQ0E7QUFDQTs7O0FBR0E7QUFDQTs7QUFFQTtBQUNBO0FBQ0E7O0FBRUE7QUFDQTs7QUFFQTs7QUFFQTtBQUNBO0FBQ0EsS0FBSztBQUNMO0FBQ0E7O0FBRUE7QUFDQTtBQUNBOztBQUVBOztBQUVBO0FBQ0E7QUFDQSxvQztBQUNBO0FBQ0E7O0FBRUE7QUFDQTtBQUNBOztBQUVBOztBQUVBO0FBQ0E7QUFDQTs7QUFFQTtBQUNBLEdBQUc7QUFDSDtBQUNBO0FBQ0E7QUFDQTs7QUFFQTtBQUNBO0FBQ0E7O0FBRUEsRUFBRTs7Ozs7QUFLRjs7O0FBR0E7QUFDQTtBQUNBOztBQUVBOztBQUVBO0FBQ0E7O0FBRUE7O0FBRUE7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0EsS0FBSztBQUNMO0FBQ0E7QUFDQSxFQUFFOzs7O0FBSUY7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7O0FBRUE7QUFDQTtBQUNBLElBQUk7QUFDSixvQkFBb0I7QUFDcEI7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBLEk7O0FBRUEscUJBQXFCOztBQUVyQjtBQUNBLEVBQUU7QUFDRjtBQUNBOztBQUVBO0FBQ0E7QUFDQTs7QUFFQTtBQUNBOztBQUVBO0FBQ0EsRUFBRTtBQUNGO0FBQ0E7QUFDQTtBQUNBOztBQUVBO0FBQ0E7QUFDQTs7QUFFQTtBQUNBOztBQUVBO0FBQ0E7QUFDQTtBQUNBOztBQUVBO0FBQ0E7QUFDQSxFQUFFO0FBQ0Y7O0FBRUE7QUFDQTs7QUFFQSxpQkFBaUIsZ0NBQWdDO0FBQ2pEO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7Ozs7QUFJQTs7QUFFQTs7QUFFQTtBQUNBO0FBQ0E7O0FBRUE7QUFDQTtBQUNBOztBQUVBOztBQUVBO0FBQ0E7QUFDQTs7QUFFQTtBQUNBLEdBQUc7QUFDSDtBQUNBO0FBQ0E7QUFDQTtBQUNBLHlDQUF5Qzs7OztBQUl6QztBQUNBO0FBQ0EsMEJBQTBCO0FBQzFCOztBQUVBOztBQUVBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7OztBQUdBLGNBQWMsOENBQThDO0FBQzVEO0FBQ0E7QUFDQSxjQUFjLDhDQUE4QztBQUM1RDtBQUNBO0FBQ0EsSUFBSTs7QUFFSjtBQUNBO0FBQ0EsSUFBSTs7QUFFSjtBQUNBOzs7O0FBSUE7QUFDQTtBQUNBLGtCQUFrQixtQkFBbUI7QUFDckM7QUFDQTtBQUNBO0FBQ0EsNEI7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQSxJQUFJO0FBQ0osR0FBRzs7O0FBR0g7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBLEdBQUc7O0FBRUg7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBOztBQUVBO0FBQ0EsK0c7QUFDQTtBQUNBLEdBQUc7O0FBRUg7O0FBRUE7QUFDQTtBQUNBOztBQUVBO0FBQ0E7QUFDQTtBQUNBOztBQUVBO0FBQ0E7O0FBRUE7QUFDQTtBQUNBO0FBQ0E7O0FBRUE7QUFDQTs7QUFFQTtBQUNBOztBQUVBO0FBQ0Esd0U7Ozs7QUFJQTtBQUNBO0FBQ0E7QUFDQSxLQUFLO0FBQ0w7QUFDQTtBQUNBOztBQUVBOztBQUVBOztBQUVBOztBQUVBOztBQUVBO0FBQ0E7QUFDQTtBQUNBOztBQUVBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTs7QUFFQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQSxTQUFTO0FBQ1QsUUFBUTtBQUNSO0FBQ0E7QUFDQSxPQUFPO0FBQ1A7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7O0FBRUE7QUFDQSxxQkFBcUI7O0FBRXJCO0FBQ0E7O0FBRUE7O0FBRUEsbUU7QUFDQTs7QUFFQTtBQUNBO0FBQ0E7QUFDQTs7QUFFQTs7QUFFQTtBQUNBOztBQUVBOzs7OztBQUtBO0FBQ0E7QUFDQTs7O0FBR0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0EsT0FBTztBQUNQLE1BQU07QUFDTjtBQUNBO0FBQ0E7O0FBRUEsSUFBSTtBQUNKO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBOzs7QUFHQTtBQUNBO0FBQ0E7QUFDQSxJQUFJO0FBQ0o7QUFDQTs7QUFFQTtBQUNBO0FBQ0EsR0FBRzs7QUFFSDtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7O0FBRUE7QUFDQSxDQUFDOztBQUVEOztBQUVBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBOztBQUVBO0FBQ0EscUJBQXFCO0FBQ3JCLHFFO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7O0FBRUE7QUFDQTtBQUNBOztBQUVBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQSxJQUFJO0FBQ0osR0FBRztBQUNIO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQSxHQUFHO0FBQ0g7QUFDQTtBQUNBO0FBQ0E7O0FBRUE7QUFDQTtBQUNBO0FBQ0E7QUFDQTs7QUFFQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7O0FBRUE7QUFDQTtBQUNBO0FBQ0E7O0FBRUE7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBOztBQUVBOztBQUVBO0FBQ0E7QUFDQTtBQUNBLEtBQUs7QUFDTDtBQUNBO0FBQ0E7QUFDQSxDQUFDOztBQUVEOztBQUVBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7O0FBRUE7O0FBRUE7O0FBRUE7O0FBRUE7O0FBRUE7QUFDQTtBQUNBO0FBQ0E7O0FBRUE7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBLEtBQUs7QUFDTCxJQUFJO0FBQ0o7QUFDQTs7QUFFQSxHQUFHOztBQUVIOztBQUVBOztBQUVBOztBQUVBO0FBQ0E7QUFDQSxJQUFJOztBQUVKO0FBQ0E7QUFDQTtBQUNBO0FBQ0EsSUFBSTs7QUFFSjs7QUFFQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0EsTUFBTTtBQUNOO0FBQ0E7QUFDQTtBQUNBLEtBQUs7QUFDTDtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7O0FBRUE7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQSxJQUFJO0FBQ0o7O0FBRUE7QUFDQTtBQUNBOztBQUVBLEdBQUc7O0FBRUg7O0FBRUE7QUFDQTs7QUFFQTtBQUNBO0FBQ0EsTUFBTTtBQUNOO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7O0FBRUE7QUFDQTtBQUNBOztBQUVBO0FBQ0E7O0FBRUE7QUFDQTs7QUFFQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0EsS0FBSztBQUNMO0FBQ0E7QUFDQTtBQUNBLElBQUk7QUFDSjtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0EsS0FBSztBQUNMO0FBQ0E7QUFDQSxJQUFJO0FBQ0o7QUFDQSxJQUFJO0FBQ0o7QUFDQTs7QUFFQTs7QUFFQTtBQUNBOztBQUVBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7O0FBRUE7QUFDQTtBQUNBLEdBQUc7O0FBRUg7QUFDQSxpQ0FBaUM7O0FBRWpDO0FBQ0E7O0FBRUE7O0FBRUE7QUFDQTtBQUNBOztBQUVBO0FBQ0EsQ0FBQzs7O0FBR0Q7O0FBRUE7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7OztBQUdBO0FBQ0E7QUFDQTtBQUNBOztBQUVBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7O0FBRUE7O0FBRUE7QUFDQTtBQUNBLEVBQUU7QUFDRjs7QUFFQTtBQUNBO0FBQ0E7O0FBRUE7QUFDQTtBQUNBO0FBQ0EsRUFBRTs7QUFFRjtBQUNBO0FBQ0E7QUFDQTtBQUNBOztBQUVBLHVCQUF1QjtBQUN2QjtBQUNBOztBQUVBO0FBQ0EsYUFBYSxpQkFBaUI7QUFDOUI7QUFDQTtBQUNBO0FBQ0EsaUM7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0Esa0JBQWtCO0FBQ2xCLGFBQWEsbUJBQW1CO0FBQ2hDO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQSxHQUFHO0FBQ0g7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0EsRUFBRTtBQUNGOztBQUVBO0FBQ0E7QUFDQTs7O0FBR0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBOztBQUVBO0FBQ0E7QUFDQSxHQUFHO0FBQ0g7QUFDQTs7O0FBR0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7O0FBRUE7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBOztBQUVBOztBQUVBOztBQUVBO0FBQ0E7QUFDQTs7QUFFQSxHQUFHO0FBQ0g7QUFDQTtBQUNBLElBQUk7QUFDSjtBQUNBO0FBQ0E7Ozs7QUFJQTtBQUNBO0FBQ0E7QUFDQSxHQUFHO0FBQ0g7Ozs7OztBQU1BOzs7O0FBSUE7QUFDQTs7QUFFQTs7QUFFQTtBQUNBO0FBQ0E7OztBQUdBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTs7O0FBR0E7QUFDQTtBQUNBO0FBQ0E7OztBQUdBO0FBQ0E7QUFDQTtBQUNBLElBQUk7OztBQUdKO0FBQ0E7QUFDQTs7QUFFQTtBQUNBO0FBQ0EsTUFBTTs7QUFFTjtBQUNBO0FBQ0EsT0FBTztBQUNQOztBQUVBO0FBQ0E7QUFDQSxRQUFRO0FBQ1I7QUFDQTtBQUNBO0FBQ0E7O0FBRUE7O0FBRUE7QUFDQTs7O0FBR0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0EsSUFBSTtBQUNKO0FBQ0E7QUFDQTtBQUNBO0FBQ0EsSUFBSTtBQUNKO0FBQ0E7QUFDQSxJQUFJOzs7OztBQUtKO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBOzs7QUFHQTtBQUNBLGlCQUFpQjtBQUNqQjtBQUNBO0FBQ0EsSUFBSTs7QUFFSixHQUFHO0FBQ0g7O0FBRUE7O0FBRUE7QUFDQTtBQUNBO0FBQ0E7QUFDQTs7QUFFQTtBQUNBO0FBQ0E7QUFDQTs7QUFFQSxHQUFHO0FBQ0g7O0FBRUE7QUFDQTs7QUFFQTs7O0FBR0E7QUFDQTtBQUNBOztBQUVBO0FBQ0Esa0JBQWtCO0FBQ2xCLElBQUk7QUFDSjtBQUNBO0FBQ0E7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R0FBRztBQUNIO0FBQ0E7QUFDQSxHQUFHOztBQUVIOztBQUVBOztBQUVBO0FBQ0E7QUFDQTs7QUFFQTs7QUFFQTs7QUFFQTs7QUFFQTtBQUNBOztBQUVBO0FBQ0E7QUFDQTtBQUNBOztBQUVBO0FBQ0E7QUFDQTs7QUFFQTs7QUFFQTtBQUNBOztBQUVBO0FBQ0E7O0FBRUE7O0FBRUEsR0FBRztBQUNIO0FBQ0E7O0FBRUE7QUFDQTtBQUNBOztBQUVBO0FBQ0E7O0FBRUE7O0FBRUE7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBLElBQUk7QUFDSjs7QUFFQTtBQUNBO0FBQ0E7O0FBRUE7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7O0FBRUE7QUFDQTtBQUNBOztBQUVBO0FBQ0E7QUFDQTs7QUFFQTs7QUFFQTtBQUNBO0FBQ0E7QUFDQTtBQUNBOztBQUVBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQSxLQUFLO0FBQ0w7QUFDQTtBQUNBOztBQUVBLEdBQUc7O0FBRUg7QUFDQTtBQUNBO0FBQ0E7QUFDQSxLQUFLO0FBQ0w7QUFDQTtBQUNBOztBQUVBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7O0FBRUE7QUFDQTtBQUNBO0FBQ0E7QUFDQTs7QUFFQTtBQUNBO0FBQ0E7O0FBRUE7QUFDQTtBQUNBO0FBQ0E7O0FBRUE7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7O0FBRUE7QUFDQTtBQUNBO0FBQ0E7O0FBRUE7QUFDQTtBQUNBO0FBQ0E7O0FBRUE7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7O0FBRUEsR0FBRztBQUNIO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTs7OztBQUlBLEdBQUc7QUFDSDtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7O0FBRUEsR0FBRztBQUNIO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBOztBQUVBO0FBQ0EsMkI7QUFDQTtBQUNBLHVEO0FBQ0EsbUM7O0FBRUE7QUFDQTtBQUNBLEtBQUs7QUFDTCx5QztBQUNBO0FBQ0E7QUFDQSwwQjtBQUNBOztBQUVBLGtDOztBQUVBO0FBQ0Esa0NBQWtDLGdDQUFnQztBQUNsRTs7QUFFQTtBQUNBOzs7O0FBSUE7QUFDQTs7O0FBR0EsQ0FBQyIsImZpbGUiOiIxLmpzIiwic291cmNlc0NvbnRlbnQiOlsiLyohIFBob3RvU3dpcGUgLSB2NC4xLjMgLSAyMDE5LTAxLTA4XG4qIGh0dHA6Ly9waG90b3N3aXBlLmNvbVxuKiBDb3B5cmlnaHQgKGMpIDIwMTkgRG1pdHJ5IFNlbWVub3Y7ICovXG4oZnVuY3Rpb24gKHJvb3QsIGZhY3RvcnkpIHsgXG5cdGlmICh0eXBlb2YgZGVmaW5lID09PSAnZnVuY3Rpb24nICYmIGRlZmluZS5hbWQpIHtcblx0XHRkZWZpbmUoZmFjdG9yeSk7XG5cdH0gZWxzZSBpZiAodHlwZW9mIGV4cG9ydHMgPT09ICdvYmplY3QnKSB7XG5cdFx0bW9kdWxlLmV4cG9ydHMgPSBmYWN0b3J5KCk7XG5cdH0gZWxzZSB7XG5cdFx0cm9vdC5QaG90b1N3aXBlID0gZmFjdG9yeSgpO1xuXHR9XG59KSh0aGlzLCBmdW5jdGlvbiAoKSB7XG5cblx0J3VzZSBzdHJpY3QnO1xuXHR2YXIgUGhvdG9Td2lwZSA9IGZ1bmN0aW9uKHRlbXBsYXRlLCBVaUNsYXNzLCBpdGVtcywgb3B0aW9ucyl7XG5cbi8qPj5mcmFtZXdvcmstYnJpZGdlKi9cbi8qKlxuICpcbiAqIFNldCBvZiBnZW5lcmljIGZ1bmN0aW9ucyB1c2VkIGJ5IGdhbGxlcnkuXG4gKiBcbiAqIFlvdSdyZSBmcmVlIHRvIG1vZGlmeSBhbnl0aGluZyBoZXJlIGFzIGxvbmcgYXMgZnVuY3Rpb25hbGl0eSBpcyBrZXB0LlxuICogXG4gKi9cbnZhciBmcmFtZXdvcmsgPSB7XG5cdGZlYXR1cmVzOiBudWxsLFxuXHRiaW5kOiBmdW5jdGlvbih0YXJnZXQsIHR5cGUsIGxpc3RlbmVyLCB1bmJpbmQpIHtcblx0XHR2YXIgbWV0aG9kTmFtZSA9ICh1bmJpbmQgPyAncmVtb3ZlJyA6ICdhZGQnKSArICdFdmVudExpc3RlbmVyJztcblx0XHR0eXBlID0gdHlwZS5zcGxpdCgnICcpO1xuXHRcdGZvcih2YXIgaSA9IDA7IGkgPCB0eXBlLmxlbmd0aDsgaSsrKSB7XG5cdFx0XHRpZih0eXBlW2ldKSB7XG5cdFx0XHRcdHRhcmdldFttZXRob2ROYW1lXSggdHlwZVtpXSwgbGlzdGVuZXIsIGZhbHNlKTtcblx0XHRcdH1cblx0XHR9XG5cdH0sXG5cdGlzQXJyYXk6IGZ1bmN0aW9uKG9iaikge1xuXHRcdHJldHVybiAob2JqIGluc3RhbmNlb2YgQXJyYXkpO1xuXHR9LFxuXHRjcmVhdGVFbDogZnVuY3Rpb24oY2xhc3NlcywgdGFnKSB7XG5cdFx0dmFyIGVsID0gZG9jdW1lbnQuY3JlYXRlRWxlbWVudCh0YWcgfHwgJ2RpdicpO1xuXHRcdGlmKGNsYXNzZXMpIHtcblx0XHRcdGVsLmNsYXNzTmFtZSA9IGNsYXNzZXM7XG5cdFx0fVxuXHRcdHJldHVybiBlbDtcblx0fSxcblx0Z2V0U2Nyb2xsWTogZnVuY3Rpb24oKSB7XG5cdFx0dmFyIHlPZmZzZXQgPSB3aW5kb3cucGFnZVlPZmZzZXQ7XG5cdFx0cmV0dXJuIHlPZmZzZXQgIT09IHVuZGVmaW5lZCA/IHlPZmZzZXQgOiBkb2N1bWVudC5kb2N1bWVudEVsZW1lbnQuc2Nyb2xsVG9wO1xuXHR9LFxuXHR1bmJpbmQ6IGZ1bmN0aW9uKHRhcmdldCwgdHlwZSwgbGlzdGVuZXIpIHtcblx0XHRmcmFtZXdvcmsuYmluZCh0YXJnZXQsdHlwZSxsaXN0ZW5lcix0cnVlKTtcblx0fSxcblx0cmVtb3ZlQ2xhc3M6IGZ1bmN0aW9uKGVsLCBjbGFzc05hbWUpIHtcblx0XHR2YXIgcmVnID0gbmV3IFJlZ0V4cCgnKFxcXFxzfF4pJyArIGNsYXNzTmFtZSArICcoXFxcXHN8JCknKTtcblx0XHRlbC5jbGFzc05hbWUgPSBlbC5jbGFzc05hbWUucmVwbGFjZShyZWcsICcgJykucmVwbGFjZSgvXlxcc1xccyovLCAnJykucmVwbGFjZSgvXFxzXFxzKiQvLCAnJyk7IFxuXHR9LFxuXHRhZGRDbGFzczogZnVuY3Rpb24oZWwsIGNsYXNzTmFtZSkge1xuXHRcdGlmKCAhZnJhbWV3b3JrLmhhc0NsYXNzKGVsLGNsYXNzTmFtZSkgKSB7XG5cdFx0XHRlbC5jbGFzc05hbWUgKz0gKGVsLmNsYXNzTmFtZSA/ICcgJyA6ICcnKSArIGNsYXNzTmFtZTtcblx0XHR9XG5cdH0sXG5cdGhhc0NsYXNzOiBmdW5jdGlvbihlbCwgY2xhc3NOYW1lKSB7XG5cdFx0cmV0dXJuIGVsLmNsYXNzTmFtZSAmJiBuZXcgUmVnRXhwKCcoXnxcXFxccyknICsgY2xhc3NOYW1lICsgJyhcXFxcc3wkKScpLnRlc3QoZWwuY2xhc3NOYW1lKTtcblx0fSxcblx0Z2V0Q2hpbGRCeUNsYXNzOiBmdW5jdGlvbihwYXJlbnRFbCwgY2hpbGRDbGFzc05hbWUpIHtcblx0XHR2YXIgbm9kZSA9IHBhcmVudEVsLmZpcnN0Q2hpbGQ7XG5cdFx0d2hpbGUobm9kZSkge1xuXHRcdFx0aWYoIGZyYW1ld29yay5oYXNDbGFzcyhub2RlLCBjaGlsZENsYXNzTmFtZSkgKSB7XG5cdFx0XHRcdHJldHVybiBub2RlO1xuXHRcdFx0fVxuXHRcdFx0bm9kZSA9IG5vZGUubmV4dFNpYmxpbmc7XG5cdFx0fVxuXHR9LFxuXHRhcnJheVNlYXJjaDogZnVuY3Rpb24oYXJyYXksIHZhbHVlLCBrZXkpIHtcblx0XHR2YXIgaSA9IGFycmF5Lmxlbmd0aDtcblx0XHR3aGlsZShpLS0pIHtcblx0XHRcdGlmKGFycmF5W2ldW2tleV0gPT09IHZhbHVlKSB7XG5cdFx0XHRcdHJldHVybiBpO1xuXHRcdFx0fSBcblx0XHR9XG5cdFx0cmV0dXJuIC0xO1xuXHR9LFxuXHRleHRlbmQ6IGZ1bmN0aW9uKG8xLCBvMiwgcHJldmVudE92ZXJ3cml0ZSkge1xuXHRcdGZvciAodmFyIHByb3AgaW4gbzIpIHtcblx0XHRcdGlmIChvMi5oYXNPd25Qcm9wZXJ0eShwcm9wKSkge1xuXHRcdFx0XHRpZihwcmV2ZW50T3ZlcndyaXRlICYmIG8xLmhhc093blByb3BlcnR5KHByb3ApKSB7XG5cdFx0XHRcdFx0Y29udGludWU7XG5cdFx0XHRcdH1cblx0XHRcdFx0bzFbcHJvcF0gPSBvMltwcm9wXTtcblx0XHRcdH1cblx0XHR9XG5cdH0sXG5cdGVhc2luZzoge1xuXHRcdHNpbmU6IHtcblx0XHRcdG91dDogZnVuY3Rpb24oaykge1xuXHRcdFx0XHRyZXR1cm4gTWF0aC5zaW4oayAqIChNYXRoLlBJIC8gMikpO1xuXHRcdFx0fSxcblx0XHRcdGluT3V0OiBmdW5jdGlvbihrKSB7XG5cdFx0XHRcdHJldHVybiAtIChNYXRoLmNvcyhNYXRoLlBJICogaykgLSAxKSAvIDI7XG5cdFx0XHR9XG5cdFx0fSxcblx0XHRjdWJpYzoge1xuXHRcdFx0b3V0OiBmdW5jdGlvbihrKSB7XG5cdFx0XHRcdHJldHVybiAtLWsgKiBrICogayArIDE7XG5cdFx0XHR9XG5cdFx0fVxuXHRcdC8qXG5cdFx0XHRlbGFzdGljOiB7XG5cdFx0XHRcdG91dDogZnVuY3Rpb24gKCBrICkge1xuXG5cdFx0XHRcdFx0dmFyIHMsIGEgPSAwLjEsIHAgPSAwLjQ7XG5cdFx0XHRcdFx0aWYgKCBrID09PSAwICkgcmV0dXJuIDA7XG5cdFx0XHRcdFx0aWYgKCBrID09PSAxICkgcmV0dXJuIDE7XG5cdFx0XHRcdFx0aWYgKCAhYSB8fCBhIDwgMSApIHsgYSA9IDE7IHMgPSBwIC8gNDsgfVxuXHRcdFx0XHRcdGVsc2UgcyA9IHAgKiBNYXRoLmFzaW4oIDEgLyBhICkgLyAoIDIgKiBNYXRoLlBJICk7XG5cdFx0XHRcdFx0cmV0dXJuICggYSAqIE1hdGgucG93KCAyLCAtIDEwICogaykgKiBNYXRoLnNpbiggKCBrIC0gcyApICogKCAyICogTWF0aC5QSSApIC8gcCApICsgMSApO1xuXG5cdFx0XHRcdH0sXG5cdFx0XHR9LFxuXHRcdFx0YmFjazoge1xuXHRcdFx0XHRvdXQ6IGZ1bmN0aW9uICggayApIHtcblx0XHRcdFx0XHR2YXIgcyA9IDEuNzAxNTg7XG5cdFx0XHRcdFx0cmV0dXJuIC0tayAqIGsgKiAoICggcyArIDEgKSAqIGsgKyBzICkgKyAxO1xuXHRcdFx0XHR9XG5cdFx0XHR9XG5cdFx0Ki9cblx0fSxcblxuXHQvKipcblx0ICogXG5cdCAqIEByZXR1cm4ge29iamVjdH1cblx0ICogXG5cdCAqIHtcblx0ICogIHJhZiA6IHJlcXVlc3QgYW5pbWF0aW9uIGZyYW1lIGZ1bmN0aW9uXG5cdCAqICBjYWYgOiBjYW5jZWwgYW5pbWF0aW9uIGZyYW1lIGZ1bmN0aW9uXG5cdCAqICB0cmFuc2Zyb20gOiB0cmFuc2Zvcm0gcHJvcGVydHkga2V5ICh3aXRoIHZlbmRvciksIG9yIG51bGwgaWYgbm90IHN1cHBvcnRlZFxuXHQgKiAgb2xkSUUgOiBJRTggb3IgYmVsb3dcblx0ICogfVxuXHQgKiBcblx0ICovXG5cdGRldGVjdEZlYXR1cmVzOiBmdW5jdGlvbigpIHtcblx0XHRpZihmcmFtZXdvcmsuZmVhdHVyZXMpIHtcblx0XHRcdHJldHVybiBmcmFtZXdvcmsuZmVhdHVyZXM7XG5cdFx0fVxuXHRcdHZhciBoZWxwZXJFbCA9IGZyYW1ld29yay5jcmVhdGVFbCgpLFxuXHRcdFx0aGVscGVyU3R5bGUgPSBoZWxwZXJFbC5zdHlsZSxcblx0XHRcdHZlbmRvciA9ICcnLFxuXHRcdFx0ZmVhdHVyZXMgPSB7fTtcblxuXHRcdC8vIElFOCBhbmQgYmVsb3dcblx0XHRmZWF0dXJlcy5vbGRJRSA9IGRvY3VtZW50LmFsbCAmJiAhZG9jdW1lbnQuYWRkRXZlbnRMaXN0ZW5lcjtcblxuXHRcdGZlYXR1cmVzLnRvdWNoID0gJ29udG91Y2hzdGFydCcgaW4gd2luZG93O1xuXG5cdFx0aWYod2luZG93LnJlcXVlc3RBbmltYXRpb25GcmFtZSkge1xuXHRcdFx0ZmVhdHVyZXMucmFmID0gd2luZG93LnJlcXVlc3RBbmltYXRpb25GcmFtZTtcblx0XHRcdGZlYXR1cmVzLmNhZiA9IHdpbmRvdy5jYW5jZWxBbmltYXRpb25GcmFtZTtcblx0XHR9XG5cblx0XHRmZWF0dXJlcy5wb2ludGVyRXZlbnQgPSAhISh3aW5kb3cuUG9pbnRlckV2ZW50KSB8fCBuYXZpZ2F0b3IubXNQb2ludGVyRW5hYmxlZDtcblxuXHRcdC8vIGZpeCBmYWxzZS1wb3NpdGl2ZSBkZXRlY3Rpb24gb2Ygb2xkIEFuZHJvaWQgaW4gbmV3IElFXG5cdFx0Ly8gKElFMTEgdWEgc3RyaW5nIGNvbnRhaW5zIFwiQW5kcm9pZCA0LjBcIilcblx0XHRcblx0XHRpZighZmVhdHVyZXMucG9pbnRlckV2ZW50KSB7IFxuXG5cdFx0XHR2YXIgdWEgPSBuYXZpZ2F0b3IudXNlckFnZW50O1xuXG5cdFx0XHQvLyBEZXRlY3QgaWYgZGV2aWNlIGlzIGlQaG9uZSBvciBpUG9kIGFuZCBpZiBpdCdzIG9sZGVyIHRoYW4gaU9TIDhcblx0XHRcdC8vIGh0dHA6Ly9zdGFja292ZXJmbG93LmNvbS9hLzE0MjIzOTIwXG5cdFx0XHQvLyBcblx0XHRcdC8vIFRoaXMgZGV0ZWN0aW9uIGlzIG1hZGUgYmVjYXVzZSBvZiBidWdneSB0b3AvYm90dG9tIHRvb2xiYXJzXG5cdFx0XHQvLyB0aGF0IGRvbid0IHRyaWdnZXIgd2luZG93LnJlc2l6ZSBldmVudC5cblx0XHRcdC8vIEZvciBtb3JlIGluZm8gcmVmZXIgdG8gX2lzRml4ZWRQb3NpdGlvbiB2YXJpYWJsZSBpbiBjb3JlLmpzXG5cblx0XHRcdGlmICgvaVAoaG9uZXxvZCkvLnRlc3QobmF2aWdhdG9yLnBsYXRmb3JtKSkge1xuXHRcdFx0XHR2YXIgdiA9IChuYXZpZ2F0b3IuYXBwVmVyc2lvbikubWF0Y2goL09TIChcXGQrKV8oXFxkKylfPyhcXGQrKT8vKTtcblx0XHRcdFx0aWYodiAmJiB2Lmxlbmd0aCA+IDApIHtcblx0XHRcdFx0XHR2ID0gcGFyc2VJbnQodlsxXSwgMTApO1xuXHRcdFx0XHRcdGlmKHYgPj0gMSAmJiB2IDwgOCApIHtcblx0XHRcdFx0XHRcdGZlYXR1cmVzLmlzT2xkSU9TUGhvbmUgPSB0cnVlO1xuXHRcdFx0XHRcdH1cblx0XHRcdFx0fVxuXHRcdFx0fVxuXG5cdFx0XHQvLyBEZXRlY3Qgb2xkIEFuZHJvaWQgKGJlZm9yZSBLaXRLYXQpXG5cdFx0XHQvLyBkdWUgdG8gYnVncyByZWxhdGVkIHRvIHBvc2l0aW9uOmZpeGVkXG5cdFx0XHQvLyBodHRwOi8vc3RhY2tvdmVyZmxvdy5jb20vcXVlc3Rpb25zLzcxODQ1NzMvcGljay11cC10aGUtYW5kcm9pZC12ZXJzaW9uLWluLXRoZS1icm93c2VyLWJ5LWphdmFzY3JpcHRcblx0XHRcdFxuXHRcdFx0dmFyIG1hdGNoID0gdWEubWF0Y2goL0FuZHJvaWRcXHMoWzAtOVxcLl0qKS8pO1xuXHRcdFx0dmFyIGFuZHJvaWR2ZXJzaW9uID0gIG1hdGNoID8gbWF0Y2hbMV0gOiAwO1xuXHRcdFx0YW5kcm9pZHZlcnNpb24gPSBwYXJzZUZsb2F0KGFuZHJvaWR2ZXJzaW9uKTtcblx0XHRcdGlmKGFuZHJvaWR2ZXJzaW9uID49IDEgKSB7XG5cdFx0XHRcdGlmKGFuZHJvaWR2ZXJzaW9uIDwgNC40KSB7XG5cdFx0XHRcdFx0ZmVhdHVyZXMuaXNPbGRBbmRyb2lkID0gdHJ1ZTsgLy8gZm9yIGZpeGVkIHBvc2l0aW9uIGJ1ZyAmIHBlcmZvcm1hbmNlXG5cdFx0XHRcdH1cblx0XHRcdFx0ZmVhdHVyZXMuYW5kcm9pZFZlcnNpb24gPSBhbmRyb2lkdmVyc2lvbjsgLy8gZm9yIHRvdWNoZW5kIGJ1Z1xuXHRcdFx0fVx0XG5cdFx0XHRmZWF0dXJlcy5pc01vYmlsZU9wZXJhID0gL29wZXJhIG1pbml8b3BlcmEgbW9iaS9pLnRlc3QodWEpO1xuXG5cdFx0XHQvLyBwLnMuIHllcywgeWVzLCBVQSBzbmlmZmluZyBpcyBiYWQsIHByb3Bvc2UgeW91ciBzb2x1dGlvbiBmb3IgYWJvdmUgYnVncy5cblx0XHR9XG5cdFx0XG5cdFx0dmFyIHN0eWxlQ2hlY2tzID0gWyd0cmFuc2Zvcm0nLCAncGVyc3BlY3RpdmUnLCAnYW5pbWF0aW9uTmFtZSddLFxuXHRcdFx0dmVuZG9ycyA9IFsnJywgJ3dlYmtpdCcsJ01veicsJ21zJywnTyddLFxuXHRcdFx0c3R5bGVDaGVja0l0ZW0sXG5cdFx0XHRzdHlsZU5hbWU7XG5cblx0XHRmb3IodmFyIGkgPSAwOyBpIDwgNDsgaSsrKSB7XG5cdFx0XHR2ZW5kb3IgPSB2ZW5kb3JzW2ldO1xuXG5cdFx0XHRmb3IodmFyIGEgPSAwOyBhIDwgMzsgYSsrKSB7XG5cdFx0XHRcdHN0eWxlQ2hlY2tJdGVtID0gc3R5bGVDaGVja3NbYV07XG5cblx0XHRcdFx0Ly8gdXBwZXJjYXNlIGZpcnN0IGxldHRlciBvZiBwcm9wZXJ0eSBuYW1lLCBpZiB2ZW5kb3IgaXMgcHJlc2VudFxuXHRcdFx0XHRzdHlsZU5hbWUgPSB2ZW5kb3IgKyAodmVuZG9yID8gXG5cdFx0XHRcdFx0XHRcdFx0XHRcdHN0eWxlQ2hlY2tJdGVtLmNoYXJBdCgwKS50b1VwcGVyQ2FzZSgpICsgc3R5bGVDaGVja0l0ZW0uc2xpY2UoMSkgOiBcblx0XHRcdFx0XHRcdFx0XHRcdFx0c3R5bGVDaGVja0l0ZW0pO1xuXHRcdFx0XG5cdFx0XHRcdGlmKCFmZWF0dXJlc1tzdHlsZUNoZWNrSXRlbV0gJiYgc3R5bGVOYW1lIGluIGhlbHBlclN0eWxlICkge1xuXHRcdFx0XHRcdGZlYXR1cmVzW3N0eWxlQ2hlY2tJdGVtXSA9IHN0eWxlTmFtZTtcblx0XHRcdFx0fVxuXHRcdFx0fVxuXG5cdFx0XHRpZih2ZW5kb3IgJiYgIWZlYXR1cmVzLnJhZikge1xuXHRcdFx0XHR2ZW5kb3IgPSB2ZW5kb3IudG9Mb3dlckNhc2UoKTtcblx0XHRcdFx0ZmVhdHVyZXMucmFmID0gd2luZG93W3ZlbmRvcisnUmVxdWVzdEFuaW1hdGlvbkZyYW1lJ107XG5cdFx0XHRcdGlmKGZlYXR1cmVzLnJhZikge1xuXHRcdFx0XHRcdGZlYXR1cmVzLmNhZiA9IHdpbmRvd1t2ZW5kb3IrJ0NhbmNlbEFuaW1hdGlvbkZyYW1lJ10gfHwgXG5cdFx0XHRcdFx0XHRcdFx0XHR3aW5kb3dbdmVuZG9yKydDYW5jZWxSZXF1ZXN0QW5pbWF0aW9uRnJhbWUnXTtcblx0XHRcdFx0fVxuXHRcdFx0fVxuXHRcdH1cblx0XHRcdFxuXHRcdGlmKCFmZWF0dXJlcy5yYWYpIHtcblx0XHRcdHZhciBsYXN0VGltZSA9IDA7XG5cdFx0XHRmZWF0dXJlcy5yYWYgPSBmdW5jdGlvbihmbikge1xuXHRcdFx0XHR2YXIgY3VyclRpbWUgPSBuZXcgRGF0ZSgpLmdldFRpbWUoKTtcblx0XHRcdFx0dmFyIHRpbWVUb0NhbGwgPSBNYXRoLm1heCgwLCAxNiAtIChjdXJyVGltZSAtIGxhc3RUaW1lKSk7XG5cdFx0XHRcdHZhciBpZCA9IHdpbmRvdy5zZXRUaW1lb3V0KGZ1bmN0aW9uKCkgeyBmbihjdXJyVGltZSArIHRpbWVUb0NhbGwpOyB9LCB0aW1lVG9DYWxsKTtcblx0XHRcdFx0bGFzdFRpbWUgPSBjdXJyVGltZSArIHRpbWVUb0NhbGw7XG5cdFx0XHRcdHJldHVybiBpZDtcblx0XHRcdH07XG5cdFx0XHRmZWF0dXJlcy5jYWYgPSBmdW5jdGlvbihpZCkgeyBjbGVhclRpbWVvdXQoaWQpOyB9O1xuXHRcdH1cblxuXHRcdC8vIERldGVjdCBTVkcgc3VwcG9ydFxuXHRcdGZlYXR1cmVzLnN2ZyA9ICEhZG9jdW1lbnQuY3JlYXRlRWxlbWVudE5TICYmIFxuXHRcdFx0XHRcdFx0ISFkb2N1bWVudC5jcmVhdGVFbGVtZW50TlMoJ2h0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnJywgJ3N2ZycpLmNyZWF0ZVNWR1JlY3Q7XG5cblx0XHRmcmFtZXdvcmsuZmVhdHVyZXMgPSBmZWF0dXJlcztcblxuXHRcdHJldHVybiBmZWF0dXJlcztcblx0fVxufTtcblxuZnJhbWV3b3JrLmRldGVjdEZlYXR1cmVzKCk7XG5cbi8vIE92ZXJyaWRlIGFkZEV2ZW50TGlzdGVuZXIgZm9yIG9sZCB2ZXJzaW9ucyBvZiBJRVxuaWYoZnJhbWV3b3JrLmZlYXR1cmVzLm9sZElFKSB7XG5cblx0ZnJhbWV3b3JrLmJpbmQgPSBmdW5jdGlvbih0YXJnZXQsIHR5cGUsIGxpc3RlbmVyLCB1bmJpbmQpIHtcblx0XHRcblx0XHR0eXBlID0gdHlwZS5zcGxpdCgnICcpO1xuXG5cdFx0dmFyIG1ldGhvZE5hbWUgPSAodW5iaW5kID8gJ2RldGFjaCcgOiAnYXR0YWNoJykgKyAnRXZlbnQnLFxuXHRcdFx0ZXZOYW1lLFxuXHRcdFx0X2hhbmRsZUV2ID0gZnVuY3Rpb24oKSB7XG5cdFx0XHRcdGxpc3RlbmVyLmhhbmRsZUV2ZW50LmNhbGwobGlzdGVuZXIpO1xuXHRcdFx0fTtcblxuXHRcdGZvcih2YXIgaSA9IDA7IGkgPCB0eXBlLmxlbmd0aDsgaSsrKSB7XG5cdFx0XHRldk5hbWUgPSB0eXBlW2ldO1xuXHRcdFx0aWYoZXZOYW1lKSB7XG5cblx0XHRcdFx0aWYodHlwZW9mIGxpc3RlbmVyID09PSAnb2JqZWN0JyAmJiBsaXN0ZW5lci5oYW5kbGVFdmVudCkge1xuXHRcdFx0XHRcdGlmKCF1bmJpbmQpIHtcblx0XHRcdFx0XHRcdGxpc3RlbmVyWydvbGRJRScgKyBldk5hbWVdID0gX2hhbmRsZUV2O1xuXHRcdFx0XHRcdH0gZWxzZSB7XG5cdFx0XHRcdFx0XHRpZighbGlzdGVuZXJbJ29sZElFJyArIGV2TmFtZV0pIHtcblx0XHRcdFx0XHRcdFx0cmV0dXJuIGZhbHNlO1xuXHRcdFx0XHRcdFx0fVxuXHRcdFx0XHRcdH1cblxuXHRcdFx0XHRcdHRhcmdldFttZXRob2ROYW1lXSggJ29uJyArIGV2TmFtZSwgbGlzdGVuZXJbJ29sZElFJyArIGV2TmFtZV0pO1xuXHRcdFx0XHR9IGVsc2Uge1xuXHRcdFx0XHRcdHRhcmdldFttZXRob2ROYW1lXSggJ29uJyArIGV2TmFtZSwgbGlzdGVuZXIpO1xuXHRcdFx0XHR9XG5cblx0XHRcdH1cblx0XHR9XG5cdH07XG5cdFxufVxuXG4vKj4+ZnJhbWV3b3JrLWJyaWRnZSovXG5cbi8qPj5jb3JlKi9cbi8vZnVuY3Rpb24odGVtcGxhdGUsIFVpQ2xhc3MsIGl0ZW1zLCBvcHRpb25zKVxuXG52YXIgc2VsZiA9IHRoaXM7XG5cbi8qKlxuICogU3RhdGljIHZhcnMsIGRvbid0IGNoYW5nZSB1bmxlc3MgeW91IGtub3cgd2hhdCB5b3UncmUgZG9pbmcuXG4gKi9cbnZhciBET1VCTEVfVEFQX1JBRElVUyA9IDI1LCBcblx0TlVNX0hPTERFUlMgPSAzO1xuXG4vKipcbiAqIE9wdGlvbnNcbiAqL1xudmFyIF9vcHRpb25zID0ge1xuXHRhbGxvd1BhblRvTmV4dDp0cnVlLFxuXHRzcGFjaW5nOiAwLjEyLFxuXHRiZ09wYWNpdHk6IDEsXG5cdG1vdXNlVXNlZDogZmFsc2UsXG5cdGxvb3A6IHRydWUsXG5cdHBpbmNoVG9DbG9zZTogdHJ1ZSxcblx0Y2xvc2VPblNjcm9sbDogdHJ1ZSxcblx0Y2xvc2VPblZlcnRpY2FsRHJhZzogdHJ1ZSxcblx0dmVydGljYWxEcmFnUmFuZ2U6IDAuNzUsXG5cdGhpZGVBbmltYXRpb25EdXJhdGlvbjogMzMzLFxuXHRzaG93QW5pbWF0aW9uRHVyYXRpb246IDMzMyxcblx0c2hvd0hpZGVPcGFjaXR5OiBmYWxzZSxcblx0Zm9jdXM6IHRydWUsXG5cdGVzY0tleTogdHJ1ZSxcblx0YXJyb3dLZXlzOiB0cnVlLFxuXHRtYWluU2Nyb2xsRW5kRnJpY3Rpb246IDAuMzUsXG5cdHBhbkVuZEZyaWN0aW9uOiAwLjM1LFxuXHRpc0NsaWNrYWJsZUVsZW1lbnQ6IGZ1bmN0aW9uKGVsKSB7XG4gICAgICAgIHJldHVybiBlbC50YWdOYW1lID09PSAnQSc7XG4gICAgfSxcbiAgICBnZXREb3VibGVUYXBab29tOiBmdW5jdGlvbihpc01vdXNlQ2xpY2ssIGl0ZW0pIHtcbiAgICBcdGlmKGlzTW91c2VDbGljaykge1xuICAgIFx0XHRyZXR1cm4gMTtcbiAgICBcdH0gZWxzZSB7XG4gICAgXHRcdHJldHVybiBpdGVtLmluaXRpYWxab29tTGV2ZWwgPCAwLjcgPyAxIDogMS4zMztcbiAgICBcdH1cbiAgICB9LFxuICAgIG1heFNwcmVhZFpvb206IDEuMzMsXG5cdG1vZGFsOiB0cnVlLFxuXG5cdC8vIG5vdCBmdWxseSBpbXBsZW1lbnRlZCB5ZXRcblx0c2NhbGVNb2RlOiAnZml0JyAvLyBUT0RPXG59O1xuZnJhbWV3b3JrLmV4dGVuZChfb3B0aW9ucywgb3B0aW9ucyk7XG5cblxuLyoqXG4gKiBQcml2YXRlIGhlbHBlciB2YXJpYWJsZXMgJiBmdW5jdGlvbnNcbiAqL1xuXG52YXIgX2dldEVtcHR5UG9pbnQgPSBmdW5jdGlvbigpIHsgXG5cdFx0cmV0dXJuIHt4OjAseTowfTsgXG5cdH07XG5cbnZhciBfaXNPcGVuLFxuXHRfaXNEZXN0cm95aW5nLFxuXHRfY2xvc2VkQnlTY3JvbGwsXG5cdF9jdXJyZW50SXRlbUluZGV4LFxuXHRfY29udGFpbmVyU3R5bGUsXG5cdF9jb250YWluZXJTaGlmdEluZGV4LFxuXHRfY3VyclBhbkRpc3QgPSBfZ2V0RW1wdHlQb2ludCgpLFxuXHRfc3RhcnRQYW5PZmZzZXQgPSBfZ2V0RW1wdHlQb2ludCgpLFxuXHRfcGFuT2Zmc2V0ID0gX2dldEVtcHR5UG9pbnQoKSxcblx0X3VwTW92ZUV2ZW50cywgLy8gZHJhZyBtb3ZlLCBkcmFnIGVuZCAmIGRyYWcgY2FuY2VsIGV2ZW50cyBhcnJheVxuXHRfZG93bkV2ZW50cywgLy8gZHJhZyBzdGFydCBldmVudHMgYXJyYXlcblx0X2dsb2JhbEV2ZW50SGFuZGxlcnMsXG5cdF92aWV3cG9ydFNpemUgPSB7fSxcblx0X2N1cnJab29tTGV2ZWwsXG5cdF9zdGFydFpvb21MZXZlbCxcblx0X3RyYW5zbGF0ZVByZWZpeCxcblx0X3RyYW5zbGF0ZVN1Zml4LFxuXHRfdXBkYXRlU2l6ZUludGVydmFsLFxuXHRfaXRlbXNOZWVkVXBkYXRlLFxuXHRfY3VyclBvc2l0aW9uSW5kZXggPSAwLFxuXHRfb2Zmc2V0ID0ge30sXG5cdF9zbGlkZVNpemUgPSBfZ2V0RW1wdHlQb2ludCgpLCAvLyBzaXplIG9mIHNsaWRlIGFyZWEsIGluY2x1ZGluZyBzcGFjaW5nXG5cdF9pdGVtSG9sZGVycyxcblx0X3ByZXZJdGVtSW5kZXgsXG5cdF9pbmRleERpZmYgPSAwLCAvLyBkaWZmZXJlbmNlIG9mIGluZGV4ZXMgc2luY2UgbGFzdCBjb250ZW50IHVwZGF0ZVxuXHRfZHJhZ1N0YXJ0RXZlbnQsXG5cdF9kcmFnTW92ZUV2ZW50LFxuXHRfZHJhZ0VuZEV2ZW50LFxuXHRfZHJhZ0NhbmNlbEV2ZW50LFxuXHRfdHJhbnNmb3JtS2V5LFxuXHRfcG9pbnRlckV2ZW50RW5hYmxlZCxcblx0X2lzRml4ZWRQb3NpdGlvbiA9IHRydWUsXG5cdF9saWtlbHlUb3VjaERldmljZSxcblx0X21vZHVsZXMgPSBbXSxcblx0X3JlcXVlc3RBRixcblx0X2NhbmNlbEFGLFxuXHRfaW5pdGFsQ2xhc3NOYW1lLFxuXHRfaW5pdGFsV2luZG93U2Nyb2xsWSxcblx0X29sZElFLFxuXHRfY3VycmVudFdpbmRvd1Njcm9sbFksXG5cdF9mZWF0dXJlcyxcblx0X3dpbmRvd1Zpc2libGVTaXplID0ge30sXG5cdF9yZW5kZXJNYXhSZXNvbHV0aW9uID0gZmFsc2UsXG5cdF9vcmllbnRhdGlvbkNoYW5nZVRpbWVvdXQsXG5cblxuXHQvLyBSZWdpc3RlcnMgUGhvdG9TV2lwZSBtb2R1bGUgKEhpc3RvcnksIENvbnRyb2xsZXIgLi4uKVxuXHRfcmVnaXN0ZXJNb2R1bGUgPSBmdW5jdGlvbihuYW1lLCBtb2R1bGUpIHtcblx0XHRmcmFtZXdvcmsuZXh0ZW5kKHNlbGYsIG1vZHVsZS5wdWJsaWNNZXRob2RzKTtcblx0XHRfbW9kdWxlcy5wdXNoKG5hbWUpO1xuXHR9LFxuXG5cdF9nZXRMb29wZWRJZCA9IGZ1bmN0aW9uKGluZGV4KSB7XG5cdFx0dmFyIG51bVNsaWRlcyA9IF9nZXROdW1JdGVtcygpO1xuXHRcdGlmKGluZGV4ID4gbnVtU2xpZGVzIC0gMSkge1xuXHRcdFx0cmV0dXJuIGluZGV4IC0gbnVtU2xpZGVzO1xuXHRcdH0gZWxzZSAgaWYoaW5kZXggPCAwKSB7XG5cdFx0XHRyZXR1cm4gbnVtU2xpZGVzICsgaW5kZXg7XG5cdFx0fVxuXHRcdHJldHVybiBpbmRleDtcblx0fSxcblx0XG5cdC8vIE1pY3JvIGJpbmQvdHJpZ2dlclxuXHRfbGlzdGVuZXJzID0ge30sXG5cdF9saXN0ZW4gPSBmdW5jdGlvbihuYW1lLCBmbikge1xuXHRcdGlmKCFfbGlzdGVuZXJzW25hbWVdKSB7XG5cdFx0XHRfbGlzdGVuZXJzW25hbWVdID0gW107XG5cdFx0fVxuXHRcdHJldHVybiBfbGlzdGVuZXJzW25hbWVdLnB1c2goZm4pO1xuXHR9LFxuXHRfc2hvdXQgPSBmdW5jdGlvbihuYW1lKSB7XG5cdFx0dmFyIGxpc3RlbmVycyA9IF9saXN0ZW5lcnNbbmFtZV07XG5cblx0XHRpZihsaXN0ZW5lcnMpIHtcblx0XHRcdHZhciBhcmdzID0gQXJyYXkucHJvdG90eXBlLnNsaWNlLmNhbGwoYXJndW1lbnRzKTtcblx0XHRcdGFyZ3Muc2hpZnQoKTtcblxuXHRcdFx0Zm9yKHZhciBpID0gMDsgaSA8IGxpc3RlbmVycy5sZW5ndGg7IGkrKykge1xuXHRcdFx0XHRsaXN0ZW5lcnNbaV0uYXBwbHkoc2VsZiwgYXJncyk7XG5cdFx0XHR9XG5cdFx0fVxuXHR9LFxuXG5cdF9nZXRDdXJyZW50VGltZSA9IGZ1bmN0aW9uKCkge1xuXHRcdHJldHVybiBuZXcgRGF0ZSgpLmdldFRpbWUoKTtcblx0fSxcblx0X2FwcGx5QmdPcGFjaXR5ID0gZnVuY3Rpb24ob3BhY2l0eSkge1xuXHRcdF9iZ09wYWNpdHkgPSBvcGFjaXR5O1xuXHRcdHNlbGYuYmcuc3R5bGUub3BhY2l0eSA9IG9wYWNpdHkgKiBfb3B0aW9ucy5iZ09wYWNpdHk7XG5cdH0sXG5cblx0X2FwcGx5Wm9vbVRyYW5zZm9ybSA9IGZ1bmN0aW9uKHN0eWxlT2JqLHgseSx6b29tLGl0ZW0pIHtcblx0XHRpZighX3JlbmRlck1heFJlc29sdXRpb24gfHwgKGl0ZW0gJiYgaXRlbSAhPT0gc2VsZi5jdXJySXRlbSkgKSB7XG5cdFx0XHR6b29tID0gem9vbSAvIChpdGVtID8gaXRlbS5maXRSYXRpbyA6IHNlbGYuY3Vyckl0ZW0uZml0UmF0aW8pO1x0XG5cdFx0fVxuXHRcdFx0XG5cdFx0c3R5bGVPYmpbX3RyYW5zZm9ybUtleV0gPSBfdHJhbnNsYXRlUHJlZml4ICsgeCArICdweCwgJyArIHkgKyAncHgnICsgX3RyYW5zbGF0ZVN1Zml4ICsgJyBzY2FsZSgnICsgem9vbSArICcpJztcblx0fSxcblx0X2FwcGx5Q3VycmVudFpvb21QYW4gPSBmdW5jdGlvbiggYWxsb3dSZW5kZXJSZXNvbHV0aW9uICkge1xuXHRcdGlmKF9jdXJyWm9vbUVsZW1lbnRTdHlsZSkge1xuXG5cdFx0XHRpZihhbGxvd1JlbmRlclJlc29sdXRpb24pIHtcblx0XHRcdFx0aWYoX2N1cnJab29tTGV2ZWwgPiBzZWxmLmN1cnJJdGVtLmZpdFJhdGlvKSB7XG5cdFx0XHRcdFx0aWYoIV9yZW5kZXJNYXhSZXNvbHV0aW9uKSB7XG5cdFx0XHRcdFx0XHRfc2V0SW1hZ2VTaXplKHNlbGYuY3Vyckl0ZW0sIGZhbHNlLCB0cnVlKTtcblx0XHRcdFx0XHRcdF9yZW5kZXJNYXhSZXNvbHV0aW9uID0gdHJ1ZTtcblx0XHRcdFx0XHR9XG5cdFx0XHRcdH0gZWxzZSB7XG5cdFx0XHRcdFx0aWYoX3JlbmRlck1heFJlc29sdXRpb24pIHtcblx0XHRcdFx0XHRcdF9zZXRJbWFnZVNpemUoc2VsZi5jdXJySXRlbSk7XG5cdFx0XHRcdFx0XHRfcmVuZGVyTWF4UmVzb2x1dGlvbiA9IGZhbHNlO1xuXHRcdFx0XHRcdH1cblx0XHRcdFx0fVxuXHRcdFx0fVxuXHRcdFx0XG5cblx0XHRcdF9hcHBseVpvb21UcmFuc2Zvcm0oX2N1cnJab29tRWxlbWVudFN0eWxlLCBfcGFuT2Zmc2V0LngsIF9wYW5PZmZzZXQueSwgX2N1cnJab29tTGV2ZWwpO1xuXHRcdH1cblx0fSxcblx0X2FwcGx5Wm9vbVBhblRvSXRlbSA9IGZ1bmN0aW9uKGl0ZW0pIHtcblx0XHRpZihpdGVtLmNvbnRhaW5lcikge1xuXG5cdFx0XHRfYXBwbHlab29tVHJhbnNmb3JtKGl0ZW0uY29udGFpbmVyLnN0eWxlLCBcblx0XHRcdFx0XHRcdFx0XHRpdGVtLmluaXRpYWxQb3NpdGlvbi54LCBcblx0XHRcdFx0XHRcdFx0XHRpdGVtLmluaXRpYWxQb3NpdGlvbi55LCBcblx0XHRcdFx0XHRcdFx0XHRpdGVtLmluaXRpYWxab29tTGV2ZWwsXG5cdFx0XHRcdFx0XHRcdFx0aXRlbSk7XG5cdFx0fVxuXHR9LFxuXHRfc2V0VHJhbnNsYXRlWCA9IGZ1bmN0aW9uKHgsIGVsU3R5bGUpIHtcblx0XHRlbFN0eWxlW190cmFuc2Zvcm1LZXldID0gX3RyYW5zbGF0ZVByZWZpeCArIHggKyAncHgsIDBweCcgKyBfdHJhbnNsYXRlU3VmaXg7XG5cdH0sXG5cdF9tb3ZlTWFpblNjcm9sbCA9IGZ1bmN0aW9uKHgsIGRyYWdnaW5nKSB7XG5cblx0XHRpZighX29wdGlvbnMubG9vcCAmJiBkcmFnZ2luZykge1xuXHRcdFx0dmFyIG5ld1NsaWRlSW5kZXhPZmZzZXQgPSBfY3VycmVudEl0ZW1JbmRleCArIChfc2xpZGVTaXplLnggKiBfY3VyclBvc2l0aW9uSW5kZXggLSB4KSAvIF9zbGlkZVNpemUueCxcblx0XHRcdFx0ZGVsdGEgPSBNYXRoLnJvdW5kKHggLSBfbWFpblNjcm9sbFBvcy54KTtcblxuXHRcdFx0aWYoIChuZXdTbGlkZUluZGV4T2Zmc2V0IDwgMCAmJiBkZWx0YSA+IDApIHx8IFxuXHRcdFx0XHQobmV3U2xpZGVJbmRleE9mZnNldCA+PSBfZ2V0TnVtSXRlbXMoKSAtIDEgJiYgZGVsdGEgPCAwKSApIHtcblx0XHRcdFx0eCA9IF9tYWluU2Nyb2xsUG9zLnggKyBkZWx0YSAqIF9vcHRpb25zLm1haW5TY3JvbGxFbmRGcmljdGlvbjtcblx0XHRcdH0gXG5cdFx0fVxuXHRcdFxuXHRcdF9tYWluU2Nyb2xsUG9zLnggPSB4O1xuXHRcdF9zZXRUcmFuc2xhdGVYKHgsIF9jb250YWluZXJTdHlsZSk7XG5cdH0sXG5cdF9jYWxjdWxhdGVQYW5PZmZzZXQgPSBmdW5jdGlvbihheGlzLCB6b29tTGV2ZWwpIHtcblx0XHR2YXIgbSA9IF9taWRab29tUG9pbnRbYXhpc10gLSBfb2Zmc2V0W2F4aXNdO1xuXHRcdHJldHVybiBfc3RhcnRQYW5PZmZzZXRbYXhpc10gKyBfY3VyclBhbkRpc3RbYXhpc10gKyBtIC0gbSAqICggem9vbUxldmVsIC8gX3N0YXJ0Wm9vbUxldmVsICk7XG5cdH0sXG5cdFxuXHRfZXF1YWxpemVQb2ludHMgPSBmdW5jdGlvbihwMSwgcDIpIHtcblx0XHRwMS54ID0gcDIueDtcblx0XHRwMS55ID0gcDIueTtcblx0XHRpZihwMi5pZCkge1xuXHRcdFx0cDEuaWQgPSBwMi5pZDtcblx0XHR9XG5cdH0sXG5cdF9yb3VuZFBvaW50ID0gZnVuY3Rpb24ocCkge1xuXHRcdHAueCA9IE1hdGgucm91bmQocC54KTtcblx0XHRwLnkgPSBNYXRoLnJvdW5kKHAueSk7XG5cdH0sXG5cblx0X21vdXNlTW92ZVRpbWVvdXQgPSBudWxsLFxuXHRfb25GaXJzdE1vdXNlTW92ZSA9IGZ1bmN0aW9uKCkge1xuXHRcdC8vIFdhaXQgdW50aWwgbW91c2UgbW92ZSBldmVudCBpcyBmaXJlZCBhdCBsZWFzdCB0d2ljZSBkdXJpbmcgMTAwbXNcblx0XHQvLyBXZSBkbyB0aGlzLCBiZWNhdXNlIHNvbWUgbW9iaWxlIGJyb3dzZXJzIHRyaWdnZXIgaXQgb24gdG91Y2hzdGFydFxuXHRcdGlmKF9tb3VzZU1vdmVUaW1lb3V0ICkgeyBcblx0XHRcdGZyYW1ld29yay51bmJpbmQoZG9jdW1lbnQsICdtb3VzZW1vdmUnLCBfb25GaXJzdE1vdXNlTW92ZSk7XG5cdFx0XHRmcmFtZXdvcmsuYWRkQ2xhc3ModGVtcGxhdGUsICdwc3dwLS1oYXNfbW91c2UnKTtcblx0XHRcdF9vcHRpb25zLm1vdXNlVXNlZCA9IHRydWU7XG5cdFx0XHRfc2hvdXQoJ21vdXNlVXNlZCcpO1xuXHRcdH1cblx0XHRfbW91c2VNb3ZlVGltZW91dCA9IHNldFRpbWVvdXQoZnVuY3Rpb24oKSB7XG5cdFx0XHRfbW91c2VNb3ZlVGltZW91dCA9IG51bGw7XG5cdFx0fSwgMTAwKTtcblx0fSxcblxuXHRfYmluZEV2ZW50cyA9IGZ1bmN0aW9uKCkge1xuXHRcdGZyYW1ld29yay5iaW5kKGRvY3VtZW50LCAna2V5ZG93bicsIHNlbGYpO1xuXG5cdFx0aWYoX2ZlYXR1cmVzLnRyYW5zZm9ybSkge1xuXHRcdFx0Ly8gZG9uJ3QgYmluZCBjbGljayBldmVudCBpbiBicm93c2VycyB0aGF0IGRvbid0IHN1cHBvcnQgdHJhbnNmb3JtIChtb3N0bHkgSUU4KVxuXHRcdFx0ZnJhbWV3b3JrLmJpbmQoc2VsZi5zY3JvbGxXcmFwLCAnY2xpY2snLCBzZWxmKTtcblx0XHR9XG5cdFx0XG5cblx0XHRpZighX29wdGlvbnMubW91c2VVc2VkKSB7XG5cdFx0XHRmcmFtZXdvcmsuYmluZChkb2N1bWVudCwgJ21vdXNlbW92ZScsIF9vbkZpcnN0TW91c2VNb3ZlKTtcblx0XHR9XG5cblx0XHRmcmFtZXdvcmsuYmluZCh3aW5kb3csICdyZXNpemUgc2Nyb2xsIG9yaWVudGF0aW9uY2hhbmdlJywgc2VsZik7XG5cblx0XHRfc2hvdXQoJ2JpbmRFdmVudHMnKTtcblx0fSxcblxuXHRfdW5iaW5kRXZlbnRzID0gZnVuY3Rpb24oKSB7XG5cdFx0ZnJhbWV3b3JrLnVuYmluZCh3aW5kb3csICdyZXNpemUgc2Nyb2xsIG9yaWVudGF0aW9uY2hhbmdlJywgc2VsZik7XG5cdFx0ZnJhbWV3b3JrLnVuYmluZCh3aW5kb3csICdzY3JvbGwnLCBfZ2xvYmFsRXZlbnRIYW5kbGVycy5zY3JvbGwpO1xuXHRcdGZyYW1ld29yay51bmJpbmQoZG9jdW1lbnQsICdrZXlkb3duJywgc2VsZik7XG5cdFx0ZnJhbWV3b3JrLnVuYmluZChkb2N1bWVudCwgJ21vdXNlbW92ZScsIF9vbkZpcnN0TW91c2VNb3ZlKTtcblxuXHRcdGlmKF9mZWF0dXJlcy50cmFuc2Zvcm0pIHtcblx0XHRcdGZyYW1ld29yay51bmJpbmQoc2VsZi5zY3JvbGxXcmFwLCAnY2xpY2snLCBzZWxmKTtcblx0XHR9XG5cblx0XHRpZihfaXNEcmFnZ2luZykge1xuXHRcdFx0ZnJhbWV3b3JrLnVuYmluZCh3aW5kb3csIF91cE1vdmVFdmVudHMsIHNlbGYpO1xuXHRcdH1cblxuXHRcdGNsZWFyVGltZW91dChfb3JpZW50YXRpb25DaGFuZ2VUaW1lb3V0KTtcblxuXHRcdF9zaG91dCgndW5iaW5kRXZlbnRzJyk7XG5cdH0sXG5cdFxuXHRfY2FsY3VsYXRlUGFuQm91bmRzID0gZnVuY3Rpb24oem9vbUxldmVsLCB1cGRhdGUpIHtcblx0XHR2YXIgYm91bmRzID0gX2NhbGN1bGF0ZUl0ZW1TaXplKCBzZWxmLmN1cnJJdGVtLCBfdmlld3BvcnRTaXplLCB6b29tTGV2ZWwgKTtcblx0XHRpZih1cGRhdGUpIHtcblx0XHRcdF9jdXJyUGFuQm91bmRzID0gYm91bmRzO1xuXHRcdH1cblx0XHRyZXR1cm4gYm91bmRzO1xuXHR9LFxuXHRcblx0X2dldE1pblpvb21MZXZlbCA9IGZ1bmN0aW9uKGl0ZW0pIHtcblx0XHRpZighaXRlbSkge1xuXHRcdFx0aXRlbSA9IHNlbGYuY3Vyckl0ZW07XG5cdFx0fVxuXHRcdHJldHVybiBpdGVtLmluaXRpYWxab29tTGV2ZWw7XG5cdH0sXG5cdF9nZXRNYXhab29tTGV2ZWwgPSBmdW5jdGlvbihpdGVtKSB7XG5cdFx0aWYoIWl0ZW0pIHtcblx0XHRcdGl0ZW0gPSBzZWxmLmN1cnJJdGVtO1xuXHRcdH1cblx0XHRyZXR1cm4gaXRlbS53ID4gMCA/IF9vcHRpb25zLm1heFNwcmVhZFpvb20gOiAxO1xuXHR9LFxuXG5cdC8vIFJldHVybiB0cnVlIGlmIG9mZnNldCBpcyBvdXQgb2YgdGhlIGJvdW5kc1xuXHRfbW9kaWZ5RGVzdFBhbk9mZnNldCA9IGZ1bmN0aW9uKGF4aXMsIGRlc3RQYW5Cb3VuZHMsIGRlc3RQYW5PZmZzZXQsIGRlc3Rab29tTGV2ZWwpIHtcblx0XHRpZihkZXN0Wm9vbUxldmVsID09PSBzZWxmLmN1cnJJdGVtLmluaXRpYWxab29tTGV2ZWwpIHtcblx0XHRcdGRlc3RQYW5PZmZzZXRbYXhpc10gPSBzZWxmLmN1cnJJdGVtLmluaXRpYWxQb3NpdGlvbltheGlzXTtcblx0XHRcdHJldHVybiB0cnVlO1xuXHRcdH0gZWxzZSB7XG5cdFx0XHRkZXN0UGFuT2Zmc2V0W2F4aXNdID0gX2NhbGN1bGF0ZVBhbk9mZnNldChheGlzLCBkZXN0Wm9vbUxldmVsKTsgXG5cblx0XHRcdGlmKGRlc3RQYW5PZmZzZXRbYXhpc10gPiBkZXN0UGFuQm91bmRzLm1pbltheGlzXSkge1xuXHRcdFx0XHRkZXN0UGFuT2Zmc2V0W2F4aXNdID0gZGVzdFBhbkJvdW5kcy5taW5bYXhpc107XG5cdFx0XHRcdHJldHVybiB0cnVlO1xuXHRcdFx0fSBlbHNlIGlmKGRlc3RQYW5PZmZzZXRbYXhpc10gPCBkZXN0UGFuQm91bmRzLm1heFtheGlzXSApIHtcblx0XHRcdFx0ZGVzdFBhbk9mZnNldFtheGlzXSA9IGRlc3RQYW5Cb3VuZHMubWF4W2F4aXNdO1xuXHRcdFx0XHRyZXR1cm4gdHJ1ZTtcblx0XHRcdH1cblx0XHR9XG5cdFx0cmV0dXJuIGZhbHNlO1xuXHR9LFxuXG5cdF9zZXR1cFRyYW5zZm9ybXMgPSBmdW5jdGlvbigpIHtcblxuXHRcdGlmKF90cmFuc2Zvcm1LZXkpIHtcblx0XHRcdC8vIHNldHVwIDNkIHRyYW5zZm9ybXNcblx0XHRcdHZhciBhbGxvdzNkVHJhbnNmb3JtID0gX2ZlYXR1cmVzLnBlcnNwZWN0aXZlICYmICFfbGlrZWx5VG91Y2hEZXZpY2U7XG5cdFx0XHRfdHJhbnNsYXRlUHJlZml4ID0gJ3RyYW5zbGF0ZScgKyAoYWxsb3czZFRyYW5zZm9ybSA/ICczZCgnIDogJygnKTtcblx0XHRcdF90cmFuc2xhdGVTdWZpeCA9IF9mZWF0dXJlcy5wZXJzcGVjdGl2ZSA/ICcsIDBweCknIDogJyknO1x0XG5cdFx0XHRyZXR1cm47XG5cdFx0fVxuXG5cdFx0Ly8gT3ZlcnJpZGUgem9vbS9wYW4vbW92ZSBmdW5jdGlvbnMgaW4gY2FzZSBvbGQgYnJvd3NlciBpcyB1c2VkIChtb3N0IGxpa2VseSBJRSlcblx0XHQvLyAoc28gdGhleSB1c2UgbGVmdC90b3Avd2lkdGgvaGVpZ2h0LCBpbnN0ZWFkIG9mIENTUyB0cmFuc2Zvcm0pXG5cdFxuXHRcdF90cmFuc2Zvcm1LZXkgPSAnbGVmdCc7XG5cdFx0ZnJhbWV3b3JrLmFkZENsYXNzKHRlbXBsYXRlLCAncHN3cC0taWUnKTtcblxuXHRcdF9zZXRUcmFuc2xhdGVYID0gZnVuY3Rpb24oeCwgZWxTdHlsZSkge1xuXHRcdFx0ZWxTdHlsZS5sZWZ0ID0geCArICdweCc7XG5cdFx0fTtcblx0XHRfYXBwbHlab29tUGFuVG9JdGVtID0gZnVuY3Rpb24oaXRlbSkge1xuXG5cdFx0XHR2YXIgem9vbVJhdGlvID0gaXRlbS5maXRSYXRpbyA+IDEgPyAxIDogaXRlbS5maXRSYXRpbyxcblx0XHRcdFx0cyA9IGl0ZW0uY29udGFpbmVyLnN0eWxlLFxuXHRcdFx0XHR3ID0gem9vbVJhdGlvICogaXRlbS53LFxuXHRcdFx0XHRoID0gem9vbVJhdGlvICogaXRlbS5oO1xuXG5cdFx0XHRzLndpZHRoID0gdyArICdweCc7XG5cdFx0XHRzLmhlaWdodCA9IGggKyAncHgnO1xuXHRcdFx0cy5sZWZ0ID0gaXRlbS5pbml0aWFsUG9zaXRpb24ueCArICdweCc7XG5cdFx0XHRzLnRvcCA9IGl0ZW0uaW5pdGlhbFBvc2l0aW9uLnkgKyAncHgnO1xuXG5cdFx0fTtcblx0XHRfYXBwbHlDdXJyZW50Wm9vbVBhbiA9IGZ1bmN0aW9uKCkge1xuXHRcdFx0aWYoX2N1cnJab29tRWxlbWVudFN0eWxlKSB7XG5cblx0XHRcdFx0dmFyIHMgPSBfY3Vyclpvb21FbGVtZW50U3R5bGUsXG5cdFx0XHRcdFx0aXRlbSA9IHNlbGYuY3Vyckl0ZW0sXG5cdFx0XHRcdFx0em9vbVJhdGlvID0gaXRlbS5maXRSYXRpbyA+IDEgPyAxIDogaXRlbS5maXRSYXRpbyxcblx0XHRcdFx0XHR3ID0gem9vbVJhdGlvICogaXRlbS53LFxuXHRcdFx0XHRcdGggPSB6b29tUmF0aW8gKiBpdGVtLmg7XG5cblx0XHRcdFx0cy53aWR0aCA9IHcgKyAncHgnO1xuXHRcdFx0XHRzLmhlaWdodCA9IGggKyAncHgnO1xuXG5cblx0XHRcdFx0cy5sZWZ0ID0gX3Bhbk9mZnNldC54ICsgJ3B4Jztcblx0XHRcdFx0cy50b3AgPSBfcGFuT2Zmc2V0LnkgKyAncHgnO1xuXHRcdFx0fVxuXHRcdFx0XG5cdFx0fTtcblx0fSxcblxuXHRfb25LZXlEb3duID0gZnVuY3Rpb24oZSkge1xuXHRcdHZhciBrZXlkb3duQWN0aW9uID0gJyc7XG5cdFx0aWYoX29wdGlvbnMuZXNjS2V5ICYmIGUua2V5Q29kZSA9PT0gMjcpIHsgXG5cdFx0XHRrZXlkb3duQWN0aW9uID0gJ2Nsb3NlJztcblx0XHR9IGVsc2UgaWYoX29wdGlvbnMuYXJyb3dLZXlzKSB7XG5cdFx0XHRpZihlLmtleUNvZGUgPT09IDM3KSB7XG5cdFx0XHRcdGtleWRvd25BY3Rpb24gPSAncHJldic7XG5cdFx0XHR9IGVsc2UgaWYoZS5rZXlDb2RlID09PSAzOSkgeyBcblx0XHRcdFx0a2V5ZG93bkFjdGlvbiA9ICduZXh0Jztcblx0XHRcdH1cblx0XHR9XG5cblx0XHRpZihrZXlkb3duQWN0aW9uKSB7XG5cdFx0XHQvLyBkb24ndCBkbyBhbnl0aGluZyBpZiBzcGVjaWFsIGtleSBwcmVzc2VkIHRvIHByZXZlbnQgZnJvbSBvdmVycmlkaW5nIGRlZmF1bHQgYnJvd3NlciBhY3Rpb25zXG5cdFx0XHQvLyBlLmcuIGluIENocm9tZSBvbiBNYWMgY21kK2Fycm93LWxlZnQgcmV0dXJucyB0byBwcmV2aW91cyBwYWdlXG5cdFx0XHRpZiggIWUuY3RybEtleSAmJiAhZS5hbHRLZXkgJiYgIWUuc2hpZnRLZXkgJiYgIWUubWV0YUtleSApIHtcblx0XHRcdFx0aWYoZS5wcmV2ZW50RGVmYXVsdCkge1xuXHRcdFx0XHRcdGUucHJldmVudERlZmF1bHQoKTtcblx0XHRcdFx0fSBlbHNlIHtcblx0XHRcdFx0XHRlLnJldHVyblZhbHVlID0gZmFsc2U7XG5cdFx0XHRcdH0gXG5cdFx0XHRcdHNlbGZba2V5ZG93bkFjdGlvbl0oKTtcblx0XHRcdH1cblx0XHR9XG5cdH0sXG5cblx0X29uR2xvYmFsQ2xpY2sgPSBmdW5jdGlvbihlKSB7XG5cdFx0aWYoIWUpIHtcblx0XHRcdHJldHVybjtcblx0XHR9XG5cblx0XHQvLyBkb24ndCBhbGxvdyBjbGljayBldmVudCB0byBwYXNzIHRocm91Z2ggd2hlbiB0cmlnZ2VyaW5nIGFmdGVyIGRyYWcgb3Igc29tZSBvdGhlciBnZXN0dXJlXG5cdFx0aWYoX21vdmVkIHx8IF96b29tU3RhcnRlZCB8fCBfbWFpblNjcm9sbEFuaW1hdGluZyB8fCBfdmVydGljYWxEcmFnSW5pdGlhdGVkKSB7XG5cdFx0XHRlLnByZXZlbnREZWZhdWx0KCk7XG5cdFx0XHRlLnN0b3BQcm9wYWdhdGlvbigpO1xuXHRcdH1cblx0fSxcblxuXHRfdXBkYXRlUGFnZVNjcm9sbE9mZnNldCA9IGZ1bmN0aW9uKCkge1xuXHRcdHNlbGYuc2V0U2Nyb2xsT2Zmc2V0KDAsIGZyYW1ld29yay5nZXRTY3JvbGxZKCkpO1x0XHRcblx0fTtcblx0XG5cblxuXHRcblxuXG5cbi8vIE1pY3JvIGFuaW1hdGlvbiBlbmdpbmVcbnZhciBfYW5pbWF0aW9ucyA9IHt9LFxuXHRfbnVtQW5pbWF0aW9ucyA9IDAsXG5cdF9zdG9wQW5pbWF0aW9uID0gZnVuY3Rpb24obmFtZSkge1xuXHRcdGlmKF9hbmltYXRpb25zW25hbWVdKSB7XG5cdFx0XHRpZihfYW5pbWF0aW9uc1tuYW1lXS5yYWYpIHtcblx0XHRcdFx0X2NhbmNlbEFGKCBfYW5pbWF0aW9uc1tuYW1lXS5yYWYgKTtcblx0XHRcdH1cblx0XHRcdF9udW1BbmltYXRpb25zLS07XG5cdFx0XHRkZWxldGUgX2FuaW1hdGlvbnNbbmFtZV07XG5cdFx0fVxuXHR9LFxuXHRfcmVnaXN0ZXJTdGFydEFuaW1hdGlvbiA9IGZ1bmN0aW9uKG5hbWUpIHtcblx0XHRpZihfYW5pbWF0aW9uc1tuYW1lXSkge1xuXHRcdFx0X3N0b3BBbmltYXRpb24obmFtZSk7XG5cdFx0fVxuXHRcdGlmKCFfYW5pbWF0aW9uc1tuYW1lXSkge1xuXHRcdFx0X251bUFuaW1hdGlvbnMrKztcblx0XHRcdF9hbmltYXRpb25zW25hbWVdID0ge307XG5cdFx0fVxuXHR9LFxuXHRfc3RvcEFsbEFuaW1hdGlvbnMgPSBmdW5jdGlvbigpIHtcblx0XHRmb3IgKHZhciBwcm9wIGluIF9hbmltYXRpb25zKSB7XG5cblx0XHRcdGlmKCBfYW5pbWF0aW9ucy5oYXNPd25Qcm9wZXJ0eSggcHJvcCApICkge1xuXHRcdFx0XHRfc3RvcEFuaW1hdGlvbihwcm9wKTtcblx0XHRcdH0gXG5cdFx0XHRcblx0XHR9XG5cdH0sXG5cdF9hbmltYXRlUHJvcCA9IGZ1bmN0aW9uKG5hbWUsIGIsIGVuZFByb3AsIGQsIGVhc2luZ0ZuLCBvblVwZGF0ZSwgb25Db21wbGV0ZSkge1xuXHRcdHZhciBzdGFydEFuaW1UaW1lID0gX2dldEN1cnJlbnRUaW1lKCksIHQ7XG5cdFx0X3JlZ2lzdGVyU3RhcnRBbmltYXRpb24obmFtZSk7XG5cblx0XHR2YXIgYW5pbWxvb3AgPSBmdW5jdGlvbigpe1xuXHRcdFx0aWYgKCBfYW5pbWF0aW9uc1tuYW1lXSApIHtcblx0XHRcdFx0XG5cdFx0XHRcdHQgPSBfZ2V0Q3VycmVudFRpbWUoKSAtIHN0YXJ0QW5pbVRpbWU7IC8vIHRpbWUgZGlmZlxuXHRcdFx0XHQvL2IgLSBiZWdpbm5pbmcgKHN0YXJ0IHByb3ApXG5cdFx0XHRcdC8vZCAtIGFuaW0gZHVyYXRpb25cblxuXHRcdFx0XHRpZiAoIHQgPj0gZCApIHtcblx0XHRcdFx0XHRfc3RvcEFuaW1hdGlvbihuYW1lKTtcblx0XHRcdFx0XHRvblVwZGF0ZShlbmRQcm9wKTtcblx0XHRcdFx0XHRpZihvbkNvbXBsZXRlKSB7XG5cdFx0XHRcdFx0XHRvbkNvbXBsZXRlKCk7XG5cdFx0XHRcdFx0fVxuXHRcdFx0XHRcdHJldHVybjtcblx0XHRcdFx0fVxuXHRcdFx0XHRvblVwZGF0ZSggKGVuZFByb3AgLSBiKSAqIGVhc2luZ0ZuKHQvZCkgKyBiICk7XG5cblx0XHRcdFx0X2FuaW1hdGlvbnNbbmFtZV0ucmFmID0gX3JlcXVlc3RBRihhbmltbG9vcCk7XG5cdFx0XHR9XG5cdFx0fTtcblx0XHRhbmltbG9vcCgpO1xuXHR9O1xuXHRcblxuXG52YXIgcHVibGljTWV0aG9kcyA9IHtcblxuXHQvLyBtYWtlIGEgZmV3IGxvY2FsIHZhcmlhYmxlcyBhbmQgZnVuY3Rpb25zIHB1YmxpY1xuXHRzaG91dDogX3Nob3V0LFxuXHRsaXN0ZW46IF9saXN0ZW4sXG5cdHZpZXdwb3J0U2l6ZTogX3ZpZXdwb3J0U2l6ZSxcblx0b3B0aW9uczogX29wdGlvbnMsXG5cblx0aXNNYWluU2Nyb2xsQW5pbWF0aW5nOiBmdW5jdGlvbigpIHtcblx0XHRyZXR1cm4gX21haW5TY3JvbGxBbmltYXRpbmc7XG5cdH0sXG5cdGdldFpvb21MZXZlbDogZnVuY3Rpb24oKSB7XG5cdFx0cmV0dXJuIF9jdXJyWm9vbUxldmVsO1xuXHR9LFxuXHRnZXRDdXJyZW50SW5kZXg6IGZ1bmN0aW9uKCkge1xuXHRcdHJldHVybiBfY3VycmVudEl0ZW1JbmRleDtcblx0fSxcblx0aXNEcmFnZ2luZzogZnVuY3Rpb24oKSB7XG5cdFx0cmV0dXJuIF9pc0RyYWdnaW5nO1xuXHR9LFx0XG5cdGlzWm9vbWluZzogZnVuY3Rpb24oKSB7XG5cdFx0cmV0dXJuIF9pc1pvb21pbmc7XG5cdH0sXG5cdHNldFNjcm9sbE9mZnNldDogZnVuY3Rpb24oeCx5KSB7XG5cdFx0X29mZnNldC54ID0geDtcblx0XHRfY3VycmVudFdpbmRvd1Njcm9sbFkgPSBfb2Zmc2V0LnkgPSB5O1xuXHRcdF9zaG91dCgndXBkYXRlU2Nyb2xsT2Zmc2V0JywgX29mZnNldCk7XG5cdH0sXG5cdGFwcGx5Wm9vbVBhbjogZnVuY3Rpb24oem9vbUxldmVsLHBhblgscGFuWSxhbGxvd1JlbmRlclJlc29sdXRpb24pIHtcblx0XHRfcGFuT2Zmc2V0LnggPSBwYW5YO1xuXHRcdF9wYW5PZmZzZXQueSA9IHBhblk7XG5cdFx0X2N1cnJab29tTGV2ZWwgPSB6b29tTGV2ZWw7XG5cdFx0X2FwcGx5Q3VycmVudFpvb21QYW4oIGFsbG93UmVuZGVyUmVzb2x1dGlvbiApO1xuXHR9LFxuXG5cdGluaXQ6IGZ1bmN0aW9uKCkge1xuXG5cdFx0aWYoX2lzT3BlbiB8fCBfaXNEZXN0cm95aW5nKSB7XG5cdFx0XHRyZXR1cm47XG5cdFx0fVxuXG5cdFx0dmFyIGk7XG5cblx0XHRzZWxmLmZyYW1ld29yayA9IGZyYW1ld29yazsgLy8gYmFzaWMgZnVuY3Rpb25hbGl0eVxuXHRcdHNlbGYudGVtcGxhdGUgPSB0ZW1wbGF0ZTsgLy8gcm9vdCBET00gZWxlbWVudCBvZiBQaG90b1N3aXBlXG5cdFx0c2VsZi5iZyA9IGZyYW1ld29yay5nZXRDaGlsZEJ5Q2xhc3ModGVtcGxhdGUsICdwc3dwX19iZycpO1xuXG5cdFx0X2luaXRhbENsYXNzTmFtZSA9IHRlbXBsYXRlLmNsYXNzTmFtZTtcblx0XHRfaXNPcGVuID0gdHJ1ZTtcblx0XHRcdFx0XG5cdFx0X2ZlYXR1cmVzID0gZnJhbWV3b3JrLmRldGVjdEZlYXR1cmVzKCk7XG5cdFx0X3JlcXVlc3RBRiA9IF9mZWF0dXJlcy5yYWY7XG5cdFx0X2NhbmNlbEFGID0gX2ZlYXR1cmVzLmNhZjtcblx0XHRfdHJhbnNmb3JtS2V5ID0gX2ZlYXR1cmVzLnRyYW5zZm9ybTtcblx0XHRfb2xkSUUgPSBfZmVhdHVyZXMub2xkSUU7XG5cdFx0XG5cdFx0c2VsZi5zY3JvbGxXcmFwID0gZnJhbWV3b3JrLmdldENoaWxkQnlDbGFzcyh0ZW1wbGF0ZSwgJ3Bzd3BfX3Njcm9sbC13cmFwJyk7XG5cdFx0c2VsZi5jb250YWluZXIgPSBmcmFtZXdvcmsuZ2V0Q2hpbGRCeUNsYXNzKHNlbGYuc2Nyb2xsV3JhcCwgJ3Bzd3BfX2NvbnRhaW5lcicpO1xuXG5cdFx0X2NvbnRhaW5lclN0eWxlID0gc2VsZi5jb250YWluZXIuc3R5bGU7IC8vIGZvciBmYXN0IGFjY2Vzc1xuXG5cdFx0Ly8gT2JqZWN0cyB0aGF0IGhvbGQgc2xpZGVzICh0aGVyZSBhcmUgb25seSAzIGluIERPTSlcblx0XHRzZWxmLml0ZW1Ib2xkZXJzID0gX2l0ZW1Ib2xkZXJzID0gW1xuXHRcdFx0e2VsOnNlbGYuY29udGFpbmVyLmNoaWxkcmVuWzBdICwgd3JhcDowLCBpbmRleDogLTF9LFxuXHRcdFx0e2VsOnNlbGYuY29udGFpbmVyLmNoaWxkcmVuWzFdICwgd3JhcDowLCBpbmRleDogLTF9LFxuXHRcdFx0e2VsOnNlbGYuY29udGFpbmVyLmNoaWxkcmVuWzJdICwgd3JhcDowLCBpbmRleDogLTF9XG5cdFx0XTtcblxuXHRcdC8vIGhpZGUgbmVhcmJ5IGl0ZW0gaG9sZGVycyB1bnRpbCBpbml0aWFsIHpvb20gYW5pbWF0aW9uIGZpbmlzaGVzICh0byBhdm9pZCBleHRyYSBQYWludHMpXG5cdFx0X2l0ZW1Ib2xkZXJzWzBdLmVsLnN0eWxlLmRpc3BsYXkgPSBfaXRlbUhvbGRlcnNbMl0uZWwuc3R5bGUuZGlzcGxheSA9ICdub25lJztcblxuXHRcdF9zZXR1cFRyYW5zZm9ybXMoKTtcblxuXHRcdC8vIFNldHVwIGdsb2JhbCBldmVudHNcblx0XHRfZ2xvYmFsRXZlbnRIYW5kbGVycyA9IHtcblx0XHRcdHJlc2l6ZTogc2VsZi51cGRhdGVTaXplLFxuXG5cdFx0XHQvLyBGaXhlczogaU9TIDEwLjMgcmVzaXplIGV2ZW50XG5cdFx0XHQvLyBkb2VzIG5vdCB1cGRhdGUgc2Nyb2xsV3JhcC5jbGllbnRXaWR0aCBpbnN0YW50bHkgYWZ0ZXIgcmVzaXplXG5cdFx0XHQvLyBodHRwczovL2dpdGh1Yi5jb20vZGltc2VtZW5vdi9QaG90b1N3aXBlL2lzc3Vlcy8xMzE1XG5cdFx0XHRvcmllbnRhdGlvbmNoYW5nZTogZnVuY3Rpb24oKSB7XG5cdFx0XHRcdGNsZWFyVGltZW91dChfb3JpZW50YXRpb25DaGFuZ2VUaW1lb3V0KTtcblx0XHRcdFx0X29yaWVudGF0aW9uQ2hhbmdlVGltZW91dCA9IHNldFRpbWVvdXQoZnVuY3Rpb24oKSB7XG5cdFx0XHRcdFx0aWYoX3ZpZXdwb3J0U2l6ZS54ICE9PSBzZWxmLnNjcm9sbFdyYXAuY2xpZW50V2lkdGgpIHtcblx0XHRcdFx0XHRcdHNlbGYudXBkYXRlU2l6ZSgpO1xuXHRcdFx0XHRcdH1cblx0XHRcdFx0fSwgNTAwKTtcblx0XHRcdH0sXG5cdFx0XHRzY3JvbGw6IF91cGRhdGVQYWdlU2Nyb2xsT2Zmc2V0LFxuXHRcdFx0a2V5ZG93bjogX29uS2V5RG93bixcblx0XHRcdGNsaWNrOiBfb25HbG9iYWxDbGlja1xuXHRcdH07XG5cblx0XHQvLyBkaXNhYmxlIHNob3cvaGlkZSBlZmZlY3RzIG9uIG9sZCBicm93c2VycyB0aGF0IGRvbid0IHN1cHBvcnQgQ1NTIGFuaW1hdGlvbnMgb3IgdHJhbnNmb3JtcywgXG5cdFx0Ly8gb2xkIElPUywgQW5kcm9pZCBhbmQgT3BlcmEgbW9iaWxlLiBCbGFja2JlcnJ5IHNlZW1zIHRvIHdvcmsgZmluZSwgZXZlbiBvbGRlciBtb2RlbHMuXG5cdFx0dmFyIG9sZFBob25lID0gX2ZlYXR1cmVzLmlzT2xkSU9TUGhvbmUgfHwgX2ZlYXR1cmVzLmlzT2xkQW5kcm9pZCB8fCBfZmVhdHVyZXMuaXNNb2JpbGVPcGVyYTtcblx0XHRpZighX2ZlYXR1cmVzLmFuaW1hdGlvbk5hbWUgfHwgIV9mZWF0dXJlcy50cmFuc2Zvcm0gfHwgb2xkUGhvbmUpIHtcblx0XHRcdF9vcHRpb25zLnNob3dBbmltYXRpb25EdXJhdGlvbiA9IF9vcHRpb25zLmhpZGVBbmltYXRpb25EdXJhdGlvbiA9IDA7XG5cdFx0fVxuXG5cdFx0Ly8gaW5pdCBtb2R1bGVzXG5cdFx0Zm9yKGkgPSAwOyBpIDwgX21vZHVsZXMubGVuZ3RoOyBpKyspIHtcblx0XHRcdHNlbGZbJ2luaXQnICsgX21vZHVsZXNbaV1dKCk7XG5cdFx0fVxuXHRcdFxuXHRcdC8vIGluaXRcblx0XHRpZihVaUNsYXNzKSB7XG5cdFx0XHR2YXIgdWkgPSBzZWxmLnVpID0gbmV3IFVpQ2xhc3Moc2VsZiwgZnJhbWV3b3JrKTtcblx0XHRcdHVpLmluaXQoKTtcblx0XHR9XG5cblx0XHRfc2hvdXQoJ2ZpcnN0VXBkYXRlJyk7XG5cdFx0X2N1cnJlbnRJdGVtSW5kZXggPSBfY3VycmVudEl0ZW1JbmRleCB8fCBfb3B0aW9ucy5pbmRleCB8fCAwO1xuXHRcdC8vIHZhbGlkYXRlIGluZGV4XG5cdFx0aWYoIGlzTmFOKF9jdXJyZW50SXRlbUluZGV4KSB8fCBfY3VycmVudEl0ZW1JbmRleCA8IDAgfHwgX2N1cnJlbnRJdGVtSW5kZXggPj0gX2dldE51bUl0ZW1zKCkgKSB7XG5cdFx0XHRfY3VycmVudEl0ZW1JbmRleCA9IDA7XG5cdFx0fVxuXHRcdHNlbGYuY3Vyckl0ZW0gPSBfZ2V0SXRlbUF0KCBfY3VycmVudEl0ZW1JbmRleCApO1xuXG5cdFx0XG5cdFx0aWYoX2ZlYXR1cmVzLmlzT2xkSU9TUGhvbmUgfHwgX2ZlYXR1cmVzLmlzT2xkQW5kcm9pZCkge1xuXHRcdFx0X2lzRml4ZWRQb3NpdGlvbiA9IGZhbHNlO1xuXHRcdH1cblx0XHRcblx0XHR0ZW1wbGF0ZS5zZXRBdHRyaWJ1dGUoJ2FyaWEtaGlkZGVuJywgJ2ZhbHNlJyk7XG5cdFx0aWYoX29wdGlvbnMubW9kYWwpIHtcblx0XHRcdGlmKCFfaXNGaXhlZFBvc2l0aW9uKSB7XG5cdFx0XHRcdHRlbXBsYXRlLnN0eWxlLnBvc2l0aW9uID0gJ2Fic29sdXRlJztcblx0XHRcdFx0dGVtcGxhdGUuc3R5bGUudG9wID0gZnJhbWV3b3JrLmdldFNjcm9sbFkoKSArICdweCc7XG5cdFx0XHR9IGVsc2Uge1xuXHRcdFx0XHR0ZW1wbGF0ZS5zdHlsZS5wb3NpdGlvbiA9ICdmaXhlZCc7XG5cdFx0XHR9XG5cdFx0fVxuXG5cdFx0aWYoX2N1cnJlbnRXaW5kb3dTY3JvbGxZID09PSB1bmRlZmluZWQpIHtcblx0XHRcdF9zaG91dCgnaW5pdGlhbExheW91dCcpO1xuXHRcdFx0X2N1cnJlbnRXaW5kb3dTY3JvbGxZID0gX2luaXRhbFdpbmRvd1Njcm9sbFkgPSBmcmFtZXdvcmsuZ2V0U2Nyb2xsWSgpO1xuXHRcdH1cblx0XHRcblx0XHQvLyBhZGQgY2xhc3NlcyB0byByb290IGVsZW1lbnQgb2YgUGhvdG9Td2lwZVxuXHRcdHZhciByb290Q2xhc3NlcyA9ICdwc3dwLS1vcGVuICc7XG5cdFx0aWYoX29wdGlvbnMubWFpbkNsYXNzKSB7XG5cdFx0XHRyb290Q2xhc3NlcyArPSBfb3B0aW9ucy5tYWluQ2xhc3MgKyAnICc7XG5cdFx0fVxuXHRcdGlmKF9vcHRpb25zLnNob3dIaWRlT3BhY2l0eSkge1xuXHRcdFx0cm9vdENsYXNzZXMgKz0gJ3Bzd3AtLWFuaW1hdGVfb3BhY2l0eSAnO1xuXHRcdH1cblx0XHRyb290Q2xhc3NlcyArPSBfbGlrZWx5VG91Y2hEZXZpY2UgPyAncHN3cC0tdG91Y2gnIDogJ3Bzd3AtLW5vdG91Y2gnO1xuXHRcdHJvb3RDbGFzc2VzICs9IF9mZWF0dXJlcy5hbmltYXRpb25OYW1lID8gJyBwc3dwLS1jc3NfYW5pbWF0aW9uJyA6ICcnO1xuXHRcdHJvb3RDbGFzc2VzICs9IF9mZWF0dXJlcy5zdmcgPyAnIHBzd3AtLXN2ZycgOiAnJztcblx0XHRmcmFtZXdvcmsuYWRkQ2xhc3ModGVtcGxhdGUsIHJvb3RDbGFzc2VzKTtcblxuXHRcdHNlbGYudXBkYXRlU2l6ZSgpO1xuXG5cdFx0Ly8gaW5pdGlhbCB1cGRhdGVcblx0XHRfY29udGFpbmVyU2hpZnRJbmRleCA9IC0xO1xuXHRcdF9pbmRleERpZmYgPSBudWxsO1xuXHRcdGZvcihpID0gMDsgaSA8IE5VTV9IT0xERVJTOyBpKyspIHtcblx0XHRcdF9zZXRUcmFuc2xhdGVYKCAoaStfY29udGFpbmVyU2hpZnRJbmRleCkgKiBfc2xpZGVTaXplLngsIF9pdGVtSG9sZGVyc1tpXS5lbC5zdHlsZSk7XG5cdFx0fVxuXG5cdFx0aWYoIV9vbGRJRSkge1xuXHRcdFx0ZnJhbWV3b3JrLmJpbmQoc2VsZi5zY3JvbGxXcmFwLCBfZG93bkV2ZW50cywgc2VsZik7IC8vIG5vIGRyYWdnaW5nIGZvciBvbGQgSUVcblx0XHR9XHRcblxuXHRcdF9saXN0ZW4oJ2luaXRpYWxab29tSW5FbmQnLCBmdW5jdGlvbigpIHtcblx0XHRcdHNlbGYuc2V0Q29udGVudChfaXRlbUhvbGRlcnNbMF0sIF9jdXJyZW50SXRlbUluZGV4LTEpO1xuXHRcdFx0c2VsZi5zZXRDb250ZW50KF9pdGVtSG9sZGVyc1syXSwgX2N1cnJlbnRJdGVtSW5kZXgrMSk7XG5cblx0XHRcdF9pdGVtSG9sZGVyc1swXS5lbC5zdHlsZS5kaXNwbGF5ID0gX2l0ZW1Ib2xkZXJzWzJdLmVsLnN0eWxlLmRpc3BsYXkgPSAnYmxvY2snO1xuXG5cdFx0XHRpZihfb3B0aW9ucy5mb2N1cykge1xuXHRcdFx0XHQvLyBmb2N1cyBjYXVzZXMgbGF5b3V0LCBcblx0XHRcdFx0Ly8gd2hpY2ggY2F1c2VzIGxhZyBkdXJpbmcgdGhlIGFuaW1hdGlvbiwgXG5cdFx0XHRcdC8vIHRoYXQncyB3aHkgd2UgZGVsYXkgaXQgdW50aWxsIHRoZSBpbml0aWFsIHpvb20gdHJhbnNpdGlvbiBlbmRzXG5cdFx0XHRcdHRlbXBsYXRlLmZvY3VzKCk7XG5cdFx0XHR9XG5cdFx0XHQgXG5cblx0XHRcdF9iaW5kRXZlbnRzKCk7XG5cdFx0fSk7XG5cblx0XHQvLyBzZXQgY29udGVudCBmb3IgY2VudGVyIHNsaWRlIChmaXJzdCB0aW1lKVxuXHRcdHNlbGYuc2V0Q29udGVudChfaXRlbUhvbGRlcnNbMV0sIF9jdXJyZW50SXRlbUluZGV4KTtcblx0XHRcblx0XHRzZWxmLnVwZGF0ZUN1cnJJdGVtKCk7XG5cblx0XHRfc2hvdXQoJ2FmdGVySW5pdCcpO1xuXG5cdFx0aWYoIV9pc0ZpeGVkUG9zaXRpb24pIHtcblxuXHRcdFx0Ly8gT24gYWxsIHZlcnNpb25zIG9mIGlPUyBsb3dlciB0aGFuIDguMCwgd2UgY2hlY2sgc2l6ZSBvZiB2aWV3cG9ydCBldmVyeSBzZWNvbmQuXG5cdFx0XHQvLyBcblx0XHRcdC8vIFRoaXMgaXMgZG9uZSB0byBkZXRlY3Qgd2hlbiBTYWZhcmkgdG9wICYgYm90dG9tIGJhcnMgYXBwZWFyLCBcblx0XHRcdC8vIGFzIHRoaXMgYWN0aW9uIGRvZXNuJ3QgdHJpZ2dlciBhbnkgZXZlbnRzIChsaWtlIHJlc2l6ZSkuIFxuXHRcdFx0Ly8gXG5cdFx0XHQvLyBPbiBpT1M4IHRoZXkgZml4ZWQgdGhpcy5cblx0XHRcdC8vIFxuXHRcdFx0Ly8gMTAgTm92IDIwMTQ6IGlPUyA3IHVzYWdlIH40MCUuIGlPUyA4IHVzYWdlIDU2JS5cblx0XHRcdFxuXHRcdFx0X3VwZGF0ZVNpemVJbnRlcnZhbCA9IHNldEludGVydmFsKGZ1bmN0aW9uKCkge1xuXHRcdFx0XHRpZighX251bUFuaW1hdGlvbnMgJiYgIV9pc0RyYWdnaW5nICYmICFfaXNab29taW5nICYmIChfY3Vyclpvb21MZXZlbCA9PT0gc2VsZi5jdXJySXRlbS5pbml0aWFsWm9vbUxldmVsKSAgKSB7XG5cdFx0XHRcdFx0c2VsZi51cGRhdGVTaXplKCk7XG5cdFx0XHRcdH1cblx0XHRcdH0sIDEwMDApO1xuXHRcdH1cblxuXHRcdGZyYW1ld29yay5hZGRDbGFzcyh0ZW1wbGF0ZSwgJ3Bzd3AtLXZpc2libGUnKTtcblx0fSxcblxuXHQvLyBDbG9zZSB0aGUgZ2FsbGVyeSwgdGhlbiBkZXN0cm95IGl0XG5cdGNsb3NlOiBmdW5jdGlvbigpIHtcblx0XHRpZighX2lzT3Blbikge1xuXHRcdFx0cmV0dXJuO1xuXHRcdH1cblxuXHRcdF9pc09wZW4gPSBmYWxzZTtcblx0XHRfaXNEZXN0cm95aW5nID0gdHJ1ZTtcblx0XHRfc2hvdXQoJ2Nsb3NlJyk7XG5cdFx0X3VuYmluZEV2ZW50cygpO1xuXG5cdFx0X3Nob3dPckhpZGUoc2VsZi5jdXJySXRlbSwgbnVsbCwgdHJ1ZSwgc2VsZi5kZXN0cm95KTtcblx0fSxcblxuXHQvLyBkZXN0cm95cyB0aGUgZ2FsbGVyeSAodW5iaW5kcyBldmVudHMsIGNsZWFucyB1cCBpbnRlcnZhbHMgYW5kIHRpbWVvdXRzIHRvIGF2b2lkIG1lbW9yeSBsZWFrcylcblx0ZGVzdHJveTogZnVuY3Rpb24oKSB7XG5cdFx0X3Nob3V0KCdkZXN0cm95Jyk7XG5cblx0XHRpZihfc2hvd09ySGlkZVRpbWVvdXQpIHtcblx0XHRcdGNsZWFyVGltZW91dChfc2hvd09ySGlkZVRpbWVvdXQpO1xuXHRcdH1cblx0XHRcblx0XHR0ZW1wbGF0ZS5zZXRBdHRyaWJ1dGUoJ2FyaWEtaGlkZGVuJywgJ3RydWUnKTtcblx0XHR0ZW1wbGF0ZS5jbGFzc05hbWUgPSBfaW5pdGFsQ2xhc3NOYW1lO1xuXG5cdFx0aWYoX3VwZGF0ZVNpemVJbnRlcnZhbCkge1xuXHRcdFx0Y2xlYXJJbnRlcnZhbChfdXBkYXRlU2l6ZUludGVydmFsKTtcblx0XHR9XG5cblx0XHRmcmFtZXdvcmsudW5iaW5kKHNlbGYuc2Nyb2xsV3JhcCwgX2Rvd25FdmVudHMsIHNlbGYpO1xuXG5cdFx0Ly8gd2UgdW5iaW5kIHNjcm9sbCBldmVudCBhdCB0aGUgZW5kLCBhcyBjbG9zaW5nIGFuaW1hdGlvbiBtYXkgZGVwZW5kIG9uIGl0XG5cdFx0ZnJhbWV3b3JrLnVuYmluZCh3aW5kb3csICdzY3JvbGwnLCBzZWxmKTtcblxuXHRcdF9zdG9wRHJhZ1VwZGF0ZUxvb3AoKTtcblxuXHRcdF9zdG9wQWxsQW5pbWF0aW9ucygpO1xuXG5cdFx0X2xpc3RlbmVycyA9IG51bGw7XG5cdH0sXG5cblx0LyoqXG5cdCAqIFBhbiBpbWFnZSB0byBwb3NpdGlvblxuXHQgKiBAcGFyYW0ge051bWJlcn0geCAgICAgXG5cdCAqIEBwYXJhbSB7TnVtYmVyfSB5ICAgICBcblx0ICogQHBhcmFtIHtCb29sZWFufSBmb3JjZSBXaWxsIGlnbm9yZSBib3VuZHMgaWYgc2V0IHRvIHRydWUuXG5cdCAqL1xuXHRwYW5UbzogZnVuY3Rpb24oeCx5LGZvcmNlKSB7XG5cdFx0aWYoIWZvcmNlKSB7XG5cdFx0XHRpZih4ID4gX2N1cnJQYW5Cb3VuZHMubWluLngpIHtcblx0XHRcdFx0eCA9IF9jdXJyUGFuQm91bmRzLm1pbi54O1xuXHRcdFx0fSBlbHNlIGlmKHggPCBfY3VyclBhbkJvdW5kcy5tYXgueCkge1xuXHRcdFx0XHR4ID0gX2N1cnJQYW5Cb3VuZHMubWF4Lng7XG5cdFx0XHR9XG5cblx0XHRcdGlmKHkgPiBfY3VyclBhbkJvdW5kcy5taW4ueSkge1xuXHRcdFx0XHR5ID0gX2N1cnJQYW5Cb3VuZHMubWluLnk7XG5cdFx0XHR9IGVsc2UgaWYoeSA8IF9jdXJyUGFuQm91bmRzLm1heC55KSB7XG5cdFx0XHRcdHkgPSBfY3VyclBhbkJvdW5kcy5tYXgueTtcblx0XHRcdH1cblx0XHR9XG5cdFx0XG5cdFx0X3Bhbk9mZnNldC54ID0geDtcblx0XHRfcGFuT2Zmc2V0LnkgPSB5O1xuXHRcdF9hcHBseUN1cnJlbnRab29tUGFuKCk7XG5cdH0sXG5cdFxuXHRoYW5kbGVFdmVudDogZnVuY3Rpb24gKGUpIHtcblx0XHRlID0gZSB8fCB3aW5kb3cuZXZlbnQ7XG5cdFx0aWYoX2dsb2JhbEV2ZW50SGFuZGxlcnNbZS50eXBlXSkge1xuXHRcdFx0X2dsb2JhbEV2ZW50SGFuZGxlcnNbZS50eXBlXShlKTtcblx0XHR9XG5cdH0sXG5cblxuXHRnb1RvOiBmdW5jdGlvbihpbmRleCkge1xuXG5cdFx0aW5kZXggPSBfZ2V0TG9vcGVkSWQoaW5kZXgpO1xuXG5cdFx0dmFyIGRpZmYgPSBpbmRleCAtIF9jdXJyZW50SXRlbUluZGV4O1xuXHRcdF9pbmRleERpZmYgPSBkaWZmO1xuXG5cdFx0X2N1cnJlbnRJdGVtSW5kZXggPSBpbmRleDtcblx0XHRzZWxmLmN1cnJJdGVtID0gX2dldEl0ZW1BdCggX2N1cnJlbnRJdGVtSW5kZXggKTtcblx0XHRfY3VyclBvc2l0aW9uSW5kZXggLT0gZGlmZjtcblx0XHRcblx0XHRfbW92ZU1haW5TY3JvbGwoX3NsaWRlU2l6ZS54ICogX2N1cnJQb3NpdGlvbkluZGV4KTtcblx0XHRcblxuXHRcdF9zdG9wQWxsQW5pbWF0aW9ucygpO1xuXHRcdF9tYWluU2Nyb2xsQW5pbWF0aW5nID0gZmFsc2U7XG5cblx0XHRzZWxmLnVwZGF0ZUN1cnJJdGVtKCk7XG5cdH0sXG5cdG5leHQ6IGZ1bmN0aW9uKCkge1xuXHRcdHNlbGYuZ29UbyggX2N1cnJlbnRJdGVtSW5kZXggKyAxKTtcblx0fSxcblx0cHJldjogZnVuY3Rpb24oKSB7XG5cdFx0c2VsZi5nb1RvKCBfY3VycmVudEl0ZW1JbmRleCAtIDEpO1xuXHR9LFxuXG5cdC8vIHVwZGF0ZSBjdXJyZW50IHpvb20vcGFuIG9iamVjdHNcblx0dXBkYXRlQ3Vyclpvb21JdGVtOiBmdW5jdGlvbihlbXVsYXRlU2V0Q29udGVudCkge1xuXHRcdGlmKGVtdWxhdGVTZXRDb250ZW50KSB7XG5cdFx0XHRfc2hvdXQoJ2JlZm9yZUNoYW5nZScsIDApO1xuXHRcdH1cblxuXHRcdC8vIGl0ZW1Ib2xkZXJbMV0gaXMgbWlkZGxlIChjdXJyZW50KSBpdGVtXG5cdFx0aWYoX2l0ZW1Ib2xkZXJzWzFdLmVsLmNoaWxkcmVuLmxlbmd0aCkge1xuXHRcdFx0dmFyIHpvb21FbGVtZW50ID0gX2l0ZW1Ib2xkZXJzWzFdLmVsLmNoaWxkcmVuWzBdO1xuXHRcdFx0aWYoIGZyYW1ld29yay5oYXNDbGFzcyh6b29tRWxlbWVudCwgJ3Bzd3BfX3pvb20td3JhcCcpICkge1xuXHRcdFx0XHRfY3Vyclpvb21FbGVtZW50U3R5bGUgPSB6b29tRWxlbWVudC5zdHlsZTtcblx0XHRcdH0gZWxzZSB7XG5cdFx0XHRcdF9jdXJyWm9vbUVsZW1lbnRTdHlsZSA9IG51bGw7XG5cdFx0XHR9XG5cdFx0fSBlbHNlIHtcblx0XHRcdF9jdXJyWm9vbUVsZW1lbnRTdHlsZSA9IG51bGw7XG5cdFx0fVxuXHRcdFxuXHRcdF9jdXJyUGFuQm91bmRzID0gc2VsZi5jdXJySXRlbS5ib3VuZHM7XHRcblx0XHRfc3RhcnRab29tTGV2ZWwgPSBfY3Vyclpvb21MZXZlbCA9IHNlbGYuY3Vyckl0ZW0uaW5pdGlhbFpvb21MZXZlbDtcblxuXHRcdF9wYW5PZmZzZXQueCA9IF9jdXJyUGFuQm91bmRzLmNlbnRlci54O1xuXHRcdF9wYW5PZmZzZXQueSA9IF9jdXJyUGFuQm91bmRzLmNlbnRlci55O1xuXG5cdFx0aWYoZW11bGF0ZVNldENvbnRlbnQpIHtcblx0XHRcdF9zaG91dCgnYWZ0ZXJDaGFuZ2UnKTtcblx0XHR9XG5cdH0sXG5cblxuXHRpbnZhbGlkYXRlQ3Vyckl0ZW1zOiBmdW5jdGlvbigpIHtcblx0XHRfaXRlbXNOZWVkVXBkYXRlID0gdHJ1ZTtcblx0XHRmb3IodmFyIGkgPSAwOyBpIDwgTlVNX0hPTERFUlM7IGkrKykge1xuXHRcdFx0aWYoIF9pdGVtSG9sZGVyc1tpXS5pdGVtICkge1xuXHRcdFx0XHRfaXRlbUhvbGRlcnNbaV0uaXRlbS5uZWVkc1VwZGF0ZSA9IHRydWU7XG5cdFx0XHR9XG5cdFx0fVxuXHR9LFxuXG5cdHVwZGF0ZUN1cnJJdGVtOiBmdW5jdGlvbihiZWZvcmVBbmltYXRpb24pIHtcblxuXHRcdGlmKF9pbmRleERpZmYgPT09IDApIHtcblx0XHRcdHJldHVybjtcblx0XHR9XG5cblx0XHR2YXIgZGlmZkFicyA9IE1hdGguYWJzKF9pbmRleERpZmYpLFxuXHRcdFx0dGVtcEhvbGRlcjtcblxuXHRcdGlmKGJlZm9yZUFuaW1hdGlvbiAmJiBkaWZmQWJzIDwgMikge1xuXHRcdFx0cmV0dXJuO1xuXHRcdH1cblxuXG5cdFx0c2VsZi5jdXJySXRlbSA9IF9nZXRJdGVtQXQoIF9jdXJyZW50SXRlbUluZGV4ICk7XG5cdFx0X3JlbmRlck1heFJlc29sdXRpb24gPSBmYWxzZTtcblx0XHRcblx0XHRfc2hvdXQoJ2JlZm9yZUNoYW5nZScsIF9pbmRleERpZmYpO1xuXG5cdFx0aWYoZGlmZkFicyA+PSBOVU1fSE9MREVSUykge1xuXHRcdFx0X2NvbnRhaW5lclNoaWZ0SW5kZXggKz0gX2luZGV4RGlmZiArIChfaW5kZXhEaWZmID4gMCA/IC1OVU1fSE9MREVSUyA6IE5VTV9IT0xERVJTKTtcblx0XHRcdGRpZmZBYnMgPSBOVU1fSE9MREVSUztcblx0XHR9XG5cdFx0Zm9yKHZhciBpID0gMDsgaSA8IGRpZmZBYnM7IGkrKykge1xuXHRcdFx0aWYoX2luZGV4RGlmZiA+IDApIHtcblx0XHRcdFx0dGVtcEhvbGRlciA9IF9pdGVtSG9sZGVycy5zaGlmdCgpO1xuXHRcdFx0XHRfaXRlbUhvbGRlcnNbTlVNX0hPTERFUlMtMV0gPSB0ZW1wSG9sZGVyOyAvLyBtb3ZlIGZpcnN0IHRvIGxhc3RcblxuXHRcdFx0XHRfY29udGFpbmVyU2hpZnRJbmRleCsrO1xuXHRcdFx0XHRfc2V0VHJhbnNsYXRlWCggKF9jb250YWluZXJTaGlmdEluZGV4KzIpICogX3NsaWRlU2l6ZS54LCB0ZW1wSG9sZGVyLmVsLnN0eWxlKTtcblx0XHRcdFx0c2VsZi5zZXRDb250ZW50KHRlbXBIb2xkZXIsIF9jdXJyZW50SXRlbUluZGV4IC0gZGlmZkFicyArIGkgKyAxICsgMSk7XG5cdFx0XHR9IGVsc2Uge1xuXHRcdFx0XHR0ZW1wSG9sZGVyID0gX2l0ZW1Ib2xkZXJzLnBvcCgpO1xuXHRcdFx0XHRfaXRlbUhvbGRlcnMudW5zaGlmdCggdGVtcEhvbGRlciApOyAvLyBtb3ZlIGxhc3QgdG8gZmlyc3RcblxuXHRcdFx0XHRfY29udGFpbmVyU2hpZnRJbmRleC0tO1xuXHRcdFx0XHRfc2V0VHJhbnNsYXRlWCggX2NvbnRhaW5lclNoaWZ0SW5kZXggKiBfc2xpZGVTaXplLngsIHRlbXBIb2xkZXIuZWwuc3R5bGUpO1xuXHRcdFx0XHRzZWxmLnNldENvbnRlbnQodGVtcEhvbGRlciwgX2N1cnJlbnRJdGVtSW5kZXggKyBkaWZmQWJzIC0gaSAtIDEgLSAxKTtcblx0XHRcdH1cblx0XHRcdFxuXHRcdH1cblxuXHRcdC8vIHJlc2V0IHpvb20vcGFuIG9uIHByZXZpb3VzIGl0ZW1cblx0XHRpZihfY3Vyclpvb21FbGVtZW50U3R5bGUgJiYgTWF0aC5hYnMoX2luZGV4RGlmZikgPT09IDEpIHtcblxuXHRcdFx0dmFyIHByZXZJdGVtID0gX2dldEl0ZW1BdChfcHJldkl0ZW1JbmRleCk7XG5cdFx0XHRpZihwcmV2SXRlbS5pbml0aWFsWm9vbUxldmVsICE9PSBfY3Vyclpvb21MZXZlbCkge1xuXHRcdFx0XHRfY2FsY3VsYXRlSXRlbVNpemUocHJldkl0ZW0gLCBfdmlld3BvcnRTaXplICk7XG5cdFx0XHRcdF9zZXRJbWFnZVNpemUocHJldkl0ZW0pO1xuXHRcdFx0XHRfYXBwbHlab29tUGFuVG9JdGVtKCBwcmV2SXRlbSApOyBcdFx0XHRcdFxuXHRcdFx0fVxuXG5cdFx0fVxuXG5cdFx0Ly8gcmVzZXQgZGlmZiBhZnRlciB1cGRhdGVcblx0XHRfaW5kZXhEaWZmID0gMDtcblxuXHRcdHNlbGYudXBkYXRlQ3Vyclpvb21JdGVtKCk7XG5cblx0XHRfcHJldkl0ZW1JbmRleCA9IF9jdXJyZW50SXRlbUluZGV4O1xuXG5cdFx0X3Nob3V0KCdhZnRlckNoYW5nZScpO1xuXHRcdFxuXHR9LFxuXG5cblxuXHR1cGRhdGVTaXplOiBmdW5jdGlvbihmb3JjZSkge1xuXHRcdFxuXHRcdGlmKCFfaXNGaXhlZFBvc2l0aW9uICYmIF9vcHRpb25zLm1vZGFsKSB7XG5cdFx0XHR2YXIgd2luZG93U2Nyb2xsWSA9IGZyYW1ld29yay5nZXRTY3JvbGxZKCk7XG5cdFx0XHRpZihfY3VycmVudFdpbmRvd1Njcm9sbFkgIT09IHdpbmRvd1Njcm9sbFkpIHtcblx0XHRcdFx0dGVtcGxhdGUuc3R5bGUudG9wID0gd2luZG93U2Nyb2xsWSArICdweCc7XG5cdFx0XHRcdF9jdXJyZW50V2luZG93U2Nyb2xsWSA9IHdpbmRvd1Njcm9sbFk7XG5cdFx0XHR9XG5cdFx0XHRpZighZm9yY2UgJiYgX3dpbmRvd1Zpc2libGVTaXplLnggPT09IHdpbmRvdy5pbm5lcldpZHRoICYmIF93aW5kb3dWaXNpYmxlU2l6ZS55ID09PSB3aW5kb3cuaW5uZXJIZWlnaHQpIHtcblx0XHRcdFx0cmV0dXJuO1xuXHRcdFx0fVxuXHRcdFx0X3dpbmRvd1Zpc2libGVTaXplLnggPSB3aW5kb3cuaW5uZXJXaWR0aDtcblx0XHRcdF93aW5kb3dWaXNpYmxlU2l6ZS55ID0gd2luZG93LmlubmVySGVpZ2h0O1xuXG5cdFx0XHQvL3RlbXBsYXRlLnN0eWxlLndpZHRoID0gX3dpbmRvd1Zpc2libGVTaXplLnggKyAncHgnO1xuXHRcdFx0dGVtcGxhdGUuc3R5bGUuaGVpZ2h0ID0gX3dpbmRvd1Zpc2libGVTaXplLnkgKyAncHgnO1xuXHRcdH1cblxuXG5cblx0XHRfdmlld3BvcnRTaXplLnggPSBzZWxmLnNjcm9sbFdyYXAuY2xpZW50V2lkdGg7XG5cdFx0X3ZpZXdwb3J0U2l6ZS55ID0gc2VsZi5zY3JvbGxXcmFwLmNsaWVudEhlaWdodDtcblxuXHRcdF91cGRhdGVQYWdlU2Nyb2xsT2Zmc2V0KCk7XG5cblx0XHRfc2xpZGVTaXplLnggPSBfdmlld3BvcnRTaXplLnggKyBNYXRoLnJvdW5kKF92aWV3cG9ydFNpemUueCAqIF9vcHRpb25zLnNwYWNpbmcpO1xuXHRcdF9zbGlkZVNpemUueSA9IF92aWV3cG9ydFNpemUueTtcblxuXHRcdF9tb3ZlTWFpblNjcm9sbChfc2xpZGVTaXplLnggKiBfY3VyclBvc2l0aW9uSW5kZXgpO1xuXG5cdFx0X3Nob3V0KCdiZWZvcmVSZXNpemUnKTsgLy8gZXZlbiBtYXkgYmUgdXNlZCBmb3IgZXhhbXBsZSB0byBzd2l0Y2ggaW1hZ2Ugc291cmNlc1xuXG5cblx0XHQvLyBkb24ndCByZS1jYWxjdWxhdGUgc2l6ZSBvbiBpbml0YWwgc2l6ZSB1cGRhdGVcblx0XHRpZihfY29udGFpbmVyU2hpZnRJbmRleCAhPT0gdW5kZWZpbmVkKSB7XG5cblx0XHRcdHZhciBob2xkZXIsXG5cdFx0XHRcdGl0ZW0sXG5cdFx0XHRcdGhJbmRleDtcblxuXHRcdFx0Zm9yKHZhciBpID0gMDsgaSA8IE5VTV9IT0xERVJTOyBpKyspIHtcblx0XHRcdFx0aG9sZGVyID0gX2l0ZW1Ib2xkZXJzW2ldO1xuXHRcdFx0XHRfc2V0VHJhbnNsYXRlWCggKGkrX2NvbnRhaW5lclNoaWZ0SW5kZXgpICogX3NsaWRlU2l6ZS54LCBob2xkZXIuZWwuc3R5bGUpO1xuXG5cdFx0XHRcdGhJbmRleCA9IF9jdXJyZW50SXRlbUluZGV4K2ktMTtcblxuXHRcdFx0XHRpZihfb3B0aW9ucy5sb29wICYmIF9nZXROdW1JdGVtcygpID4gMikge1xuXHRcdFx0XHRcdGhJbmRleCA9IF9nZXRMb29wZWRJZChoSW5kZXgpO1xuXHRcdFx0XHR9XG5cblx0XHRcdFx0Ly8gdXBkYXRlIHpvb20gbGV2ZWwgb24gaXRlbXMgYW5kIHJlZnJlc2ggc291cmNlIChpZiBuZWVkc1VwZGF0ZSlcblx0XHRcdFx0aXRlbSA9IF9nZXRJdGVtQXQoIGhJbmRleCApO1xuXG5cdFx0XHRcdC8vIHJlLXJlbmRlciBnYWxsZXJ5IGl0ZW0gaWYgYG5lZWRzVXBkYXRlYCxcblx0XHRcdFx0Ly8gb3IgZG9lc24ndCBoYXZlIGBib3VuZHNgIChlbnRpcmVseSBuZXcgc2xpZGUgb2JqZWN0KVxuXHRcdFx0XHRpZiggaXRlbSAmJiAoX2l0ZW1zTmVlZFVwZGF0ZSB8fCBpdGVtLm5lZWRzVXBkYXRlIHx8ICFpdGVtLmJvdW5kcykgKSB7XG5cblx0XHRcdFx0XHRzZWxmLmNsZWFuU2xpZGUoIGl0ZW0gKTtcblx0XHRcdFx0XHRcblx0XHRcdFx0XHRzZWxmLnNldENvbnRlbnQoIGhvbGRlciwgaEluZGV4ICk7XG5cblx0XHRcdFx0XHQvLyBpZiBcImNlbnRlclwiIHNsaWRlXG5cdFx0XHRcdFx0aWYoaSA9PT0gMSkge1xuXHRcdFx0XHRcdFx0c2VsZi5jdXJySXRlbSA9IGl0ZW07XG5cdFx0XHRcdFx0XHRzZWxmLnVwZGF0ZUN1cnJab29tSXRlbSh0cnVlKTtcblx0XHRcdFx0XHR9XG5cblx0XHRcdFx0XHRpdGVtLm5lZWRzVXBkYXRlID0gZmFsc2U7XG5cblx0XHRcdFx0fSBlbHNlIGlmKGhvbGRlci5pbmRleCA9PT0gLTEgJiYgaEluZGV4ID49IDApIHtcblx0XHRcdFx0XHQvLyBhZGQgY29udGVudCBmaXJzdCB0aW1lXG5cdFx0XHRcdFx0c2VsZi5zZXRDb250ZW50KCBob2xkZXIsIGhJbmRleCApO1xuXHRcdFx0XHR9XG5cdFx0XHRcdGlmKGl0ZW0gJiYgaXRlbS5jb250YWluZXIpIHtcblx0XHRcdFx0XHRfY2FsY3VsYXRlSXRlbVNpemUoaXRlbSwgX3ZpZXdwb3J0U2l6ZSk7XG5cdFx0XHRcdFx0X3NldEltYWdlU2l6ZShpdGVtKTtcblx0XHRcdFx0XHRfYXBwbHlab29tUGFuVG9JdGVtKCBpdGVtICk7XG5cdFx0XHRcdH1cblx0XHRcdFx0XG5cdFx0XHR9XG5cdFx0XHRfaXRlbXNOZWVkVXBkYXRlID0gZmFsc2U7XG5cdFx0fVx0XG5cblx0XHRfc3RhcnRab29tTGV2ZWwgPSBfY3Vyclpvb21MZXZlbCA9IHNlbGYuY3Vyckl0ZW0uaW5pdGlhbFpvb21MZXZlbDtcblx0XHRfY3VyclBhbkJvdW5kcyA9IHNlbGYuY3Vyckl0ZW0uYm91bmRzO1xuXG5cdFx0aWYoX2N1cnJQYW5Cb3VuZHMpIHtcblx0XHRcdF9wYW5PZmZzZXQueCA9IF9jdXJyUGFuQm91bmRzLmNlbnRlci54O1xuXHRcdFx0X3Bhbk9mZnNldC55ID0gX2N1cnJQYW5Cb3VuZHMuY2VudGVyLnk7XG5cdFx0XHRfYXBwbHlDdXJyZW50Wm9vbVBhbiggdHJ1ZSApO1xuXHRcdH1cblx0XHRcblx0XHRfc2hvdXQoJ3Jlc2l6ZScpO1xuXHR9LFxuXHRcblx0Ly8gWm9vbSBjdXJyZW50IGl0ZW0gdG9cblx0em9vbVRvOiBmdW5jdGlvbihkZXN0Wm9vbUxldmVsLCBjZW50ZXJQb2ludCwgc3BlZWQsIGVhc2luZ0ZuLCB1cGRhdGVGbikge1xuXHRcdC8qXG5cdFx0XHRpZihkZXN0Wm9vbUxldmVsID09PSAnZml0Jykge1xuXHRcdFx0XHRkZXN0Wm9vbUxldmVsID0gc2VsZi5jdXJySXRlbS5maXRSYXRpbztcblx0XHRcdH0gZWxzZSBpZihkZXN0Wm9vbUxldmVsID09PSAnZmlsbCcpIHtcblx0XHRcdFx0ZGVzdFpvb21MZXZlbCA9IHNlbGYuY3Vyckl0ZW0uZmlsbFJhdGlvO1xuXHRcdFx0fVxuXHRcdCovXG5cblx0XHRpZihjZW50ZXJQb2ludCkge1xuXHRcdFx0X3N0YXJ0Wm9vbUxldmVsID0gX2N1cnJab29tTGV2ZWw7XG5cdFx0XHRfbWlkWm9vbVBvaW50LnggPSBNYXRoLmFicyhjZW50ZXJQb2ludC54KSAtIF9wYW5PZmZzZXQueCA7XG5cdFx0XHRfbWlkWm9vbVBvaW50LnkgPSBNYXRoLmFicyhjZW50ZXJQb2ludC55KSAtIF9wYW5PZmZzZXQueSA7XG5cdFx0XHRfZXF1YWxpemVQb2ludHMoX3N0YXJ0UGFuT2Zmc2V0LCBfcGFuT2Zmc2V0KTtcblx0XHR9XG5cblx0XHR2YXIgZGVzdFBhbkJvdW5kcyA9IF9jYWxjdWxhdGVQYW5Cb3VuZHMoZGVzdFpvb21MZXZlbCwgZmFsc2UpLFxuXHRcdFx0ZGVzdFBhbk9mZnNldCA9IHt9O1xuXG5cdFx0X21vZGlmeURlc3RQYW5PZmZzZXQoJ3gnLCBkZXN0UGFuQm91bmRzLCBkZXN0UGFuT2Zmc2V0LCBkZXN0Wm9vbUxldmVsKTtcblx0XHRfbW9kaWZ5RGVzdFBhbk9mZnNldCgneScsIGRlc3RQYW5Cb3VuZHMsIGRlc3RQYW5PZmZzZXQsIGRlc3Rab29tTGV2ZWwpO1xuXG5cdFx0dmFyIGluaXRpYWxab29tTGV2ZWwgPSBfY3Vyclpvb21MZXZlbDtcblx0XHR2YXIgaW5pdGlhbFBhbk9mZnNldCA9IHtcblx0XHRcdHg6IF9wYW5PZmZzZXQueCxcblx0XHRcdHk6IF9wYW5PZmZzZXQueVxuXHRcdH07XG5cblx0XHRfcm91bmRQb2ludChkZXN0UGFuT2Zmc2V0KTtcblxuXHRcdHZhciBvblVwZGF0ZSA9IGZ1bmN0aW9uKG5vdykge1xuXHRcdFx0aWYobm93ID09PSAxKSB7XG5cdFx0XHRcdF9jdXJyWm9vbUxldmVsID0gZGVzdFpvb21MZXZlbDtcblx0XHRcdFx0X3Bhbk9mZnNldC54ID0gZGVzdFBhbk9mZnNldC54O1xuXHRcdFx0XHRfcGFuT2Zmc2V0LnkgPSBkZXN0UGFuT2Zmc2V0Lnk7XG5cdFx0XHR9IGVsc2Uge1xuXHRcdFx0XHRfY3Vyclpvb21MZXZlbCA9IChkZXN0Wm9vbUxldmVsIC0gaW5pdGlhbFpvb21MZXZlbCkgKiBub3cgKyBpbml0aWFsWm9vbUxldmVsO1xuXHRcdFx0XHRfcGFuT2Zmc2V0LnggPSAoZGVzdFBhbk9mZnNldC54IC0gaW5pdGlhbFBhbk9mZnNldC54KSAqIG5vdyArIGluaXRpYWxQYW5PZmZzZXQueDtcblx0XHRcdFx0X3Bhbk9mZnNldC55ID0gKGRlc3RQYW5PZmZzZXQueSAtIGluaXRpYWxQYW5PZmZzZXQueSkgKiBub3cgKyBpbml0aWFsUGFuT2Zmc2V0Lnk7XG5cdFx0XHR9XG5cblx0XHRcdGlmKHVwZGF0ZUZuKSB7XG5cdFx0XHRcdHVwZGF0ZUZuKG5vdyk7XG5cdFx0XHR9XG5cblx0XHRcdF9hcHBseUN1cnJlbnRab29tUGFuKCBub3cgPT09IDEgKTtcblx0XHR9O1xuXG5cdFx0aWYoc3BlZWQpIHtcblx0XHRcdF9hbmltYXRlUHJvcCgnY3VzdG9tWm9vbVRvJywgMCwgMSwgc3BlZWQsIGVhc2luZ0ZuIHx8IGZyYW1ld29yay5lYXNpbmcuc2luZS5pbk91dCwgb25VcGRhdGUpO1xuXHRcdH0gZWxzZSB7XG5cdFx0XHRvblVwZGF0ZSgxKTtcblx0XHR9XG5cdH1cblxuXG59O1xuXG5cbi8qPj5jb3JlKi9cblxuLyo+Pmdlc3R1cmVzKi9cbi8qKlxuICogTW91c2UvdG91Y2gvcG9pbnRlciBldmVudCBoYW5kbGVycy5cbiAqIFxuICogc2VwYXJhdGVkIGZyb20gQGNvcmUuanMgZm9yIHJlYWRhYmlsaXR5XG4gKi9cblxudmFyIE1JTl9TV0lQRV9ESVNUQU5DRSA9IDMwLFxuXHRESVJFQ1RJT05fQ0hFQ0tfT0ZGU0VUID0gMTA7IC8vIGFtb3VudCBvZiBwaXhlbHMgdG8gZHJhZyB0byBkZXRlcm1pbmUgZGlyZWN0aW9uIG9mIHN3aXBlXG5cbnZhciBfZ2VzdHVyZVN0YXJ0VGltZSxcblx0X2dlc3R1cmVDaGVja1NwZWVkVGltZSxcblxuXHQvLyBwb29sIG9mIG9iamVjdHMgdGhhdCBhcmUgdXNlZCBkdXJpbmcgZHJhZ2dpbmcgb2Ygem9vbWluZ1xuXHRwID0ge30sIC8vIGZpcnN0IHBvaW50XG5cdHAyID0ge30sIC8vIHNlY29uZCBwb2ludCAoZm9yIHpvb20gZ2VzdHVyZSlcblx0ZGVsdGEgPSB7fSxcblx0X2N1cnJQb2ludCA9IHt9LFxuXHRfc3RhcnRQb2ludCA9IHt9LFxuXHRfY3VyclBvaW50ZXJzID0gW10sXG5cdF9zdGFydE1haW5TY3JvbGxQb3MgPSB7fSxcblx0X3JlbGVhc2VBbmltRGF0YSxcblx0X3Bvc1BvaW50cyA9IFtdLCAvLyBhcnJheSBvZiBwb2ludHMgZHVyaW5nIGRyYWdnaW5nLCB1c2VkIHRvIGRldGVybWluZSB0eXBlIG9mIGdlc3R1cmVcblx0X3RlbXBQb2ludCA9IHt9LFxuXG5cdF9pc1pvb21pbmdJbixcblx0X3ZlcnRpY2FsRHJhZ0luaXRpYXRlZCxcblx0X29sZEFuZHJvaWRUb3VjaEVuZFRpbWVvdXQsXG5cdF9jdXJyWm9vbWVkSXRlbUluZGV4ID0gMCxcblx0X2NlbnRlclBvaW50ID0gX2dldEVtcHR5UG9pbnQoKSxcblx0X2xhc3RSZWxlYXNlVGltZSA9IDAsXG5cdF9pc0RyYWdnaW5nLCAvLyBhdCBsZWFzdCBvbmUgcG9pbnRlciBpcyBkb3duXG5cdF9pc011bHRpdG91Y2gsIC8vIGF0IGxlYXN0IHR3byBfcG9pbnRlcnMgYXJlIGRvd25cblx0X3pvb21TdGFydGVkLCAvLyB6b29tIGxldmVsIGNoYW5nZWQgZHVyaW5nIHpvb20gZ2VzdHVyZVxuXHRfbW92ZWQsXG5cdF9kcmFnQW5pbUZyYW1lLFxuXHRfbWFpblNjcm9sbFNoaWZ0ZWQsXG5cdF9jdXJyZW50UG9pbnRzLCAvLyBhcnJheSBvZiBjdXJyZW50IHRvdWNoIHBvaW50c1xuXHRfaXNab29taW5nLFxuXHRfY3VyclBvaW50c0Rpc3RhbmNlLFxuXHRfc3RhcnRQb2ludHNEaXN0YW5jZSxcblx0X2N1cnJQYW5Cb3VuZHMsXG5cdF9tYWluU2Nyb2xsUG9zID0gX2dldEVtcHR5UG9pbnQoKSxcblx0X2N1cnJab29tRWxlbWVudFN0eWxlLFxuXHRfbWFpblNjcm9sbEFuaW1hdGluZywgLy8gdHJ1ZSwgaWYgYW5pbWF0aW9uIGFmdGVyIHN3aXBlIGdlc3R1cmUgaXMgcnVubmluZ1xuXHRfbWlkWm9vbVBvaW50ID0gX2dldEVtcHR5UG9pbnQoKSxcblx0X2N1cnJDZW50ZXJQb2ludCA9IF9nZXRFbXB0eVBvaW50KCksXG5cdF9kaXJlY3Rpb24sXG5cdF9pc0ZpcnN0TW92ZSxcblx0X29wYWNpdHlDaGFuZ2VkLFxuXHRfYmdPcGFjaXR5LFxuXHRfd2FzT3ZlckluaXRpYWxab29tLFxuXG5cdF9pc0VxdWFsUG9pbnRzID0gZnVuY3Rpb24ocDEsIHAyKSB7XG5cdFx0cmV0dXJuIHAxLnggPT09IHAyLnggJiYgcDEueSA9PT0gcDIueTtcblx0fSxcblx0X2lzTmVhcmJ5UG9pbnRzID0gZnVuY3Rpb24odG91Y2gwLCB0b3VjaDEpIHtcblx0XHRyZXR1cm4gTWF0aC5hYnModG91Y2gwLnggLSB0b3VjaDEueCkgPCBET1VCTEVfVEFQX1JBRElVUyAmJiBNYXRoLmFicyh0b3VjaDAueSAtIHRvdWNoMS55KSA8IERPVUJMRV9UQVBfUkFESVVTO1xuXHR9LFxuXHRfY2FsY3VsYXRlUG9pbnRzRGlzdGFuY2UgPSBmdW5jdGlvbihwMSwgcDIpIHtcblx0XHRfdGVtcFBvaW50LnggPSBNYXRoLmFicyggcDEueCAtIHAyLnggKTtcblx0XHRfdGVtcFBvaW50LnkgPSBNYXRoLmFicyggcDEueSAtIHAyLnkgKTtcblx0XHRyZXR1cm4gTWF0aC5zcXJ0KF90ZW1wUG9pbnQueCAqIF90ZW1wUG9pbnQueCArIF90ZW1wUG9pbnQueSAqIF90ZW1wUG9pbnQueSk7XG5cdH0sXG5cdF9zdG9wRHJhZ1VwZGF0ZUxvb3AgPSBmdW5jdGlvbigpIHtcblx0XHRpZihfZHJhZ0FuaW1GcmFtZSkge1xuXHRcdFx0X2NhbmNlbEFGKF9kcmFnQW5pbUZyYW1lKTtcblx0XHRcdF9kcmFnQW5pbUZyYW1lID0gbnVsbDtcblx0XHR9XG5cdH0sXG5cdF9kcmFnVXBkYXRlTG9vcCA9IGZ1bmN0aW9uKCkge1xuXHRcdGlmKF9pc0RyYWdnaW5nKSB7XG5cdFx0XHRfZHJhZ0FuaW1GcmFtZSA9IF9yZXF1ZXN0QUYoX2RyYWdVcGRhdGVMb29wKTtcblx0XHRcdF9yZW5kZXJNb3ZlbWVudCgpO1xuXHRcdH1cblx0fSxcblx0X2NhblBhbiA9IGZ1bmN0aW9uKCkge1xuXHRcdHJldHVybiAhKF9vcHRpb25zLnNjYWxlTW9kZSA9PT0gJ2ZpdCcgJiYgX2N1cnJab29tTGV2ZWwgPT09ICBzZWxmLmN1cnJJdGVtLmluaXRpYWxab29tTGV2ZWwpO1xuXHR9LFxuXHRcblx0Ly8gZmluZCB0aGUgY2xvc2VzdCBwYXJlbnQgRE9NIGVsZW1lbnRcblx0X2Nsb3Nlc3RFbGVtZW50ID0gZnVuY3Rpb24oZWwsIGZuKSB7XG5cdCAgXHRpZighZWwgfHwgZWwgPT09IGRvY3VtZW50KSB7XG5cdCAgXHRcdHJldHVybiBmYWxzZTtcblx0ICBcdH1cblxuXHQgIFx0Ly8gZG9uJ3Qgc2VhcmNoIGVsZW1lbnRzIGFib3ZlIHBzd3BfX3Njcm9sbC13cmFwXG5cdCAgXHRpZihlbC5nZXRBdHRyaWJ1dGUoJ2NsYXNzJykgJiYgZWwuZ2V0QXR0cmlidXRlKCdjbGFzcycpLmluZGV4T2YoJ3Bzd3BfX3Njcm9sbC13cmFwJykgPiAtMSApIHtcblx0ICBcdFx0cmV0dXJuIGZhbHNlO1xuXHQgIFx0fVxuXG5cdCAgXHRpZiggZm4oZWwpICkge1xuXHQgIFx0XHRyZXR1cm4gZWw7XG5cdCAgXHR9XG5cblx0ICBcdHJldHVybiBfY2xvc2VzdEVsZW1lbnQoZWwucGFyZW50Tm9kZSwgZm4pO1xuXHR9LFxuXG5cdF9wcmV2ZW50T2JqID0ge30sXG5cdF9wcmV2ZW50RGVmYXVsdEV2ZW50QmVoYXZpb3VyID0gZnVuY3Rpb24oZSwgaXNEb3duKSB7XG5cdCAgICBfcHJldmVudE9iai5wcmV2ZW50ID0gIV9jbG9zZXN0RWxlbWVudChlLnRhcmdldCwgX29wdGlvbnMuaXNDbGlja2FibGVFbGVtZW50KTtcblxuXHRcdF9zaG91dCgncHJldmVudERyYWdFdmVudCcsIGUsIGlzRG93biwgX3ByZXZlbnRPYmopO1xuXHRcdHJldHVybiBfcHJldmVudE9iai5wcmV2ZW50O1xuXG5cdH0sXG5cdF9jb252ZXJ0VG91Y2hUb1BvaW50ID0gZnVuY3Rpb24odG91Y2gsIHApIHtcblx0XHRwLnggPSB0b3VjaC5wYWdlWDtcblx0XHRwLnkgPSB0b3VjaC5wYWdlWTtcblx0XHRwLmlkID0gdG91Y2guaWRlbnRpZmllcjtcblx0XHRyZXR1cm4gcDtcblx0fSxcblx0X2ZpbmRDZW50ZXJPZlBvaW50cyA9IGZ1bmN0aW9uKHAxLCBwMiwgcENlbnRlcikge1xuXHRcdHBDZW50ZXIueCA9IChwMS54ICsgcDIueCkgKiAwLjU7XG5cdFx0cENlbnRlci55ID0gKHAxLnkgKyBwMi55KSAqIDAuNTtcblx0fSxcblx0X3B1c2hQb3NQb2ludCA9IGZ1bmN0aW9uKHRpbWUsIHgsIHkpIHtcblx0XHRpZih0aW1lIC0gX2dlc3R1cmVDaGVja1NwZWVkVGltZSA+IDUwKSB7XG5cdFx0XHR2YXIgbyA9IF9wb3NQb2ludHMubGVuZ3RoID4gMiA/IF9wb3NQb2ludHMuc2hpZnQoKSA6IHt9O1xuXHRcdFx0by54ID0geDtcblx0XHRcdG8ueSA9IHk7IFxuXHRcdFx0X3Bvc1BvaW50cy5wdXNoKG8pO1xuXHRcdFx0X2dlc3R1cmVDaGVja1NwZWVkVGltZSA9IHRpbWU7XG5cdFx0fVxuXHR9LFxuXG5cdF9jYWxjdWxhdGVWZXJ0aWNhbERyYWdPcGFjaXR5UmF0aW8gPSBmdW5jdGlvbigpIHtcblx0XHR2YXIgeU9mZnNldCA9IF9wYW5PZmZzZXQueSAtIHNlbGYuY3Vyckl0ZW0uaW5pdGlhbFBvc2l0aW9uLnk7IC8vIGRpZmZlcmVuY2UgYmV0d2VlbiBpbml0aWFsIGFuZCBjdXJyZW50IHBvc2l0aW9uXG5cdFx0cmV0dXJuIDEgLSAgTWF0aC5hYnMoIHlPZmZzZXQgLyAoX3ZpZXdwb3J0U2l6ZS55IC8gMikgICk7XG5cdH0sXG5cblx0XG5cdC8vIHBvaW50cyBwb29sLCByZXVzZWQgZHVyaW5nIHRvdWNoIGV2ZW50c1xuXHRfZVBvaW50MSA9IHt9LFxuXHRfZVBvaW50MiA9IHt9LFxuXHRfdGVtcFBvaW50c0FyciA9IFtdLFxuXHRfdGVtcENvdW50ZXIsXG5cdF9nZXRUb3VjaFBvaW50cyA9IGZ1bmN0aW9uKGUpIHtcblx0XHQvLyBjbGVhbiB1cCBwcmV2aW91cyBwb2ludHMsIHdpdGhvdXQgcmVjcmVhdGluZyBhcnJheVxuXHRcdHdoaWxlKF90ZW1wUG9pbnRzQXJyLmxlbmd0aCA+IDApIHtcblx0XHRcdF90ZW1wUG9pbnRzQXJyLnBvcCgpO1xuXHRcdH1cblxuXHRcdGlmKCFfcG9pbnRlckV2ZW50RW5hYmxlZCkge1xuXHRcdFx0aWYoZS50eXBlLmluZGV4T2YoJ3RvdWNoJykgPiAtMSkge1xuXG5cdFx0XHRcdGlmKGUudG91Y2hlcyAmJiBlLnRvdWNoZXMubGVuZ3RoID4gMCkge1xuXHRcdFx0XHRcdF90ZW1wUG9pbnRzQXJyWzBdID0gX2NvbnZlcnRUb3VjaFRvUG9pbnQoZS50b3VjaGVzWzBdLCBfZVBvaW50MSk7XG5cdFx0XHRcdFx0aWYoZS50b3VjaGVzLmxlbmd0aCA+IDEpIHtcblx0XHRcdFx0XHRcdF90ZW1wUG9pbnRzQXJyWzFdID0gX2NvbnZlcnRUb3VjaFRvUG9pbnQoZS50b3VjaGVzWzFdLCBfZVBvaW50Mik7XG5cdFx0XHRcdFx0fVxuXHRcdFx0XHR9XG5cdFx0XHRcdFxuXHRcdFx0fSBlbHNlIHtcblx0XHRcdFx0X2VQb2ludDEueCA9IGUucGFnZVg7XG5cdFx0XHRcdF9lUG9pbnQxLnkgPSBlLnBhZ2VZO1xuXHRcdFx0XHRfZVBvaW50MS5pZCA9ICcnO1xuXHRcdFx0XHRfdGVtcFBvaW50c0FyclswXSA9IF9lUG9pbnQxOy8vX2VQb2ludDE7XG5cdFx0XHR9XG5cdFx0fSBlbHNlIHtcblx0XHRcdF90ZW1wQ291bnRlciA9IDA7XG5cdFx0XHQvLyB3ZSBjYW4gdXNlIGZvckVhY2gsIGFzIHBvaW50ZXIgZXZlbnRzIGFyZSBzdXBwb3J0ZWQgb25seSBpbiBtb2Rlcm4gYnJvd3NlcnNcblx0XHRcdF9jdXJyUG9pbnRlcnMuZm9yRWFjaChmdW5jdGlvbihwKSB7XG5cdFx0XHRcdGlmKF90ZW1wQ291bnRlciA9PT0gMCkge1xuXHRcdFx0XHRcdF90ZW1wUG9pbnRzQXJyWzBdID0gcDtcblx0XHRcdFx0fSBlbHNlIGlmKF90ZW1wQ291bnRlciA9PT0gMSkge1xuXHRcdFx0XHRcdF90ZW1wUG9pbnRzQXJyWzFdID0gcDtcblx0XHRcdFx0fVxuXHRcdFx0XHRfdGVtcENvdW50ZXIrKztcblxuXHRcdFx0fSk7XG5cdFx0fVxuXHRcdHJldHVybiBfdGVtcFBvaW50c0Fycjtcblx0fSxcblxuXHRfcGFuT3JNb3ZlTWFpblNjcm9sbCA9IGZ1bmN0aW9uKGF4aXMsIGRlbHRhKSB7XG5cblx0XHR2YXIgcGFuRnJpY3Rpb24sXG5cdFx0XHRvdmVyRGlmZiA9IDAsXG5cdFx0XHRuZXdPZmZzZXQgPSBfcGFuT2Zmc2V0W2F4aXNdICsgZGVsdGFbYXhpc10sXG5cdFx0XHRzdGFydE92ZXJEaWZmLFxuXHRcdFx0ZGlyID0gZGVsdGFbYXhpc10gPiAwLFxuXHRcdFx0bmV3TWFpblNjcm9sbFBvc2l0aW9uID0gX21haW5TY3JvbGxQb3MueCArIGRlbHRhLngsXG5cdFx0XHRtYWluU2Nyb2xsRGlmZiA9IF9tYWluU2Nyb2xsUG9zLnggLSBfc3RhcnRNYWluU2Nyb2xsUG9zLngsXG5cdFx0XHRuZXdQYW5Qb3MsXG5cdFx0XHRuZXdNYWluU2Nyb2xsUG9zO1xuXG5cdFx0Ly8gY2FsY3VsYXRlIGZkaXN0YW5jZSBvdmVyIHRoZSBib3VuZHMgYW5kIGZyaWN0aW9uXG5cdFx0aWYobmV3T2Zmc2V0ID4gX2N1cnJQYW5Cb3VuZHMubWluW2F4aXNdIHx8IG5ld09mZnNldCA8IF9jdXJyUGFuQm91bmRzLm1heFtheGlzXSkge1xuXHRcdFx0cGFuRnJpY3Rpb24gPSBfb3B0aW9ucy5wYW5FbmRGcmljdGlvbjtcblx0XHRcdC8vIExpbmVhciBpbmNyZWFzaW5nIG9mIGZyaWN0aW9uLCBzbyBhdCAxLzQgb2Ygdmlld3BvcnQgaXQncyBhdCBtYXggdmFsdWUuIFxuXHRcdFx0Ly8gTG9va3Mgbm90IGFzIG5pY2UgYXMgd2FzIGV4cGVjdGVkLiBMZWZ0IGZvciBoaXN0b3J5LlxuXHRcdFx0Ly8gcGFuRnJpY3Rpb24gPSAoMSAtIChfcGFuT2Zmc2V0W2F4aXNdICsgZGVsdGFbYXhpc10gKyBwYW5Cb3VuZHMubWluW2F4aXNdKSAvIChfdmlld3BvcnRTaXplW2F4aXNdIC8gNCkgKTtcblx0XHR9IGVsc2Uge1xuXHRcdFx0cGFuRnJpY3Rpb24gPSAxO1xuXHRcdH1cblx0XHRcblx0XHRuZXdPZmZzZXQgPSBfcGFuT2Zmc2V0W2F4aXNdICsgZGVsdGFbYXhpc10gKiBwYW5GcmljdGlvbjtcblxuXHRcdC8vIG1vdmUgbWFpbiBzY3JvbGwgb3Igc3RhcnQgcGFubmluZ1xuXHRcdGlmKF9vcHRpb25zLmFsbG93UGFuVG9OZXh0IHx8IF9jdXJyWm9vbUxldmVsID09PSBzZWxmLmN1cnJJdGVtLmluaXRpYWxab29tTGV2ZWwpIHtcblxuXG5cdFx0XHRpZighX2N1cnJab29tRWxlbWVudFN0eWxlKSB7XG5cdFx0XHRcdFxuXHRcdFx0XHRuZXdNYWluU2Nyb2xsUG9zID0gbmV3TWFpblNjcm9sbFBvc2l0aW9uO1xuXG5cdFx0XHR9IGVsc2UgaWYoX2RpcmVjdGlvbiA9PT0gJ2gnICYmIGF4aXMgPT09ICd4JyAmJiAhX3pvb21TdGFydGVkICkge1xuXHRcdFx0XHRcblx0XHRcdFx0aWYoZGlyKSB7XG5cdFx0XHRcdFx0aWYobmV3T2Zmc2V0ID4gX2N1cnJQYW5Cb3VuZHMubWluW2F4aXNdKSB7XG5cdFx0XHRcdFx0XHRwYW5GcmljdGlvbiA9IF9vcHRpb25zLnBhbkVuZEZyaWN0aW9uO1xuXHRcdFx0XHRcdFx0b3ZlckRpZmYgPSBfY3VyclBhbkJvdW5kcy5taW5bYXhpc10gLSBuZXdPZmZzZXQ7XG5cdFx0XHRcdFx0XHRzdGFydE92ZXJEaWZmID0gX2N1cnJQYW5Cb3VuZHMubWluW2F4aXNdIC0gX3N0YXJ0UGFuT2Zmc2V0W2F4aXNdO1xuXHRcdFx0XHRcdH1cblx0XHRcdFx0XHRcblx0XHRcdFx0XHQvLyBkcmFnIHJpZ2h0XG5cdFx0XHRcdFx0aWYoIChzdGFydE92ZXJEaWZmIDw9IDAgfHwgbWFpblNjcm9sbERpZmYgPCAwKSAmJiBfZ2V0TnVtSXRlbXMoKSA+IDEgKSB7XG5cdFx0XHRcdFx0XHRuZXdNYWluU2Nyb2xsUG9zID0gbmV3TWFpblNjcm9sbFBvc2l0aW9uO1xuXHRcdFx0XHRcdFx0aWYobWFpblNjcm9sbERpZmYgPCAwICYmIG5ld01haW5TY3JvbGxQb3NpdGlvbiA+IF9zdGFydE1haW5TY3JvbGxQb3MueCkge1xuXHRcdFx0XHRcdFx0XHRuZXdNYWluU2Nyb2xsUG9zID0gX3N0YXJ0TWFpblNjcm9sbFBvcy54O1xuXHRcdFx0XHRcdFx0fVxuXHRcdFx0XHRcdH0gZWxzZSB7XG5cdFx0XHRcdFx0XHRpZihfY3VyclBhbkJvdW5kcy5taW4ueCAhPT0gX2N1cnJQYW5Cb3VuZHMubWF4LngpIHtcblx0XHRcdFx0XHRcdFx0bmV3UGFuUG9zID0gbmV3T2Zmc2V0O1xuXHRcdFx0XHRcdFx0fVxuXHRcdFx0XHRcdFx0XG5cdFx0XHRcdFx0fVxuXG5cdFx0XHRcdH0gZWxzZSB7XG5cblx0XHRcdFx0XHRpZihuZXdPZmZzZXQgPCBfY3VyclBhbkJvdW5kcy5tYXhbYXhpc10gKSB7XG5cdFx0XHRcdFx0XHRwYW5GcmljdGlvbiA9X29wdGlvbnMucGFuRW5kRnJpY3Rpb247XG5cdFx0XHRcdFx0XHRvdmVyRGlmZiA9IG5ld09mZnNldCAtIF9jdXJyUGFuQm91bmRzLm1heFtheGlzXTtcblx0XHRcdFx0XHRcdHN0YXJ0T3ZlckRpZmYgPSBfc3RhcnRQYW5PZmZzZXRbYXhpc10gLSBfY3VyclBhbkJvdW5kcy5tYXhbYXhpc107XG5cdFx0XHRcdFx0fVxuXG5cdFx0XHRcdFx0aWYoIChzdGFydE92ZXJEaWZmIDw9IDAgfHwgbWFpblNjcm9sbERpZmYgPiAwKSAmJiBfZ2V0TnVtSXRlbXMoKSA+IDEgKSB7XG5cdFx0XHRcdFx0XHRuZXdNYWluU2Nyb2xsUG9zID0gbmV3TWFpblNjcm9sbFBvc2l0aW9uO1xuXG5cdFx0XHRcdFx0XHRpZihtYWluU2Nyb2xsRGlmZiA+IDAgJiYgbmV3TWFpblNjcm9sbFBvc2l0aW9uIDwgX3N0YXJ0TWFpblNjcm9sbFBvcy54KSB7XG5cdFx0XHRcdFx0XHRcdG5ld01haW5TY3JvbGxQb3MgPSBfc3RhcnRNYWluU2Nyb2xsUG9zLng7XG5cdFx0XHRcdFx0XHR9XG5cblx0XHRcdFx0XHR9IGVsc2Uge1xuXHRcdFx0XHRcdFx0aWYoX2N1cnJQYW5Cb3VuZHMubWluLnggIT09IF9jdXJyUGFuQm91bmRzLm1heC54KSB7XG5cdFx0XHRcdFx0XHRcdG5ld1BhblBvcyA9IG5ld09mZnNldDtcblx0XHRcdFx0XHRcdH1cblx0XHRcdFx0XHR9XG5cblx0XHRcdFx0fVxuXG5cblx0XHRcdFx0Ly9cblx0XHRcdH1cblxuXHRcdFx0aWYoYXhpcyA9PT0gJ3gnKSB7XG5cblx0XHRcdFx0aWYobmV3TWFpblNjcm9sbFBvcyAhPT0gdW5kZWZpbmVkKSB7XG5cdFx0XHRcdFx0X21vdmVNYWluU2Nyb2xsKG5ld01haW5TY3JvbGxQb3MsIHRydWUpO1xuXHRcdFx0XHRcdGlmKG5ld01haW5TY3JvbGxQb3MgPT09IF9zdGFydE1haW5TY3JvbGxQb3MueCkge1xuXHRcdFx0XHRcdFx0X21haW5TY3JvbGxTaGlmdGVkID0gZmFsc2U7XG5cdFx0XHRcdFx0fSBlbHNlIHtcblx0XHRcdFx0XHRcdF9tYWluU2Nyb2xsU2hpZnRlZCA9IHRydWU7XG5cdFx0XHRcdFx0fVxuXHRcdFx0XHR9XG5cblx0XHRcdFx0aWYoX2N1cnJQYW5Cb3VuZHMubWluLnggIT09IF9jdXJyUGFuQm91bmRzLm1heC54KSB7XG5cdFx0XHRcdFx0aWYobmV3UGFuUG9zICE9PSB1bmRlZmluZWQpIHtcblx0XHRcdFx0XHRcdF9wYW5PZmZzZXQueCA9IG5ld1BhblBvcztcblx0XHRcdFx0XHR9IGVsc2UgaWYoIV9tYWluU2Nyb2xsU2hpZnRlZCkge1xuXHRcdFx0XHRcdFx0X3Bhbk9mZnNldC54ICs9IGRlbHRhLnggKiBwYW5GcmljdGlvbjtcblx0XHRcdFx0XHR9XG5cdFx0XHRcdH1cblxuXHRcdFx0XHRyZXR1cm4gbmV3TWFpblNjcm9sbFBvcyAhPT0gdW5kZWZpbmVkO1xuXHRcdFx0fVxuXG5cdFx0fVxuXG5cdFx0aWYoIV9tYWluU2Nyb2xsQW5pbWF0aW5nKSB7XG5cdFx0XHRcblx0XHRcdGlmKCFfbWFpblNjcm9sbFNoaWZ0ZWQpIHtcblx0XHRcdFx0aWYoX2N1cnJab29tTGV2ZWwgPiBzZWxmLmN1cnJJdGVtLmZpdFJhdGlvKSB7XG5cdFx0XHRcdFx0X3Bhbk9mZnNldFtheGlzXSArPSBkZWx0YVtheGlzXSAqIHBhbkZyaWN0aW9uO1xuXHRcdFx0XHRcblx0XHRcdFx0fVxuXHRcdFx0fVxuXG5cdFx0XHRcblx0XHR9XG5cdFx0XG5cdH0sXG5cblx0Ly8gUG9pbnRlcmRvd24vdG91Y2hzdGFydC9tb3VzZWRvd24gaGFuZGxlclxuXHRfb25EcmFnU3RhcnQgPSBmdW5jdGlvbihlKSB7XG5cblx0XHQvLyBBbGxvdyBkcmFnZ2luZyBvbmx5IHZpYSBsZWZ0IG1vdXNlIGJ1dHRvbi5cblx0XHQvLyBBcyB0aGlzIGhhbmRsZXIgaXMgbm90IGFkZGVkIGluIElFOCAtIHdlIGlnbm9yZSBlLndoaWNoXG5cdFx0Ly8gXG5cdFx0Ly8gaHR0cDovL3d3dy5xdWlya3Ntb2RlLm9yZy9qcy9ldmVudHNfcHJvcGVydGllcy5odG1sXG5cdFx0Ly8gaHR0cHM6Ly9kZXZlbG9wZXIubW96aWxsYS5vcmcvZW4tVVMvZG9jcy9XZWIvQVBJL2V2ZW50LmJ1dHRvblxuXHRcdGlmKGUudHlwZSA9PT0gJ21vdXNlZG93bicgJiYgZS5idXR0b24gPiAwICApIHtcblx0XHRcdHJldHVybjtcblx0XHR9XG5cblx0XHRpZihfaW5pdGlhbFpvb21SdW5uaW5nKSB7XG5cdFx0XHRlLnByZXZlbnREZWZhdWx0KCk7XG5cdFx0XHRyZXR1cm47XG5cdFx0fVxuXG5cdFx0aWYoX29sZEFuZHJvaWRUb3VjaEVuZFRpbWVvdXQgJiYgZS50eXBlID09PSAnbW91c2Vkb3duJykge1xuXHRcdFx0cmV0dXJuO1xuXHRcdH1cblxuXHRcdGlmKF9wcmV2ZW50RGVmYXVsdEV2ZW50QmVoYXZpb3VyKGUsIHRydWUpKSB7XG5cdFx0XHRlLnByZXZlbnREZWZhdWx0KCk7XG5cdFx0fVxuXG5cblxuXHRcdF9zaG91dCgncG9pbnRlckRvd24nKTtcblxuXHRcdGlmKF9wb2ludGVyRXZlbnRFbmFibGVkKSB7XG5cdFx0XHR2YXIgcG9pbnRlckluZGV4ID0gZnJhbWV3b3JrLmFycmF5U2VhcmNoKF9jdXJyUG9pbnRlcnMsIGUucG9pbnRlcklkLCAnaWQnKTtcblx0XHRcdGlmKHBvaW50ZXJJbmRleCA8IDApIHtcblx0XHRcdFx0cG9pbnRlckluZGV4ID0gX2N1cnJQb2ludGVycy5sZW5ndGg7XG5cdFx0XHR9XG5cdFx0XHRfY3VyclBvaW50ZXJzW3BvaW50ZXJJbmRleF0gPSB7eDplLnBhZ2VYLCB5OmUucGFnZVksIGlkOiBlLnBvaW50ZXJJZH07XG5cdFx0fVxuXHRcdFxuXG5cblx0XHR2YXIgc3RhcnRQb2ludHNMaXN0ID0gX2dldFRvdWNoUG9pbnRzKGUpLFxuXHRcdFx0bnVtUG9pbnRzID0gc3RhcnRQb2ludHNMaXN0Lmxlbmd0aDtcblxuXHRcdF9jdXJyZW50UG9pbnRzID0gbnVsbDtcblxuXHRcdF9zdG9wQWxsQW5pbWF0aW9ucygpO1xuXG5cdFx0Ly8gaW5pdCBkcmFnXG5cdFx0aWYoIV9pc0RyYWdnaW5nIHx8IG51bVBvaW50cyA9PT0gMSkge1xuXG5cdFx0XHRcblxuXHRcdFx0X2lzRHJhZ2dpbmcgPSBfaXNGaXJzdE1vdmUgPSB0cnVlO1xuXHRcdFx0ZnJhbWV3b3JrLmJpbmQod2luZG93LCBfdXBNb3ZlRXZlbnRzLCBzZWxmKTtcblxuXHRcdFx0X2lzWm9vbWluZ0luID0gXG5cdFx0XHRcdF93YXNPdmVySW5pdGlhbFpvb20gPSBcblx0XHRcdFx0X29wYWNpdHlDaGFuZ2VkID0gXG5cdFx0XHRcdF92ZXJ0aWNhbERyYWdJbml0aWF0ZWQgPSBcblx0XHRcdFx0X21haW5TY3JvbGxTaGlmdGVkID0gXG5cdFx0XHRcdF9tb3ZlZCA9IFxuXHRcdFx0XHRfaXNNdWx0aXRvdWNoID0gXG5cdFx0XHRcdF96b29tU3RhcnRlZCA9IGZhbHNlO1xuXG5cdFx0XHRfZGlyZWN0aW9uID0gbnVsbDtcblxuXHRcdFx0X3Nob3V0KCdmaXJzdFRvdWNoU3RhcnQnLCBzdGFydFBvaW50c0xpc3QpO1xuXG5cdFx0XHRfZXF1YWxpemVQb2ludHMoX3N0YXJ0UGFuT2Zmc2V0LCBfcGFuT2Zmc2V0KTtcblxuXHRcdFx0X2N1cnJQYW5EaXN0LnggPSBfY3VyclBhbkRpc3QueSA9IDA7XG5cdFx0XHRfZXF1YWxpemVQb2ludHMoX2N1cnJQb2ludCwgc3RhcnRQb2ludHNMaXN0WzBdKTtcblx0XHRcdF9lcXVhbGl6ZVBvaW50cyhfc3RhcnRQb2ludCwgX2N1cnJQb2ludCk7XG5cblx0XHRcdC8vX2VxdWFsaXplUG9pbnRzKF9zdGFydE1haW5TY3JvbGxQb3MsIF9tYWluU2Nyb2xsUG9zKTtcblx0XHRcdF9zdGFydE1haW5TY3JvbGxQb3MueCA9IF9zbGlkZVNpemUueCAqIF9jdXJyUG9zaXRpb25JbmRleDtcblxuXHRcdFx0X3Bvc1BvaW50cyA9IFt7XG5cdFx0XHRcdHg6IF9jdXJyUG9pbnQueCxcblx0XHRcdFx0eTogX2N1cnJQb2ludC55XG5cdFx0XHR9XTtcblxuXHRcdFx0X2dlc3R1cmVDaGVja1NwZWVkVGltZSA9IF9nZXN0dXJlU3RhcnRUaW1lID0gX2dldEN1cnJlbnRUaW1lKCk7XG5cblx0XHRcdC8vX21haW5TY3JvbGxBbmltYXRpb25FbmQodHJ1ZSk7XG5cdFx0XHRfY2FsY3VsYXRlUGFuQm91bmRzKCBfY3Vyclpvb21MZXZlbCwgdHJ1ZSApO1xuXHRcdFx0XG5cdFx0XHQvLyBTdGFydCByZW5kZXJpbmdcblx0XHRcdF9zdG9wRHJhZ1VwZGF0ZUxvb3AoKTtcblx0XHRcdF9kcmFnVXBkYXRlTG9vcCgpO1xuXHRcdFx0XG5cdFx0fVxuXG5cdFx0Ly8gaW5pdCB6b29tXG5cdFx0aWYoIV9pc1pvb21pbmcgJiYgbnVtUG9pbnRzID4gMSAmJiAhX21haW5TY3JvbGxBbmltYXRpbmcgJiYgIV9tYWluU2Nyb2xsU2hpZnRlZCkge1xuXHRcdFx0X3N0YXJ0Wm9vbUxldmVsID0gX2N1cnJab29tTGV2ZWw7XG5cdFx0XHRfem9vbVN0YXJ0ZWQgPSBmYWxzZTsgLy8gdHJ1ZSBpZiB6b29tIGNoYW5nZWQgYXQgbGVhc3Qgb25jZVxuXG5cdFx0XHRfaXNab29taW5nID0gX2lzTXVsdGl0b3VjaCA9IHRydWU7XG5cdFx0XHRfY3VyclBhbkRpc3QueSA9IF9jdXJyUGFuRGlzdC54ID0gMDtcblxuXHRcdFx0X2VxdWFsaXplUG9pbnRzKF9zdGFydFBhbk9mZnNldCwgX3Bhbk9mZnNldCk7XG5cblx0XHRcdF9lcXVhbGl6ZVBvaW50cyhwLCBzdGFydFBvaW50c0xpc3RbMF0pO1xuXHRcdFx0X2VxdWFsaXplUG9pbnRzKHAyLCBzdGFydFBvaW50c0xpc3RbMV0pO1xuXG5cdFx0XHRfZmluZENlbnRlck9mUG9pbnRzKHAsIHAyLCBfY3VyckNlbnRlclBvaW50KTtcblxuXHRcdFx0X21pZFpvb21Qb2ludC54ID0gTWF0aC5hYnMoX2N1cnJDZW50ZXJQb2ludC54KSAtIF9wYW5PZmZzZXQueDtcblx0XHRcdF9taWRab29tUG9pbnQueSA9IE1hdGguYWJzKF9jdXJyQ2VudGVyUG9pbnQueSkgLSBfcGFuT2Zmc2V0Lnk7XG5cdFx0XHRfY3VyclBvaW50c0Rpc3RhbmNlID0gX3N0YXJ0UG9pbnRzRGlzdGFuY2UgPSBfY2FsY3VsYXRlUG9pbnRzRGlzdGFuY2UocCwgcDIpO1xuXHRcdH1cblxuXG5cdH0sXG5cblx0Ly8gUG9pbnRlcm1vdmUvdG91Y2htb3ZlL21vdXNlbW92ZSBoYW5kbGVyXG5cdF9vbkRyYWdNb3ZlID0gZnVuY3Rpb24oZSkge1xuXG5cdFx0ZS5wcmV2ZW50RGVmYXVsdCgpO1xuXG5cdFx0aWYoX3BvaW50ZXJFdmVudEVuYWJsZWQpIHtcblx0XHRcdHZhciBwb2ludGVySW5kZXggPSBmcmFtZXdvcmsuYXJyYXlTZWFyY2goX2N1cnJQb2ludGVycywgZS5wb2ludGVySWQsICdpZCcpO1xuXHRcdFx0aWYocG9pbnRlckluZGV4ID4gLTEpIHtcblx0XHRcdFx0dmFyIHAgPSBfY3VyclBvaW50ZXJzW3BvaW50ZXJJbmRleF07XG5cdFx0XHRcdHAueCA9IGUucGFnZVg7XG5cdFx0XHRcdHAueSA9IGUucGFnZVk7IFxuXHRcdFx0fVxuXHRcdH1cblxuXHRcdGlmKF9pc0RyYWdnaW5nKSB7XG5cdFx0XHR2YXIgdG91Y2hlc0xpc3QgPSBfZ2V0VG91Y2hQb2ludHMoZSk7XG5cdFx0XHRpZighX2RpcmVjdGlvbiAmJiAhX21vdmVkICYmICFfaXNab29taW5nKSB7XG5cblx0XHRcdFx0aWYoX21haW5TY3JvbGxQb3MueCAhPT0gX3NsaWRlU2l6ZS54ICogX2N1cnJQb3NpdGlvbkluZGV4KSB7XG5cdFx0XHRcdFx0Ly8gaWYgbWFpbiBzY3JvbGwgcG9zaXRpb24gaXMgc2hpZnRlZCDigJMgZGlyZWN0aW9uIGlzIGFsd2F5cyBob3Jpem9udGFsXG5cdFx0XHRcdFx0X2RpcmVjdGlvbiA9ICdoJztcblx0XHRcdFx0fSBlbHNlIHtcblx0XHRcdFx0XHR2YXIgZGlmZiA9IE1hdGguYWJzKHRvdWNoZXNMaXN0WzBdLnggLSBfY3VyclBvaW50LngpIC0gTWF0aC5hYnModG91Y2hlc0xpc3RbMF0ueSAtIF9jdXJyUG9pbnQueSk7XG5cdFx0XHRcdFx0Ly8gY2hlY2sgdGhlIGRpcmVjdGlvbiBvZiBtb3ZlbWVudFxuXHRcdFx0XHRcdGlmKE1hdGguYWJzKGRpZmYpID49IERJUkVDVElPTl9DSEVDS19PRkZTRVQpIHtcblx0XHRcdFx0XHRcdF9kaXJlY3Rpb24gPSBkaWZmID4gMCA/ICdoJyA6ICd2Jztcblx0XHRcdFx0XHRcdF9jdXJyZW50UG9pbnRzID0gdG91Y2hlc0xpc3Q7XG5cdFx0XHRcdFx0fVxuXHRcdFx0XHR9XG5cdFx0XHRcdFxuXHRcdFx0fSBlbHNlIHtcblx0XHRcdFx0X2N1cnJlbnRQb2ludHMgPSB0b3VjaGVzTGlzdDtcblx0XHRcdH1cblx0XHR9XHRcblx0fSxcblx0Ly8gXG5cdF9yZW5kZXJNb3ZlbWVudCA9ICBmdW5jdGlvbigpIHtcblxuXHRcdGlmKCFfY3VycmVudFBvaW50cykge1xuXHRcdFx0cmV0dXJuO1xuXHRcdH1cblxuXHRcdHZhciBudW1Qb2ludHMgPSBfY3VycmVudFBvaW50cy5sZW5ndGg7XG5cblx0XHRpZihudW1Qb2ludHMgPT09IDApIHtcblx0XHRcdHJldHVybjtcblx0XHR9XG5cblx0XHRfZXF1YWxpemVQb2ludHMocCwgX2N1cnJlbnRQb2ludHNbMF0pO1xuXG5cdFx0ZGVsdGEueCA9IHAueCAtIF9jdXJyUG9pbnQueDtcblx0XHRkZWx0YS55ID0gcC55IC0gX2N1cnJQb2ludC55O1xuXG5cdFx0aWYoX2lzWm9vbWluZyAmJiBudW1Qb2ludHMgPiAxKSB7XG5cdFx0XHQvLyBIYW5kbGUgYmVoYXZpb3VyIGZvciBtb3JlIHRoYW4gMSBwb2ludFxuXG5cdFx0XHRfY3VyclBvaW50LnggPSBwLng7XG5cdFx0XHRfY3VyclBvaW50LnkgPSBwLnk7XG5cdFx0XG5cdFx0XHQvLyBjaGVjayBpZiBvbmUgb2YgdHdvIHBvaW50cyBjaGFuZ2VkXG5cdFx0XHRpZiggIWRlbHRhLnggJiYgIWRlbHRhLnkgJiYgX2lzRXF1YWxQb2ludHMoX2N1cnJlbnRQb2ludHNbMV0sIHAyKSApIHtcblx0XHRcdFx0cmV0dXJuO1xuXHRcdFx0fVxuXG5cdFx0XHRfZXF1YWxpemVQb2ludHMocDIsIF9jdXJyZW50UG9pbnRzWzFdKTtcblxuXG5cdFx0XHRpZighX3pvb21TdGFydGVkKSB7XG5cdFx0XHRcdF96b29tU3RhcnRlZCA9IHRydWU7XG5cdFx0XHRcdF9zaG91dCgnem9vbUdlc3R1cmVTdGFydGVkJyk7XG5cdFx0XHR9XG5cdFx0XHRcblx0XHRcdC8vIERpc3RhbmNlIGJldHdlZW4gdHdvIHBvaW50c1xuXHRcdFx0dmFyIHBvaW50c0Rpc3RhbmNlID0gX2NhbGN1bGF0ZVBvaW50c0Rpc3RhbmNlKHAscDIpO1xuXG5cdFx0XHR2YXIgem9vbUxldmVsID0gX2NhbGN1bGF0ZVpvb21MZXZlbChwb2ludHNEaXN0YW5jZSk7XG5cblx0XHRcdC8vIHNsaWdodGx5IG92ZXIgdGhlIG9mIGluaXRpYWwgem9vbSBsZXZlbFxuXHRcdFx0aWYoem9vbUxldmVsID4gc2VsZi5jdXJySXRlbS5pbml0aWFsWm9vbUxldmVsICsgc2VsZi5jdXJySXRlbS5pbml0aWFsWm9vbUxldmVsIC8gMTUpIHtcblx0XHRcdFx0X3dhc092ZXJJbml0aWFsWm9vbSA9IHRydWU7XG5cdFx0XHR9XG5cblx0XHRcdC8vIEFwcGx5IHRoZSBmcmljdGlvbiBpZiB6b29tIGxldmVsIGlzIG91dCBvZiB0aGUgYm91bmRzXG5cdFx0XHR2YXIgem9vbUZyaWN0aW9uID0gMSxcblx0XHRcdFx0bWluWm9vbUxldmVsID0gX2dldE1pblpvb21MZXZlbCgpLFxuXHRcdFx0XHRtYXhab29tTGV2ZWwgPSBfZ2V0TWF4Wm9vbUxldmVsKCk7XG5cblx0XHRcdGlmICggem9vbUxldmVsIDwgbWluWm9vbUxldmVsICkge1xuXHRcdFx0XHRcblx0XHRcdFx0aWYoX29wdGlvbnMucGluY2hUb0Nsb3NlICYmICFfd2FzT3ZlckluaXRpYWxab29tICYmIF9zdGFydFpvb21MZXZlbCA8PSBzZWxmLmN1cnJJdGVtLmluaXRpYWxab29tTGV2ZWwpIHtcblx0XHRcdFx0XHQvLyBmYWRlIG91dCBiYWNrZ3JvdW5kIGlmIHpvb21pbmcgb3V0XG5cdFx0XHRcdFx0dmFyIG1pbnVzRGlmZiA9IG1pblpvb21MZXZlbCAtIHpvb21MZXZlbDtcblx0XHRcdFx0XHR2YXIgcGVyY2VudCA9IDEgLSBtaW51c0RpZmYgLyAobWluWm9vbUxldmVsIC8gMS4yKTtcblxuXHRcdFx0XHRcdF9hcHBseUJnT3BhY2l0eShwZXJjZW50KTtcblx0XHRcdFx0XHRfc2hvdXQoJ29uUGluY2hDbG9zZScsIHBlcmNlbnQpO1xuXHRcdFx0XHRcdF9vcGFjaXR5Q2hhbmdlZCA9IHRydWU7XG5cdFx0XHRcdH0gZWxzZSB7XG5cdFx0XHRcdFx0em9vbUZyaWN0aW9uID0gKG1pblpvb21MZXZlbCAtIHpvb21MZXZlbCkgLyBtaW5ab29tTGV2ZWw7XG5cdFx0XHRcdFx0aWYoem9vbUZyaWN0aW9uID4gMSkge1xuXHRcdFx0XHRcdFx0em9vbUZyaWN0aW9uID0gMTtcblx0XHRcdFx0XHR9XG5cdFx0XHRcdFx0em9vbUxldmVsID0gbWluWm9vbUxldmVsIC0gem9vbUZyaWN0aW9uICogKG1pblpvb21MZXZlbCAvIDMpO1xuXHRcdFx0XHR9XG5cdFx0XHRcdFxuXHRcdFx0fSBlbHNlIGlmICggem9vbUxldmVsID4gbWF4Wm9vbUxldmVsICkge1xuXHRcdFx0XHQvLyAxLjUgLSBleHRyYSB6b29tIGxldmVsIGFib3ZlIHRoZSBtYXguIEUuZy4gaWYgbWF4IGlzIHg2LCByZWFsIG1heCA2ICsgMS41ID0gNy41XG5cdFx0XHRcdHpvb21GcmljdGlvbiA9ICh6b29tTGV2ZWwgLSBtYXhab29tTGV2ZWwpIC8gKCBtaW5ab29tTGV2ZWwgKiA2ICk7XG5cdFx0XHRcdGlmKHpvb21GcmljdGlvbiA+IDEpIHtcblx0XHRcdFx0XHR6b29tRnJpY3Rpb24gPSAxO1xuXHRcdFx0XHR9XG5cdFx0XHRcdHpvb21MZXZlbCA9IG1heFpvb21MZXZlbCArIHpvb21GcmljdGlvbiAqIG1pblpvb21MZXZlbDtcblx0XHRcdH1cblxuXHRcdFx0aWYoem9vbUZyaWN0aW9uIDwgMCkge1xuXHRcdFx0XHR6b29tRnJpY3Rpb24gPSAwO1xuXHRcdFx0fVxuXG5cdFx0XHQvLyBkaXN0YW5jZSBiZXR3ZWVuIHRvdWNoIHBvaW50cyBhZnRlciBmcmljdGlvbiBpcyBhcHBsaWVkXG5cdFx0XHRfY3VyclBvaW50c0Rpc3RhbmNlID0gcG9pbnRzRGlzdGFuY2U7XG5cblx0XHRcdC8vIF9jZW50ZXJQb2ludCAtIFRoZSBwb2ludCBpbiB0aGUgbWlkZGxlIG9mIHR3byBwb2ludGVyc1xuXHRcdFx0X2ZpbmRDZW50ZXJPZlBvaW50cyhwLCBwMiwgX2NlbnRlclBvaW50KTtcblx0XHRcblx0XHRcdC8vIHBhbmluZyB3aXRoIHR3byBwb2ludGVycyBwcmVzc2VkXG5cdFx0XHRfY3VyclBhbkRpc3QueCArPSBfY2VudGVyUG9pbnQueCAtIF9jdXJyQ2VudGVyUG9pbnQueDtcblx0XHRcdF9jdXJyUGFuRGlzdC55ICs9IF9jZW50ZXJQb2ludC55IC0gX2N1cnJDZW50ZXJQb2ludC55O1xuXHRcdFx0X2VxdWFsaXplUG9pbnRzKF9jdXJyQ2VudGVyUG9pbnQsIF9jZW50ZXJQb2ludCk7XG5cblx0XHRcdF9wYW5PZmZzZXQueCA9IF9jYWxjdWxhdGVQYW5PZmZzZXQoJ3gnLCB6b29tTGV2ZWwpO1xuXHRcdFx0X3Bhbk9mZnNldC55ID0gX2NhbGN1bGF0ZVBhbk9mZnNldCgneScsIHpvb21MZXZlbCk7XG5cblx0XHRcdF9pc1pvb21pbmdJbiA9IHpvb21MZXZlbCA+IF9jdXJyWm9vbUxldmVsO1xuXHRcdFx0X2N1cnJab29tTGV2ZWwgPSB6b29tTGV2ZWw7XG5cdFx0XHRfYXBwbHlDdXJyZW50Wm9vbVBhbigpO1xuXG5cdFx0fSBlbHNlIHtcblxuXHRcdFx0Ly8gaGFuZGxlIGJlaGF2aW91ciBmb3Igb25lIHBvaW50IChkcmFnZ2luZyBvciBwYW5uaW5nKVxuXG5cdFx0XHRpZighX2RpcmVjdGlvbikge1xuXHRcdFx0XHRyZXR1cm47XG5cdFx0XHR9XG5cblx0XHRcdGlmKF9pc0ZpcnN0TW92ZSkge1xuXHRcdFx0XHRfaXNGaXJzdE1vdmUgPSBmYWxzZTtcblxuXHRcdFx0XHQvLyBzdWJ0cmFjdCBkcmFnIGRpc3RhbmNlIHRoYXQgd2FzIHVzZWQgZHVyaW5nIHRoZSBkZXRlY3Rpb24gZGlyZWN0aW9uICBcblxuXHRcdFx0XHRpZiggTWF0aC5hYnMoZGVsdGEueCkgPj0gRElSRUNUSU9OX0NIRUNLX09GRlNFVCkge1xuXHRcdFx0XHRcdGRlbHRhLnggLT0gX2N1cnJlbnRQb2ludHNbMF0ueCAtIF9zdGFydFBvaW50Lng7XG5cdFx0XHRcdH1cblx0XHRcdFx0XG5cdFx0XHRcdGlmKCBNYXRoLmFicyhkZWx0YS55KSA+PSBESVJFQ1RJT05fQ0hFQ0tfT0ZGU0VUKSB7XG5cdFx0XHRcdFx0ZGVsdGEueSAtPSBfY3VycmVudFBvaW50c1swXS55IC0gX3N0YXJ0UG9pbnQueTtcblx0XHRcdFx0fVxuXHRcdFx0fVxuXG5cdFx0XHRfY3VyclBvaW50LnggPSBwLng7XG5cdFx0XHRfY3VyclBvaW50LnkgPSBwLnk7XG5cblx0XHRcdC8vIGRvIG5vdGhpbmcgaWYgcG9pbnRlcnMgcG9zaXRpb24gaGFzbid0IGNoYW5nZWRcblx0XHRcdGlmKGRlbHRhLnggPT09IDAgJiYgZGVsdGEueSA9PT0gMCkge1xuXHRcdFx0XHRyZXR1cm47XG5cdFx0XHR9XG5cblx0XHRcdGlmKF9kaXJlY3Rpb24gPT09ICd2JyAmJiBfb3B0aW9ucy5jbG9zZU9uVmVydGljYWxEcmFnKSB7XG5cdFx0XHRcdGlmKCFfY2FuUGFuKCkpIHtcblx0XHRcdFx0XHRfY3VyclBhbkRpc3QueSArPSBkZWx0YS55O1xuXHRcdFx0XHRcdF9wYW5PZmZzZXQueSArPSBkZWx0YS55O1xuXG5cdFx0XHRcdFx0dmFyIG9wYWNpdHlSYXRpbyA9IF9jYWxjdWxhdGVWZXJ0aWNhbERyYWdPcGFjaXR5UmF0aW8oKTtcblxuXHRcdFx0XHRcdF92ZXJ0aWNhbERyYWdJbml0aWF0ZWQgPSB0cnVlO1xuXHRcdFx0XHRcdF9zaG91dCgnb25WZXJ0aWNhbERyYWcnLCBvcGFjaXR5UmF0aW8pO1xuXG5cdFx0XHRcdFx0X2FwcGx5QmdPcGFjaXR5KG9wYWNpdHlSYXRpbyk7XG5cdFx0XHRcdFx0X2FwcGx5Q3VycmVudFpvb21QYW4oKTtcblx0XHRcdFx0XHRyZXR1cm4gO1xuXHRcdFx0XHR9XG5cdFx0XHR9XG5cblx0XHRcdF9wdXNoUG9zUG9pbnQoX2dldEN1cnJlbnRUaW1lKCksIHAueCwgcC55KTtcblxuXHRcdFx0X21vdmVkID0gdHJ1ZTtcblx0XHRcdF9jdXJyUGFuQm91bmRzID0gc2VsZi5jdXJySXRlbS5ib3VuZHM7XG5cdFx0XHRcblx0XHRcdHZhciBtYWluU2Nyb2xsQ2hhbmdlZCA9IF9wYW5Pck1vdmVNYWluU2Nyb2xsKCd4JywgZGVsdGEpO1xuXHRcdFx0aWYoIW1haW5TY3JvbGxDaGFuZ2VkKSB7XG5cdFx0XHRcdF9wYW5Pck1vdmVNYWluU2Nyb2xsKCd5JywgZGVsdGEpO1xuXG5cdFx0XHRcdF9yb3VuZFBvaW50KF9wYW5PZmZzZXQpO1xuXHRcdFx0XHRfYXBwbHlDdXJyZW50Wm9vbVBhbigpO1xuXHRcdFx0fVxuXG5cdFx0fVxuXG5cdH0sXG5cdFxuXHQvLyBQb2ludGVydXAvcG9pbnRlcmNhbmNlbC90b3VjaGVuZC90b3VjaGNhbmNlbC9tb3VzZXVwIGV2ZW50IGhhbmRsZXJcblx0X29uRHJhZ1JlbGVhc2UgPSBmdW5jdGlvbihlKSB7XG5cblx0XHRpZihfZmVhdHVyZXMuaXNPbGRBbmRyb2lkICkge1xuXG5cdFx0XHRpZihfb2xkQW5kcm9pZFRvdWNoRW5kVGltZW91dCAmJiBlLnR5cGUgPT09ICdtb3VzZXVwJykge1xuXHRcdFx0XHRyZXR1cm47XG5cdFx0XHR9XG5cblx0XHRcdC8vIG9uIEFuZHJvaWQgKHY0LjEsIDQuMiwgNC4zICYgcG9zc2libHkgb2xkZXIpIFxuXHRcdFx0Ly8gZ2hvc3QgbW91c2Vkb3duL3VwIGV2ZW50IGlzbid0IHByZXZlbnRhYmxlIHZpYSBlLnByZXZlbnREZWZhdWx0LFxuXHRcdFx0Ly8gd2hpY2ggY2F1c2VzIGZha2UgbW91c2Vkb3duIGV2ZW50XG5cdFx0XHQvLyBzbyB3ZSBibG9jayBtb3VzZWRvd24vdXAgZm9yIDYwMG1zXG5cdFx0XHRpZiggZS50eXBlLmluZGV4T2YoJ3RvdWNoJykgPiAtMSApIHtcblx0XHRcdFx0Y2xlYXJUaW1lb3V0KF9vbGRBbmRyb2lkVG91Y2hFbmRUaW1lb3V0KTtcblx0XHRcdFx0X29sZEFuZHJvaWRUb3VjaEVuZFRpbWVvdXQgPSBzZXRUaW1lb3V0KGZ1bmN0aW9uKCkge1xuXHRcdFx0XHRcdF9vbGRBbmRyb2lkVG91Y2hFbmRUaW1lb3V0ID0gMDtcblx0XHRcdFx0fSwgNjAwKTtcblx0XHRcdH1cblx0XHRcdFxuXHRcdH1cblxuXHRcdF9zaG91dCgncG9pbnRlclVwJyk7XG5cblx0XHRpZihfcHJldmVudERlZmF1bHRFdmVudEJlaGF2aW91cihlLCBmYWxzZSkpIHtcblx0XHRcdGUucHJldmVudERlZmF1bHQoKTtcblx0XHR9XG5cblx0XHR2YXIgcmVsZWFzZVBvaW50O1xuXG5cdFx0aWYoX3BvaW50ZXJFdmVudEVuYWJsZWQpIHtcblx0XHRcdHZhciBwb2ludGVySW5kZXggPSBmcmFtZXdvcmsuYXJyYXlTZWFyY2goX2N1cnJQb2ludGVycywgZS5wb2ludGVySWQsICdpZCcpO1xuXHRcdFx0XG5cdFx0XHRpZihwb2ludGVySW5kZXggPiAtMSkge1xuXHRcdFx0XHRyZWxlYXNlUG9pbnQgPSBfY3VyclBvaW50ZXJzLnNwbGljZShwb2ludGVySW5kZXgsIDEpWzBdO1xuXG5cdFx0XHRcdGlmKG5hdmlnYXRvci5tc1BvaW50ZXJFbmFibGVkKSB7XG5cdFx0XHRcdFx0dmFyIE1TUE9JTlRFUl9UWVBFUyA9IHtcblx0XHRcdFx0XHRcdDQ6ICdtb3VzZScsIC8vIGV2ZW50Lk1TUE9JTlRFUl9UWVBFX01PVVNFXG5cdFx0XHRcdFx0XHQyOiAndG91Y2gnLCAvLyBldmVudC5NU1BPSU5URVJfVFlQRV9UT1VDSCBcblx0XHRcdFx0XHRcdDM6ICdwZW4nIC8vIGV2ZW50Lk1TUE9JTlRFUl9UWVBFX1BFTlxuXHRcdFx0XHRcdH07XG5cdFx0XHRcdFx0cmVsZWFzZVBvaW50LnR5cGUgPSBNU1BPSU5URVJfVFlQRVNbZS5wb2ludGVyVHlwZV07XG5cblx0XHRcdFx0XHRpZighcmVsZWFzZVBvaW50LnR5cGUpIHtcblx0XHRcdFx0XHRcdHJlbGVhc2VQb2ludC50eXBlID0gZS5wb2ludGVyVHlwZSB8fCAnbW91c2UnO1xuXHRcdFx0XHRcdH1cblx0XHRcdFx0fSBlbHNlIHtcblx0XHRcdFx0XHRyZWxlYXNlUG9pbnQudHlwZSA9IGUucG9pbnRlclR5cGUgfHwgJ21vdXNlJztcblx0XHRcdFx0fVxuXG5cdFx0XHR9XG5cdFx0fVxuXG5cdFx0dmFyIHRvdWNoTGlzdCA9IF9nZXRUb3VjaFBvaW50cyhlKSxcblx0XHRcdGdlc3R1cmVUeXBlLFxuXHRcdFx0bnVtUG9pbnRzID0gdG91Y2hMaXN0Lmxlbmd0aDtcblxuXHRcdGlmKGUudHlwZSA9PT0gJ21vdXNldXAnKSB7XG5cdFx0XHRudW1Qb2ludHMgPSAwO1xuXHRcdH1cblxuXHRcdC8vIERvIG5vdGhpbmcgaWYgdGhlcmUgd2VyZSAzIHRvdWNoIHBvaW50cyBvciBtb3JlXG5cdFx0aWYobnVtUG9pbnRzID09PSAyKSB7XG5cdFx0XHRfY3VycmVudFBvaW50cyA9IG51bGw7XG5cdFx0XHRyZXR1cm4gdHJ1ZTtcblx0XHR9XG5cblx0XHQvLyBpZiBzZWNvbmQgcG9pbnRlciByZWxlYXNlZFxuXHRcdGlmKG51bVBvaW50cyA9PT0gMSkge1xuXHRcdFx0X2VxdWFsaXplUG9pbnRzKF9zdGFydFBvaW50LCB0b3VjaExpc3RbMF0pO1xuXHRcdH1cdFx0XHRcdFxuXG5cblx0XHQvLyBwb2ludGVyIGhhc24ndCBtb3ZlZCwgc2VuZCBcInRhcCByZWxlYXNlXCIgcG9pbnRcblx0XHRpZihudW1Qb2ludHMgPT09IDAgJiYgIV9kaXJlY3Rpb24gJiYgIV9tYWluU2Nyb2xsQW5pbWF0aW5nKSB7XG5cdFx0XHRpZighcmVsZWFzZVBvaW50KSB7XG5cdFx0XHRcdGlmKGUudHlwZSA9PT0gJ21vdXNldXAnKSB7XG5cdFx0XHRcdFx0cmVsZWFzZVBvaW50ID0ge3g6IGUucGFnZVgsIHk6IGUucGFnZVksIHR5cGU6J21vdXNlJ307XG5cdFx0XHRcdH0gZWxzZSBpZihlLmNoYW5nZWRUb3VjaGVzICYmIGUuY2hhbmdlZFRvdWNoZXNbMF0pIHtcblx0XHRcdFx0XHRyZWxlYXNlUG9pbnQgPSB7eDogZS5jaGFuZ2VkVG91Y2hlc1swXS5wYWdlWCwgeTogZS5jaGFuZ2VkVG91Y2hlc1swXS5wYWdlWSwgdHlwZTondG91Y2gnfTtcblx0XHRcdFx0fVx0XHRcblx0XHRcdH1cblxuXHRcdFx0X3Nob3V0KCd0b3VjaFJlbGVhc2UnLCBlLCByZWxlYXNlUG9pbnQpO1xuXHRcdH1cblxuXHRcdC8vIERpZmZlcmVuY2UgaW4gdGltZSBiZXR3ZWVuIHJlbGVhc2luZyBvZiB0d28gbGFzdCB0b3VjaCBwb2ludHMgKHpvb20gZ2VzdHVyZSlcblx0XHR2YXIgcmVsZWFzZVRpbWVEaWZmID0gLTE7XG5cblx0XHQvLyBHZXN0dXJlIGNvbXBsZXRlZCwgbm8gcG9pbnRlcnMgbGVmdFxuXHRcdGlmKG51bVBvaW50cyA9PT0gMCkge1xuXHRcdFx0X2lzRHJhZ2dpbmcgPSBmYWxzZTtcblx0XHRcdGZyYW1ld29yay51bmJpbmQod2luZG93LCBfdXBNb3ZlRXZlbnRzLCBzZWxmKTtcblxuXHRcdFx0X3N0b3BEcmFnVXBkYXRlTG9vcCgpO1xuXG5cdFx0XHRpZihfaXNab29taW5nKSB7XG5cdFx0XHRcdC8vIFR3byBwb2ludHMgcmVsZWFzZWQgYXQgdGhlIHNhbWUgdGltZVxuXHRcdFx0XHRyZWxlYXNlVGltZURpZmYgPSAwO1xuXHRcdFx0fSBlbHNlIGlmKF9sYXN0UmVsZWFzZVRpbWUgIT09IC0xKSB7XG5cdFx0XHRcdHJlbGVhc2VUaW1lRGlmZiA9IF9nZXRDdXJyZW50VGltZSgpIC0gX2xhc3RSZWxlYXNlVGltZTtcblx0XHRcdH1cblx0XHR9XG5cdFx0X2xhc3RSZWxlYXNlVGltZSA9IG51bVBvaW50cyA9PT0gMSA/IF9nZXRDdXJyZW50VGltZSgpIDogLTE7XG5cdFx0XG5cdFx0aWYocmVsZWFzZVRpbWVEaWZmICE9PSAtMSAmJiByZWxlYXNlVGltZURpZmYgPCAxNTApIHtcblx0XHRcdGdlc3R1cmVUeXBlID0gJ3pvb20nO1xuXHRcdH0gZWxzZSB7XG5cdFx0XHRnZXN0dXJlVHlwZSA9ICdzd2lwZSc7XG5cdFx0fVxuXG5cdFx0aWYoX2lzWm9vbWluZyAmJiBudW1Qb2ludHMgPCAyKSB7XG5cdFx0XHRfaXNab29taW5nID0gZmFsc2U7XG5cblx0XHRcdC8vIE9ubHkgc2Vjb25kIHBvaW50IHJlbGVhc2VkXG5cdFx0XHRpZihudW1Qb2ludHMgPT09IDEpIHtcblx0XHRcdFx0Z2VzdHVyZVR5cGUgPSAnem9vbVBvaW50ZXJVcCc7XG5cdFx0XHR9XG5cdFx0XHRfc2hvdXQoJ3pvb21HZXN0dXJlRW5kZWQnKTtcblx0XHR9XG5cblx0XHRfY3VycmVudFBvaW50cyA9IG51bGw7XG5cdFx0aWYoIV9tb3ZlZCAmJiAhX3pvb21TdGFydGVkICYmICFfbWFpblNjcm9sbEFuaW1hdGluZyAmJiAhX3ZlcnRpY2FsRHJhZ0luaXRpYXRlZCkge1xuXHRcdFx0Ly8gbm90aGluZyB0byBhbmltYXRlXG5cdFx0XHRyZXR1cm47XG5cdFx0fVxuXHRcblx0XHRfc3RvcEFsbEFuaW1hdGlvbnMoKTtcblxuXHRcdFxuXHRcdGlmKCFfcmVsZWFzZUFuaW1EYXRhKSB7XG5cdFx0XHRfcmVsZWFzZUFuaW1EYXRhID0gX2luaXREcmFnUmVsZWFzZUFuaW1hdGlvbkRhdGEoKTtcblx0XHR9XG5cdFx0XG5cdFx0X3JlbGVhc2VBbmltRGF0YS5jYWxjdWxhdGVTd2lwZVNwZWVkKCd4Jyk7XG5cblxuXHRcdGlmKF92ZXJ0aWNhbERyYWdJbml0aWF0ZWQpIHtcblxuXHRcdFx0dmFyIG9wYWNpdHlSYXRpbyA9IF9jYWxjdWxhdGVWZXJ0aWNhbERyYWdPcGFjaXR5UmF0aW8oKTtcblxuXHRcdFx0aWYob3BhY2l0eVJhdGlvIDwgX29wdGlvbnMudmVydGljYWxEcmFnUmFuZ2UpIHtcblx0XHRcdFx0c2VsZi5jbG9zZSgpO1xuXHRcdFx0fSBlbHNlIHtcblx0XHRcdFx0dmFyIGluaXRhbFBhblkgPSBfcGFuT2Zmc2V0LnksXG5cdFx0XHRcdFx0aW5pdGlhbEJnT3BhY2l0eSA9IF9iZ09wYWNpdHk7XG5cblx0XHRcdFx0X2FuaW1hdGVQcm9wKCd2ZXJ0aWNhbERyYWcnLCAwLCAxLCAzMDAsIGZyYW1ld29yay5lYXNpbmcuY3ViaWMub3V0LCBmdW5jdGlvbihub3cpIHtcblx0XHRcdFx0XHRcblx0XHRcdFx0XHRfcGFuT2Zmc2V0LnkgPSAoc2VsZi5jdXJySXRlbS5pbml0aWFsUG9zaXRpb24ueSAtIGluaXRhbFBhblkpICogbm93ICsgaW5pdGFsUGFuWTtcblxuXHRcdFx0XHRcdF9hcHBseUJnT3BhY2l0eSggICgxIC0gaW5pdGlhbEJnT3BhY2l0eSkgKiBub3cgKyBpbml0aWFsQmdPcGFjaXR5ICk7XG5cdFx0XHRcdFx0X2FwcGx5Q3VycmVudFpvb21QYW4oKTtcblx0XHRcdFx0fSk7XG5cblx0XHRcdFx0X3Nob3V0KCdvblZlcnRpY2FsRHJhZycsIDEpO1xuXHRcdFx0fVxuXG5cdFx0XHRyZXR1cm47XG5cdFx0fVxuXG5cblx0XHQvLyBtYWluIHNjcm9sbCBcblx0XHRpZiggIChfbWFpblNjcm9sbFNoaWZ0ZWQgfHwgX21haW5TY3JvbGxBbmltYXRpbmcpICYmIG51bVBvaW50cyA9PT0gMCkge1xuXHRcdFx0dmFyIGl0ZW1DaGFuZ2VkID0gX2ZpbmlzaFN3aXBlTWFpblNjcm9sbEdlc3R1cmUoZ2VzdHVyZVR5cGUsIF9yZWxlYXNlQW5pbURhdGEpO1xuXHRcdFx0aWYoaXRlbUNoYW5nZWQpIHtcblx0XHRcdFx0cmV0dXJuO1xuXHRcdFx0fVxuXHRcdFx0Z2VzdHVyZVR5cGUgPSAnem9vbVBvaW50ZXJVcCc7XG5cdFx0fVxuXG5cdFx0Ly8gcHJldmVudCB6b29tL3BhbiBhbmltYXRpb24gd2hlbiBtYWluIHNjcm9sbCBhbmltYXRpb24gcnVuc1xuXHRcdGlmKF9tYWluU2Nyb2xsQW5pbWF0aW5nKSB7XG5cdFx0XHRyZXR1cm47XG5cdFx0fVxuXHRcdFxuXHRcdC8vIENvbXBsZXRlIHNpbXBsZSB6b29tIGdlc3R1cmUgKHJlc2V0IHpvb20gbGV2ZWwgaWYgaXQncyBvdXQgb2YgdGhlIGJvdW5kcykgIFxuXHRcdGlmKGdlc3R1cmVUeXBlICE9PSAnc3dpcGUnKSB7XG5cdFx0XHRfY29tcGxldGVab29tR2VzdHVyZSgpO1xuXHRcdFx0cmV0dXJuO1xuXHRcdH1cblx0XG5cdFx0Ly8gQ29tcGxldGUgcGFuIGdlc3R1cmUgaWYgbWFpbiBzY3JvbGwgaXMgbm90IHNoaWZ0ZWQsIGFuZCBpdCdzIHBvc3NpYmxlIHRvIHBhbiBjdXJyZW50IGltYWdlXG5cdFx0aWYoIV9tYWluU2Nyb2xsU2hpZnRlZCAmJiBfY3Vyclpvb21MZXZlbCA+IHNlbGYuY3Vyckl0ZW0uZml0UmF0aW8pIHtcblx0XHRcdF9jb21wbGV0ZVBhbkdlc3R1cmUoX3JlbGVhc2VBbmltRGF0YSk7XG5cdFx0fVxuXHR9LFxuXG5cblx0Ly8gUmV0dXJucyBvYmplY3Qgd2l0aCBkYXRhIGFib3V0IGdlc3R1cmVcblx0Ly8gSXQncyBjcmVhdGVkIG9ubHkgb25jZSBhbmQgdGhlbiByZXVzZWRcblx0X2luaXREcmFnUmVsZWFzZUFuaW1hdGlvbkRhdGEgID0gZnVuY3Rpb24oKSB7XG5cdFx0Ly8gdGVtcCBsb2NhbCB2YXJzXG5cdFx0dmFyIGxhc3RGbGlja0R1cmF0aW9uLFxuXHRcdFx0dGVtcFJlbGVhc2VQb3M7XG5cblx0XHQvLyBzID0gdGhpc1xuXHRcdHZhciBzID0ge1xuXHRcdFx0bGFzdEZsaWNrT2Zmc2V0OiB7fSxcblx0XHRcdGxhc3RGbGlja0Rpc3Q6IHt9LFxuXHRcdFx0bGFzdEZsaWNrU3BlZWQ6IHt9LFxuXHRcdFx0c2xvd0Rvd25SYXRpbzogIHt9LFxuXHRcdFx0c2xvd0Rvd25SYXRpb1JldmVyc2U6ICB7fSxcblx0XHRcdHNwZWVkRGVjZWxlcmF0aW9uUmF0aW86ICB7fSxcblx0XHRcdHNwZWVkRGVjZWxlcmF0aW9uUmF0aW9BYnM6ICB7fSxcblx0XHRcdGRpc3RhbmNlT2Zmc2V0OiAge30sXG5cdFx0XHRiYWNrQW5pbURlc3RpbmF0aW9uOiB7fSxcblx0XHRcdGJhY2tBbmltU3RhcnRlZDoge30sXG5cdFx0XHRjYWxjdWxhdGVTd2lwZVNwZWVkOiBmdW5jdGlvbihheGlzKSB7XG5cdFx0XHRcdFxuXG5cdFx0XHRcdGlmKCBfcG9zUG9pbnRzLmxlbmd0aCA+IDEpIHtcblx0XHRcdFx0XHRsYXN0RmxpY2tEdXJhdGlvbiA9IF9nZXRDdXJyZW50VGltZSgpIC0gX2dlc3R1cmVDaGVja1NwZWVkVGltZSArIDUwO1xuXHRcdFx0XHRcdHRlbXBSZWxlYXNlUG9zID0gX3Bvc1BvaW50c1tfcG9zUG9pbnRzLmxlbmd0aC0yXVtheGlzXTtcblx0XHRcdFx0fSBlbHNlIHtcblx0XHRcdFx0XHRsYXN0RmxpY2tEdXJhdGlvbiA9IF9nZXRDdXJyZW50VGltZSgpIC0gX2dlc3R1cmVTdGFydFRpbWU7IC8vIHRvdGFsIGdlc3R1cmUgZHVyYXRpb25cblx0XHRcdFx0XHR0ZW1wUmVsZWFzZVBvcyA9IF9zdGFydFBvaW50W2F4aXNdO1xuXHRcdFx0XHR9XG5cdFx0XHRcdHMubGFzdEZsaWNrT2Zmc2V0W2F4aXNdID0gX2N1cnJQb2ludFtheGlzXSAtIHRlbXBSZWxlYXNlUG9zO1xuXHRcdFx0XHRzLmxhc3RGbGlja0Rpc3RbYXhpc10gPSBNYXRoLmFicyhzLmxhc3RGbGlja09mZnNldFtheGlzXSk7XG5cdFx0XHRcdGlmKHMubGFzdEZsaWNrRGlzdFtheGlzXSA+IDIwKSB7XG5cdFx0XHRcdFx0cy5sYXN0RmxpY2tTcGVlZFtheGlzXSA9IHMubGFzdEZsaWNrT2Zmc2V0W2F4aXNdIC8gbGFzdEZsaWNrRHVyYXRpb247XG5cdFx0XHRcdH0gZWxzZSB7XG5cdFx0XHRcdFx0cy5sYXN0RmxpY2tTcGVlZFtheGlzXSA9IDA7XG5cdFx0XHRcdH1cblx0XHRcdFx0aWYoIE1hdGguYWJzKHMubGFzdEZsaWNrU3BlZWRbYXhpc10pIDwgMC4xICkge1xuXHRcdFx0XHRcdHMubGFzdEZsaWNrU3BlZWRbYXhpc10gPSAwO1xuXHRcdFx0XHR9XG5cdFx0XHRcdFxuXHRcdFx0XHRzLnNsb3dEb3duUmF0aW9bYXhpc10gPSAwLjk1O1xuXHRcdFx0XHRzLnNsb3dEb3duUmF0aW9SZXZlcnNlW2F4aXNdID0gMSAtIHMuc2xvd0Rvd25SYXRpb1theGlzXTtcblx0XHRcdFx0cy5zcGVlZERlY2VsZXJhdGlvblJhdGlvW2F4aXNdID0gMTtcblx0XHRcdH0sXG5cblx0XHRcdGNhbGN1bGF0ZU92ZXJCb3VuZHNBbmltT2Zmc2V0OiBmdW5jdGlvbihheGlzLCBzcGVlZCkge1xuXHRcdFx0XHRpZighcy5iYWNrQW5pbVN0YXJ0ZWRbYXhpc10pIHtcblxuXHRcdFx0XHRcdGlmKF9wYW5PZmZzZXRbYXhpc10gPiBfY3VyclBhbkJvdW5kcy5taW5bYXhpc10pIHtcblx0XHRcdFx0XHRcdHMuYmFja0FuaW1EZXN0aW5hdGlvbltheGlzXSA9IF9jdXJyUGFuQm91bmRzLm1pbltheGlzXTtcblx0XHRcdFx0XHRcdFxuXHRcdFx0XHRcdH0gZWxzZSBpZihfcGFuT2Zmc2V0W2F4aXNdIDwgX2N1cnJQYW5Cb3VuZHMubWF4W2F4aXNdKSB7XG5cdFx0XHRcdFx0XHRzLmJhY2tBbmltRGVzdGluYXRpb25bYXhpc10gPSBfY3VyclBhbkJvdW5kcy5tYXhbYXhpc107XG5cdFx0XHRcdFx0fVxuXG5cdFx0XHRcdFx0aWYocy5iYWNrQW5pbURlc3RpbmF0aW9uW2F4aXNdICE9PSB1bmRlZmluZWQpIHtcblx0XHRcdFx0XHRcdHMuc2xvd0Rvd25SYXRpb1theGlzXSA9IDAuNztcblx0XHRcdFx0XHRcdHMuc2xvd0Rvd25SYXRpb1JldmVyc2VbYXhpc10gPSAxIC0gcy5zbG93RG93blJhdGlvW2F4aXNdO1xuXHRcdFx0XHRcdFx0aWYocy5zcGVlZERlY2VsZXJhdGlvblJhdGlvQWJzW2F4aXNdIDwgMC4wNSkge1xuXG5cdFx0XHRcdFx0XHRcdHMubGFzdEZsaWNrU3BlZWRbYXhpc10gPSAwO1xuXHRcdFx0XHRcdFx0XHRzLmJhY2tBbmltU3RhcnRlZFtheGlzXSA9IHRydWU7XG5cblx0XHRcdFx0XHRcdFx0X2FuaW1hdGVQcm9wKCdib3VuY2Vab29tUGFuJytheGlzLF9wYW5PZmZzZXRbYXhpc10sIFxuXHRcdFx0XHRcdFx0XHRcdHMuYmFja0FuaW1EZXN0aW5hdGlvbltheGlzXSwgXG5cdFx0XHRcdFx0XHRcdFx0c3BlZWQgfHwgMzAwLCBcblx0XHRcdFx0XHRcdFx0XHRmcmFtZXdvcmsuZWFzaW5nLnNpbmUub3V0LCBcblx0XHRcdFx0XHRcdFx0XHRmdW5jdGlvbihwb3MpIHtcblx0XHRcdFx0XHRcdFx0XHRcdF9wYW5PZmZzZXRbYXhpc10gPSBwb3M7XG5cdFx0XHRcdFx0XHRcdFx0XHRfYXBwbHlDdXJyZW50Wm9vbVBhbigpO1xuXHRcdFx0XHRcdFx0XHRcdH1cblx0XHRcdFx0XHRcdFx0KTtcblxuXHRcdFx0XHRcdFx0fVxuXHRcdFx0XHRcdH1cblx0XHRcdFx0fVxuXHRcdFx0fSxcblxuXHRcdFx0Ly8gUmVkdWNlcyB0aGUgc3BlZWQgYnkgc2xvd0Rvd25SYXRpbyAocGVyIDEwbXMpXG5cdFx0XHRjYWxjdWxhdGVBbmltT2Zmc2V0OiBmdW5jdGlvbihheGlzKSB7XG5cdFx0XHRcdGlmKCFzLmJhY2tBbmltU3RhcnRlZFtheGlzXSkge1xuXHRcdFx0XHRcdHMuc3BlZWREZWNlbGVyYXRpb25SYXRpb1theGlzXSA9IHMuc3BlZWREZWNlbGVyYXRpb25SYXRpb1theGlzXSAqIChzLnNsb3dEb3duUmF0aW9bYXhpc10gKyBcblx0XHRcdFx0XHRcdFx0XHRcdFx0XHRcdHMuc2xvd0Rvd25SYXRpb1JldmVyc2VbYXhpc10gLSBcblx0XHRcdFx0XHRcdFx0XHRcdFx0XHRcdHMuc2xvd0Rvd25SYXRpb1JldmVyc2VbYXhpc10gKiBzLnRpbWVEaWZmIC8gMTApO1xuXG5cdFx0XHRcdFx0cy5zcGVlZERlY2VsZXJhdGlvblJhdGlvQWJzW2F4aXNdID0gTWF0aC5hYnMocy5sYXN0RmxpY2tTcGVlZFtheGlzXSAqIHMuc3BlZWREZWNlbGVyYXRpb25SYXRpb1theGlzXSk7XG5cdFx0XHRcdFx0cy5kaXN0YW5jZU9mZnNldFtheGlzXSA9IHMubGFzdEZsaWNrU3BlZWRbYXhpc10gKiBzLnNwZWVkRGVjZWxlcmF0aW9uUmF0aW9bYXhpc10gKiBzLnRpbWVEaWZmO1xuXHRcdFx0XHRcdF9wYW5PZmZzZXRbYXhpc10gKz0gcy5kaXN0YW5jZU9mZnNldFtheGlzXTtcblxuXHRcdFx0XHR9XG5cdFx0XHR9LFxuXG5cdFx0XHRwYW5BbmltTG9vcDogZnVuY3Rpb24oKSB7XG5cdFx0XHRcdGlmICggX2FuaW1hdGlvbnMuem9vbVBhbiApIHtcblx0XHRcdFx0XHRfYW5pbWF0aW9ucy56b29tUGFuLnJhZiA9IF9yZXF1ZXN0QUYocy5wYW5BbmltTG9vcCk7XG5cblx0XHRcdFx0XHRzLm5vdyA9IF9nZXRDdXJyZW50VGltZSgpO1xuXHRcdFx0XHRcdHMudGltZURpZmYgPSBzLm5vdyAtIHMubGFzdE5vdztcblx0XHRcdFx0XHRzLmxhc3ROb3cgPSBzLm5vdztcblx0XHRcdFx0XHRcblx0XHRcdFx0XHRzLmNhbGN1bGF0ZUFuaW1PZmZzZXQoJ3gnKTtcblx0XHRcdFx0XHRzLmNhbGN1bGF0ZUFuaW1PZmZzZXQoJ3knKTtcblxuXHRcdFx0XHRcdF9hcHBseUN1cnJlbnRab29tUGFuKCk7XG5cdFx0XHRcdFx0XG5cdFx0XHRcdFx0cy5jYWxjdWxhdGVPdmVyQm91bmRzQW5pbU9mZnNldCgneCcpO1xuXHRcdFx0XHRcdHMuY2FsY3VsYXRlT3ZlckJvdW5kc0FuaW1PZmZzZXQoJ3knKTtcblxuXG5cdFx0XHRcdFx0aWYgKHMuc3BlZWREZWNlbGVyYXRpb25SYXRpb0Ficy54IDwgMC4wNSAmJiBzLnNwZWVkRGVjZWxlcmF0aW9uUmF0aW9BYnMueSA8IDAuMDUpIHtcblxuXHRcdFx0XHRcdFx0Ly8gcm91bmQgcGFuIHBvc2l0aW9uXG5cdFx0XHRcdFx0XHRfcGFuT2Zmc2V0LnggPSBNYXRoLnJvdW5kKF9wYW5PZmZzZXQueCk7XG5cdFx0XHRcdFx0XHRfcGFuT2Zmc2V0LnkgPSBNYXRoLnJvdW5kKF9wYW5PZmZzZXQueSk7XG5cdFx0XHRcdFx0XHRfYXBwbHlDdXJyZW50Wm9vbVBhbigpO1xuXHRcdFx0XHRcdFx0XG5cdFx0XHRcdFx0XHRfc3RvcEFuaW1hdGlvbignem9vbVBhbicpO1xuXHRcdFx0XHRcdFx0cmV0dXJuO1xuXHRcdFx0XHRcdH1cblx0XHRcdFx0fVxuXG5cdFx0XHR9XG5cdFx0fTtcblx0XHRyZXR1cm4gcztcblx0fSxcblxuXHRfY29tcGxldGVQYW5HZXN0dXJlID0gZnVuY3Rpb24oYW5pbURhdGEpIHtcblx0XHQvLyBjYWxjdWxhdGUgc3dpcGUgc3BlZWQgZm9yIFkgYXhpcyAocGFhbm5pbmcpXG5cdFx0YW5pbURhdGEuY2FsY3VsYXRlU3dpcGVTcGVlZCgneScpO1xuXG5cdFx0X2N1cnJQYW5Cb3VuZHMgPSBzZWxmLmN1cnJJdGVtLmJvdW5kcztcblx0XHRcblx0XHRhbmltRGF0YS5iYWNrQW5pbURlc3RpbmF0aW9uID0ge307XG5cdFx0YW5pbURhdGEuYmFja0FuaW1TdGFydGVkID0ge307XG5cblx0XHQvLyBBdm9pZCBhY2NlbGVyYXRpb24gYW5pbWF0aW9uIGlmIHNwZWVkIGlzIHRvbyBsb3dcblx0XHRpZihNYXRoLmFicyhhbmltRGF0YS5sYXN0RmxpY2tTcGVlZC54KSA8PSAwLjA1ICYmIE1hdGguYWJzKGFuaW1EYXRhLmxhc3RGbGlja1NwZWVkLnkpIDw9IDAuMDUgKSB7XG5cdFx0XHRhbmltRGF0YS5zcGVlZERlY2VsZXJhdGlvblJhdGlvQWJzLnggPSBhbmltRGF0YS5zcGVlZERlY2VsZXJhdGlvblJhdGlvQWJzLnkgPSAwO1xuXG5cdFx0XHQvLyBSdW4gcGFuIGRyYWcgcmVsZWFzZSBhbmltYXRpb24uIEUuZy4gaWYgeW91IGRyYWcgaW1hZ2UgYW5kIHJlbGVhc2UgZmluZ2VyIHdpdGhvdXQgbW9tZW50dW0uXG5cdFx0XHRhbmltRGF0YS5jYWxjdWxhdGVPdmVyQm91bmRzQW5pbU9mZnNldCgneCcpO1xuXHRcdFx0YW5pbURhdGEuY2FsY3VsYXRlT3ZlckJvdW5kc0FuaW1PZmZzZXQoJ3knKTtcblx0XHRcdHJldHVybiB0cnVlO1xuXHRcdH1cblxuXHRcdC8vIEFuaW1hdGlvbiBsb29wIHRoYXQgY29udHJvbHMgdGhlIGFjY2VsZXJhdGlvbiBhZnRlciBwYW4gZ2VzdHVyZSBlbmRzXG5cdFx0X3JlZ2lzdGVyU3RhcnRBbmltYXRpb24oJ3pvb21QYW4nKTtcblx0XHRhbmltRGF0YS5sYXN0Tm93ID0gX2dldEN1cnJlbnRUaW1lKCk7XG5cdFx0YW5pbURhdGEucGFuQW5pbUxvb3AoKTtcblx0fSxcblxuXG5cdF9maW5pc2hTd2lwZU1haW5TY3JvbGxHZXN0dXJlID0gZnVuY3Rpb24oZ2VzdHVyZVR5cGUsIF9yZWxlYXNlQW5pbURhdGEpIHtcblx0XHR2YXIgaXRlbUNoYW5nZWQ7XG5cdFx0aWYoIV9tYWluU2Nyb2xsQW5pbWF0aW5nKSB7XG5cdFx0XHRfY3Vyclpvb21lZEl0ZW1JbmRleCA9IF9jdXJyZW50SXRlbUluZGV4O1xuXHRcdH1cblxuXG5cdFx0XG5cdFx0dmFyIGl0ZW1zRGlmZjtcblxuXHRcdGlmKGdlc3R1cmVUeXBlID09PSAnc3dpcGUnKSB7XG5cdFx0XHR2YXIgdG90YWxTaGlmdERpc3QgPSBfY3VyclBvaW50LnggLSBfc3RhcnRQb2ludC54LFxuXHRcdFx0XHRpc0Zhc3RMYXN0RmxpY2sgPSBfcmVsZWFzZUFuaW1EYXRhLmxhc3RGbGlja0Rpc3QueCA8IDEwO1xuXG5cdFx0XHQvLyBpZiBjb250YWluZXIgaXMgc2hpZnRlZCBmb3IgbW9yZSB0aGFuIE1JTl9TV0lQRV9ESVNUQU5DRSwgXG5cdFx0XHQvLyBhbmQgbGFzdCBmbGljayBnZXN0dXJlIHdhcyBpbiByaWdodCBkaXJlY3Rpb25cblx0XHRcdGlmKHRvdGFsU2hpZnREaXN0ID4gTUlOX1NXSVBFX0RJU1RBTkNFICYmIFxuXHRcdFx0XHQoaXNGYXN0TGFzdEZsaWNrIHx8IF9yZWxlYXNlQW5pbURhdGEubGFzdEZsaWNrT2Zmc2V0LnggPiAyMCkgKSB7XG5cdFx0XHRcdC8vIGdvIHRvIHByZXYgaXRlbVxuXHRcdFx0XHRpdGVtc0RpZmYgPSAtMTtcblx0XHRcdH0gZWxzZSBpZih0b3RhbFNoaWZ0RGlzdCA8IC1NSU5fU1dJUEVfRElTVEFOQ0UgJiYgXG5cdFx0XHRcdChpc0Zhc3RMYXN0RmxpY2sgfHwgX3JlbGVhc2VBbmltRGF0YS5sYXN0RmxpY2tPZmZzZXQueCA8IC0yMCkgKSB7XG5cdFx0XHRcdC8vIGdvIHRvIG5leHQgaXRlbVxuXHRcdFx0XHRpdGVtc0RpZmYgPSAxO1xuXHRcdFx0fVxuXHRcdH1cblxuXHRcdHZhciBuZXh0Q2lyY2xlO1xuXG5cdFx0aWYoaXRlbXNEaWZmKSB7XG5cdFx0XHRcblx0XHRcdF9jdXJyZW50SXRlbUluZGV4ICs9IGl0ZW1zRGlmZjtcblxuXHRcdFx0aWYoX2N1cnJlbnRJdGVtSW5kZXggPCAwKSB7XG5cdFx0XHRcdF9jdXJyZW50SXRlbUluZGV4ID0gX29wdGlvbnMubG9vcCA/IF9nZXROdW1JdGVtcygpLTEgOiAwO1xuXHRcdFx0XHRuZXh0Q2lyY2xlID0gdHJ1ZTtcblx0XHRcdH0gZWxzZSBpZihfY3VycmVudEl0ZW1JbmRleCA+PSBfZ2V0TnVtSXRlbXMoKSkge1xuXHRcdFx0XHRfY3VycmVudEl0ZW1JbmRleCA9IF9vcHRpb25zLmxvb3AgPyAwIDogX2dldE51bUl0ZW1zKCktMTtcblx0XHRcdFx0bmV4dENpcmNsZSA9IHRydWU7XG5cdFx0XHR9XG5cblx0XHRcdGlmKCFuZXh0Q2lyY2xlIHx8IF9vcHRpb25zLmxvb3ApIHtcblx0XHRcdFx0X2luZGV4RGlmZiArPSBpdGVtc0RpZmY7XG5cdFx0XHRcdF9jdXJyUG9zaXRpb25JbmRleCAtPSBpdGVtc0RpZmY7XG5cdFx0XHRcdGl0ZW1DaGFuZ2VkID0gdHJ1ZTtcblx0XHRcdH1cblx0XHRcdFxuXG5cdFx0XHRcblx0XHR9XG5cblx0XHR2YXIgYW5pbWF0ZVRvWCA9IF9zbGlkZVNpemUueCAqIF9jdXJyUG9zaXRpb25JbmRleDtcblx0XHR2YXIgYW5pbWF0ZVRvRGlzdCA9IE1hdGguYWJzKCBhbmltYXRlVG9YIC0gX21haW5TY3JvbGxQb3MueCApO1xuXHRcdHZhciBmaW5pc2hBbmltRHVyYXRpb247XG5cblxuXHRcdGlmKCFpdGVtQ2hhbmdlZCAmJiBhbmltYXRlVG9YID4gX21haW5TY3JvbGxQb3MueCAhPT0gX3JlbGVhc2VBbmltRGF0YS5sYXN0RmxpY2tTcGVlZC54ID4gMCkge1xuXHRcdFx0Ly8gXCJyZXR1cm4gdG8gY3VycmVudFwiIGR1cmF0aW9uLCBlLmcuIHdoZW4gZHJhZ2dpbmcgZnJvbSBzbGlkZSAwIHRvIC0xXG5cdFx0XHRmaW5pc2hBbmltRHVyYXRpb24gPSAzMzM7IFxuXHRcdH0gZWxzZSB7XG5cdFx0XHRmaW5pc2hBbmltRHVyYXRpb24gPSBNYXRoLmFicyhfcmVsZWFzZUFuaW1EYXRhLmxhc3RGbGlja1NwZWVkLngpID4gMCA/IFxuXHRcdFx0XHRcdFx0XHRcdFx0YW5pbWF0ZVRvRGlzdCAvIE1hdGguYWJzKF9yZWxlYXNlQW5pbURhdGEubGFzdEZsaWNrU3BlZWQueCkgOiBcblx0XHRcdFx0XHRcdFx0XHRcdDMzMztcblxuXHRcdFx0ZmluaXNoQW5pbUR1cmF0aW9uID0gTWF0aC5taW4oZmluaXNoQW5pbUR1cmF0aW9uLCA0MDApO1xuXHRcdFx0ZmluaXNoQW5pbUR1cmF0aW9uID0gTWF0aC5tYXgoZmluaXNoQW5pbUR1cmF0aW9uLCAyNTApO1xuXHRcdH1cblxuXHRcdGlmKF9jdXJyWm9vbWVkSXRlbUluZGV4ID09PSBfY3VycmVudEl0ZW1JbmRleCkge1xuXHRcdFx0aXRlbUNoYW5nZWQgPSBmYWxzZTtcblx0XHR9XG5cdFx0XG5cdFx0X21haW5TY3JvbGxBbmltYXRpbmcgPSB0cnVlO1xuXHRcdFxuXHRcdF9zaG91dCgnbWFpblNjcm9sbEFuaW1TdGFydCcpO1xuXG5cdFx0X2FuaW1hdGVQcm9wKCdtYWluU2Nyb2xsJywgX21haW5TY3JvbGxQb3MueCwgYW5pbWF0ZVRvWCwgZmluaXNoQW5pbUR1cmF0aW9uLCBmcmFtZXdvcmsuZWFzaW5nLmN1YmljLm91dCwgXG5cdFx0XHRfbW92ZU1haW5TY3JvbGwsXG5cdFx0XHRmdW5jdGlvbigpIHtcblx0XHRcdFx0X3N0b3BBbGxBbmltYXRpb25zKCk7XG5cdFx0XHRcdF9tYWluU2Nyb2xsQW5pbWF0aW5nID0gZmFsc2U7XG5cdFx0XHRcdF9jdXJyWm9vbWVkSXRlbUluZGV4ID0gLTE7XG5cdFx0XHRcdFxuXHRcdFx0XHRpZihpdGVtQ2hhbmdlZCB8fCBfY3Vyclpvb21lZEl0ZW1JbmRleCAhPT0gX2N1cnJlbnRJdGVtSW5kZXgpIHtcblx0XHRcdFx0XHRzZWxmLnVwZGF0ZUN1cnJJdGVtKCk7XG5cdFx0XHRcdH1cblx0XHRcdFx0XG5cdFx0XHRcdF9zaG91dCgnbWFpblNjcm9sbEFuaW1Db21wbGV0ZScpO1xuXHRcdFx0fVxuXHRcdCk7XG5cblx0XHRpZihpdGVtQ2hhbmdlZCkge1xuXHRcdFx0c2VsZi51cGRhdGVDdXJySXRlbSh0cnVlKTtcblx0XHR9XG5cblx0XHRyZXR1cm4gaXRlbUNoYW5nZWQ7XG5cdH0sXG5cblx0X2NhbGN1bGF0ZVpvb21MZXZlbCA9IGZ1bmN0aW9uKHRvdWNoZXNEaXN0YW5jZSkge1xuXHRcdHJldHVybiAgMSAvIF9zdGFydFBvaW50c0Rpc3RhbmNlICogdG91Y2hlc0Rpc3RhbmNlICogX3N0YXJ0Wm9vbUxldmVsO1xuXHR9LFxuXG5cdC8vIFJlc2V0cyB6b29tIGlmIGl0J3Mgb3V0IG9mIGJvdW5kc1xuXHRfY29tcGxldGVab29tR2VzdHVyZSA9IGZ1bmN0aW9uKCkge1xuXHRcdHZhciBkZXN0Wm9vbUxldmVsID0gX2N1cnJab29tTGV2ZWwsXG5cdFx0XHRtaW5ab29tTGV2ZWwgPSBfZ2V0TWluWm9vbUxldmVsKCksXG5cdFx0XHRtYXhab29tTGV2ZWwgPSBfZ2V0TWF4Wm9vbUxldmVsKCk7XG5cblx0XHRpZiAoIF9jdXJyWm9vbUxldmVsIDwgbWluWm9vbUxldmVsICkge1xuXHRcdFx0ZGVzdFpvb21MZXZlbCA9IG1pblpvb21MZXZlbDtcblx0XHR9IGVsc2UgaWYgKCBfY3Vyclpvb21MZXZlbCA+IG1heFpvb21MZXZlbCApIHtcblx0XHRcdGRlc3Rab29tTGV2ZWwgPSBtYXhab29tTGV2ZWw7XG5cdFx0fVxuXG5cdFx0dmFyIGRlc3RPcGFjaXR5ID0gMSxcblx0XHRcdG9uVXBkYXRlLFxuXHRcdFx0aW5pdGlhbE9wYWNpdHkgPSBfYmdPcGFjaXR5O1xuXG5cdFx0aWYoX29wYWNpdHlDaGFuZ2VkICYmICFfaXNab29taW5nSW4gJiYgIV93YXNPdmVySW5pdGlhbFpvb20gJiYgX2N1cnJab29tTGV2ZWwgPCBtaW5ab29tTGV2ZWwpIHtcblx0XHRcdC8vX2Nsb3NlZEJ5U2Nyb2xsID0gdHJ1ZTtcblx0XHRcdHNlbGYuY2xvc2UoKTtcblx0XHRcdHJldHVybiB0cnVlO1xuXHRcdH1cblxuXHRcdGlmKF9vcGFjaXR5Q2hhbmdlZCkge1xuXHRcdFx0b25VcGRhdGUgPSBmdW5jdGlvbihub3cpIHtcblx0XHRcdFx0X2FwcGx5QmdPcGFjaXR5KCAgKGRlc3RPcGFjaXR5IC0gaW5pdGlhbE9wYWNpdHkpICogbm93ICsgaW5pdGlhbE9wYWNpdHkgKTtcblx0XHRcdH07XG5cdFx0fVxuXG5cdFx0c2VsZi56b29tVG8oZGVzdFpvb21MZXZlbCwgMCwgMjAwLCAgZnJhbWV3b3JrLmVhc2luZy5jdWJpYy5vdXQsIG9uVXBkYXRlKTtcblx0XHRyZXR1cm4gdHJ1ZTtcblx0fTtcblxuXG5fcmVnaXN0ZXJNb2R1bGUoJ0dlc3R1cmVzJywge1xuXHRwdWJsaWNNZXRob2RzOiB7XG5cblx0XHRpbml0R2VzdHVyZXM6IGZ1bmN0aW9uKCkge1xuXG5cdFx0XHQvLyBoZWxwZXIgZnVuY3Rpb24gdGhhdCBidWlsZHMgdG91Y2gvcG9pbnRlci9tb3VzZSBldmVudHNcblx0XHRcdHZhciBhZGRFdmVudE5hbWVzID0gZnVuY3Rpb24ocHJlZiwgZG93biwgbW92ZSwgdXAsIGNhbmNlbCkge1xuXHRcdFx0XHRfZHJhZ1N0YXJ0RXZlbnQgPSBwcmVmICsgZG93bjtcblx0XHRcdFx0X2RyYWdNb3ZlRXZlbnQgPSBwcmVmICsgbW92ZTtcblx0XHRcdFx0X2RyYWdFbmRFdmVudCA9IHByZWYgKyB1cDtcblx0XHRcdFx0aWYoY2FuY2VsKSB7XG5cdFx0XHRcdFx0X2RyYWdDYW5jZWxFdmVudCA9IHByZWYgKyBjYW5jZWw7XG5cdFx0XHRcdH0gZWxzZSB7XG5cdFx0XHRcdFx0X2RyYWdDYW5jZWxFdmVudCA9ICcnO1xuXHRcdFx0XHR9XG5cdFx0XHR9O1xuXG5cdFx0XHRfcG9pbnRlckV2ZW50RW5hYmxlZCA9IF9mZWF0dXJlcy5wb2ludGVyRXZlbnQ7XG5cdFx0XHRpZihfcG9pbnRlckV2ZW50RW5hYmxlZCAmJiBfZmVhdHVyZXMudG91Y2gpIHtcblx0XHRcdFx0Ly8gd2UgZG9uJ3QgbmVlZCB0b3VjaCBldmVudHMsIGlmIGJyb3dzZXIgc3VwcG9ydHMgcG9pbnRlciBldmVudHNcblx0XHRcdFx0X2ZlYXR1cmVzLnRvdWNoID0gZmFsc2U7XG5cdFx0XHR9XG5cblx0XHRcdGlmKF9wb2ludGVyRXZlbnRFbmFibGVkKSB7XG5cdFx0XHRcdGlmKG5hdmlnYXRvci5tc1BvaW50ZXJFbmFibGVkKSB7XG5cdFx0XHRcdFx0Ly8gSUUxMCBwb2ludGVyIGV2ZW50cyBhcmUgY2FzZS1zZW5zaXRpdmVcblx0XHRcdFx0XHRhZGRFdmVudE5hbWVzKCdNU1BvaW50ZXInLCAnRG93bicsICdNb3ZlJywgJ1VwJywgJ0NhbmNlbCcpO1xuXHRcdFx0XHR9IGVsc2Uge1xuXHRcdFx0XHRcdGFkZEV2ZW50TmFtZXMoJ3BvaW50ZXInLCAnZG93bicsICdtb3ZlJywgJ3VwJywgJ2NhbmNlbCcpO1xuXHRcdFx0XHR9XG5cdFx0XHR9IGVsc2UgaWYoX2ZlYXR1cmVzLnRvdWNoKSB7XG5cdFx0XHRcdGFkZEV2ZW50TmFtZXMoJ3RvdWNoJywgJ3N0YXJ0JywgJ21vdmUnLCAnZW5kJywgJ2NhbmNlbCcpO1xuXHRcdFx0XHRfbGlrZWx5VG91Y2hEZXZpY2UgPSB0cnVlO1xuXHRcdFx0fSBlbHNlIHtcblx0XHRcdFx0YWRkRXZlbnROYW1lcygnbW91c2UnLCAnZG93bicsICdtb3ZlJywgJ3VwJyk7XHRcblx0XHRcdH1cblxuXHRcdFx0X3VwTW92ZUV2ZW50cyA9IF9kcmFnTW92ZUV2ZW50ICsgJyAnICsgX2RyYWdFbmRFdmVudCAgKyAnICcgKyAgX2RyYWdDYW5jZWxFdmVudDtcblx0XHRcdF9kb3duRXZlbnRzID0gX2RyYWdTdGFydEV2ZW50O1xuXG5cdFx0XHRpZihfcG9pbnRlckV2ZW50RW5hYmxlZCAmJiAhX2xpa2VseVRvdWNoRGV2aWNlKSB7XG5cdFx0XHRcdF9saWtlbHlUb3VjaERldmljZSA9IChuYXZpZ2F0b3IubWF4VG91Y2hQb2ludHMgPiAxKSB8fCAobmF2aWdhdG9yLm1zTWF4VG91Y2hQb2ludHMgPiAxKTtcblx0XHRcdH1cblx0XHRcdC8vIG1ha2UgdmFyaWFibGUgcHVibGljXG5cdFx0XHRzZWxmLmxpa2VseVRvdWNoRGV2aWNlID0gX2xpa2VseVRvdWNoRGV2aWNlOyBcblx0XHRcdFxuXHRcdFx0X2dsb2JhbEV2ZW50SGFuZGxlcnNbX2RyYWdTdGFydEV2ZW50XSA9IF9vbkRyYWdTdGFydDtcblx0XHRcdF9nbG9iYWxFdmVudEhhbmRsZXJzW19kcmFnTW92ZUV2ZW50XSA9IF9vbkRyYWdNb3ZlO1xuXHRcdFx0X2dsb2JhbEV2ZW50SGFuZGxlcnNbX2RyYWdFbmRFdmVudF0gPSBfb25EcmFnUmVsZWFzZTsgLy8gdGhlIEtyYWtlblxuXG5cdFx0XHRpZihfZHJhZ0NhbmNlbEV2ZW50KSB7XG5cdFx0XHRcdF9nbG9iYWxFdmVudEhhbmRsZXJzW19kcmFnQ2FuY2VsRXZlbnRdID0gX2dsb2JhbEV2ZW50SGFuZGxlcnNbX2RyYWdFbmRFdmVudF07XG5cdFx0XHR9XG5cblx0XHRcdC8vIEJpbmQgbW91c2UgZXZlbnRzIG9uIGRldmljZSB3aXRoIGRldGVjdGVkIGhhcmR3YXJlIHRvdWNoIHN1cHBvcnQsIGluIGNhc2UgaXQgc3VwcG9ydHMgbXVsdGlwbGUgdHlwZXMgb2YgaW5wdXQuXG5cdFx0XHRpZihfZmVhdHVyZXMudG91Y2gpIHtcblx0XHRcdFx0X2Rvd25FdmVudHMgKz0gJyBtb3VzZWRvd24nO1xuXHRcdFx0XHRfdXBNb3ZlRXZlbnRzICs9ICcgbW91c2Vtb3ZlIG1vdXNldXAnO1xuXHRcdFx0XHRfZ2xvYmFsRXZlbnRIYW5kbGVycy5tb3VzZWRvd24gPSBfZ2xvYmFsRXZlbnRIYW5kbGVyc1tfZHJhZ1N0YXJ0RXZlbnRdO1xuXHRcdFx0XHRfZ2xvYmFsRXZlbnRIYW5kbGVycy5tb3VzZW1vdmUgPSBfZ2xvYmFsRXZlbnRIYW5kbGVyc1tfZHJhZ01vdmVFdmVudF07XG5cdFx0XHRcdF9nbG9iYWxFdmVudEhhbmRsZXJzLm1vdXNldXAgPSBfZ2xvYmFsRXZlbnRIYW5kbGVyc1tfZHJhZ0VuZEV2ZW50XTtcblx0XHRcdH1cblxuXHRcdFx0aWYoIV9saWtlbHlUb3VjaERldmljZSkge1xuXHRcdFx0XHQvLyBkb24ndCBhbGxvdyBwYW4gdG8gbmV4dCBzbGlkZSBmcm9tIHpvb21lZCBzdGF0ZSBvbiBEZXNrdG9wXG5cdFx0XHRcdF9vcHRpb25zLmFsbG93UGFuVG9OZXh0ID0gZmFsc2U7XG5cdFx0XHR9XG5cdFx0fVxuXG5cdH1cbn0pO1xuXG5cbi8qPj5nZXN0dXJlcyovXG5cbi8qPj5zaG93LWhpZGUtdHJhbnNpdGlvbiovXG4vKipcbiAqIHNob3ctaGlkZS10cmFuc2l0aW9uLmpzOlxuICpcbiAqIE1hbmFnZXMgaW5pdGlhbCBvcGVuaW5nIG9yIGNsb3NpbmcgdHJhbnNpdGlvbi5cbiAqXG4gKiBJZiB5b3UncmUgbm90IHBsYW5uaW5nIHRvIHVzZSB0cmFuc2l0aW9uIGZvciBnYWxsZXJ5IGF0IGFsbCxcbiAqIHlvdSBtYXkgc2V0IG9wdGlvbnMgaGlkZUFuaW1hdGlvbkR1cmF0aW9uIGFuZCBzaG93QW5pbWF0aW9uRHVyYXRpb24gdG8gMCxcbiAqIGFuZCBqdXN0IGRlbGV0ZSBzdGFydEFuaW1hdGlvbiBmdW5jdGlvbi5cbiAqIFxuICovXG5cblxudmFyIF9zaG93T3JIaWRlVGltZW91dCxcblx0X3Nob3dPckhpZGUgPSBmdW5jdGlvbihpdGVtLCBpbWcsIG91dCwgY29tcGxldGVGbikge1xuXG5cdFx0aWYoX3Nob3dPckhpZGVUaW1lb3V0KSB7XG5cdFx0XHRjbGVhclRpbWVvdXQoX3Nob3dPckhpZGVUaW1lb3V0KTtcblx0XHR9XG5cblx0XHRfaW5pdGlhbFpvb21SdW5uaW5nID0gdHJ1ZTtcblx0XHRfaW5pdGlhbENvbnRlbnRTZXQgPSB0cnVlO1xuXHRcdFxuXHRcdC8vIGRpbWVuc2lvbnMgb2Ygc21hbGwgdGh1bWJuYWlsIHt4Oix5Oix3On0uXG5cdFx0Ly8gSGVpZ2h0IGlzIG9wdGlvbmFsLCBhcyBjYWxjdWxhdGVkIGJhc2VkIG9uIGxhcmdlIGltYWdlLlxuXHRcdHZhciB0aHVtYkJvdW5kczsgXG5cdFx0aWYoaXRlbS5pbml0aWFsTGF5b3V0KSB7XG5cdFx0XHR0aHVtYkJvdW5kcyA9IGl0ZW0uaW5pdGlhbExheW91dDtcblx0XHRcdGl0ZW0uaW5pdGlhbExheW91dCA9IG51bGw7XG5cdFx0fSBlbHNlIHtcblx0XHRcdHRodW1iQm91bmRzID0gX29wdGlvbnMuZ2V0VGh1bWJCb3VuZHNGbiAmJiBfb3B0aW9ucy5nZXRUaHVtYkJvdW5kc0ZuKF9jdXJyZW50SXRlbUluZGV4KTtcblx0XHR9XG5cblx0XHR2YXIgZHVyYXRpb24gPSBvdXQgPyBfb3B0aW9ucy5oaWRlQW5pbWF0aW9uRHVyYXRpb24gOiBfb3B0aW9ucy5zaG93QW5pbWF0aW9uRHVyYXRpb247XG5cblx0XHR2YXIgb25Db21wbGV0ZSA9IGZ1bmN0aW9uKCkge1xuXHRcdFx0X3N0b3BBbmltYXRpb24oJ2luaXRpYWxab29tJyk7XG5cdFx0XHRpZighb3V0KSB7XG5cdFx0XHRcdF9hcHBseUJnT3BhY2l0eSgxKTtcblx0XHRcdFx0aWYoaW1nKSB7XG5cdFx0XHRcdFx0aW1nLnN0eWxlLmRpc3BsYXkgPSAnYmxvY2snO1xuXHRcdFx0XHR9XG5cdFx0XHRcdGZyYW1ld29yay5hZGRDbGFzcyh0ZW1wbGF0ZSwgJ3Bzd3AtLWFuaW1hdGVkLWluJyk7XG5cdFx0XHRcdF9zaG91dCgnaW5pdGlhbFpvb20nICsgKG91dCA/ICdPdXRFbmQnIDogJ0luRW5kJykpO1xuXHRcdFx0fSBlbHNlIHtcblx0XHRcdFx0c2VsZi50ZW1wbGF0ZS5yZW1vdmVBdHRyaWJ1dGUoJ3N0eWxlJyk7XG5cdFx0XHRcdHNlbGYuYmcucmVtb3ZlQXR0cmlidXRlKCdzdHlsZScpO1xuXHRcdFx0fVxuXG5cdFx0XHRpZihjb21wbGV0ZUZuKSB7XG5cdFx0XHRcdGNvbXBsZXRlRm4oKTtcblx0XHRcdH1cblx0XHRcdF9pbml0aWFsWm9vbVJ1bm5pbmcgPSBmYWxzZTtcblx0XHR9O1xuXG5cdFx0Ly8gaWYgYm91bmRzIGFyZW4ndCBwcm92aWRlZCwganVzdCBvcGVuIGdhbGxlcnkgd2l0aG91dCBhbmltYXRpb25cblx0XHRpZighZHVyYXRpb24gfHwgIXRodW1iQm91bmRzIHx8IHRodW1iQm91bmRzLnggPT09IHVuZGVmaW5lZCkge1xuXG5cdFx0XHRfc2hvdXQoJ2luaXRpYWxab29tJyArIChvdXQgPyAnT3V0JyA6ICdJbicpICk7XG5cblx0XHRcdF9jdXJyWm9vbUxldmVsID0gaXRlbS5pbml0aWFsWm9vbUxldmVsO1xuXHRcdFx0X2VxdWFsaXplUG9pbnRzKF9wYW5PZmZzZXQsICBpdGVtLmluaXRpYWxQb3NpdGlvbiApO1xuXHRcdFx0X2FwcGx5Q3VycmVudFpvb21QYW4oKTtcblxuXHRcdFx0dGVtcGxhdGUuc3R5bGUub3BhY2l0eSA9IG91dCA/IDAgOiAxO1xuXHRcdFx0X2FwcGx5QmdPcGFjaXR5KDEpO1xuXG5cdFx0XHRpZihkdXJhdGlvbikge1xuXHRcdFx0XHRzZXRUaW1lb3V0KGZ1bmN0aW9uKCkge1xuXHRcdFx0XHRcdG9uQ29tcGxldGUoKTtcblx0XHRcdFx0fSwgZHVyYXRpb24pO1xuXHRcdFx0fSBlbHNlIHtcblx0XHRcdFx0b25Db21wbGV0ZSgpO1xuXHRcdFx0fVxuXG5cdFx0XHRyZXR1cm47XG5cdFx0fVxuXG5cdFx0dmFyIHN0YXJ0QW5pbWF0aW9uID0gZnVuY3Rpb24oKSB7XG5cdFx0XHR2YXIgY2xvc2VXaXRoUmFmID0gX2Nsb3NlZEJ5U2Nyb2xsLFxuXHRcdFx0XHRmYWRlRXZlcnl0aGluZyA9ICFzZWxmLmN1cnJJdGVtLnNyYyB8fCBzZWxmLmN1cnJJdGVtLmxvYWRFcnJvciB8fCBfb3B0aW9ucy5zaG93SGlkZU9wYWNpdHk7XG5cdFx0XHRcblx0XHRcdC8vIGFwcGx5IGh3LWFjY2VsZXJhdGlvbiB0byBpbWFnZVxuXHRcdFx0aWYoaXRlbS5taW5pSW1nKSB7XG5cdFx0XHRcdGl0ZW0ubWluaUltZy5zdHlsZS53ZWJraXRCYWNrZmFjZVZpc2liaWxpdHkgPSAnaGlkZGVuJztcblx0XHRcdH1cblxuXHRcdFx0aWYoIW91dCkge1xuXHRcdFx0XHRfY3Vyclpvb21MZXZlbCA9IHRodW1iQm91bmRzLncgLyBpdGVtLnc7XG5cdFx0XHRcdF9wYW5PZmZzZXQueCA9IHRodW1iQm91bmRzLng7XG5cdFx0XHRcdF9wYW5PZmZzZXQueSA9IHRodW1iQm91bmRzLnkgLSBfaW5pdGFsV2luZG93U2Nyb2xsWTtcblxuXHRcdFx0XHRzZWxmW2ZhZGVFdmVyeXRoaW5nID8gJ3RlbXBsYXRlJyA6ICdiZyddLnN0eWxlLm9wYWNpdHkgPSAwLjAwMTtcblx0XHRcdFx0X2FwcGx5Q3VycmVudFpvb21QYW4oKTtcblx0XHRcdH1cblxuXHRcdFx0X3JlZ2lzdGVyU3RhcnRBbmltYXRpb24oJ2luaXRpYWxab29tJyk7XG5cdFx0XHRcblx0XHRcdGlmKG91dCAmJiAhY2xvc2VXaXRoUmFmKSB7XG5cdFx0XHRcdGZyYW1ld29yay5yZW1vdmVDbGFzcyh0ZW1wbGF0ZSwgJ3Bzd3AtLWFuaW1hdGVkLWluJyk7XG5cdFx0XHR9XG5cblx0XHRcdGlmKGZhZGVFdmVyeXRoaW5nKSB7XG5cdFx0XHRcdGlmKG91dCkge1xuXHRcdFx0XHRcdGZyYW1ld29ya1sgKGNsb3NlV2l0aFJhZiA/ICdyZW1vdmUnIDogJ2FkZCcpICsgJ0NsYXNzJyBdKHRlbXBsYXRlLCAncHN3cC0tYW5pbWF0ZV9vcGFjaXR5Jyk7XG5cdFx0XHRcdH0gZWxzZSB7XG5cdFx0XHRcdFx0c2V0VGltZW91dChmdW5jdGlvbigpIHtcblx0XHRcdFx0XHRcdGZyYW1ld29yay5hZGRDbGFzcyh0ZW1wbGF0ZSwgJ3Bzd3AtLWFuaW1hdGVfb3BhY2l0eScpO1xuXHRcdFx0XHRcdH0sIDMwKTtcblx0XHRcdFx0fVxuXHRcdFx0fVxuXG5cdFx0XHRfc2hvd09ySGlkZVRpbWVvdXQgPSBzZXRUaW1lb3V0KGZ1bmN0aW9uKCkge1xuXG5cdFx0XHRcdF9zaG91dCgnaW5pdGlhbFpvb20nICsgKG91dCA/ICdPdXQnIDogJ0luJykgKTtcblx0XHRcdFx0XG5cblx0XHRcdFx0aWYoIW91dCkge1xuXG5cdFx0XHRcdFx0Ly8gXCJpblwiIGFuaW1hdGlvbiBhbHdheXMgdXNlcyBDU1MgdHJhbnNpdGlvbnMgKGluc3RlYWQgb2YgckFGKS5cblx0XHRcdFx0XHQvLyBDU1MgdHJhbnNpdGlvbiB3b3JrIGZhc3RlciBoZXJlLCBcblx0XHRcdFx0XHQvLyBhcyBkZXZlbG9wZXIgbWF5IGFsc28gd2FudCB0byBhbmltYXRlIG90aGVyIHRoaW5ncywgXG5cdFx0XHRcdFx0Ly8gbGlrZSB1aSBvbiB0b3Agb2Ygc2xpZGluZyBhcmVhLCB3aGljaCBjYW4gYmUgYW5pbWF0ZWQganVzdCB2aWEgQ1NTXG5cdFx0XHRcdFx0XG5cdFx0XHRcdFx0X2N1cnJab29tTGV2ZWwgPSBpdGVtLmluaXRpYWxab29tTGV2ZWw7XG5cdFx0XHRcdFx0X2VxdWFsaXplUG9pbnRzKF9wYW5PZmZzZXQsICBpdGVtLmluaXRpYWxQb3NpdGlvbiApO1xuXHRcdFx0XHRcdF9hcHBseUN1cnJlbnRab29tUGFuKCk7XG5cdFx0XHRcdFx0X2FwcGx5QmdPcGFjaXR5KDEpO1xuXG5cdFx0XHRcdFx0aWYoZmFkZUV2ZXJ5dGhpbmcpIHtcblx0XHRcdFx0XHRcdHRlbXBsYXRlLnN0eWxlLm9wYWNpdHkgPSAxO1xuXHRcdFx0XHRcdH0gZWxzZSB7XG5cdFx0XHRcdFx0XHRfYXBwbHlCZ09wYWNpdHkoMSk7XG5cdFx0XHRcdFx0fVxuXG5cdFx0XHRcdFx0X3Nob3dPckhpZGVUaW1lb3V0ID0gc2V0VGltZW91dChvbkNvbXBsZXRlLCBkdXJhdGlvbiArIDIwKTtcblx0XHRcdFx0fSBlbHNlIHtcblxuXHRcdFx0XHRcdC8vIFwib3V0XCIgYW5pbWF0aW9uIHVzZXMgckFGIG9ubHkgd2hlbiBQaG90b1N3aXBlIGlzIGNsb3NlZCBieSBicm93c2VyIHNjcm9sbCwgdG8gcmVjYWxjdWxhdGUgcG9zaXRpb25cblx0XHRcdFx0XHR2YXIgZGVzdFpvb21MZXZlbCA9IHRodW1iQm91bmRzLncgLyBpdGVtLncsXG5cdFx0XHRcdFx0XHRpbml0aWFsUGFuT2Zmc2V0ID0ge1xuXHRcdFx0XHRcdFx0XHR4OiBfcGFuT2Zmc2V0LngsXG5cdFx0XHRcdFx0XHRcdHk6IF9wYW5PZmZzZXQueVxuXHRcdFx0XHRcdFx0fSxcblx0XHRcdFx0XHRcdGluaXRpYWxab29tTGV2ZWwgPSBfY3Vyclpvb21MZXZlbCxcblx0XHRcdFx0XHRcdGluaXRhbEJnT3BhY2l0eSA9IF9iZ09wYWNpdHksXG5cdFx0XHRcdFx0XHRvblVwZGF0ZSA9IGZ1bmN0aW9uKG5vdykge1xuXHRcdFx0XHRcdFx0XHRcblx0XHRcdFx0XHRcdFx0aWYobm93ID09PSAxKSB7XG5cdFx0XHRcdFx0XHRcdFx0X2N1cnJab29tTGV2ZWwgPSBkZXN0Wm9vbUxldmVsO1xuXHRcdFx0XHRcdFx0XHRcdF9wYW5PZmZzZXQueCA9IHRodW1iQm91bmRzLng7XG5cdFx0XHRcdFx0XHRcdFx0X3Bhbk9mZnNldC55ID0gdGh1bWJCb3VuZHMueSAgLSBfY3VycmVudFdpbmRvd1Njcm9sbFk7XG5cdFx0XHRcdFx0XHRcdH0gZWxzZSB7XG5cdFx0XHRcdFx0XHRcdFx0X2N1cnJab29tTGV2ZWwgPSAoZGVzdFpvb21MZXZlbCAtIGluaXRpYWxab29tTGV2ZWwpICogbm93ICsgaW5pdGlhbFpvb21MZXZlbDtcblx0XHRcdFx0XHRcdFx0XHRfcGFuT2Zmc2V0LnggPSAodGh1bWJCb3VuZHMueCAtIGluaXRpYWxQYW5PZmZzZXQueCkgKiBub3cgKyBpbml0aWFsUGFuT2Zmc2V0Lng7XG5cdFx0XHRcdFx0XHRcdFx0X3Bhbk9mZnNldC55ID0gKHRodW1iQm91bmRzLnkgLSBfY3VycmVudFdpbmRvd1Njcm9sbFkgLSBpbml0aWFsUGFuT2Zmc2V0LnkpICogbm93ICsgaW5pdGlhbFBhbk9mZnNldC55O1xuXHRcdFx0XHRcdFx0XHR9XG5cdFx0XHRcdFx0XHRcdFxuXHRcdFx0XHRcdFx0XHRfYXBwbHlDdXJyZW50Wm9vbVBhbigpO1xuXHRcdFx0XHRcdFx0XHRpZihmYWRlRXZlcnl0aGluZykge1xuXHRcdFx0XHRcdFx0XHRcdHRlbXBsYXRlLnN0eWxlLm9wYWNpdHkgPSAxIC0gbm93O1xuXHRcdFx0XHRcdFx0XHR9IGVsc2Uge1xuXHRcdFx0XHRcdFx0XHRcdF9hcHBseUJnT3BhY2l0eSggaW5pdGFsQmdPcGFjaXR5IC0gbm93ICogaW5pdGFsQmdPcGFjaXR5ICk7XG5cdFx0XHRcdFx0XHRcdH1cblx0XHRcdFx0XHRcdH07XG5cblx0XHRcdFx0XHRpZihjbG9zZVdpdGhSYWYpIHtcblx0XHRcdFx0XHRcdF9hbmltYXRlUHJvcCgnaW5pdGlhbFpvb20nLCAwLCAxLCBkdXJhdGlvbiwgZnJhbWV3b3JrLmVhc2luZy5jdWJpYy5vdXQsIG9uVXBkYXRlLCBvbkNvbXBsZXRlKTtcblx0XHRcdFx0XHR9IGVsc2Uge1xuXHRcdFx0XHRcdFx0b25VcGRhdGUoMSk7XG5cdFx0XHRcdFx0XHRfc2hvd09ySGlkZVRpbWVvdXQgPSBzZXRUaW1lb3V0KG9uQ29tcGxldGUsIGR1cmF0aW9uICsgMjApO1xuXHRcdFx0XHRcdH1cblx0XHRcdFx0fVxuXHRcdFx0XG5cdFx0XHR9LCBvdXQgPyAyNSA6IDkwKTsgLy8gTWFpbiBwdXJwb3NlIG9mIHRoaXMgZGVsYXkgaXMgdG8gZ2l2ZSBicm93c2VyIHRpbWUgdG8gcGFpbnQgYW5kXG5cdFx0XHRcdFx0Ly8gY3JlYXRlIGNvbXBvc2l0ZSBsYXllcnMgb2YgUGhvdG9Td2lwZSBVSSBwYXJ0cyAoYmFja2dyb3VuZCwgY29udHJvbHMsIGNhcHRpb24sIGFycm93cykuXG5cdFx0XHRcdFx0Ly8gV2hpY2ggYXZvaWRzIGxhZyBhdCB0aGUgYmVnaW5uaW5nIG9mIHNjYWxlIHRyYW5zaXRpb24uXG5cdFx0fTtcblx0XHRzdGFydEFuaW1hdGlvbigpO1xuXG5cdFx0XG5cdH07XG5cbi8qPj5zaG93LWhpZGUtdHJhbnNpdGlvbiovXG5cbi8qPj5pdGVtcy1jb250cm9sbGVyKi9cbi8qKlxuKlxuKiBDb250cm9sbGVyIG1hbmFnZXMgZ2FsbGVyeSBpdGVtcywgdGhlaXIgZGltZW5zaW9ucywgYW5kIHRoZWlyIGNvbnRlbnQuXG4qIFxuKi9cblxudmFyIF9pdGVtcyxcblx0X3RlbXBQYW5BcmVhU2l6ZSA9IHt9LFxuXHRfaW1hZ2VzVG9BcHBlbmRQb29sID0gW10sXG5cdF9pbml0aWFsQ29udGVudFNldCxcblx0X2luaXRpYWxab29tUnVubmluZyxcblx0X2NvbnRyb2xsZXJEZWZhdWx0T3B0aW9ucyA9IHtcblx0XHRpbmRleDogMCxcblx0XHRlcnJvck1zZzogJzxkaXYgY2xhc3M9XCJwc3dwX19lcnJvci1tc2dcIj48YSBocmVmPVwiJXVybCVcIiB0YXJnZXQ9XCJfYmxhbmtcIj5UaGUgaW1hZ2U8L2E+IGNvdWxkIG5vdCBiZSBsb2FkZWQuPC9kaXY+Jyxcblx0XHRmb3JjZVByb2dyZXNzaXZlTG9hZGluZzogZmFsc2UsIC8vIFRPRE9cblx0XHRwcmVsb2FkOiBbMSwxXSxcblx0XHRnZXROdW1JdGVtc0ZuOiBmdW5jdGlvbigpIHtcblx0XHRcdHJldHVybiBfaXRlbXMubGVuZ3RoO1xuXHRcdH1cblx0fTtcblxuXG52YXIgX2dldEl0ZW1BdCxcblx0X2dldE51bUl0ZW1zLFxuXHRfaW5pdGlhbElzTG9vcCxcblx0X2dldFplcm9Cb3VuZHMgPSBmdW5jdGlvbigpIHtcblx0XHRyZXR1cm4ge1xuXHRcdFx0Y2VudGVyOnt4OjAseTowfSwgXG5cdFx0XHRtYXg6e3g6MCx5OjB9LCBcblx0XHRcdG1pbjp7eDowLHk6MH1cblx0XHR9O1xuXHR9LFxuXHRfY2FsY3VsYXRlU2luZ2xlSXRlbVBhbkJvdW5kcyA9IGZ1bmN0aW9uKGl0ZW0sIHJlYWxQYW5FbGVtZW50VywgcmVhbFBhbkVsZW1lbnRIICkge1xuXHRcdHZhciBib3VuZHMgPSBpdGVtLmJvdW5kcztcblxuXHRcdC8vIHBvc2l0aW9uIG9mIGVsZW1lbnQgd2hlbiBpdCdzIGNlbnRlcmVkXG5cdFx0Ym91bmRzLmNlbnRlci54ID0gTWF0aC5yb3VuZCgoX3RlbXBQYW5BcmVhU2l6ZS54IC0gcmVhbFBhbkVsZW1lbnRXKSAvIDIpO1xuXHRcdGJvdW5kcy5jZW50ZXIueSA9IE1hdGgucm91bmQoKF90ZW1wUGFuQXJlYVNpemUueSAtIHJlYWxQYW5FbGVtZW50SCkgLyAyKSArIGl0ZW0udkdhcC50b3A7XG5cblx0XHQvLyBtYXhpbXVtIHBhbiBwb3NpdGlvblxuXHRcdGJvdW5kcy5tYXgueCA9IChyZWFsUGFuRWxlbWVudFcgPiBfdGVtcFBhbkFyZWFTaXplLngpID8gXG5cdFx0XHRcdFx0XHRcdE1hdGgucm91bmQoX3RlbXBQYW5BcmVhU2l6ZS54IC0gcmVhbFBhbkVsZW1lbnRXKSA6IFxuXHRcdFx0XHRcdFx0XHRib3VuZHMuY2VudGVyLng7XG5cdFx0XG5cdFx0Ym91bmRzLm1heC55ID0gKHJlYWxQYW5FbGVtZW50SCA+IF90ZW1wUGFuQXJlYVNpemUueSkgPyBcblx0XHRcdFx0XHRcdFx0TWF0aC5yb3VuZChfdGVtcFBhbkFyZWFTaXplLnkgLSByZWFsUGFuRWxlbWVudEgpICsgaXRlbS52R2FwLnRvcCA6IFxuXHRcdFx0XHRcdFx0XHRib3VuZHMuY2VudGVyLnk7XG5cdFx0XG5cdFx0Ly8gbWluaW11bSBwYW4gcG9zaXRpb25cblx0XHRib3VuZHMubWluLnggPSAocmVhbFBhbkVsZW1lbnRXID4gX3RlbXBQYW5BcmVhU2l6ZS54KSA/IDAgOiBib3VuZHMuY2VudGVyLng7XG5cdFx0Ym91bmRzLm1pbi55ID0gKHJlYWxQYW5FbGVtZW50SCA+IF90ZW1wUGFuQXJlYVNpemUueSkgPyBpdGVtLnZHYXAudG9wIDogYm91bmRzLmNlbnRlci55O1xuXHR9LFxuXHRfY2FsY3VsYXRlSXRlbVNpemUgPSBmdW5jdGlvbihpdGVtLCB2aWV3cG9ydFNpemUsIHpvb21MZXZlbCkge1xuXG5cdFx0aWYgKGl0ZW0uc3JjICYmICFpdGVtLmxvYWRFcnJvcikge1xuXHRcdFx0dmFyIGlzSW5pdGlhbCA9ICF6b29tTGV2ZWw7XG5cdFx0XHRcblx0XHRcdGlmKGlzSW5pdGlhbCkge1xuXHRcdFx0XHRpZighaXRlbS52R2FwKSB7XG5cdFx0XHRcdFx0aXRlbS52R2FwID0ge3RvcDowLGJvdHRvbTowfTtcblx0XHRcdFx0fVxuXHRcdFx0XHQvLyBhbGxvd3Mgb3ZlcnJpZGluZyB2ZXJ0aWNhbCBtYXJnaW4gZm9yIGluZGl2aWR1YWwgaXRlbXNcblx0XHRcdFx0X3Nob3V0KCdwYXJzZVZlcnRpY2FsTWFyZ2luJywgaXRlbSk7XG5cdFx0XHR9XG5cblxuXHRcdFx0X3RlbXBQYW5BcmVhU2l6ZS54ID0gdmlld3BvcnRTaXplLng7XG5cdFx0XHRfdGVtcFBhbkFyZWFTaXplLnkgPSB2aWV3cG9ydFNpemUueSAtIGl0ZW0udkdhcC50b3AgLSBpdGVtLnZHYXAuYm90dG9tO1xuXG5cdFx0XHRpZiAoaXNJbml0aWFsKSB7XG5cdFx0XHRcdHZhciBoUmF0aW8gPSBfdGVtcFBhbkFyZWFTaXplLnggLyBpdGVtLnc7XG5cdFx0XHRcdHZhciB2UmF0aW8gPSBfdGVtcFBhbkFyZWFTaXplLnkgLyBpdGVtLmg7XG5cblx0XHRcdFx0aXRlbS5maXRSYXRpbyA9IGhSYXRpbyA8IHZSYXRpbyA/IGhSYXRpbyA6IHZSYXRpbztcblx0XHRcdFx0Ly9pdGVtLmZpbGxSYXRpbyA9IGhSYXRpbyA+IHZSYXRpbyA/IGhSYXRpbyA6IHZSYXRpbztcblxuXHRcdFx0XHR2YXIgc2NhbGVNb2RlID0gX29wdGlvbnMuc2NhbGVNb2RlO1xuXG5cdFx0XHRcdGlmIChzY2FsZU1vZGUgPT09ICdvcmlnJykge1xuXHRcdFx0XHRcdHpvb21MZXZlbCA9IDE7XG5cdFx0XHRcdH0gZWxzZSBpZiAoc2NhbGVNb2RlID09PSAnZml0Jykge1xuXHRcdFx0XHRcdHpvb21MZXZlbCA9IGl0ZW0uZml0UmF0aW87XG5cdFx0XHRcdH1cblxuXHRcdFx0XHRpZiAoem9vbUxldmVsID4gMSkge1xuXHRcdFx0XHRcdHpvb21MZXZlbCA9IDE7XG5cdFx0XHRcdH1cblxuXHRcdFx0XHRpdGVtLmluaXRpYWxab29tTGV2ZWwgPSB6b29tTGV2ZWw7XG5cdFx0XHRcdFxuXHRcdFx0XHRpZighaXRlbS5ib3VuZHMpIHtcblx0XHRcdFx0XHQvLyByZXVzZSBib3VuZHMgb2JqZWN0XG5cdFx0XHRcdFx0aXRlbS5ib3VuZHMgPSBfZ2V0WmVyb0JvdW5kcygpOyBcblx0XHRcdFx0fVxuXHRcdFx0fVxuXG5cdFx0XHRpZighem9vbUxldmVsKSB7XG5cdFx0XHRcdHJldHVybjtcblx0XHRcdH1cblxuXHRcdFx0X2NhbGN1bGF0ZVNpbmdsZUl0ZW1QYW5Cb3VuZHMoaXRlbSwgaXRlbS53ICogem9vbUxldmVsLCBpdGVtLmggKiB6b29tTGV2ZWwpO1xuXG5cdFx0XHRpZiAoaXNJbml0aWFsICYmIHpvb21MZXZlbCA9PT0gaXRlbS5pbml0aWFsWm9vbUxldmVsKSB7XG5cdFx0XHRcdGl0ZW0uaW5pdGlhbFBvc2l0aW9uID0gaXRlbS5ib3VuZHMuY2VudGVyO1xuXHRcdFx0fVxuXG5cdFx0XHRyZXR1cm4gaXRlbS5ib3VuZHM7XG5cdFx0fSBlbHNlIHtcblx0XHRcdGl0ZW0udyA9IGl0ZW0uaCA9IDA7XG5cdFx0XHRpdGVtLmluaXRpYWxab29tTGV2ZWwgPSBpdGVtLmZpdFJhdGlvID0gMTtcblx0XHRcdGl0ZW0uYm91bmRzID0gX2dldFplcm9Cb3VuZHMoKTtcblx0XHRcdGl0ZW0uaW5pdGlhbFBvc2l0aW9uID0gaXRlbS5ib3VuZHMuY2VudGVyO1xuXG5cdFx0XHQvLyBpZiBpdCdzIG5vdCBpbWFnZSwgd2UgcmV0dXJuIHplcm8gYm91bmRzIChjb250ZW50IGlzIG5vdCB6b29tYWJsZSlcblx0XHRcdHJldHVybiBpdGVtLmJvdW5kcztcblx0XHR9XG5cdFx0XG5cdH0sXG5cblx0XG5cblxuXHRfYXBwZW5kSW1hZ2UgPSBmdW5jdGlvbihpbmRleCwgaXRlbSwgYmFzZURpdiwgaW1nLCBwcmV2ZW50QW5pbWF0aW9uLCBrZWVwUGxhY2Vob2xkZXIpIHtcblx0XHRcblxuXHRcdGlmKGl0ZW0ubG9hZEVycm9yKSB7XG5cdFx0XHRyZXR1cm47XG5cdFx0fVxuXG5cdFx0aWYoaW1nKSB7XG5cblx0XHRcdGl0ZW0uaW1hZ2VBcHBlbmRlZCA9IHRydWU7XG5cdFx0XHRfc2V0SW1hZ2VTaXplKGl0ZW0sIGltZywgKGl0ZW0gPT09IHNlbGYuY3Vyckl0ZW0gJiYgX3JlbmRlck1heFJlc29sdXRpb24pICk7XG5cdFx0XHRcblx0XHRcdGJhc2VEaXYuYXBwZW5kQ2hpbGQoaW1nKTtcblxuXHRcdFx0aWYoa2VlcFBsYWNlaG9sZGVyKSB7XG5cdFx0XHRcdHNldFRpbWVvdXQoZnVuY3Rpb24oKSB7XG5cdFx0XHRcdFx0aWYoaXRlbSAmJiBpdGVtLmxvYWRlZCAmJiBpdGVtLnBsYWNlaG9sZGVyKSB7XG5cdFx0XHRcdFx0XHRpdGVtLnBsYWNlaG9sZGVyLnN0eWxlLmRpc3BsYXkgPSAnbm9uZSc7XG5cdFx0XHRcdFx0XHRpdGVtLnBsYWNlaG9sZGVyID0gbnVsbDtcblx0XHRcdFx0XHR9XG5cdFx0XHRcdH0sIDUwMCk7XG5cdFx0XHR9XG5cdFx0fVxuXHR9LFxuXHRcblxuXG5cdF9wcmVsb2FkSW1hZ2UgPSBmdW5jdGlvbihpdGVtKSB7XG5cdFx0aXRlbS5sb2FkaW5nID0gdHJ1ZTtcblx0XHRpdGVtLmxvYWRlZCA9IGZhbHNlO1xuXHRcdHZhciBpbWcgPSBpdGVtLmltZyA9IGZyYW1ld29yay5jcmVhdGVFbCgncHN3cF9faW1nJywgJ2ltZycpO1xuXHRcdHZhciBvbkNvbXBsZXRlID0gZnVuY3Rpb24oKSB7XG5cdFx0XHRpdGVtLmxvYWRpbmcgPSBmYWxzZTtcblx0XHRcdGl0ZW0ubG9hZGVkID0gdHJ1ZTtcblxuXHRcdFx0aWYoaXRlbS5sb2FkQ29tcGxldGUpIHtcblx0XHRcdFx0aXRlbS5sb2FkQ29tcGxldGUoaXRlbSk7XG5cdFx0XHR9IGVsc2Uge1xuXHRcdFx0XHRpdGVtLmltZyA9IG51bGw7IC8vIG5vIG5lZWQgdG8gc3RvcmUgaW1hZ2Ugb2JqZWN0XG5cdFx0XHR9XG5cdFx0XHRpbWcub25sb2FkID0gaW1nLm9uZXJyb3IgPSBudWxsO1xuXHRcdFx0aW1nID0gbnVsbDtcblx0XHR9O1xuXHRcdGltZy5vbmxvYWQgPSBvbkNvbXBsZXRlO1xuXHRcdGltZy5vbmVycm9yID0gZnVuY3Rpb24oKSB7XG5cdFx0XHRpdGVtLmxvYWRFcnJvciA9IHRydWU7XG5cdFx0XHRvbkNvbXBsZXRlKCk7XG5cdFx0fTtcdFx0XG5cblx0XHRpbWcuc3JjID0gaXRlbS5zcmM7Ly8gKyAnP2E9JyArIE1hdGgucmFuZG9tKCk7XG5cblx0XHRyZXR1cm4gaW1nO1xuXHR9LFxuXHRfY2hlY2tGb3JFcnJvciA9IGZ1bmN0aW9uKGl0ZW0sIGNsZWFuVXApIHtcblx0XHRpZihpdGVtLnNyYyAmJiBpdGVtLmxvYWRFcnJvciAmJiBpdGVtLmNvbnRhaW5lcikge1xuXG5cdFx0XHRpZihjbGVhblVwKSB7XG5cdFx0XHRcdGl0ZW0uY29udGFpbmVyLmlubmVySFRNTCA9ICcnO1xuXHRcdFx0fVxuXG5cdFx0XHRpdGVtLmNvbnRhaW5lci5pbm5lckhUTUwgPSBfb3B0aW9ucy5lcnJvck1zZy5yZXBsYWNlKCcldXJsJScsICBpdGVtLnNyYyApO1xuXHRcdFx0cmV0dXJuIHRydWU7XG5cdFx0XHRcblx0XHR9XG5cdH0sXG5cdF9zZXRJbWFnZVNpemUgPSBmdW5jdGlvbihpdGVtLCBpbWcsIG1heFJlcykge1xuXHRcdGlmKCFpdGVtLnNyYykge1xuXHRcdFx0cmV0dXJuO1xuXHRcdH1cblxuXHRcdGlmKCFpbWcpIHtcblx0XHRcdGltZyA9IGl0ZW0uY29udGFpbmVyLmxhc3RDaGlsZDtcblx0XHR9XG5cblx0XHR2YXIgdyA9IG1heFJlcyA/IGl0ZW0udyA6IE1hdGgucm91bmQoaXRlbS53ICogaXRlbS5maXRSYXRpbyksXG5cdFx0XHRoID0gbWF4UmVzID8gaXRlbS5oIDogTWF0aC5yb3VuZChpdGVtLmggKiBpdGVtLmZpdFJhdGlvKTtcblx0XHRcblx0XHRpZihpdGVtLnBsYWNlaG9sZGVyICYmICFpdGVtLmxvYWRlZCkge1xuXHRcdFx0aXRlbS5wbGFjZWhvbGRlci5zdHlsZS53aWR0aCA9IHcgKyAncHgnO1xuXHRcdFx0aXRlbS5wbGFjZWhvbGRlci5zdHlsZS5oZWlnaHQgPSBoICsgJ3B4Jztcblx0XHR9XG5cblx0XHRpbWcuc3R5bGUud2lkdGggPSB3ICsgJ3B4Jztcblx0XHRpbWcuc3R5bGUuaGVpZ2h0ID0gaCArICdweCc7XG5cdH0sXG5cdF9hcHBlbmRJbWFnZXNQb29sID0gZnVuY3Rpb24oKSB7XG5cblx0XHRpZihfaW1hZ2VzVG9BcHBlbmRQb29sLmxlbmd0aCkge1xuXHRcdFx0dmFyIHBvb2xJdGVtO1xuXG5cdFx0XHRmb3IodmFyIGkgPSAwOyBpIDwgX2ltYWdlc1RvQXBwZW5kUG9vbC5sZW5ndGg7IGkrKykge1xuXHRcdFx0XHRwb29sSXRlbSA9IF9pbWFnZXNUb0FwcGVuZFBvb2xbaV07XG5cdFx0XHRcdGlmKCBwb29sSXRlbS5ob2xkZXIuaW5kZXggPT09IHBvb2xJdGVtLmluZGV4ICkge1xuXHRcdFx0XHRcdF9hcHBlbmRJbWFnZShwb29sSXRlbS5pbmRleCwgcG9vbEl0ZW0uaXRlbSwgcG9vbEl0ZW0uYmFzZURpdiwgcG9vbEl0ZW0uaW1nLCBmYWxzZSwgcG9vbEl0ZW0uY2xlYXJQbGFjZWhvbGRlcik7XG5cdFx0XHRcdH1cblx0XHRcdH1cblx0XHRcdF9pbWFnZXNUb0FwcGVuZFBvb2wgPSBbXTtcblx0XHR9XG5cdH07XG5cdFxuXG5cbl9yZWdpc3Rlck1vZHVsZSgnQ29udHJvbGxlcicsIHtcblxuXHRwdWJsaWNNZXRob2RzOiB7XG5cblx0XHRsYXp5TG9hZEl0ZW06IGZ1bmN0aW9uKGluZGV4KSB7XG5cdFx0XHRpbmRleCA9IF9nZXRMb29wZWRJZChpbmRleCk7XG5cdFx0XHR2YXIgaXRlbSA9IF9nZXRJdGVtQXQoaW5kZXgpO1xuXG5cdFx0XHRpZighaXRlbSB8fCAoKGl0ZW0ubG9hZGVkIHx8IGl0ZW0ubG9hZGluZykgJiYgIV9pdGVtc05lZWRVcGRhdGUpKSB7XG5cdFx0XHRcdHJldHVybjtcblx0XHRcdH1cblxuXHRcdFx0X3Nob3V0KCdnZXR0aW5nRGF0YScsIGluZGV4LCBpdGVtKTtcblxuXHRcdFx0aWYgKCFpdGVtLnNyYykge1xuXHRcdFx0XHRyZXR1cm47XG5cdFx0XHR9XG5cblx0XHRcdF9wcmVsb2FkSW1hZ2UoaXRlbSk7XG5cdFx0fSxcblx0XHRpbml0Q29udHJvbGxlcjogZnVuY3Rpb24oKSB7XG5cdFx0XHRmcmFtZXdvcmsuZXh0ZW5kKF9vcHRpb25zLCBfY29udHJvbGxlckRlZmF1bHRPcHRpb25zLCB0cnVlKTtcblx0XHRcdHNlbGYuaXRlbXMgPSBfaXRlbXMgPSBpdGVtcztcblx0XHRcdF9nZXRJdGVtQXQgPSBzZWxmLmdldEl0ZW1BdDtcblx0XHRcdF9nZXROdW1JdGVtcyA9IF9vcHRpb25zLmdldE51bUl0ZW1zRm47IC8vc2VsZi5nZXROdW1JdGVtcztcblxuXG5cblx0XHRcdF9pbml0aWFsSXNMb29wID0gX29wdGlvbnMubG9vcDtcblx0XHRcdGlmKF9nZXROdW1JdGVtcygpIDwgMykge1xuXHRcdFx0XHRfb3B0aW9ucy5sb29wID0gZmFsc2U7IC8vIGRpc2FibGUgbG9vcCBpZiBsZXNzIHRoZW4gMyBpdGVtc1xuXHRcdFx0fVxuXG5cdFx0XHRfbGlzdGVuKCdiZWZvcmVDaGFuZ2UnLCBmdW5jdGlvbihkaWZmKSB7XG5cblx0XHRcdFx0dmFyIHAgPSBfb3B0aW9ucy5wcmVsb2FkLFxuXHRcdFx0XHRcdGlzTmV4dCA9IGRpZmYgPT09IG51bGwgPyB0cnVlIDogKGRpZmYgPj0gMCksXG5cdFx0XHRcdFx0cHJlbG9hZEJlZm9yZSA9IE1hdGgubWluKHBbMF0sIF9nZXROdW1JdGVtcygpICksXG5cdFx0XHRcdFx0cHJlbG9hZEFmdGVyID0gTWF0aC5taW4ocFsxXSwgX2dldE51bUl0ZW1zKCkgKSxcblx0XHRcdFx0XHRpO1xuXG5cblx0XHRcdFx0Zm9yKGkgPSAxOyBpIDw9IChpc05leHQgPyBwcmVsb2FkQWZ0ZXIgOiBwcmVsb2FkQmVmb3JlKTsgaSsrKSB7XG5cdFx0XHRcdFx0c2VsZi5sYXp5TG9hZEl0ZW0oX2N1cnJlbnRJdGVtSW5kZXgraSk7XG5cdFx0XHRcdH1cblx0XHRcdFx0Zm9yKGkgPSAxOyBpIDw9IChpc05leHQgPyBwcmVsb2FkQmVmb3JlIDogcHJlbG9hZEFmdGVyKTsgaSsrKSB7XG5cdFx0XHRcdFx0c2VsZi5sYXp5TG9hZEl0ZW0oX2N1cnJlbnRJdGVtSW5kZXgtaSk7XG5cdFx0XHRcdH1cblx0XHRcdH0pO1xuXG5cdFx0XHRfbGlzdGVuKCdpbml0aWFsTGF5b3V0JywgZnVuY3Rpb24oKSB7XG5cdFx0XHRcdHNlbGYuY3Vyckl0ZW0uaW5pdGlhbExheW91dCA9IF9vcHRpb25zLmdldFRodW1iQm91bmRzRm4gJiYgX29wdGlvbnMuZ2V0VGh1bWJCb3VuZHNGbihfY3VycmVudEl0ZW1JbmRleCk7XG5cdFx0XHR9KTtcblxuXHRcdFx0X2xpc3RlbignbWFpblNjcm9sbEFuaW1Db21wbGV0ZScsIF9hcHBlbmRJbWFnZXNQb29sKTtcblx0XHRcdF9saXN0ZW4oJ2luaXRpYWxab29tSW5FbmQnLCBfYXBwZW5kSW1hZ2VzUG9vbCk7XG5cblxuXG5cdFx0XHRfbGlzdGVuKCdkZXN0cm95JywgZnVuY3Rpb24oKSB7XG5cdFx0XHRcdHZhciBpdGVtO1xuXHRcdFx0XHRmb3IodmFyIGkgPSAwOyBpIDwgX2l0ZW1zLmxlbmd0aDsgaSsrKSB7XG5cdFx0XHRcdFx0aXRlbSA9IF9pdGVtc1tpXTtcblx0XHRcdFx0XHQvLyByZW1vdmUgcmVmZXJlbmNlIHRvIERPTSBlbGVtZW50cywgZm9yIEdDXG5cdFx0XHRcdFx0aWYoaXRlbS5jb250YWluZXIpIHtcblx0XHRcdFx0XHRcdGl0ZW0uY29udGFpbmVyID0gbnVsbDsgXG5cdFx0XHRcdFx0fVxuXHRcdFx0XHRcdGlmKGl0ZW0ucGxhY2Vob2xkZXIpIHtcblx0XHRcdFx0XHRcdGl0ZW0ucGxhY2Vob2xkZXIgPSBudWxsO1xuXHRcdFx0XHRcdH1cblx0XHRcdFx0XHRpZihpdGVtLmltZykge1xuXHRcdFx0XHRcdFx0aXRlbS5pbWcgPSBudWxsO1xuXHRcdFx0XHRcdH1cblx0XHRcdFx0XHRpZihpdGVtLnByZWxvYWRlcikge1xuXHRcdFx0XHRcdFx0aXRlbS5wcmVsb2FkZXIgPSBudWxsO1xuXHRcdFx0XHRcdH1cblx0XHRcdFx0XHRpZihpdGVtLmxvYWRFcnJvcikge1xuXHRcdFx0XHRcdFx0aXRlbS5sb2FkZWQgPSBpdGVtLmxvYWRFcnJvciA9IGZhbHNlO1xuXHRcdFx0XHRcdH1cblx0XHRcdFx0fVxuXHRcdFx0XHRfaW1hZ2VzVG9BcHBlbmRQb29sID0gbnVsbDtcblx0XHRcdH0pO1xuXHRcdH0sXG5cblxuXHRcdGdldEl0ZW1BdDogZnVuY3Rpb24oaW5kZXgpIHtcblx0XHRcdGlmIChpbmRleCA+PSAwKSB7XG5cdFx0XHRcdHJldHVybiBfaXRlbXNbaW5kZXhdICE9PSB1bmRlZmluZWQgPyBfaXRlbXNbaW5kZXhdIDogZmFsc2U7XG5cdFx0XHR9XG5cdFx0XHRyZXR1cm4gZmFsc2U7XG5cdFx0fSxcblxuXHRcdGFsbG93UHJvZ3Jlc3NpdmVJbWc6IGZ1bmN0aW9uKCkge1xuXHRcdFx0Ly8gMS4gUHJvZ3Jlc3NpdmUgaW1hZ2UgbG9hZGluZyBpc24ndCB3b3JraW5nIG9uIHdlYmtpdC9ibGluayBcblx0XHRcdC8vICAgIHdoZW4gaHctYWNjZWxlcmF0aW9uIChlLmcuIHRyYW5zbGF0ZVopIGlzIGFwcGxpZWQgdG8gSU1HIGVsZW1lbnQuXG5cdFx0XHQvLyAgICBUaGF0J3Mgd2h5IGluIFBob3RvU3dpcGUgcGFyZW50IGVsZW1lbnQgZ2V0cyB6b29tIHRyYW5zZm9ybSwgbm90IGltYWdlIGl0c2VsZi5cblx0XHRcdC8vICAgIFxuXHRcdFx0Ly8gMi4gUHJvZ3Jlc3NpdmUgaW1hZ2UgbG9hZGluZyBzb21ldGltZXMgYmxpbmtzIGluIHdlYmtpdC9ibGluayB3aGVuIGFwcGx5aW5nIGFuaW1hdGlvbiB0byBwYXJlbnQgZWxlbWVudC5cblx0XHRcdC8vICAgIFRoYXQncyB3aHkgaXQncyBkaXNhYmxlZCBvbiB0b3VjaCBkZXZpY2VzIChtYWlubHkgYmVjYXVzZSBvZiBzd2lwZSB0cmFuc2l0aW9uKVxuXHRcdFx0Ly8gICAgXG5cdFx0XHQvLyAzLiBQcm9ncmVzc2l2ZSBpbWFnZSBsb2FkaW5nIHNvbWV0aW1lcyBkb2Vzbid0IHdvcmsgaW4gSUUgKHVwIHRvIDExKS5cblxuXHRcdFx0Ly8gRG9uJ3QgYWxsb3cgcHJvZ3Jlc3NpdmUgbG9hZGluZyBvbiBub24tbGFyZ2UgdG91Y2ggZGV2aWNlc1xuXHRcdFx0cmV0dXJuIF9vcHRpb25zLmZvcmNlUHJvZ3Jlc3NpdmVMb2FkaW5nIHx8ICFfbGlrZWx5VG91Y2hEZXZpY2UgfHwgX29wdGlvbnMubW91c2VVc2VkIHx8IHNjcmVlbi53aWR0aCA+IDEyMDA7IFxuXHRcdFx0Ly8gMTIwMCAtIHRvIGVsaW1pbmF0ZSB0b3VjaCBkZXZpY2VzIHdpdGggbGFyZ2Ugc2NyZWVuIChsaWtlIENocm9tZWJvb2sgUGl4ZWwpXG5cdFx0fSxcblxuXHRcdHNldENvbnRlbnQ6IGZ1bmN0aW9uKGhvbGRlciwgaW5kZXgpIHtcblxuXHRcdFx0aWYoX29wdGlvbnMubG9vcCkge1xuXHRcdFx0XHRpbmRleCA9IF9nZXRMb29wZWRJZChpbmRleCk7XG5cdFx0XHR9XG5cblx0XHRcdHZhciBwcmV2SXRlbSA9IHNlbGYuZ2V0SXRlbUF0KGhvbGRlci5pbmRleCk7XG5cdFx0XHRpZihwcmV2SXRlbSkge1xuXHRcdFx0XHRwcmV2SXRlbS5jb250YWluZXIgPSBudWxsO1xuXHRcdFx0fVxuXHRcblx0XHRcdHZhciBpdGVtID0gc2VsZi5nZXRJdGVtQXQoaW5kZXgpLFxuXHRcdFx0XHRpbWc7XG5cdFx0XHRcblx0XHRcdGlmKCFpdGVtKSB7XG5cdFx0XHRcdGhvbGRlci5lbC5pbm5lckhUTUwgPSAnJztcblx0XHRcdFx0cmV0dXJuO1xuXHRcdFx0fVxuXG5cdFx0XHQvLyBhbGxvdyB0byBvdmVycmlkZSBkYXRhXG5cdFx0XHRfc2hvdXQoJ2dldHRpbmdEYXRhJywgaW5kZXgsIGl0ZW0pO1xuXG5cdFx0XHRob2xkZXIuaW5kZXggPSBpbmRleDtcblx0XHRcdGhvbGRlci5pdGVtID0gaXRlbTtcblxuXHRcdFx0Ly8gYmFzZSBjb250YWluZXIgRElWIGlzIGNyZWF0ZWQgb25seSBvbmNlIGZvciBlYWNoIG9mIDMgaG9sZGVyc1xuXHRcdFx0dmFyIGJhc2VEaXYgPSBpdGVtLmNvbnRhaW5lciA9IGZyYW1ld29yay5jcmVhdGVFbCgncHN3cF9fem9vbS13cmFwJyk7IFxuXG5cdFx0XHRcblxuXHRcdFx0aWYoIWl0ZW0uc3JjICYmIGl0ZW0uaHRtbCkge1xuXHRcdFx0XHRpZihpdGVtLmh0bWwudGFnTmFtZSkge1xuXHRcdFx0XHRcdGJhc2VEaXYuYXBwZW5kQ2hpbGQoaXRlbS5odG1sKTtcblx0XHRcdFx0fSBlbHNlIHtcblx0XHRcdFx0XHRiYXNlRGl2LmlubmVySFRNTCA9IGl0ZW0uaHRtbDtcblx0XHRcdFx0fVxuXHRcdFx0fVxuXG5cdFx0XHRfY2hlY2tGb3JFcnJvcihpdGVtKTtcblxuXHRcdFx0X2NhbGN1bGF0ZUl0ZW1TaXplKGl0ZW0sIF92aWV3cG9ydFNpemUpO1xuXHRcdFx0XG5cdFx0XHRpZihpdGVtLnNyYyAmJiAhaXRlbS5sb2FkRXJyb3IgJiYgIWl0ZW0ubG9hZGVkKSB7XG5cblx0XHRcdFx0aXRlbS5sb2FkQ29tcGxldGUgPSBmdW5jdGlvbihpdGVtKSB7XG5cblx0XHRcdFx0XHQvLyBnYWxsZXJ5IGNsb3NlZCBiZWZvcmUgaW1hZ2UgZmluaXNoZWQgbG9hZGluZ1xuXHRcdFx0XHRcdGlmKCFfaXNPcGVuKSB7XG5cdFx0XHRcdFx0XHRyZXR1cm47XG5cdFx0XHRcdFx0fVxuXG5cdFx0XHRcdFx0Ly8gY2hlY2sgaWYgaG9sZGVyIGhhc24ndCBjaGFuZ2VkIHdoaWxlIGltYWdlIHdhcyBsb2FkaW5nXG5cdFx0XHRcdFx0aWYoaG9sZGVyICYmIGhvbGRlci5pbmRleCA9PT0gaW5kZXggKSB7XG5cdFx0XHRcdFx0XHRpZiggX2NoZWNrRm9yRXJyb3IoaXRlbSwgdHJ1ZSkgKSB7XG5cdFx0XHRcdFx0XHRcdGl0ZW0ubG9hZENvbXBsZXRlID0gaXRlbS5pbWcgPSBudWxsO1xuXHRcdFx0XHRcdFx0XHRfY2FsY3VsYXRlSXRlbVNpemUoaXRlbSwgX3ZpZXdwb3J0U2l6ZSk7XG5cdFx0XHRcdFx0XHRcdF9hcHBseVpvb21QYW5Ub0l0ZW0oaXRlbSk7XG5cblx0XHRcdFx0XHRcdFx0aWYoaG9sZGVyLmluZGV4ID09PSBfY3VycmVudEl0ZW1JbmRleCkge1xuXHRcdFx0XHRcdFx0XHRcdC8vIHJlY2FsY3VsYXRlIGRpbWVuc2lvbnNcblx0XHRcdFx0XHRcdFx0XHRzZWxmLnVwZGF0ZUN1cnJab29tSXRlbSgpO1xuXHRcdFx0XHRcdFx0XHR9XG5cdFx0XHRcdFx0XHRcdHJldHVybjtcblx0XHRcdFx0XHRcdH1cblx0XHRcdFx0XHRcdGlmKCAhaXRlbS5pbWFnZUFwcGVuZGVkICkge1xuXHRcdFx0XHRcdFx0XHRpZihfZmVhdHVyZXMudHJhbnNmb3JtICYmIChfbWFpblNjcm9sbEFuaW1hdGluZyB8fCBfaW5pdGlhbFpvb21SdW5uaW5nKSApIHtcblx0XHRcdFx0XHRcdFx0XHRfaW1hZ2VzVG9BcHBlbmRQb29sLnB1c2goe1xuXHRcdFx0XHRcdFx0XHRcdFx0aXRlbTppdGVtLFxuXHRcdFx0XHRcdFx0XHRcdFx0YmFzZURpdjpiYXNlRGl2LFxuXHRcdFx0XHRcdFx0XHRcdFx0aW1nOml0ZW0uaW1nLFxuXHRcdFx0XHRcdFx0XHRcdFx0aW5kZXg6aW5kZXgsXG5cdFx0XHRcdFx0XHRcdFx0XHRob2xkZXI6aG9sZGVyLFxuXHRcdFx0XHRcdFx0XHRcdFx0Y2xlYXJQbGFjZWhvbGRlcjp0cnVlXG5cdFx0XHRcdFx0XHRcdFx0fSk7XG5cdFx0XHRcdFx0XHRcdH0gZWxzZSB7XG5cdFx0XHRcdFx0XHRcdFx0X2FwcGVuZEltYWdlKGluZGV4LCBpdGVtLCBiYXNlRGl2LCBpdGVtLmltZywgX21haW5TY3JvbGxBbmltYXRpbmcgfHwgX2luaXRpYWxab29tUnVubmluZywgdHJ1ZSk7XG5cdFx0XHRcdFx0XHRcdH1cblx0XHRcdFx0XHRcdH0gZWxzZSB7XG5cdFx0XHRcdFx0XHRcdC8vIHJlbW92ZSBwcmVsb2FkZXIgJiBtaW5pLWltZ1xuXHRcdFx0XHRcdFx0XHRpZighX2luaXRpYWxab29tUnVubmluZyAmJiBpdGVtLnBsYWNlaG9sZGVyKSB7XG5cdFx0XHRcdFx0XHRcdFx0aXRlbS5wbGFjZWhvbGRlci5zdHlsZS5kaXNwbGF5ID0gJ25vbmUnO1xuXHRcdFx0XHRcdFx0XHRcdGl0ZW0ucGxhY2Vob2xkZXIgPSBudWxsO1xuXHRcdFx0XHRcdFx0XHR9XG5cdFx0XHRcdFx0XHR9XG5cdFx0XHRcdFx0fVxuXG5cdFx0XHRcdFx0aXRlbS5sb2FkQ29tcGxldGUgPSBudWxsO1xuXHRcdFx0XHRcdGl0ZW0uaW1nID0gbnVsbDsgLy8gbm8gbmVlZCB0byBzdG9yZSBpbWFnZSBlbGVtZW50IGFmdGVyIGl0J3MgYWRkZWRcblxuXHRcdFx0XHRcdF9zaG91dCgnaW1hZ2VMb2FkQ29tcGxldGUnLCBpbmRleCwgaXRlbSk7XG5cdFx0XHRcdH07XG5cblx0XHRcdFx0aWYoZnJhbWV3b3JrLmZlYXR1cmVzLnRyYW5zZm9ybSkge1xuXHRcdFx0XHRcdFxuXHRcdFx0XHRcdHZhciBwbGFjZWhvbGRlckNsYXNzTmFtZSA9ICdwc3dwX19pbWcgcHN3cF9faW1nLS1wbGFjZWhvbGRlcic7IFxuXHRcdFx0XHRcdHBsYWNlaG9sZGVyQ2xhc3NOYW1lICs9IChpdGVtLm1zcmMgPyAnJyA6ICcgcHN3cF9faW1nLS1wbGFjZWhvbGRlci0tYmxhbmsnKTtcblxuXHRcdFx0XHRcdHZhciBwbGFjZWhvbGRlciA9IGZyYW1ld29yay5jcmVhdGVFbChwbGFjZWhvbGRlckNsYXNzTmFtZSwgaXRlbS5tc3JjID8gJ2ltZycgOiAnJyk7XG5cdFx0XHRcdFx0aWYoaXRlbS5tc3JjKSB7XG5cdFx0XHRcdFx0XHRwbGFjZWhvbGRlci5zcmMgPSBpdGVtLm1zcmM7XG5cdFx0XHRcdFx0fVxuXHRcdFx0XHRcdFxuXHRcdFx0XHRcdF9zZXRJbWFnZVNpemUoaXRlbSwgcGxhY2Vob2xkZXIpO1xuXG5cdFx0XHRcdFx0YmFzZURpdi5hcHBlbmRDaGlsZChwbGFjZWhvbGRlcik7XG5cdFx0XHRcdFx0aXRlbS5wbGFjZWhvbGRlciA9IHBsYWNlaG9sZGVyO1xuXG5cdFx0XHRcdH1cblx0XHRcdFx0XG5cblx0XHRcdFx0XG5cblx0XHRcdFx0aWYoIWl0ZW0ubG9hZGluZykge1xuXHRcdFx0XHRcdF9wcmVsb2FkSW1hZ2UoaXRlbSk7XG5cdFx0XHRcdH1cblxuXG5cdFx0XHRcdGlmKCBzZWxmLmFsbG93UHJvZ3Jlc3NpdmVJbWcoKSApIHtcblx0XHRcdFx0XHQvLyBqdXN0IGFwcGVuZCBpbWFnZVxuXHRcdFx0XHRcdGlmKCFfaW5pdGlhbENvbnRlbnRTZXQgJiYgX2ZlYXR1cmVzLnRyYW5zZm9ybSkge1xuXHRcdFx0XHRcdFx0X2ltYWdlc1RvQXBwZW5kUG9vbC5wdXNoKHtcblx0XHRcdFx0XHRcdFx0aXRlbTppdGVtLCBcblx0XHRcdFx0XHRcdFx0YmFzZURpdjpiYXNlRGl2LCBcblx0XHRcdFx0XHRcdFx0aW1nOml0ZW0uaW1nLCBcblx0XHRcdFx0XHRcdFx0aW5kZXg6aW5kZXgsIFxuXHRcdFx0XHRcdFx0XHRob2xkZXI6aG9sZGVyXG5cdFx0XHRcdFx0XHR9KTtcblx0XHRcdFx0XHR9IGVsc2Uge1xuXHRcdFx0XHRcdFx0X2FwcGVuZEltYWdlKGluZGV4LCBpdGVtLCBiYXNlRGl2LCBpdGVtLmltZywgdHJ1ZSwgdHJ1ZSk7XG5cdFx0XHRcdFx0fVxuXHRcdFx0XHR9XG5cdFx0XHRcdFxuXHRcdFx0fSBlbHNlIGlmKGl0ZW0uc3JjICYmICFpdGVtLmxvYWRFcnJvcikge1xuXHRcdFx0XHQvLyBpbWFnZSBvYmplY3QgaXMgY3JlYXRlZCBldmVyeSB0aW1lLCBkdWUgdG8gYnVncyBvZiBpbWFnZSBsb2FkaW5nICYgZGVsYXkgd2hlbiBzd2l0Y2hpbmcgaW1hZ2VzXG5cdFx0XHRcdGltZyA9IGZyYW1ld29yay5jcmVhdGVFbCgncHN3cF9faW1nJywgJ2ltZycpO1xuXHRcdFx0XHRpbWcuc3R5bGUub3BhY2l0eSA9IDE7XG5cdFx0XHRcdGltZy5zcmMgPSBpdGVtLnNyYztcblx0XHRcdFx0X3NldEltYWdlU2l6ZShpdGVtLCBpbWcpO1xuXHRcdFx0XHRfYXBwZW5kSW1hZ2UoaW5kZXgsIGl0ZW0sIGJhc2VEaXYsIGltZywgdHJ1ZSk7XG5cdFx0XHR9XG5cdFx0XHRcblxuXHRcdFx0aWYoIV9pbml0aWFsQ29udGVudFNldCAmJiBpbmRleCA9PT0gX2N1cnJlbnRJdGVtSW5kZXgpIHtcblx0XHRcdFx0X2N1cnJab29tRWxlbWVudFN0eWxlID0gYmFzZURpdi5zdHlsZTtcblx0XHRcdFx0X3Nob3dPckhpZGUoaXRlbSwgKGltZyB8fGl0ZW0uaW1nKSApO1xuXHRcdFx0fSBlbHNlIHtcblx0XHRcdFx0X2FwcGx5Wm9vbVBhblRvSXRlbShpdGVtKTtcblx0XHRcdH1cblxuXHRcdFx0aG9sZGVyLmVsLmlubmVySFRNTCA9ICcnO1xuXHRcdFx0aG9sZGVyLmVsLmFwcGVuZENoaWxkKGJhc2VEaXYpO1xuXHRcdH0sXG5cblx0XHRjbGVhblNsaWRlOiBmdW5jdGlvbiggaXRlbSApIHtcblx0XHRcdGlmKGl0ZW0uaW1nICkge1xuXHRcdFx0XHRpdGVtLmltZy5vbmxvYWQgPSBpdGVtLmltZy5vbmVycm9yID0gbnVsbDtcblx0XHRcdH1cblx0XHRcdGl0ZW0ubG9hZGVkID0gaXRlbS5sb2FkaW5nID0gaXRlbS5pbWcgPSBpdGVtLmltYWdlQXBwZW5kZWQgPSBmYWxzZTtcblx0XHR9XG5cblx0fVxufSk7XG5cbi8qPj5pdGVtcy1jb250cm9sbGVyKi9cblxuLyo+PnRhcCovXG4vKipcbiAqIHRhcC5qczpcbiAqXG4gKiBEaXNwbGF0Y2hlcyB0YXAgYW5kIGRvdWJsZS10YXAgZXZlbnRzLlxuICogXG4gKi9cblxudmFyIHRhcFRpbWVyLFxuXHR0YXBSZWxlYXNlUG9pbnQgPSB7fSxcblx0X2Rpc3BhdGNoVGFwRXZlbnQgPSBmdW5jdGlvbihvcmlnRXZlbnQsIHJlbGVhc2VQb2ludCwgcG9pbnRlclR5cGUpIHtcdFx0XG5cdFx0dmFyIGUgPSBkb2N1bWVudC5jcmVhdGVFdmVudCggJ0N1c3RvbUV2ZW50JyApLFxuXHRcdFx0ZURldGFpbCA9IHtcblx0XHRcdFx0b3JpZ0V2ZW50Om9yaWdFdmVudCwgXG5cdFx0XHRcdHRhcmdldDpvcmlnRXZlbnQudGFyZ2V0LCBcblx0XHRcdFx0cmVsZWFzZVBvaW50OiByZWxlYXNlUG9pbnQsIFxuXHRcdFx0XHRwb2ludGVyVHlwZTpwb2ludGVyVHlwZSB8fCAndG91Y2gnXG5cdFx0XHR9O1xuXG5cdFx0ZS5pbml0Q3VzdG9tRXZlbnQoICdwc3dwVGFwJywgdHJ1ZSwgdHJ1ZSwgZURldGFpbCApO1xuXHRcdG9yaWdFdmVudC50YXJnZXQuZGlzcGF0Y2hFdmVudChlKTtcblx0fTtcblxuX3JlZ2lzdGVyTW9kdWxlKCdUYXAnLCB7XG5cdHB1YmxpY01ldGhvZHM6IHtcblx0XHRpbml0VGFwOiBmdW5jdGlvbigpIHtcblx0XHRcdF9saXN0ZW4oJ2ZpcnN0VG91Y2hTdGFydCcsIHNlbGYub25UYXBTdGFydCk7XG5cdFx0XHRfbGlzdGVuKCd0b3VjaFJlbGVhc2UnLCBzZWxmLm9uVGFwUmVsZWFzZSk7XG5cdFx0XHRfbGlzdGVuKCdkZXN0cm95JywgZnVuY3Rpb24oKSB7XG5cdFx0XHRcdHRhcFJlbGVhc2VQb2ludCA9IHt9O1xuXHRcdFx0XHR0YXBUaW1lciA9IG51bGw7XG5cdFx0XHR9KTtcblx0XHR9LFxuXHRcdG9uVGFwU3RhcnQ6IGZ1bmN0aW9uKHRvdWNoTGlzdCkge1xuXHRcdFx0aWYodG91Y2hMaXN0Lmxlbmd0aCA+IDEpIHtcblx0XHRcdFx0Y2xlYXJUaW1lb3V0KHRhcFRpbWVyKTtcblx0XHRcdFx0dGFwVGltZXIgPSBudWxsO1xuXHRcdFx0fVxuXHRcdH0sXG5cdFx0b25UYXBSZWxlYXNlOiBmdW5jdGlvbihlLCByZWxlYXNlUG9pbnQpIHtcblx0XHRcdGlmKCFyZWxlYXNlUG9pbnQpIHtcblx0XHRcdFx0cmV0dXJuO1xuXHRcdFx0fVxuXG5cdFx0XHRpZighX21vdmVkICYmICFfaXNNdWx0aXRvdWNoICYmICFfbnVtQW5pbWF0aW9ucykge1xuXHRcdFx0XHR2YXIgcDAgPSByZWxlYXNlUG9pbnQ7XG5cdFx0XHRcdGlmKHRhcFRpbWVyKSB7XG5cdFx0XHRcdFx0Y2xlYXJUaW1lb3V0KHRhcFRpbWVyKTtcblx0XHRcdFx0XHR0YXBUaW1lciA9IG51bGw7XG5cblx0XHRcdFx0XHQvLyBDaGVjayBpZiB0YXBlZCBvbiB0aGUgc2FtZSBwbGFjZVxuXHRcdFx0XHRcdGlmICggX2lzTmVhcmJ5UG9pbnRzKHAwLCB0YXBSZWxlYXNlUG9pbnQpICkge1xuXHRcdFx0XHRcdFx0X3Nob3V0KCdkb3VibGVUYXAnLCBwMCk7XG5cdFx0XHRcdFx0XHRyZXR1cm47XG5cdFx0XHRcdFx0fVxuXHRcdFx0XHR9XG5cblx0XHRcdFx0aWYocmVsZWFzZVBvaW50LnR5cGUgPT09ICdtb3VzZScpIHtcblx0XHRcdFx0XHRfZGlzcGF0Y2hUYXBFdmVudChlLCByZWxlYXNlUG9pbnQsICdtb3VzZScpO1xuXHRcdFx0XHRcdHJldHVybjtcblx0XHRcdFx0fVxuXG5cdFx0XHRcdHZhciBjbGlja2VkVGFnTmFtZSA9IGUudGFyZ2V0LnRhZ05hbWUudG9VcHBlckNhc2UoKTtcblx0XHRcdFx0Ly8gYXZvaWQgZG91YmxlIHRhcCBkZWxheSBvbiBidXR0b25zIGFuZCBlbGVtZW50cyB0aGF0IGhhdmUgY2xhc3MgcHN3cF9fc2luZ2xlLXRhcFxuXHRcdFx0XHRpZihjbGlja2VkVGFnTmFtZSA9PT0gJ0JVVFRPTicgfHwgZnJhbWV3b3JrLmhhc0NsYXNzKGUudGFyZ2V0LCAncHN3cF9fc2luZ2xlLXRhcCcpICkge1xuXHRcdFx0XHRcdF9kaXNwYXRjaFRhcEV2ZW50KGUsIHJlbGVhc2VQb2ludCk7XG5cdFx0XHRcdFx0cmV0dXJuO1xuXHRcdFx0XHR9XG5cblx0XHRcdFx0X2VxdWFsaXplUG9pbnRzKHRhcFJlbGVhc2VQb2ludCwgcDApO1xuXG5cdFx0XHRcdHRhcFRpbWVyID0gc2V0VGltZW91dChmdW5jdGlvbigpIHtcblx0XHRcdFx0XHRfZGlzcGF0Y2hUYXBFdmVudChlLCByZWxlYXNlUG9pbnQpO1xuXHRcdFx0XHRcdHRhcFRpbWVyID0gbnVsbDtcblx0XHRcdFx0fSwgMzAwKTtcblx0XHRcdH1cblx0XHR9XG5cdH1cbn0pO1xuXG4vKj4+dGFwKi9cblxuLyo+PmRlc2t0b3Atem9vbSovXG4vKipcbiAqXG4gKiBkZXNrdG9wLXpvb20uanM6XG4gKlxuICogLSBCaW5kcyBtb3VzZXdoZWVsIGV2ZW50IGZvciBwYW5pbmcgem9vbWVkIGltYWdlLlxuICogLSBNYW5hZ2VzIFwiZHJhZ2dpbmdcIiwgXCJ6b29tZWQtaW5cIiwgXCJ6b29tLW91dFwiIGNsYXNzZXMuXG4gKiAgICh3aGljaCBhcmUgdXNlZCBmb3IgY3Vyc29ycyBhbmQgem9vbSBpY29uKVxuICogLSBBZGRzIHRvZ2dsZURlc2t0b3Bab29tIGZ1bmN0aW9uLlxuICogXG4gKi9cblxudmFyIF93aGVlbERlbHRhO1xuXHRcbl9yZWdpc3Rlck1vZHVsZSgnRGVza3RvcFpvb20nLCB7XG5cblx0cHVibGljTWV0aG9kczoge1xuXG5cdFx0aW5pdERlc2t0b3Bab29tOiBmdW5jdGlvbigpIHtcblxuXHRcdFx0aWYoX29sZElFKSB7XG5cdFx0XHRcdC8vIG5vIHpvb20gZm9yIG9sZCBJRSAoPD04KVxuXHRcdFx0XHRyZXR1cm47XG5cdFx0XHR9XG5cblx0XHRcdGlmKF9saWtlbHlUb3VjaERldmljZSkge1xuXHRcdFx0XHQvLyBpZiBkZXRlY3RlZCBoYXJkd2FyZSB0b3VjaCBzdXBwb3J0LCB3ZSB3YWl0IHVudGlsIG1vdXNlIGlzIHVzZWQsXG5cdFx0XHRcdC8vIGFuZCBvbmx5IHRoZW4gYXBwbHkgZGVza3RvcC16b29tIGZlYXR1cmVzXG5cdFx0XHRcdF9saXN0ZW4oJ21vdXNlVXNlZCcsIGZ1bmN0aW9uKCkge1xuXHRcdFx0XHRcdHNlbGYuc2V0dXBEZXNrdG9wWm9vbSgpO1xuXHRcdFx0XHR9KTtcblx0XHRcdH0gZWxzZSB7XG5cdFx0XHRcdHNlbGYuc2V0dXBEZXNrdG9wWm9vbSh0cnVlKTtcblx0XHRcdH1cblxuXHRcdH0sXG5cblx0XHRzZXR1cERlc2t0b3Bab29tOiBmdW5jdGlvbihvbkluaXQpIHtcblxuXHRcdFx0X3doZWVsRGVsdGEgPSB7fTtcblxuXHRcdFx0dmFyIGV2ZW50cyA9ICd3aGVlbCBtb3VzZXdoZWVsIERPTU1vdXNlU2Nyb2xsJztcblx0XHRcdFxuXHRcdFx0X2xpc3RlbignYmluZEV2ZW50cycsIGZ1bmN0aW9uKCkge1xuXHRcdFx0XHRmcmFtZXdvcmsuYmluZCh0ZW1wbGF0ZSwgZXZlbnRzLCAgc2VsZi5oYW5kbGVNb3VzZVdoZWVsKTtcblx0XHRcdH0pO1xuXG5cdFx0XHRfbGlzdGVuKCd1bmJpbmRFdmVudHMnLCBmdW5jdGlvbigpIHtcblx0XHRcdFx0aWYoX3doZWVsRGVsdGEpIHtcblx0XHRcdFx0XHRmcmFtZXdvcmsudW5iaW5kKHRlbXBsYXRlLCBldmVudHMsIHNlbGYuaGFuZGxlTW91c2VXaGVlbCk7XG5cdFx0XHRcdH1cblx0XHRcdH0pO1xuXG5cdFx0XHRzZWxmLm1vdXNlWm9vbWVkSW4gPSBmYWxzZTtcblxuXHRcdFx0dmFyIGhhc0RyYWdnaW5nQ2xhc3MsXG5cdFx0XHRcdHVwZGF0ZVpvb21hYmxlID0gZnVuY3Rpb24oKSB7XG5cdFx0XHRcdFx0aWYoc2VsZi5tb3VzZVpvb21lZEluKSB7XG5cdFx0XHRcdFx0XHRmcmFtZXdvcmsucmVtb3ZlQ2xhc3ModGVtcGxhdGUsICdwc3dwLS16b29tZWQtaW4nKTtcblx0XHRcdFx0XHRcdHNlbGYubW91c2Vab29tZWRJbiA9IGZhbHNlO1xuXHRcdFx0XHRcdH1cblx0XHRcdFx0XHRpZihfY3Vyclpvb21MZXZlbCA8IDEpIHtcblx0XHRcdFx0XHRcdGZyYW1ld29yay5hZGRDbGFzcyh0ZW1wbGF0ZSwgJ3Bzd3AtLXpvb20tYWxsb3dlZCcpO1xuXHRcdFx0XHRcdH0gZWxzZSB7XG5cdFx0XHRcdFx0XHRmcmFtZXdvcmsucmVtb3ZlQ2xhc3ModGVtcGxhdGUsICdwc3dwLS16b29tLWFsbG93ZWQnKTtcblx0XHRcdFx0XHR9XG5cdFx0XHRcdFx0cmVtb3ZlRHJhZ2dpbmdDbGFzcygpO1xuXHRcdFx0XHR9LFxuXHRcdFx0XHRyZW1vdmVEcmFnZ2luZ0NsYXNzID0gZnVuY3Rpb24oKSB7XG5cdFx0XHRcdFx0aWYoaGFzRHJhZ2dpbmdDbGFzcykge1xuXHRcdFx0XHRcdFx0ZnJhbWV3b3JrLnJlbW92ZUNsYXNzKHRlbXBsYXRlLCAncHN3cC0tZHJhZ2dpbmcnKTtcblx0XHRcdFx0XHRcdGhhc0RyYWdnaW5nQ2xhc3MgPSBmYWxzZTtcblx0XHRcdFx0XHR9XG5cdFx0XHRcdH07XG5cblx0XHRcdF9saXN0ZW4oJ3Jlc2l6ZScgLCB1cGRhdGVab29tYWJsZSk7XG5cdFx0XHRfbGlzdGVuKCdhZnRlckNoYW5nZScgLCB1cGRhdGVab29tYWJsZSk7XG5cdFx0XHRfbGlzdGVuKCdwb2ludGVyRG93bicsIGZ1bmN0aW9uKCkge1xuXHRcdFx0XHRpZihzZWxmLm1vdXNlWm9vbWVkSW4pIHtcblx0XHRcdFx0XHRoYXNEcmFnZ2luZ0NsYXNzID0gdHJ1ZTtcblx0XHRcdFx0XHRmcmFtZXdvcmsuYWRkQ2xhc3ModGVtcGxhdGUsICdwc3dwLS1kcmFnZ2luZycpO1xuXHRcdFx0XHR9XG5cdFx0XHR9KTtcblx0XHRcdF9saXN0ZW4oJ3BvaW50ZXJVcCcsIHJlbW92ZURyYWdnaW5nQ2xhc3MpO1xuXG5cdFx0XHRpZighb25Jbml0KSB7XG5cdFx0XHRcdHVwZGF0ZVpvb21hYmxlKCk7XG5cdFx0XHR9XG5cdFx0XHRcblx0XHR9LFxuXG5cdFx0aGFuZGxlTW91c2VXaGVlbDogZnVuY3Rpb24oZSkge1xuXG5cdFx0XHRpZihfY3Vyclpvb21MZXZlbCA8PSBzZWxmLmN1cnJJdGVtLmZpdFJhdGlvKSB7XG5cdFx0XHRcdGlmKCBfb3B0aW9ucy5tb2RhbCApIHtcblxuXHRcdFx0XHRcdGlmICghX29wdGlvbnMuY2xvc2VPblNjcm9sbCB8fCBfbnVtQW5pbWF0aW9ucyB8fCBfaXNEcmFnZ2luZykge1xuXHRcdFx0XHRcdFx0ZS5wcmV2ZW50RGVmYXVsdCgpO1xuXHRcdFx0XHRcdH0gZWxzZSBpZihfdHJhbnNmb3JtS2V5ICYmIE1hdGguYWJzKGUuZGVsdGFZKSA+IDIpIHtcblx0XHRcdFx0XHRcdC8vIGNsb3NlIFBob3RvU3dpcGVcblx0XHRcdFx0XHRcdC8vIGlmIGJyb3dzZXIgc3VwcG9ydHMgdHJhbnNmb3JtcyAmIHNjcm9sbCBjaGFuZ2VkIGVub3VnaFxuXHRcdFx0XHRcdFx0X2Nsb3NlZEJ5U2Nyb2xsID0gdHJ1ZTtcblx0XHRcdFx0XHRcdHNlbGYuY2xvc2UoKTtcblx0XHRcdFx0XHR9XG5cblx0XHRcdFx0fVxuXHRcdFx0XHRyZXR1cm4gdHJ1ZTtcblx0XHRcdH1cblxuXHRcdFx0Ly8gYWxsb3cganVzdCBvbmUgZXZlbnQgdG8gZmlyZVxuXHRcdFx0ZS5zdG9wUHJvcGFnYXRpb24oKTtcblxuXHRcdFx0Ly8gaHR0cHM6Ly9kZXZlbG9wZXIubW96aWxsYS5vcmcvZW4tVVMvZG9jcy9XZWIvRXZlbnRzL3doZWVsXG5cdFx0XHRfd2hlZWxEZWx0YS54ID0gMDtcblxuXHRcdFx0aWYoJ2RlbHRhWCcgaW4gZSkge1xuXHRcdFx0XHRpZihlLmRlbHRhTW9kZSA9PT0gMSAvKiBET01fREVMVEFfTElORSAqLykge1xuXHRcdFx0XHRcdC8vIDE4IC0gYXZlcmFnZSBsaW5lIGhlaWdodFxuXHRcdFx0XHRcdF93aGVlbERlbHRhLnggPSBlLmRlbHRhWCAqIDE4O1xuXHRcdFx0XHRcdF93aGVlbERlbHRhLnkgPSBlLmRlbHRhWSAqIDE4O1xuXHRcdFx0XHR9IGVsc2Uge1xuXHRcdFx0XHRcdF93aGVlbERlbHRhLnggPSBlLmRlbHRhWDtcblx0XHRcdFx0XHRfd2hlZWxEZWx0YS55ID0gZS5kZWx0YVk7XG5cdFx0XHRcdH1cblx0XHRcdH0gZWxzZSBpZignd2hlZWxEZWx0YScgaW4gZSkge1xuXHRcdFx0XHRpZihlLndoZWVsRGVsdGFYKSB7XG5cdFx0XHRcdFx0X3doZWVsRGVsdGEueCA9IC0wLjE2ICogZS53aGVlbERlbHRhWDtcblx0XHRcdFx0fVxuXHRcdFx0XHRpZihlLndoZWVsRGVsdGFZKSB7XG5cdFx0XHRcdFx0X3doZWVsRGVsdGEueSA9IC0wLjE2ICogZS53aGVlbERlbHRhWTtcblx0XHRcdFx0fSBlbHNlIHtcblx0XHRcdFx0XHRfd2hlZWxEZWx0YS55ID0gLTAuMTYgKiBlLndoZWVsRGVsdGE7XG5cdFx0XHRcdH1cblx0XHRcdH0gZWxzZSBpZignZGV0YWlsJyBpbiBlKSB7XG5cdFx0XHRcdF93aGVlbERlbHRhLnkgPSBlLmRldGFpbDtcblx0XHRcdH0gZWxzZSB7XG5cdFx0XHRcdHJldHVybjtcblx0XHRcdH1cblxuXHRcdFx0X2NhbGN1bGF0ZVBhbkJvdW5kcyhfY3Vyclpvb21MZXZlbCwgdHJ1ZSk7XG5cblx0XHRcdHZhciBuZXdQYW5YID0gX3Bhbk9mZnNldC54IC0gX3doZWVsRGVsdGEueCxcblx0XHRcdFx0bmV3UGFuWSA9IF9wYW5PZmZzZXQueSAtIF93aGVlbERlbHRhLnk7XG5cblx0XHRcdC8vIG9ubHkgcHJldmVudCBzY3JvbGxpbmcgaW4gbm9ubW9kYWwgbW9kZSB3aGVuIG5vdCBhdCBlZGdlc1xuXHRcdFx0aWYgKF9vcHRpb25zLm1vZGFsIHx8XG5cdFx0XHRcdChcblx0XHRcdFx0bmV3UGFuWCA8PSBfY3VyclBhbkJvdW5kcy5taW4ueCAmJiBuZXdQYW5YID49IF9jdXJyUGFuQm91bmRzLm1heC54ICYmXG5cdFx0XHRcdG5ld1BhblkgPD0gX2N1cnJQYW5Cb3VuZHMubWluLnkgJiYgbmV3UGFuWSA+PSBfY3VyclBhbkJvdW5kcy5tYXgueVxuXHRcdFx0XHQpICkge1xuXHRcdFx0XHRlLnByZXZlbnREZWZhdWx0KCk7XG5cdFx0XHR9XG5cblx0XHRcdC8vIFRPRE86IHVzZSByQUYgaW5zdGVhZCBvZiBtb3VzZXdoZWVsP1xuXHRcdFx0c2VsZi5wYW5UbyhuZXdQYW5YLCBuZXdQYW5ZKTtcblx0XHR9LFxuXG5cdFx0dG9nZ2xlRGVza3RvcFpvb206IGZ1bmN0aW9uKGNlbnRlclBvaW50KSB7XG5cdFx0XHRjZW50ZXJQb2ludCA9IGNlbnRlclBvaW50IHx8IHt4Ol92aWV3cG9ydFNpemUueC8yICsgX29mZnNldC54LCB5Ol92aWV3cG9ydFNpemUueS8yICsgX29mZnNldC55IH07XG5cblx0XHRcdHZhciBkb3VibGVUYXBab29tTGV2ZWwgPSBfb3B0aW9ucy5nZXREb3VibGVUYXBab29tKHRydWUsIHNlbGYuY3Vyckl0ZW0pO1xuXHRcdFx0dmFyIHpvb21PdXQgPSBfY3Vyclpvb21MZXZlbCA9PT0gZG91YmxlVGFwWm9vbUxldmVsO1xuXHRcdFx0XG5cdFx0XHRzZWxmLm1vdXNlWm9vbWVkSW4gPSAhem9vbU91dDtcblxuXHRcdFx0c2VsZi56b29tVG8oem9vbU91dCA/IHNlbGYuY3Vyckl0ZW0uaW5pdGlhbFpvb21MZXZlbCA6IGRvdWJsZVRhcFpvb21MZXZlbCwgY2VudGVyUG9pbnQsIDMzMyk7XG5cdFx0XHRmcmFtZXdvcmtbICghem9vbU91dCA/ICdhZGQnIDogJ3JlbW92ZScpICsgJ0NsYXNzJ10odGVtcGxhdGUsICdwc3dwLS16b29tZWQtaW4nKTtcblx0XHR9XG5cblx0fVxufSk7XG5cblxuLyo+PmRlc2t0b3Atem9vbSovXG5cbi8qPj5oaXN0b3J5Ki9cbi8qKlxuICpcbiAqIGhpc3RvcnkuanM6XG4gKlxuICogLSBCYWNrIGJ1dHRvbiB0byBjbG9zZSBnYWxsZXJ5LlxuICogXG4gKiAtIFVuaXF1ZSBVUkwgZm9yIGVhY2ggc2xpZGU6IGV4YW1wbGUuY29tLyZwaWQ9MSZnaWQ9M1xuICogICAod2hlcmUgUElEIGlzIHBpY3R1cmUgaW5kZXgsIGFuZCBHSUQgYW5kIGdhbGxlcnkgaW5kZXgpXG4gKiAgIFxuICogLSBTd2l0Y2ggVVJMIHdoZW4gc2xpZGVzIGNoYW5nZS5cbiAqIFxuICovXG5cblxudmFyIF9oaXN0b3J5RGVmYXVsdE9wdGlvbnMgPSB7XG5cdGhpc3Rvcnk6IHRydWUsXG5cdGdhbGxlcnlVSUQ6IDFcbn07XG5cbnZhciBfaGlzdG9yeVVwZGF0ZVRpbWVvdXQsXG5cdF9oYXNoQ2hhbmdlVGltZW91dCxcblx0X2hhc2hBbmltQ2hlY2tUaW1lb3V0LFxuXHRfaGFzaENoYW5nZWRCeVNjcmlwdCxcblx0X2hhc2hDaGFuZ2VkQnlIaXN0b3J5LFxuXHRfaGFzaFJlc2V0ZWQsXG5cdF9pbml0aWFsSGFzaCxcblx0X2hpc3RvcnlDaGFuZ2VkLFxuXHRfY2xvc2VkRnJvbVVSTCxcblx0X3VybENoYW5nZWRPbmNlLFxuXHRfd2luZG93TG9jLFxuXG5cdF9zdXBwb3J0c1B1c2hTdGF0ZSxcblxuXHRfZ2V0SGFzaCA9IGZ1bmN0aW9uKCkge1xuXHRcdHJldHVybiBfd2luZG93TG9jLmhhc2guc3Vic3RyaW5nKDEpO1xuXHR9LFxuXHRfY2xlYW5IaXN0b3J5VGltZW91dHMgPSBmdW5jdGlvbigpIHtcblxuXHRcdGlmKF9oaXN0b3J5VXBkYXRlVGltZW91dCkge1xuXHRcdFx0Y2xlYXJUaW1lb3V0KF9oaXN0b3J5VXBkYXRlVGltZW91dCk7XG5cdFx0fVxuXG5cdFx0aWYoX2hhc2hBbmltQ2hlY2tUaW1lb3V0KSB7XG5cdFx0XHRjbGVhclRpbWVvdXQoX2hhc2hBbmltQ2hlY2tUaW1lb3V0KTtcblx0XHR9XG5cdH0sXG5cblx0Ly8gcGlkIC0gUGljdHVyZSBpbmRleFxuXHQvLyBnaWQgLSBHYWxsZXJ5IGluZGV4XG5cdF9wYXJzZUl0ZW1JbmRleEZyb21VUkwgPSBmdW5jdGlvbigpIHtcblx0XHR2YXIgaGFzaCA9IF9nZXRIYXNoKCksXG5cdFx0XHRwYXJhbXMgPSB7fTtcblxuXHRcdGlmKGhhc2gubGVuZ3RoIDwgNSkgeyAvLyBwaWQ9MVxuXHRcdFx0cmV0dXJuIHBhcmFtcztcblx0XHR9XG5cblx0XHR2YXIgaSwgdmFycyA9IGhhc2guc3BsaXQoJyYnKTtcblx0XHRmb3IgKGkgPSAwOyBpIDwgdmFycy5sZW5ndGg7IGkrKykge1xuXHRcdFx0aWYoIXZhcnNbaV0pIHtcblx0XHRcdFx0Y29udGludWU7XG5cdFx0XHR9XG5cdFx0XHR2YXIgcGFpciA9IHZhcnNbaV0uc3BsaXQoJz0nKTtcdFxuXHRcdFx0aWYocGFpci5sZW5ndGggPCAyKSB7XG5cdFx0XHRcdGNvbnRpbnVlO1xuXHRcdFx0fVxuXHRcdFx0cGFyYW1zW3BhaXJbMF1dID0gcGFpclsxXTtcblx0XHR9XG5cdFx0aWYoX29wdGlvbnMuZ2FsbGVyeVBJRHMpIHtcblx0XHRcdC8vIGRldGVjdCBjdXN0b20gcGlkIGluIGhhc2ggYW5kIHNlYXJjaCBmb3IgaXQgYW1vbmcgdGhlIGl0ZW1zIGNvbGxlY3Rpb25cblx0XHRcdHZhciBzZWFyY2hmb3IgPSBwYXJhbXMucGlkO1xuXHRcdFx0cGFyYW1zLnBpZCA9IDA7IC8vIGlmIGN1c3RvbSBwaWQgY2Fubm90IGJlIGZvdW5kLCBmYWxsYmFjayB0byB0aGUgZmlyc3QgaXRlbVxuXHRcdFx0Zm9yKGkgPSAwOyBpIDwgX2l0ZW1zLmxlbmd0aDsgaSsrKSB7XG5cdFx0XHRcdGlmKF9pdGVtc1tpXS5waWQgPT09IHNlYXJjaGZvcikge1xuXHRcdFx0XHRcdHBhcmFtcy5waWQgPSBpO1xuXHRcdFx0XHRcdGJyZWFrO1xuXHRcdFx0XHR9XG5cdFx0XHR9XG5cdFx0fSBlbHNlIHtcblx0XHRcdHBhcmFtcy5waWQgPSBwYXJzZUludChwYXJhbXMucGlkLDEwKS0xO1xuXHRcdH1cblx0XHRpZiggcGFyYW1zLnBpZCA8IDAgKSB7XG5cdFx0XHRwYXJhbXMucGlkID0gMDtcblx0XHR9XG5cdFx0cmV0dXJuIHBhcmFtcztcblx0fSxcblx0X3VwZGF0ZUhhc2ggPSBmdW5jdGlvbigpIHtcblxuXHRcdGlmKF9oYXNoQW5pbUNoZWNrVGltZW91dCkge1xuXHRcdFx0Y2xlYXJUaW1lb3V0KF9oYXNoQW5pbUNoZWNrVGltZW91dCk7XG5cdFx0fVxuXG5cblx0XHRpZihfbnVtQW5pbWF0aW9ucyB8fCBfaXNEcmFnZ2luZykge1xuXHRcdFx0Ly8gY2hhbmdpbmcgYnJvd3NlciBVUkwgZm9yY2VzIGxheW91dC9wYWludCBpbiBzb21lIGJyb3dzZXJzLCB3aGljaCBjYXVzZXMgbm90aWNhYmxlIGxhZyBkdXJpbmcgYW5pbWF0aW9uXG5cdFx0XHQvLyB0aGF0J3Mgd2h5IHdlIHVwZGF0ZSBoYXNoIG9ubHkgd2hlbiBubyBhbmltYXRpb25zIHJ1bm5pbmdcblx0XHRcdF9oYXNoQW5pbUNoZWNrVGltZW91dCA9IHNldFRpbWVvdXQoX3VwZGF0ZUhhc2gsIDUwMCk7XG5cdFx0XHRyZXR1cm47XG5cdFx0fVxuXHRcdFxuXHRcdGlmKF9oYXNoQ2hhbmdlZEJ5U2NyaXB0KSB7XG5cdFx0XHRjbGVhclRpbWVvdXQoX2hhc2hDaGFuZ2VUaW1lb3V0KTtcblx0XHR9IGVsc2Uge1xuXHRcdFx0X2hhc2hDaGFuZ2VkQnlTY3JpcHQgPSB0cnVlO1xuXHRcdH1cblxuXG5cdFx0dmFyIHBpZCA9IChfY3VycmVudEl0ZW1JbmRleCArIDEpO1xuXHRcdHZhciBpdGVtID0gX2dldEl0ZW1BdCggX2N1cnJlbnRJdGVtSW5kZXggKTtcblx0XHRpZihpdGVtLmhhc093blByb3BlcnR5KCdwaWQnKSkge1xuXHRcdFx0Ly8gY2FycnkgZm9yd2FyZCBhbnkgY3VzdG9tIHBpZCBhc3NpZ25lZCB0byB0aGUgaXRlbVxuXHRcdFx0cGlkID0gaXRlbS5waWQ7XG5cdFx0fVxuXHRcdHZhciBuZXdIYXNoID0gX2luaXRpYWxIYXNoICsgJyYnICArICAnZ2lkPScgKyBfb3B0aW9ucy5nYWxsZXJ5VUlEICsgJyYnICsgJ3BpZD0nICsgcGlkO1xuXG5cdFx0aWYoIV9oaXN0b3J5Q2hhbmdlZCkge1xuXHRcdFx0aWYoX3dpbmRvd0xvYy5oYXNoLmluZGV4T2YobmV3SGFzaCkgPT09IC0xKSB7XG5cdFx0XHRcdF91cmxDaGFuZ2VkT25jZSA9IHRydWU7XG5cdFx0XHR9XG5cdFx0XHQvLyBmaXJzdCB0aW1lIC0gYWRkIG5ldyBoaXNvcnkgcmVjb3JkLCB0aGVuIGp1c3QgcmVwbGFjZVxuXHRcdH1cblxuXHRcdHZhciBuZXdVUkwgPSBfd2luZG93TG9jLmhyZWYuc3BsaXQoJyMnKVswXSArICcjJyArICBuZXdIYXNoO1xuXG5cdFx0aWYoIF9zdXBwb3J0c1B1c2hTdGF0ZSApIHtcblxuXHRcdFx0aWYoJyMnICsgbmV3SGFzaCAhPT0gd2luZG93LmxvY2F0aW9uLmhhc2gpIHtcblx0XHRcdFx0aGlzdG9yeVtfaGlzdG9yeUNoYW5nZWQgPyAncmVwbGFjZVN0YXRlJyA6ICdwdXNoU3RhdGUnXSgnJywgZG9jdW1lbnQudGl0bGUsIG5ld1VSTCk7XG5cdFx0XHR9XG5cblx0XHR9IGVsc2Uge1xuXHRcdFx0aWYoX2hpc3RvcnlDaGFuZ2VkKSB7XG5cdFx0XHRcdF93aW5kb3dMb2MucmVwbGFjZSggbmV3VVJMICk7XG5cdFx0XHR9IGVsc2Uge1xuXHRcdFx0XHRfd2luZG93TG9jLmhhc2ggPSBuZXdIYXNoO1xuXHRcdFx0fVxuXHRcdH1cblx0XHRcblx0XHRcblxuXHRcdF9oaXN0b3J5Q2hhbmdlZCA9IHRydWU7XG5cdFx0X2hhc2hDaGFuZ2VUaW1lb3V0ID0gc2V0VGltZW91dChmdW5jdGlvbigpIHtcblx0XHRcdF9oYXNoQ2hhbmdlZEJ5U2NyaXB0ID0gZmFsc2U7XG5cdFx0fSwgNjApO1xuXHR9O1xuXG5cblxuXHRcblxuX3JlZ2lzdGVyTW9kdWxlKCdIaXN0b3J5Jywge1xuXG5cdFxuXG5cdHB1YmxpY01ldGhvZHM6IHtcblx0XHRpbml0SGlzdG9yeTogZnVuY3Rpb24oKSB7XG5cblx0XHRcdGZyYW1ld29yay5leHRlbmQoX29wdGlvbnMsIF9oaXN0b3J5RGVmYXVsdE9wdGlvbnMsIHRydWUpO1xuXG5cdFx0XHRpZiggIV9vcHRpb25zLmhpc3RvcnkgKSB7XG5cdFx0XHRcdHJldHVybjtcblx0XHRcdH1cblxuXG5cdFx0XHRfd2luZG93TG9jID0gd2luZG93LmxvY2F0aW9uO1xuXHRcdFx0X3VybENoYW5nZWRPbmNlID0gZmFsc2U7XG5cdFx0XHRfY2xvc2VkRnJvbVVSTCA9IGZhbHNlO1xuXHRcdFx0X2hpc3RvcnlDaGFuZ2VkID0gZmFsc2U7XG5cdFx0XHRfaW5pdGlhbEhhc2ggPSBfZ2V0SGFzaCgpO1xuXHRcdFx0X3N1cHBvcnRzUHVzaFN0YXRlID0gKCdwdXNoU3RhdGUnIGluIGhpc3RvcnkpO1xuXG5cblx0XHRcdGlmKF9pbml0aWFsSGFzaC5pbmRleE9mKCdnaWQ9JykgPiAtMSkge1xuXHRcdFx0XHRfaW5pdGlhbEhhc2ggPSBfaW5pdGlhbEhhc2guc3BsaXQoJyZnaWQ9JylbMF07XG5cdFx0XHRcdF9pbml0aWFsSGFzaCA9IF9pbml0aWFsSGFzaC5zcGxpdCgnP2dpZD0nKVswXTtcblx0XHRcdH1cblx0XHRcdFxuXG5cdFx0XHRfbGlzdGVuKCdhZnRlckNoYW5nZScsIHNlbGYudXBkYXRlVVJMKTtcblx0XHRcdF9saXN0ZW4oJ3VuYmluZEV2ZW50cycsIGZ1bmN0aW9uKCkge1xuXHRcdFx0XHRmcmFtZXdvcmsudW5iaW5kKHdpbmRvdywgJ2hhc2hjaGFuZ2UnLCBzZWxmLm9uSGFzaENoYW5nZSk7XG5cdFx0XHR9KTtcblxuXG5cdFx0XHR2YXIgcmV0dXJuVG9PcmlnaW5hbCA9IGZ1bmN0aW9uKCkge1xuXHRcdFx0XHRfaGFzaFJlc2V0ZWQgPSB0cnVlO1xuXHRcdFx0XHRpZighX2Nsb3NlZEZyb21VUkwpIHtcblxuXHRcdFx0XHRcdGlmKF91cmxDaGFuZ2VkT25jZSkge1xuXHRcdFx0XHRcdFx0aGlzdG9yeS5iYWNrKCk7XG5cdFx0XHRcdFx0fSBlbHNlIHtcblxuXHRcdFx0XHRcdFx0aWYoX2luaXRpYWxIYXNoKSB7XG5cdFx0XHRcdFx0XHRcdF93aW5kb3dMb2MuaGFzaCA9IF9pbml0aWFsSGFzaDtcblx0XHRcdFx0XHRcdH0gZWxzZSB7XG5cdFx0XHRcdFx0XHRcdGlmIChfc3VwcG9ydHNQdXNoU3RhdGUpIHtcblxuXHRcdFx0XHRcdFx0XHRcdC8vIHJlbW92ZSBoYXNoIGZyb20gdXJsIHdpdGhvdXQgcmVmcmVzaGluZyBpdCBvciBzY3JvbGxpbmcgdG8gdG9wXG5cdFx0XHRcdFx0XHRcdFx0aGlzdG9yeS5wdXNoU3RhdGUoJycsIGRvY3VtZW50LnRpdGxlLCAgX3dpbmRvd0xvYy5wYXRobmFtZSArIF93aW5kb3dMb2Muc2VhcmNoICk7XG5cdFx0XHRcdFx0XHRcdH0gZWxzZSB7XG5cdFx0XHRcdFx0XHRcdFx0X3dpbmRvd0xvYy5oYXNoID0gJyc7XG5cdFx0XHRcdFx0XHRcdH1cblx0XHRcdFx0XHRcdH1cblx0XHRcdFx0XHR9XG5cdFx0XHRcdFx0XG5cdFx0XHRcdH1cblxuXHRcdFx0XHRfY2xlYW5IaXN0b3J5VGltZW91dHMoKTtcblx0XHRcdH07XG5cblxuXHRcdFx0X2xpc3RlbigndW5iaW5kRXZlbnRzJywgZnVuY3Rpb24oKSB7XG5cdFx0XHRcdGlmKF9jbG9zZWRCeVNjcm9sbCkge1xuXHRcdFx0XHRcdC8vIGlmIFBob3RvU3dpcGUgaXMgY2xvc2VkIGJ5IHNjcm9sbCwgd2UgZ28gXCJiYWNrXCIgYmVmb3JlIHRoZSBjbG9zaW5nIGFuaW1hdGlvbiBzdGFydHNcblx0XHRcdFx0XHQvLyB0aGlzIGlzIGRvbmUgdG8ga2VlcCB0aGUgc2Nyb2xsIHBvc2l0aW9uXG5cdFx0XHRcdFx0cmV0dXJuVG9PcmlnaW5hbCgpO1xuXHRcdFx0XHR9XG5cdFx0XHR9KTtcblx0XHRcdF9saXN0ZW4oJ2Rlc3Ryb3knLCBmdW5jdGlvbigpIHtcblx0XHRcdFx0aWYoIV9oYXNoUmVzZXRlZCkge1xuXHRcdFx0XHRcdHJldHVyblRvT3JpZ2luYWwoKTtcblx0XHRcdFx0fVxuXHRcdFx0fSk7XG5cdFx0XHRfbGlzdGVuKCdmaXJzdFVwZGF0ZScsIGZ1bmN0aW9uKCkge1xuXHRcdFx0XHRfY3VycmVudEl0ZW1JbmRleCA9IF9wYXJzZUl0ZW1JbmRleEZyb21VUkwoKS5waWQ7XG5cdFx0XHR9KTtcblxuXHRcdFx0XG5cblx0XHRcdFxuXHRcdFx0dmFyIGluZGV4ID0gX2luaXRpYWxIYXNoLmluZGV4T2YoJ3BpZD0nKTtcblx0XHRcdGlmKGluZGV4ID4gLTEpIHtcblx0XHRcdFx0X2luaXRpYWxIYXNoID0gX2luaXRpYWxIYXNoLnN1YnN0cmluZygwLCBpbmRleCk7XG5cdFx0XHRcdGlmKF9pbml0aWFsSGFzaC5zbGljZSgtMSkgPT09ICcmJykge1xuXHRcdFx0XHRcdF9pbml0aWFsSGFzaCA9IF9pbml0aWFsSGFzaC5zbGljZSgwLCAtMSk7XG5cdFx0XHRcdH1cblx0XHRcdH1cblx0XHRcdFxuXG5cdFx0XHRzZXRUaW1lb3V0KGZ1bmN0aW9uKCkge1xuXHRcdFx0XHRpZihfaXNPcGVuKSB7IC8vIGhhc24ndCBkZXN0cm95ZWQgeWV0XG5cdFx0XHRcdFx0ZnJhbWV3b3JrLmJpbmQod2luZG93LCAnaGFzaGNoYW5nZScsIHNlbGYub25IYXNoQ2hhbmdlKTtcblx0XHRcdFx0fVxuXHRcdFx0fSwgNDApO1xuXHRcdFx0XG5cdFx0fSxcblx0XHRvbkhhc2hDaGFuZ2U6IGZ1bmN0aW9uKCkge1xuXG5cdFx0XHRpZihfZ2V0SGFzaCgpID09PSBfaW5pdGlhbEhhc2gpIHtcblxuXHRcdFx0XHRfY2xvc2VkRnJvbVVSTCA9IHRydWU7XG5cdFx0XHRcdHNlbGYuY2xvc2UoKTtcblx0XHRcdFx0cmV0dXJuO1xuXHRcdFx0fVxuXHRcdFx0aWYoIV9oYXNoQ2hhbmdlZEJ5U2NyaXB0KSB7XG5cblx0XHRcdFx0X2hhc2hDaGFuZ2VkQnlIaXN0b3J5ID0gdHJ1ZTtcblx0XHRcdFx0c2VsZi5nb1RvKCBfcGFyc2VJdGVtSW5kZXhGcm9tVVJMKCkucGlkICk7XG5cdFx0XHRcdF9oYXNoQ2hhbmdlZEJ5SGlzdG9yeSA9IGZhbHNlO1xuXHRcdFx0fVxuXHRcdFx0XG5cdFx0fSxcblx0XHR1cGRhdGVVUkw6IGZ1bmN0aW9uKCkge1xuXG5cdFx0XHQvLyBEZWxheSB0aGUgdXBkYXRlIG9mIFVSTCwgdG8gYXZvaWQgbGFnIGR1cmluZyB0cmFuc2l0aW9uLCBcblx0XHRcdC8vIGFuZCB0byBub3QgdG8gdHJpZ2dlciBhY3Rpb25zIGxpa2UgXCJyZWZyZXNoIHBhZ2Ugc291bmRcIiBvciBcImJsaW5raW5nIGZhdmljb25cIiB0byBvZnRlblxuXHRcdFx0XG5cdFx0XHRfY2xlYW5IaXN0b3J5VGltZW91dHMoKTtcblx0XHRcdFxuXG5cdFx0XHRpZihfaGFzaENoYW5nZWRCeUhpc3RvcnkpIHtcblx0XHRcdFx0cmV0dXJuO1xuXHRcdFx0fVxuXG5cdFx0XHRpZighX2hpc3RvcnlDaGFuZ2VkKSB7XG5cdFx0XHRcdF91cGRhdGVIYXNoKCk7IC8vIGZpcnN0IHRpbWVcblx0XHRcdH0gZWxzZSB7XG5cdFx0XHRcdF9oaXN0b3J5VXBkYXRlVGltZW91dCA9IHNldFRpbWVvdXQoX3VwZGF0ZUhhc2gsIDgwMCk7XG5cdFx0XHR9XG5cdFx0fVxuXHRcblx0fVxufSk7XG5cblxuLyo+Pmhpc3RvcnkqL1xuXHRmcmFtZXdvcmsuZXh0ZW5kKHNlbGYsIHB1YmxpY01ldGhvZHMpOyB9O1xuXHRyZXR1cm4gUGhvdG9Td2lwZTtcbn0pOyIsIi8vIGV4dHJhY3RlZCBieSBtaW5pLWNzcy1leHRyYWN0LXBsdWdpbiIsIi8vIGV4dHJhY3RlZCBieSBtaW5pLWNzcy1leHRyYWN0LXBsdWdpbiIsIi8qKlxuKlxuKiBVSSBvbiB0b3Agb2YgbWFpbiBzbGlkaW5nIGFyZWEgKGNhcHRpb24sIGFycm93cywgY2xvc2UgYnV0dG9uLCBldGMuKS5cbiogQnVpbHQganVzdCB1c2luZyBwdWJsaWMgbWV0aG9kcy9wcm9wZXJ0aWVzIG9mIFBob3RvU3dpcGUuXG4qIFxuKi9cbihmdW5jdGlvbiAocm9vdCwgZmFjdG9yeSkgeyBcblx0aWYgKHR5cGVvZiBkZWZpbmUgPT09ICdmdW5jdGlvbicgJiYgZGVmaW5lLmFtZCkge1xuXHRcdGRlZmluZShmYWN0b3J5KTtcblx0fSBlbHNlIGlmICh0eXBlb2YgZXhwb3J0cyA9PT0gJ29iamVjdCcpIHtcblx0XHRtb2R1bGUuZXhwb3J0cyA9IGZhY3RvcnkoKTtcblx0fSBlbHNlIHtcblx0XHRyb290LlBob3RvU3dpcGVVSV9EZWZhdWx0ID0gZmFjdG9yeSgpO1xuXHR9XG59KSh0aGlzLCBmdW5jdGlvbiAoKSB7XG5cblx0J3VzZSBzdHJpY3QnO1xuXG5cblxudmFyIFBob3RvU3dpcGVVSV9EZWZhdWx0ID1cbiBmdW5jdGlvbihwc3dwLCBmcmFtZXdvcmspIHtcblxuXHR2YXIgdWkgPSB0aGlzO1xuXHR2YXIgX292ZXJsYXlVSVVwZGF0ZWQgPSBmYWxzZSxcblx0XHRfY29udHJvbHNWaXNpYmxlID0gdHJ1ZSxcblx0XHRfZnVsbHNjcmVuQVBJLFxuXHRcdF9jb250cm9scyxcblx0XHRfY2FwdGlvbkNvbnRhaW5lcixcblx0XHRfZmFrZUNhcHRpb25Db250YWluZXIsXG5cdFx0X2luZGV4SW5kaWNhdG9yLFxuXHRcdF9zaGFyZUJ1dHRvbixcblx0XHRfc2hhcmVNb2RhbCxcblx0XHRfc2hhcmVNb2RhbEhpZGRlbiA9IHRydWUsXG5cdFx0X2luaXRhbENsb3NlT25TY3JvbGxWYWx1ZSxcblx0XHRfaXNJZGxlLFxuXHRcdF9saXN0ZW4sXG5cblx0XHRfbG9hZGluZ0luZGljYXRvcixcblx0XHRfbG9hZGluZ0luZGljYXRvckhpZGRlbixcblx0XHRfbG9hZGluZ0luZGljYXRvclRpbWVvdXQsXG5cblx0XHRfZ2FsbGVyeUhhc09uZVNsaWRlLFxuXG5cdFx0X29wdGlvbnMsXG5cdFx0X2RlZmF1bHRVSU9wdGlvbnMgPSB7XG5cdFx0XHRiYXJzU2l6ZToge3RvcDo0NCwgYm90dG9tOidhdXRvJ30sXG5cdFx0XHRjbG9zZUVsQ2xhc3NlczogWydpdGVtJywgJ2NhcHRpb24nLCAnem9vbS13cmFwJywgJ3VpJywgJ3RvcC1iYXInXSwgXG5cdFx0XHR0aW1lVG9JZGxlOiA0MDAwLCBcblx0XHRcdHRpbWVUb0lkbGVPdXRzaWRlOiAxMDAwLFxuXHRcdFx0bG9hZGluZ0luZGljYXRvckRlbGF5OiAxMDAwLCAvLyAyc1xuXHRcdFx0XG5cdFx0XHRhZGRDYXB0aW9uSFRNTEZuOiBmdW5jdGlvbihpdGVtLCBjYXB0aW9uRWwgLyosIGlzRmFrZSAqLykge1xuXHRcdFx0XHRpZighaXRlbS50aXRsZSkge1xuXHRcdFx0XHRcdGNhcHRpb25FbC5jaGlsZHJlblswXS5pbm5lckhUTUwgPSAnJztcblx0XHRcdFx0XHRyZXR1cm4gZmFsc2U7XG5cdFx0XHRcdH1cblx0XHRcdFx0Y2FwdGlvbkVsLmNoaWxkcmVuWzBdLmlubmVySFRNTCA9IGl0ZW0udGl0bGU7XG5cdFx0XHRcdHJldHVybiB0cnVlO1xuXHRcdFx0fSxcblxuXHRcdFx0Y2xvc2VFbDp0cnVlLFxuXHRcdFx0Y2FwdGlvbkVsOiB0cnVlLFxuXHRcdFx0ZnVsbHNjcmVlbkVsOiB0cnVlLFxuXHRcdFx0em9vbUVsOiB0cnVlLFxuXHRcdFx0c2hhcmVFbDogdHJ1ZSxcblx0XHRcdGNvdW50ZXJFbDogdHJ1ZSxcblx0XHRcdGFycm93RWw6IHRydWUsXG5cdFx0XHRwcmVsb2FkZXJFbDogdHJ1ZSxcblxuXHRcdFx0dGFwVG9DbG9zZTogZmFsc2UsXG5cdFx0XHR0YXBUb1RvZ2dsZUNvbnRyb2xzOiB0cnVlLFxuXG5cdFx0XHRjbGlja1RvQ2xvc2VOb25ab29tYWJsZTogdHJ1ZSxcblxuXHRcdFx0c2hhcmVCdXR0b25zOiBbXG5cdFx0XHRcdHtpZDonZmFjZWJvb2snLCBsYWJlbDonU2hhcmUgb24gRmFjZWJvb2snLCB1cmw6J2h0dHBzOi8vd3d3LmZhY2Vib29rLmNvbS9zaGFyZXIvc2hhcmVyLnBocD91PXt7dXJsfX0nfSxcblx0XHRcdFx0e2lkOid0d2l0dGVyJywgbGFiZWw6J1R3ZWV0JywgdXJsOidodHRwczovL3R3aXR0ZXIuY29tL2ludGVudC90d2VldD90ZXh0PXt7dGV4dH19JnVybD17e3VybH19J30sXG5cdFx0XHRcdHtpZDoncGludGVyZXN0JywgbGFiZWw6J1BpbiBpdCcsIHVybDonaHR0cDovL3d3dy5waW50ZXJlc3QuY29tL3Bpbi9jcmVhdGUvYnV0dG9uLycrXG5cdFx0XHRcdFx0XHRcdFx0XHRcdFx0XHRcdCc/dXJsPXt7dXJsfX0mbWVkaWE9e3tpbWFnZV91cmx9fSZkZXNjcmlwdGlvbj17e3RleHR9fSd9LFxuXHRcdFx0XHR7aWQ6J2Rvd25sb2FkJywgbGFiZWw6J0Rvd25sb2FkIGltYWdlJywgdXJsOid7e3Jhd19pbWFnZV91cmx9fScsIGRvd25sb2FkOnRydWV9XG5cdFx0XHRdLFxuXHRcdFx0Z2V0SW1hZ2VVUkxGb3JTaGFyZTogZnVuY3Rpb24oIC8qIHNoYXJlQnV0dG9uRGF0YSAqLyApIHtcblx0XHRcdFx0cmV0dXJuIHBzd3AuY3Vyckl0ZW0uc3JjIHx8ICcnO1xuXHRcdFx0fSxcblx0XHRcdGdldFBhZ2VVUkxGb3JTaGFyZTogZnVuY3Rpb24oIC8qIHNoYXJlQnV0dG9uRGF0YSAqLyApIHtcblx0XHRcdFx0cmV0dXJuIHdpbmRvdy5sb2NhdGlvbi5ocmVmO1xuXHRcdFx0fSxcblx0XHRcdGdldFRleHRGb3JTaGFyZTogZnVuY3Rpb24oIC8qIHNoYXJlQnV0dG9uRGF0YSAqLyApIHtcblx0XHRcdFx0cmV0dXJuIHBzd3AuY3Vyckl0ZW0udGl0bGUgfHwgJyc7XG5cdFx0XHR9LFxuXHRcdFx0XHRcblx0XHRcdGluZGV4SW5kaWNhdG9yU2VwOiAnIC8gJyxcblx0XHRcdGZpdENvbnRyb2xzV2lkdGg6IDEyMDBcblxuXHRcdH0sXG5cdFx0X2Jsb2NrQ29udHJvbHNUYXAsXG5cdFx0X2Jsb2NrQ29udHJvbHNUYXBUaW1lb3V0O1xuXG5cblxuXHR2YXIgX29uQ29udHJvbHNUYXAgPSBmdW5jdGlvbihlKSB7XG5cdFx0XHRpZihfYmxvY2tDb250cm9sc1RhcCkge1xuXHRcdFx0XHRyZXR1cm4gdHJ1ZTtcblx0XHRcdH1cblxuXG5cdFx0XHRlID0gZSB8fCB3aW5kb3cuZXZlbnQ7XG5cblx0XHRcdGlmKF9vcHRpb25zLnRpbWVUb0lkbGUgJiYgX29wdGlvbnMubW91c2VVc2VkICYmICFfaXNJZGxlKSB7XG5cdFx0XHRcdC8vIHJlc2V0IGlkbGUgdGltZXJcblx0XHRcdFx0X29uSWRsZU1vdXNlTW92ZSgpO1xuXHRcdFx0fVxuXG5cblx0XHRcdHZhciB0YXJnZXQgPSBlLnRhcmdldCB8fCBlLnNyY0VsZW1lbnQsXG5cdFx0XHRcdHVpRWxlbWVudCxcblx0XHRcdFx0Y2xpY2tlZENsYXNzID0gdGFyZ2V0LmdldEF0dHJpYnV0ZSgnY2xhc3MnKSB8fCAnJyxcblx0XHRcdFx0Zm91bmQ7XG5cblx0XHRcdGZvcih2YXIgaSA9IDA7IGkgPCBfdWlFbGVtZW50cy5sZW5ndGg7IGkrKykge1xuXHRcdFx0XHR1aUVsZW1lbnQgPSBfdWlFbGVtZW50c1tpXTtcblx0XHRcdFx0aWYodWlFbGVtZW50Lm9uVGFwICYmIGNsaWNrZWRDbGFzcy5pbmRleE9mKCdwc3dwX18nICsgdWlFbGVtZW50Lm5hbWUgKSA+IC0xICkge1xuXHRcdFx0XHRcdHVpRWxlbWVudC5vblRhcCgpO1xuXHRcdFx0XHRcdGZvdW5kID0gdHJ1ZTtcblxuXHRcdFx0XHR9XG5cdFx0XHR9XG5cblx0XHRcdGlmKGZvdW5kKSB7XG5cdFx0XHRcdGlmKGUuc3RvcFByb3BhZ2F0aW9uKSB7XG5cdFx0XHRcdFx0ZS5zdG9wUHJvcGFnYXRpb24oKTtcblx0XHRcdFx0fVxuXHRcdFx0XHRfYmxvY2tDb250cm9sc1RhcCA9IHRydWU7XG5cblx0XHRcdFx0Ly8gU29tZSB2ZXJzaW9ucyBvZiBBbmRyb2lkIGRvbid0IHByZXZlbnQgZ2hvc3QgY2xpY2sgZXZlbnQgXG5cdFx0XHRcdC8vIHdoZW4gcHJldmVudERlZmF1bHQoKSB3YXMgY2FsbGVkIG9uIHRvdWNoc3RhcnQgYW5kL29yIHRvdWNoZW5kLlxuXHRcdFx0XHQvLyBcblx0XHRcdFx0Ly8gVGhpcyBoYXBwZW5zIG9uIHY0LjMsIDQuMiwgNC4xLCBcblx0XHRcdFx0Ly8gb2xkZXIgdmVyc2lvbnMgc3RyYW5nZWx5IHdvcmsgY29ycmVjdGx5LCBcblx0XHRcdFx0Ly8gYnV0IGp1c3QgaW4gY2FzZSB3ZSBhZGQgZGVsYXkgb24gYWxsIG9mIHRoZW0pXHRcblx0XHRcdFx0dmFyIHRhcERlbGF5ID0gZnJhbWV3b3JrLmZlYXR1cmVzLmlzT2xkQW5kcm9pZCA/IDYwMCA6IDMwO1xuXHRcdFx0XHRfYmxvY2tDb250cm9sc1RhcFRpbWVvdXQgPSBzZXRUaW1lb3V0KGZ1bmN0aW9uKCkge1xuXHRcdFx0XHRcdF9ibG9ja0NvbnRyb2xzVGFwID0gZmFsc2U7XG5cdFx0XHRcdH0sIHRhcERlbGF5KTtcblx0XHRcdH1cblxuXHRcdH0sXG5cdFx0X2ZpdENvbnRyb2xzSW5WaWV3cG9ydCA9IGZ1bmN0aW9uKCkge1xuXHRcdFx0cmV0dXJuICFwc3dwLmxpa2VseVRvdWNoRGV2aWNlIHx8IF9vcHRpb25zLm1vdXNlVXNlZCB8fCBzY3JlZW4ud2lkdGggPiBfb3B0aW9ucy5maXRDb250cm9sc1dpZHRoO1xuXHRcdH0sXG5cdFx0X3RvZ2dsZVBzd3BDbGFzcyA9IGZ1bmN0aW9uKGVsLCBjTmFtZSwgYWRkKSB7XG5cdFx0XHRmcmFtZXdvcmtbIChhZGQgPyAnYWRkJyA6ICdyZW1vdmUnKSArICdDbGFzcycgXShlbCwgJ3Bzd3BfXycgKyBjTmFtZSk7XG5cdFx0fSxcblxuXHRcdC8vIGFkZCBjbGFzcyB3aGVuIHRoZXJlIGlzIGp1c3Qgb25lIGl0ZW0gaW4gdGhlIGdhbGxlcnlcblx0XHQvLyAoYnkgZGVmYXVsdCBpdCBoaWRlcyBsZWZ0L3JpZ2h0IGFycm93cyBhbmQgMW9mWCBjb3VudGVyKVxuXHRcdF9jb3VudE51bUl0ZW1zID0gZnVuY3Rpb24oKSB7XG5cdFx0XHR2YXIgaGFzT25lU2xpZGUgPSAoX29wdGlvbnMuZ2V0TnVtSXRlbXNGbigpID09PSAxKTtcblxuXHRcdFx0aWYoaGFzT25lU2xpZGUgIT09IF9nYWxsZXJ5SGFzT25lU2xpZGUpIHtcblx0XHRcdFx0X3RvZ2dsZVBzd3BDbGFzcyhfY29udHJvbHMsICd1aS0tb25lLXNsaWRlJywgaGFzT25lU2xpZGUpO1xuXHRcdFx0XHRfZ2FsbGVyeUhhc09uZVNsaWRlID0gaGFzT25lU2xpZGU7XG5cdFx0XHR9XG5cdFx0fSxcblx0XHRfdG9nZ2xlU2hhcmVNb2RhbENsYXNzID0gZnVuY3Rpb24oKSB7XG5cdFx0XHRfdG9nZ2xlUHN3cENsYXNzKF9zaGFyZU1vZGFsLCAnc2hhcmUtbW9kYWwtLWhpZGRlbicsIF9zaGFyZU1vZGFsSGlkZGVuKTtcblx0XHR9LFxuXHRcdF90b2dnbGVTaGFyZU1vZGFsID0gZnVuY3Rpb24oKSB7XG5cblx0XHRcdF9zaGFyZU1vZGFsSGlkZGVuID0gIV9zaGFyZU1vZGFsSGlkZGVuO1xuXHRcdFx0XG5cdFx0XHRcblx0XHRcdGlmKCFfc2hhcmVNb2RhbEhpZGRlbikge1xuXHRcdFx0XHRfdG9nZ2xlU2hhcmVNb2RhbENsYXNzKCk7XG5cdFx0XHRcdHNldFRpbWVvdXQoZnVuY3Rpb24oKSB7XG5cdFx0XHRcdFx0aWYoIV9zaGFyZU1vZGFsSGlkZGVuKSB7XG5cdFx0XHRcdFx0XHRmcmFtZXdvcmsuYWRkQ2xhc3MoX3NoYXJlTW9kYWwsICdwc3dwX19zaGFyZS1tb2RhbC0tZmFkZS1pbicpO1xuXHRcdFx0XHRcdH1cblx0XHRcdFx0fSwgMzApO1xuXHRcdFx0fSBlbHNlIHtcblx0XHRcdFx0ZnJhbWV3b3JrLnJlbW92ZUNsYXNzKF9zaGFyZU1vZGFsLCAncHN3cF9fc2hhcmUtbW9kYWwtLWZhZGUtaW4nKTtcblx0XHRcdFx0c2V0VGltZW91dChmdW5jdGlvbigpIHtcblx0XHRcdFx0XHRpZihfc2hhcmVNb2RhbEhpZGRlbikge1xuXHRcdFx0XHRcdFx0X3RvZ2dsZVNoYXJlTW9kYWxDbGFzcygpO1xuXHRcdFx0XHRcdH1cblx0XHRcdFx0fSwgMzAwKTtcblx0XHRcdH1cblx0XHRcdFxuXHRcdFx0aWYoIV9zaGFyZU1vZGFsSGlkZGVuKSB7XG5cdFx0XHRcdF91cGRhdGVTaGFyZVVSTHMoKTtcblx0XHRcdH1cblx0XHRcdHJldHVybiBmYWxzZTtcblx0XHR9LFxuXG5cdFx0X29wZW5XaW5kb3dQb3B1cCA9IGZ1bmN0aW9uKGUpIHtcblx0XHRcdGUgPSBlIHx8IHdpbmRvdy5ldmVudDtcblx0XHRcdHZhciB0YXJnZXQgPSBlLnRhcmdldCB8fCBlLnNyY0VsZW1lbnQ7XG5cblx0XHRcdHBzd3Auc2hvdXQoJ3NoYXJlTGlua0NsaWNrJywgZSwgdGFyZ2V0KTtcblxuXHRcdFx0aWYoIXRhcmdldC5ocmVmKSB7XG5cdFx0XHRcdHJldHVybiBmYWxzZTtcblx0XHRcdH1cblxuXHRcdFx0aWYoIHRhcmdldC5oYXNBdHRyaWJ1dGUoJ2Rvd25sb2FkJykgKSB7XG5cdFx0XHRcdHJldHVybiB0cnVlO1xuXHRcdFx0fVxuXG5cdFx0XHR3aW5kb3cub3Blbih0YXJnZXQuaHJlZiwgJ3Bzd3Bfc2hhcmUnLCAnc2Nyb2xsYmFycz15ZXMscmVzaXphYmxlPXllcyx0b29sYmFyPW5vLCcrXG5cdFx0XHRcdFx0XHRcdFx0XHRcdCdsb2NhdGlvbj15ZXMsd2lkdGg9NTUwLGhlaWdodD00MjAsdG9wPTEwMCxsZWZ0PScgKyBcblx0XHRcdFx0XHRcdFx0XHRcdFx0KHdpbmRvdy5zY3JlZW4gPyBNYXRoLnJvdW5kKHNjcmVlbi53aWR0aCAvIDIgLSAyNzUpIDogMTAwKSAgKTtcblxuXHRcdFx0aWYoIV9zaGFyZU1vZGFsSGlkZGVuKSB7XG5cdFx0XHRcdF90b2dnbGVTaGFyZU1vZGFsKCk7XG5cdFx0XHR9XG5cdFx0XHRcblx0XHRcdHJldHVybiBmYWxzZTtcblx0XHR9LFxuXHRcdF91cGRhdGVTaGFyZVVSTHMgPSBmdW5jdGlvbigpIHtcblx0XHRcdHZhciBzaGFyZUJ1dHRvbk91dCA9ICcnLFxuXHRcdFx0XHRzaGFyZUJ1dHRvbkRhdGEsXG5cdFx0XHRcdHNoYXJlVVJMLFxuXHRcdFx0XHRpbWFnZV91cmwsXG5cdFx0XHRcdHBhZ2VfdXJsLFxuXHRcdFx0XHRzaGFyZV90ZXh0O1xuXG5cdFx0XHRmb3IodmFyIGkgPSAwOyBpIDwgX29wdGlvbnMuc2hhcmVCdXR0b25zLmxlbmd0aDsgaSsrKSB7XG5cdFx0XHRcdHNoYXJlQnV0dG9uRGF0YSA9IF9vcHRpb25zLnNoYXJlQnV0dG9uc1tpXTtcblxuXHRcdFx0XHRpbWFnZV91cmwgPSBfb3B0aW9ucy5nZXRJbWFnZVVSTEZvclNoYXJlKHNoYXJlQnV0dG9uRGF0YSk7XG5cdFx0XHRcdHBhZ2VfdXJsID0gX29wdGlvbnMuZ2V0UGFnZVVSTEZvclNoYXJlKHNoYXJlQnV0dG9uRGF0YSk7XG5cdFx0XHRcdHNoYXJlX3RleHQgPSBfb3B0aW9ucy5nZXRUZXh0Rm9yU2hhcmUoc2hhcmVCdXR0b25EYXRhKTtcblxuXHRcdFx0XHRzaGFyZVVSTCA9IHNoYXJlQnV0dG9uRGF0YS51cmwucmVwbGFjZSgne3t1cmx9fScsIGVuY29kZVVSSUNvbXBvbmVudChwYWdlX3VybCkgKVxuXHRcdFx0XHRcdFx0XHRcdFx0LnJlcGxhY2UoJ3t7aW1hZ2VfdXJsfX0nLCBlbmNvZGVVUklDb21wb25lbnQoaW1hZ2VfdXJsKSApXG5cdFx0XHRcdFx0XHRcdFx0XHQucmVwbGFjZSgne3tyYXdfaW1hZ2VfdXJsfX0nLCBpbWFnZV91cmwgKVxuXHRcdFx0XHRcdFx0XHRcdFx0LnJlcGxhY2UoJ3t7dGV4dH19JywgZW5jb2RlVVJJQ29tcG9uZW50KHNoYXJlX3RleHQpICk7XG5cblx0XHRcdFx0c2hhcmVCdXR0b25PdXQgKz0gJzxhIGhyZWY9XCInICsgc2hhcmVVUkwgKyAnXCIgdGFyZ2V0PVwiX2JsYW5rXCIgJytcblx0XHRcdFx0XHRcdFx0XHRcdCdjbGFzcz1cInBzd3BfX3NoYXJlLS0nICsgc2hhcmVCdXR0b25EYXRhLmlkICsgJ1wiJyArXG5cdFx0XHRcdFx0XHRcdFx0XHQoc2hhcmVCdXR0b25EYXRhLmRvd25sb2FkID8gJ2Rvd25sb2FkJyA6ICcnKSArICc+JyArIFxuXHRcdFx0XHRcdFx0XHRcdFx0c2hhcmVCdXR0b25EYXRhLmxhYmVsICsgJzwvYT4nO1xuXG5cdFx0XHRcdGlmKF9vcHRpb25zLnBhcnNlU2hhcmVCdXR0b25PdXQpIHtcblx0XHRcdFx0XHRzaGFyZUJ1dHRvbk91dCA9IF9vcHRpb25zLnBhcnNlU2hhcmVCdXR0b25PdXQoc2hhcmVCdXR0b25EYXRhLCBzaGFyZUJ1dHRvbk91dCk7XG5cdFx0XHRcdH1cblx0XHRcdH1cblx0XHRcdF9zaGFyZU1vZGFsLmNoaWxkcmVuWzBdLmlubmVySFRNTCA9IHNoYXJlQnV0dG9uT3V0O1xuXHRcdFx0X3NoYXJlTW9kYWwuY2hpbGRyZW5bMF0ub25jbGljayA9IF9vcGVuV2luZG93UG9wdXA7XG5cblx0XHR9LFxuXHRcdF9oYXNDbG9zZUNsYXNzID0gZnVuY3Rpb24odGFyZ2V0KSB7XG5cdFx0XHRmb3IodmFyICBpID0gMDsgaSA8IF9vcHRpb25zLmNsb3NlRWxDbGFzc2VzLmxlbmd0aDsgaSsrKSB7XG5cdFx0XHRcdGlmKCBmcmFtZXdvcmsuaGFzQ2xhc3ModGFyZ2V0LCAncHN3cF9fJyArIF9vcHRpb25zLmNsb3NlRWxDbGFzc2VzW2ldKSApIHtcblx0XHRcdFx0XHRyZXR1cm4gdHJ1ZTtcblx0XHRcdFx0fVxuXHRcdFx0fVxuXHRcdH0sXG5cdFx0X2lkbGVJbnRlcnZhbCxcblx0XHRfaWRsZVRpbWVyLFxuXHRcdF9pZGxlSW5jcmVtZW50ID0gMCxcblx0XHRfb25JZGxlTW91c2VNb3ZlID0gZnVuY3Rpb24oKSB7XG5cdFx0XHRjbGVhclRpbWVvdXQoX2lkbGVUaW1lcik7XG5cdFx0XHRfaWRsZUluY3JlbWVudCA9IDA7XG5cdFx0XHRpZihfaXNJZGxlKSB7XG5cdFx0XHRcdHVpLnNldElkbGUoZmFsc2UpO1xuXHRcdFx0fVxuXHRcdH0sXG5cdFx0X29uTW91c2VMZWF2ZVdpbmRvdyA9IGZ1bmN0aW9uKGUpIHtcblx0XHRcdGUgPSBlID8gZSA6IHdpbmRvdy5ldmVudDtcblx0XHRcdHZhciBmcm9tID0gZS5yZWxhdGVkVGFyZ2V0IHx8IGUudG9FbGVtZW50O1xuXHRcdFx0aWYgKCFmcm9tIHx8IGZyb20ubm9kZU5hbWUgPT09ICdIVE1MJykge1xuXHRcdFx0XHRjbGVhclRpbWVvdXQoX2lkbGVUaW1lcik7XG5cdFx0XHRcdF9pZGxlVGltZXIgPSBzZXRUaW1lb3V0KGZ1bmN0aW9uKCkge1xuXHRcdFx0XHRcdHVpLnNldElkbGUodHJ1ZSk7XG5cdFx0XHRcdH0sIF9vcHRpb25zLnRpbWVUb0lkbGVPdXRzaWRlKTtcblx0XHRcdH1cblx0XHR9LFxuXHRcdF9zZXR1cEZ1bGxzY3JlZW5BUEkgPSBmdW5jdGlvbigpIHtcblx0XHRcdGlmKF9vcHRpb25zLmZ1bGxzY3JlZW5FbCAmJiAhZnJhbWV3b3JrLmZlYXR1cmVzLmlzT2xkQW5kcm9pZCkge1xuXHRcdFx0XHRpZighX2Z1bGxzY3JlbkFQSSkge1xuXHRcdFx0XHRcdF9mdWxsc2NyZW5BUEkgPSB1aS5nZXRGdWxsc2NyZWVuQVBJKCk7XG5cdFx0XHRcdH1cblx0XHRcdFx0aWYoX2Z1bGxzY3JlbkFQSSkge1xuXHRcdFx0XHRcdGZyYW1ld29yay5iaW5kKGRvY3VtZW50LCBfZnVsbHNjcmVuQVBJLmV2ZW50SywgdWkudXBkYXRlRnVsbHNjcmVlbik7XG5cdFx0XHRcdFx0dWkudXBkYXRlRnVsbHNjcmVlbigpO1xuXHRcdFx0XHRcdGZyYW1ld29yay5hZGRDbGFzcyhwc3dwLnRlbXBsYXRlLCAncHN3cC0tc3VwcG9ydHMtZnMnKTtcblx0XHRcdFx0fSBlbHNlIHtcblx0XHRcdFx0XHRmcmFtZXdvcmsucmVtb3ZlQ2xhc3MocHN3cC50ZW1wbGF0ZSwgJ3Bzd3AtLXN1cHBvcnRzLWZzJyk7XG5cdFx0XHRcdH1cblx0XHRcdH1cblx0XHR9LFxuXHRcdF9zZXR1cExvYWRpbmdJbmRpY2F0b3IgPSBmdW5jdGlvbigpIHtcblx0XHRcdC8vIFNldHVwIGxvYWRpbmcgaW5kaWNhdG9yXG5cdFx0XHRpZihfb3B0aW9ucy5wcmVsb2FkZXJFbCkge1xuXHRcdFx0XG5cdFx0XHRcdF90b2dnbGVMb2FkaW5nSW5kaWNhdG9yKHRydWUpO1xuXG5cdFx0XHRcdF9saXN0ZW4oJ2JlZm9yZUNoYW5nZScsIGZ1bmN0aW9uKCkge1xuXG5cdFx0XHRcdFx0Y2xlYXJUaW1lb3V0KF9sb2FkaW5nSW5kaWNhdG9yVGltZW91dCk7XG5cblx0XHRcdFx0XHQvLyBkaXNwbGF5IGxvYWRpbmcgaW5kaWNhdG9yIHdpdGggZGVsYXlcblx0XHRcdFx0XHRfbG9hZGluZ0luZGljYXRvclRpbWVvdXQgPSBzZXRUaW1lb3V0KGZ1bmN0aW9uKCkge1xuXG5cdFx0XHRcdFx0XHRpZihwc3dwLmN1cnJJdGVtICYmIHBzd3AuY3Vyckl0ZW0ubG9hZGluZykge1xuXG5cdFx0XHRcdFx0XHRcdGlmKCAhcHN3cC5hbGxvd1Byb2dyZXNzaXZlSW1nKCkgfHwgKHBzd3AuY3Vyckl0ZW0uaW1nICYmICFwc3dwLmN1cnJJdGVtLmltZy5uYXR1cmFsV2lkdGgpICApIHtcblx0XHRcdFx0XHRcdFx0XHQvLyBzaG93IHByZWxvYWRlciBpZiBwcm9ncmVzc2l2ZSBsb2FkaW5nIGlzIG5vdCBlbmFibGVkLCBcblx0XHRcdFx0XHRcdFx0XHQvLyBvciBpbWFnZSB3aWR0aCBpcyBub3QgZGVmaW5lZCB5ZXQgKGJlY2F1c2Ugb2Ygc2xvdyBjb25uZWN0aW9uKVxuXHRcdFx0XHRcdFx0XHRcdF90b2dnbGVMb2FkaW5nSW5kaWNhdG9yKGZhbHNlKTsgXG5cdFx0XHRcdFx0XHRcdFx0Ly8gaXRlbXMtY29udHJvbGxlci5qcyBmdW5jdGlvbiBhbGxvd1Byb2dyZXNzaXZlSW1nXG5cdFx0XHRcdFx0XHRcdH1cblx0XHRcdFx0XHRcdFx0XG5cdFx0XHRcdFx0XHR9IGVsc2Uge1xuXHRcdFx0XHRcdFx0XHRfdG9nZ2xlTG9hZGluZ0luZGljYXRvcih0cnVlKTsgLy8gaGlkZSBwcmVsb2FkZXJcblx0XHRcdFx0XHRcdH1cblxuXHRcdFx0XHRcdH0sIF9vcHRpb25zLmxvYWRpbmdJbmRpY2F0b3JEZWxheSk7XG5cdFx0XHRcdFx0XG5cdFx0XHRcdH0pO1xuXHRcdFx0XHRfbGlzdGVuKCdpbWFnZUxvYWRDb21wbGV0ZScsIGZ1bmN0aW9uKGluZGV4LCBpdGVtKSB7XG5cdFx0XHRcdFx0aWYocHN3cC5jdXJySXRlbSA9PT0gaXRlbSkge1xuXHRcdFx0XHRcdFx0X3RvZ2dsZUxvYWRpbmdJbmRpY2F0b3IodHJ1ZSk7XG5cdFx0XHRcdFx0fVxuXHRcdFx0XHR9KTtcblxuXHRcdFx0fVxuXHRcdH0sXG5cdFx0X3RvZ2dsZUxvYWRpbmdJbmRpY2F0b3IgPSBmdW5jdGlvbihoaWRlKSB7XG5cdFx0XHRpZiggX2xvYWRpbmdJbmRpY2F0b3JIaWRkZW4gIT09IGhpZGUgKSB7XG5cdFx0XHRcdF90b2dnbGVQc3dwQ2xhc3MoX2xvYWRpbmdJbmRpY2F0b3IsICdwcmVsb2FkZXItLWFjdGl2ZScsICFoaWRlKTtcblx0XHRcdFx0X2xvYWRpbmdJbmRpY2F0b3JIaWRkZW4gPSBoaWRlO1xuXHRcdFx0fVxuXHRcdH0sXG5cdFx0X2FwcGx5TmF2QmFyR2FwcyA9IGZ1bmN0aW9uKGl0ZW0pIHtcblx0XHRcdHZhciBnYXAgPSBpdGVtLnZHYXA7XG5cblx0XHRcdGlmKCBfZml0Q29udHJvbHNJblZpZXdwb3J0KCkgKSB7XG5cdFx0XHRcdFxuXHRcdFx0XHR2YXIgYmFycyA9IF9vcHRpb25zLmJhcnNTaXplOyBcblx0XHRcdFx0aWYoX29wdGlvbnMuY2FwdGlvbkVsICYmIGJhcnMuYm90dG9tID09PSAnYXV0bycpIHtcblx0XHRcdFx0XHRpZighX2Zha2VDYXB0aW9uQ29udGFpbmVyKSB7XG5cdFx0XHRcdFx0XHRfZmFrZUNhcHRpb25Db250YWluZXIgPSBmcmFtZXdvcmsuY3JlYXRlRWwoJ3Bzd3BfX2NhcHRpb24gcHN3cF9fY2FwdGlvbi0tZmFrZScpO1xuXHRcdFx0XHRcdFx0X2Zha2VDYXB0aW9uQ29udGFpbmVyLmFwcGVuZENoaWxkKCBmcmFtZXdvcmsuY3JlYXRlRWwoJ3Bzd3BfX2NhcHRpb25fX2NlbnRlcicpICk7XG5cdFx0XHRcdFx0XHRfY29udHJvbHMuaW5zZXJ0QmVmb3JlKF9mYWtlQ2FwdGlvbkNvbnRhaW5lciwgX2NhcHRpb25Db250YWluZXIpO1xuXHRcdFx0XHRcdFx0ZnJhbWV3b3JrLmFkZENsYXNzKF9jb250cm9scywgJ3Bzd3BfX3VpLS1maXQnKTtcblx0XHRcdFx0XHR9XG5cdFx0XHRcdFx0aWYoIF9vcHRpb25zLmFkZENhcHRpb25IVE1MRm4oaXRlbSwgX2Zha2VDYXB0aW9uQ29udGFpbmVyLCB0cnVlKSApIHtcblxuXHRcdFx0XHRcdFx0dmFyIGNhcHRpb25TaXplID0gX2Zha2VDYXB0aW9uQ29udGFpbmVyLmNsaWVudEhlaWdodDtcblx0XHRcdFx0XHRcdGdhcC5ib3R0b20gPSBwYXJzZUludChjYXB0aW9uU2l6ZSwxMCkgfHwgNDQ7XG5cdFx0XHRcdFx0fSBlbHNlIHtcblx0XHRcdFx0XHRcdGdhcC5ib3R0b20gPSBiYXJzLnRvcDsgLy8gaWYgbm8gY2FwdGlvbiwgc2V0IHNpemUgb2YgYm90dG9tIGdhcCB0byBzaXplIG9mIHRvcFxuXHRcdFx0XHRcdH1cblx0XHRcdFx0fSBlbHNlIHtcblx0XHRcdFx0XHRnYXAuYm90dG9tID0gYmFycy5ib3R0b20gPT09ICdhdXRvJyA/IDAgOiBiYXJzLmJvdHRvbTtcblx0XHRcdFx0fVxuXHRcdFx0XHRcblx0XHRcdFx0Ly8gaGVpZ2h0IG9mIHRvcCBiYXIgaXMgc3RhdGljLCBubyBuZWVkIHRvIGNhbGN1bGF0ZSBpdFxuXHRcdFx0XHRnYXAudG9wID0gYmFycy50b3A7XG5cdFx0XHR9IGVsc2Uge1xuXHRcdFx0XHRnYXAudG9wID0gZ2FwLmJvdHRvbSA9IDA7XG5cdFx0XHR9XG5cdFx0fSxcblx0XHRfc2V0dXBJZGxlID0gZnVuY3Rpb24oKSB7XG5cdFx0XHQvLyBIaWRlIGNvbnRyb2xzIHdoZW4gbW91c2UgaXMgdXNlZFxuXHRcdFx0aWYoX29wdGlvbnMudGltZVRvSWRsZSkge1xuXHRcdFx0XHRfbGlzdGVuKCdtb3VzZVVzZWQnLCBmdW5jdGlvbigpIHtcblx0XHRcdFx0XHRcblx0XHRcdFx0XHRmcmFtZXdvcmsuYmluZChkb2N1bWVudCwgJ21vdXNlbW92ZScsIF9vbklkbGVNb3VzZU1vdmUpO1xuXHRcdFx0XHRcdGZyYW1ld29yay5iaW5kKGRvY3VtZW50LCAnbW91c2VvdXQnLCBfb25Nb3VzZUxlYXZlV2luZG93KTtcblxuXHRcdFx0XHRcdF9pZGxlSW50ZXJ2YWwgPSBzZXRJbnRlcnZhbChmdW5jdGlvbigpIHtcblx0XHRcdFx0XHRcdF9pZGxlSW5jcmVtZW50Kys7XG5cdFx0XHRcdFx0XHRpZihfaWRsZUluY3JlbWVudCA9PT0gMikge1xuXHRcdFx0XHRcdFx0XHR1aS5zZXRJZGxlKHRydWUpO1xuXHRcdFx0XHRcdFx0fVxuXHRcdFx0XHRcdH0sIF9vcHRpb25zLnRpbWVUb0lkbGUgLyAyKTtcblx0XHRcdFx0fSk7XG5cdFx0XHR9XG5cdFx0fSxcblx0XHRfc2V0dXBIaWRpbmdDb250cm9sc0R1cmluZ0dlc3R1cmVzID0gZnVuY3Rpb24oKSB7XG5cblx0XHRcdC8vIEhpZGUgY29udHJvbHMgb24gdmVydGljYWwgZHJhZ1xuXHRcdFx0X2xpc3Rlbignb25WZXJ0aWNhbERyYWcnLCBmdW5jdGlvbihub3cpIHtcblx0XHRcdFx0aWYoX2NvbnRyb2xzVmlzaWJsZSAmJiBub3cgPCAwLjk1KSB7XG5cdFx0XHRcdFx0dWkuaGlkZUNvbnRyb2xzKCk7XG5cdFx0XHRcdH0gZWxzZSBpZighX2NvbnRyb2xzVmlzaWJsZSAmJiBub3cgPj0gMC45NSkge1xuXHRcdFx0XHRcdHVpLnNob3dDb250cm9scygpO1xuXHRcdFx0XHR9XG5cdFx0XHR9KTtcblxuXHRcdFx0Ly8gSGlkZSBjb250cm9scyB3aGVuIHBpbmNoaW5nIHRvIGNsb3NlXG5cdFx0XHR2YXIgcGluY2hDb250cm9sc0hpZGRlbjtcblx0XHRcdF9saXN0ZW4oJ29uUGluY2hDbG9zZScgLCBmdW5jdGlvbihub3cpIHtcblx0XHRcdFx0aWYoX2NvbnRyb2xzVmlzaWJsZSAmJiBub3cgPCAwLjkpIHtcblx0XHRcdFx0XHR1aS5oaWRlQ29udHJvbHMoKTtcblx0XHRcdFx0XHRwaW5jaENvbnRyb2xzSGlkZGVuID0gdHJ1ZTtcblx0XHRcdFx0fSBlbHNlIGlmKHBpbmNoQ29udHJvbHNIaWRkZW4gJiYgIV9jb250cm9sc1Zpc2libGUgJiYgbm93ID4gMC45KSB7XG5cdFx0XHRcdFx0dWkuc2hvd0NvbnRyb2xzKCk7XG5cdFx0XHRcdH1cblx0XHRcdH0pO1xuXG5cdFx0XHRfbGlzdGVuKCd6b29tR2VzdHVyZUVuZGVkJywgZnVuY3Rpb24oKSB7XG5cdFx0XHRcdHBpbmNoQ29udHJvbHNIaWRkZW4gPSBmYWxzZTtcblx0XHRcdFx0aWYocGluY2hDb250cm9sc0hpZGRlbiAmJiAhX2NvbnRyb2xzVmlzaWJsZSkge1xuXHRcdFx0XHRcdHVpLnNob3dDb250cm9scygpO1xuXHRcdFx0XHR9XG5cdFx0XHR9KTtcblxuXHRcdH07XG5cblxuXG5cdHZhciBfdWlFbGVtZW50cyA9IFtcblx0XHR7IFxuXHRcdFx0bmFtZTogJ2NhcHRpb24nLCBcblx0XHRcdG9wdGlvbjogJ2NhcHRpb25FbCcsXG5cdFx0XHRvbkluaXQ6IGZ1bmN0aW9uKGVsKSB7ICBcblx0XHRcdFx0X2NhcHRpb25Db250YWluZXIgPSBlbDsgXG5cdFx0XHR9IFxuXHRcdH0sXG5cdFx0eyBcblx0XHRcdG5hbWU6ICdzaGFyZS1tb2RhbCcsIFxuXHRcdFx0b3B0aW9uOiAnc2hhcmVFbCcsXG5cdFx0XHRvbkluaXQ6IGZ1bmN0aW9uKGVsKSB7ICBcblx0XHRcdFx0X3NoYXJlTW9kYWwgPSBlbDtcblx0XHRcdH0sXG5cdFx0XHRvblRhcDogZnVuY3Rpb24oKSB7XG5cdFx0XHRcdF90b2dnbGVTaGFyZU1vZGFsKCk7XG5cdFx0XHR9IFxuXHRcdH0sXG5cdFx0eyBcblx0XHRcdG5hbWU6ICdidXR0b24tLXNoYXJlJywgXG5cdFx0XHRvcHRpb246ICdzaGFyZUVsJyxcblx0XHRcdG9uSW5pdDogZnVuY3Rpb24oZWwpIHsgXG5cdFx0XHRcdF9zaGFyZUJ1dHRvbiA9IGVsO1xuXHRcdFx0fSxcblx0XHRcdG9uVGFwOiBmdW5jdGlvbigpIHtcblx0XHRcdFx0X3RvZ2dsZVNoYXJlTW9kYWwoKTtcblx0XHRcdH0gXG5cdFx0fSxcblx0XHR7IFxuXHRcdFx0bmFtZTogJ2J1dHRvbi0tem9vbScsIFxuXHRcdFx0b3B0aW9uOiAnem9vbUVsJyxcblx0XHRcdG9uVGFwOiBwc3dwLnRvZ2dsZURlc2t0b3Bab29tXG5cdFx0fSxcblx0XHR7IFxuXHRcdFx0bmFtZTogJ2NvdW50ZXInLCBcblx0XHRcdG9wdGlvbjogJ2NvdW50ZXJFbCcsXG5cdFx0XHRvbkluaXQ6IGZ1bmN0aW9uKGVsKSB7ICBcblx0XHRcdFx0X2luZGV4SW5kaWNhdG9yID0gZWw7XG5cdFx0XHR9IFxuXHRcdH0sXG5cdFx0eyBcblx0XHRcdG5hbWU6ICdidXR0b24tLWNsb3NlJywgXG5cdFx0XHRvcHRpb246ICdjbG9zZUVsJyxcblx0XHRcdG9uVGFwOiBwc3dwLmNsb3NlXG5cdFx0fSxcblx0XHR7IFxuXHRcdFx0bmFtZTogJ2J1dHRvbi0tYXJyb3ctLWxlZnQnLCBcblx0XHRcdG9wdGlvbjogJ2Fycm93RWwnLFxuXHRcdFx0b25UYXA6IHBzd3AucHJldlxuXHRcdH0sXG5cdFx0eyBcblx0XHRcdG5hbWU6ICdidXR0b24tLWFycm93LS1yaWdodCcsIFxuXHRcdFx0b3B0aW9uOiAnYXJyb3dFbCcsXG5cdFx0XHRvblRhcDogcHN3cC5uZXh0XG5cdFx0fSxcblx0XHR7IFxuXHRcdFx0bmFtZTogJ2J1dHRvbi0tZnMnLCBcblx0XHRcdG9wdGlvbjogJ2Z1bGxzY3JlZW5FbCcsXG5cdFx0XHRvblRhcDogZnVuY3Rpb24oKSB7ICBcblx0XHRcdFx0aWYoX2Z1bGxzY3JlbkFQSS5pc0Z1bGxzY3JlZW4oKSkge1xuXHRcdFx0XHRcdF9mdWxsc2NyZW5BUEkuZXhpdCgpO1xuXHRcdFx0XHR9IGVsc2Uge1xuXHRcdFx0XHRcdF9mdWxsc2NyZW5BUEkuZW50ZXIoKTtcblx0XHRcdFx0fVxuXHRcdFx0fSBcblx0XHR9LFxuXHRcdHsgXG5cdFx0XHRuYW1lOiAncHJlbG9hZGVyJywgXG5cdFx0XHRvcHRpb246ICdwcmVsb2FkZXJFbCcsXG5cdFx0XHRvbkluaXQ6IGZ1bmN0aW9uKGVsKSB7ICBcblx0XHRcdFx0X2xvYWRpbmdJbmRpY2F0b3IgPSBlbDtcblx0XHRcdH0gXG5cdFx0fVxuXG5cdF07XG5cblx0dmFyIF9zZXR1cFVJRWxlbWVudHMgPSBmdW5jdGlvbigpIHtcblx0XHR2YXIgaXRlbSxcblx0XHRcdGNsYXNzQXR0cixcblx0XHRcdHVpRWxlbWVudDtcblxuXHRcdHZhciBsb29wVGhyb3VnaENoaWxkRWxlbWVudHMgPSBmdW5jdGlvbihzQ2hpbGRyZW4pIHtcblx0XHRcdGlmKCFzQ2hpbGRyZW4pIHtcblx0XHRcdFx0cmV0dXJuO1xuXHRcdFx0fVxuXG5cdFx0XHR2YXIgbCA9IHNDaGlsZHJlbi5sZW5ndGg7XG5cdFx0XHRmb3IodmFyIGkgPSAwOyBpIDwgbDsgaSsrKSB7XG5cdFx0XHRcdGl0ZW0gPSBzQ2hpbGRyZW5baV07XG5cdFx0XHRcdGNsYXNzQXR0ciA9IGl0ZW0uY2xhc3NOYW1lO1xuXG5cdFx0XHRcdGZvcih2YXIgYSA9IDA7IGEgPCBfdWlFbGVtZW50cy5sZW5ndGg7IGErKykge1xuXHRcdFx0XHRcdHVpRWxlbWVudCA9IF91aUVsZW1lbnRzW2FdO1xuXG5cdFx0XHRcdFx0aWYoY2xhc3NBdHRyLmluZGV4T2YoJ3Bzd3BfXycgKyB1aUVsZW1lbnQubmFtZSkgPiAtMSAgKSB7XG5cblx0XHRcdFx0XHRcdGlmKCBfb3B0aW9uc1t1aUVsZW1lbnQub3B0aW9uXSApIHsgLy8gaWYgZWxlbWVudCBpcyBub3QgZGlzYWJsZWQgZnJvbSBvcHRpb25zXG5cdFx0XHRcdFx0XHRcdFxuXHRcdFx0XHRcdFx0XHRmcmFtZXdvcmsucmVtb3ZlQ2xhc3MoaXRlbSwgJ3Bzd3BfX2VsZW1lbnQtLWRpc2FibGVkJyk7XG5cdFx0XHRcdFx0XHRcdGlmKHVpRWxlbWVudC5vbkluaXQpIHtcblx0XHRcdFx0XHRcdFx0XHR1aUVsZW1lbnQub25Jbml0KGl0ZW0pO1xuXHRcdFx0XHRcdFx0XHR9XG5cdFx0XHRcdFx0XHRcdFxuXHRcdFx0XHRcdFx0XHQvL2l0ZW0uc3R5bGUuZGlzcGxheSA9ICdibG9jayc7XG5cdFx0XHRcdFx0XHR9IGVsc2Uge1xuXHRcdFx0XHRcdFx0XHRmcmFtZXdvcmsuYWRkQ2xhc3MoaXRlbSwgJ3Bzd3BfX2VsZW1lbnQtLWRpc2FibGVkJyk7XG5cdFx0XHRcdFx0XHRcdC8vaXRlbS5zdHlsZS5kaXNwbGF5ID0gJ25vbmUnO1xuXHRcdFx0XHRcdFx0fVxuXHRcdFx0XHRcdH1cblx0XHRcdFx0fVxuXHRcdFx0fVxuXHRcdH07XG5cdFx0bG9vcFRocm91Z2hDaGlsZEVsZW1lbnRzKF9jb250cm9scy5jaGlsZHJlbik7XG5cblx0XHR2YXIgdG9wQmFyID0gIGZyYW1ld29yay5nZXRDaGlsZEJ5Q2xhc3MoX2NvbnRyb2xzLCAncHN3cF9fdG9wLWJhcicpO1xuXHRcdGlmKHRvcEJhcikge1xuXHRcdFx0bG9vcFRocm91Z2hDaGlsZEVsZW1lbnRzKCB0b3BCYXIuY2hpbGRyZW4gKTtcblx0XHR9XG5cdH07XG5cblxuXHRcblxuXHR1aS5pbml0ID0gZnVuY3Rpb24oKSB7XG5cblx0XHQvLyBleHRlbmQgb3B0aW9uc1xuXHRcdGZyYW1ld29yay5leHRlbmQocHN3cC5vcHRpb25zLCBfZGVmYXVsdFVJT3B0aW9ucywgdHJ1ZSk7XG5cblx0XHQvLyBjcmVhdGUgbG9jYWwgbGluayBmb3IgZmFzdCBhY2Nlc3Ncblx0XHRfb3B0aW9ucyA9IHBzd3Aub3B0aW9ucztcblxuXHRcdC8vIGZpbmQgcHN3cF9fdWkgZWxlbWVudFxuXHRcdF9jb250cm9scyA9IGZyYW1ld29yay5nZXRDaGlsZEJ5Q2xhc3MocHN3cC5zY3JvbGxXcmFwLCAncHN3cF9fdWknKTtcblxuXHRcdC8vIGNyZWF0ZSBsb2NhbCBsaW5rXG5cdFx0X2xpc3RlbiA9IHBzd3AubGlzdGVuO1xuXG5cblx0XHRfc2V0dXBIaWRpbmdDb250cm9sc0R1cmluZ0dlc3R1cmVzKCk7XG5cblx0XHQvLyB1cGRhdGUgY29udHJvbHMgd2hlbiBzbGlkZXMgY2hhbmdlXG5cdFx0X2xpc3RlbignYmVmb3JlQ2hhbmdlJywgdWkudXBkYXRlKTtcblxuXHRcdC8vIHRvZ2dsZSB6b29tIG9uIGRvdWJsZS10YXBcblx0XHRfbGlzdGVuKCdkb3VibGVUYXAnLCBmdW5jdGlvbihwb2ludCkge1xuXHRcdFx0dmFyIGluaXRpYWxab29tTGV2ZWwgPSBwc3dwLmN1cnJJdGVtLmluaXRpYWxab29tTGV2ZWw7XG5cdFx0XHRpZihwc3dwLmdldFpvb21MZXZlbCgpICE9PSBpbml0aWFsWm9vbUxldmVsKSB7XG5cdFx0XHRcdHBzd3Auem9vbVRvKGluaXRpYWxab29tTGV2ZWwsIHBvaW50LCAzMzMpO1xuXHRcdFx0fSBlbHNlIHtcblx0XHRcdFx0cHN3cC56b29tVG8oX29wdGlvbnMuZ2V0RG91YmxlVGFwWm9vbShmYWxzZSwgcHN3cC5jdXJySXRlbSksIHBvaW50LCAzMzMpO1xuXHRcdFx0fVxuXHRcdH0pO1xuXG5cdFx0Ly8gQWxsb3cgdGV4dCBzZWxlY3Rpb24gaW4gY2FwdGlvblxuXHRcdF9saXN0ZW4oJ3ByZXZlbnREcmFnRXZlbnQnLCBmdW5jdGlvbihlLCBpc0Rvd24sIHByZXZlbnRPYmopIHtcblx0XHRcdHZhciB0ID0gZS50YXJnZXQgfHwgZS5zcmNFbGVtZW50O1xuXHRcdFx0aWYoXG5cdFx0XHRcdHQgJiYgXG5cdFx0XHRcdHQuZ2V0QXR0cmlidXRlKCdjbGFzcycpICYmIGUudHlwZS5pbmRleE9mKCdtb3VzZScpID4gLTEgJiYgXG5cdFx0XHRcdCggdC5nZXRBdHRyaWJ1dGUoJ2NsYXNzJykuaW5kZXhPZignX19jYXB0aW9uJykgPiAwIHx8ICgvKFNNQUxMfFNUUk9OR3xFTSkvaSkudGVzdCh0LnRhZ05hbWUpICkgXG5cdFx0XHQpIHtcblx0XHRcdFx0cHJldmVudE9iai5wcmV2ZW50ID0gZmFsc2U7XG5cdFx0XHR9XG5cdFx0fSk7XG5cblx0XHQvLyBiaW5kIGV2ZW50cyBmb3IgVUlcblx0XHRfbGlzdGVuKCdiaW5kRXZlbnRzJywgZnVuY3Rpb24oKSB7XG5cdFx0XHRmcmFtZXdvcmsuYmluZChfY29udHJvbHMsICdwc3dwVGFwIGNsaWNrJywgX29uQ29udHJvbHNUYXApO1xuXHRcdFx0ZnJhbWV3b3JrLmJpbmQocHN3cC5zY3JvbGxXcmFwLCAncHN3cFRhcCcsIHVpLm9uR2xvYmFsVGFwKTtcblxuXHRcdFx0aWYoIXBzd3AubGlrZWx5VG91Y2hEZXZpY2UpIHtcblx0XHRcdFx0ZnJhbWV3b3JrLmJpbmQocHN3cC5zY3JvbGxXcmFwLCAnbW91c2VvdmVyJywgdWkub25Nb3VzZU92ZXIpO1xuXHRcdFx0fVxuXHRcdH0pO1xuXG5cdFx0Ly8gdW5iaW5kIGV2ZW50cyBmb3IgVUlcblx0XHRfbGlzdGVuKCd1bmJpbmRFdmVudHMnLCBmdW5jdGlvbigpIHtcblx0XHRcdGlmKCFfc2hhcmVNb2RhbEhpZGRlbikge1xuXHRcdFx0XHRfdG9nZ2xlU2hhcmVNb2RhbCgpO1xuXHRcdFx0fVxuXG5cdFx0XHRpZihfaWRsZUludGVydmFsKSB7XG5cdFx0XHRcdGNsZWFySW50ZXJ2YWwoX2lkbGVJbnRlcnZhbCk7XG5cdFx0XHR9XG5cdFx0XHRmcmFtZXdvcmsudW5iaW5kKGRvY3VtZW50LCAnbW91c2VvdXQnLCBfb25Nb3VzZUxlYXZlV2luZG93KTtcblx0XHRcdGZyYW1ld29yay51bmJpbmQoZG9jdW1lbnQsICdtb3VzZW1vdmUnLCBfb25JZGxlTW91c2VNb3ZlKTtcblx0XHRcdGZyYW1ld29yay51bmJpbmQoX2NvbnRyb2xzLCAncHN3cFRhcCBjbGljaycsIF9vbkNvbnRyb2xzVGFwKTtcblx0XHRcdGZyYW1ld29yay51bmJpbmQocHN3cC5zY3JvbGxXcmFwLCAncHN3cFRhcCcsIHVpLm9uR2xvYmFsVGFwKTtcblx0XHRcdGZyYW1ld29yay51bmJpbmQocHN3cC5zY3JvbGxXcmFwLCAnbW91c2VvdmVyJywgdWkub25Nb3VzZU92ZXIpO1xuXG5cdFx0XHRpZihfZnVsbHNjcmVuQVBJKSB7XG5cdFx0XHRcdGZyYW1ld29yay51bmJpbmQoZG9jdW1lbnQsIF9mdWxsc2NyZW5BUEkuZXZlbnRLLCB1aS51cGRhdGVGdWxsc2NyZWVuKTtcblx0XHRcdFx0aWYoX2Z1bGxzY3JlbkFQSS5pc0Z1bGxzY3JlZW4oKSkge1xuXHRcdFx0XHRcdF9vcHRpb25zLmhpZGVBbmltYXRpb25EdXJhdGlvbiA9IDA7XG5cdFx0XHRcdFx0X2Z1bGxzY3JlbkFQSS5leGl0KCk7XG5cdFx0XHRcdH1cblx0XHRcdFx0X2Z1bGxzY3JlbkFQSSA9IG51bGw7XG5cdFx0XHR9XG5cdFx0fSk7XG5cblxuXHRcdC8vIGNsZWFuIHVwIHRoaW5ncyB3aGVuIGdhbGxlcnkgaXMgZGVzdHJveWVkXG5cdFx0X2xpc3RlbignZGVzdHJveScsIGZ1bmN0aW9uKCkge1xuXHRcdFx0aWYoX29wdGlvbnMuY2FwdGlvbkVsKSB7XG5cdFx0XHRcdGlmKF9mYWtlQ2FwdGlvbkNvbnRhaW5lcikge1xuXHRcdFx0XHRcdF9jb250cm9scy5yZW1vdmVDaGlsZChfZmFrZUNhcHRpb25Db250YWluZXIpO1xuXHRcdFx0XHR9XG5cdFx0XHRcdGZyYW1ld29yay5yZW1vdmVDbGFzcyhfY2FwdGlvbkNvbnRhaW5lciwgJ3Bzd3BfX2NhcHRpb24tLWVtcHR5Jyk7XG5cdFx0XHR9XG5cblx0XHRcdGlmKF9zaGFyZU1vZGFsKSB7XG5cdFx0XHRcdF9zaGFyZU1vZGFsLmNoaWxkcmVuWzBdLm9uY2xpY2sgPSBudWxsO1xuXHRcdFx0fVxuXHRcdFx0ZnJhbWV3b3JrLnJlbW92ZUNsYXNzKF9jb250cm9scywgJ3Bzd3BfX3VpLS1vdmVyLWNsb3NlJyk7XG5cdFx0XHRmcmFtZXdvcmsuYWRkQ2xhc3MoIF9jb250cm9scywgJ3Bzd3BfX3VpLS1oaWRkZW4nKTtcblx0XHRcdHVpLnNldElkbGUoZmFsc2UpO1xuXHRcdH0pO1xuXHRcdFxuXG5cdFx0aWYoIV9vcHRpb25zLnNob3dBbmltYXRpb25EdXJhdGlvbikge1xuXHRcdFx0ZnJhbWV3b3JrLnJlbW92ZUNsYXNzKCBfY29udHJvbHMsICdwc3dwX191aS0taGlkZGVuJyk7XG5cdFx0fVxuXHRcdF9saXN0ZW4oJ2luaXRpYWxab29tSW4nLCBmdW5jdGlvbigpIHtcblx0XHRcdGlmKF9vcHRpb25zLnNob3dBbmltYXRpb25EdXJhdGlvbikge1xuXHRcdFx0XHRmcmFtZXdvcmsucmVtb3ZlQ2xhc3MoIF9jb250cm9scywgJ3Bzd3BfX3VpLS1oaWRkZW4nKTtcblx0XHRcdH1cblx0XHR9KTtcblx0XHRfbGlzdGVuKCdpbml0aWFsWm9vbU91dCcsIGZ1bmN0aW9uKCkge1xuXHRcdFx0ZnJhbWV3b3JrLmFkZENsYXNzKCBfY29udHJvbHMsICdwc3dwX191aS0taGlkZGVuJyk7XG5cdFx0fSk7XG5cblx0XHRfbGlzdGVuKCdwYXJzZVZlcnRpY2FsTWFyZ2luJywgX2FwcGx5TmF2QmFyR2Fwcyk7XG5cdFx0XG5cdFx0X3NldHVwVUlFbGVtZW50cygpO1xuXG5cdFx0aWYoX29wdGlvbnMuc2hhcmVFbCAmJiBfc2hhcmVCdXR0b24gJiYgX3NoYXJlTW9kYWwpIHtcblx0XHRcdF9zaGFyZU1vZGFsSGlkZGVuID0gdHJ1ZTtcblx0XHR9XG5cblx0XHRfY291bnROdW1JdGVtcygpO1xuXG5cdFx0X3NldHVwSWRsZSgpO1xuXG5cdFx0X3NldHVwRnVsbHNjcmVlbkFQSSgpO1xuXG5cdFx0X3NldHVwTG9hZGluZ0luZGljYXRvcigpO1xuXHR9O1xuXG5cdHVpLnNldElkbGUgPSBmdW5jdGlvbihpc0lkbGUpIHtcblx0XHRfaXNJZGxlID0gaXNJZGxlO1xuXHRcdF90b2dnbGVQc3dwQ2xhc3MoX2NvbnRyb2xzLCAndWktLWlkbGUnLCBpc0lkbGUpO1xuXHR9O1xuXG5cdHVpLnVwZGF0ZSA9IGZ1bmN0aW9uKCkge1xuXHRcdC8vIERvbid0IHVwZGF0ZSBVSSBpZiBpdCdzIGhpZGRlblxuXHRcdGlmKF9jb250cm9sc1Zpc2libGUgJiYgcHN3cC5jdXJySXRlbSkge1xuXHRcdFx0XG5cdFx0XHR1aS51cGRhdGVJbmRleEluZGljYXRvcigpO1xuXG5cdFx0XHRpZihfb3B0aW9ucy5jYXB0aW9uRWwpIHtcblx0XHRcdFx0X29wdGlvbnMuYWRkQ2FwdGlvbkhUTUxGbihwc3dwLmN1cnJJdGVtLCBfY2FwdGlvbkNvbnRhaW5lcik7XG5cblx0XHRcdFx0X3RvZ2dsZVBzd3BDbGFzcyhfY2FwdGlvbkNvbnRhaW5lciwgJ2NhcHRpb24tLWVtcHR5JywgIXBzd3AuY3Vyckl0ZW0udGl0bGUpO1xuXHRcdFx0fVxuXG5cdFx0XHRfb3ZlcmxheVVJVXBkYXRlZCA9IHRydWU7XG5cblx0XHR9IGVsc2Uge1xuXHRcdFx0X292ZXJsYXlVSVVwZGF0ZWQgPSBmYWxzZTtcblx0XHR9XG5cblx0XHRpZighX3NoYXJlTW9kYWxIaWRkZW4pIHtcblx0XHRcdF90b2dnbGVTaGFyZU1vZGFsKCk7XG5cdFx0fVxuXG5cdFx0X2NvdW50TnVtSXRlbXMoKTtcblx0fTtcblxuXHR1aS51cGRhdGVGdWxsc2NyZWVuID0gZnVuY3Rpb24oZSkge1xuXG5cdFx0aWYoZSkge1xuXHRcdFx0Ly8gc29tZSBicm93c2VycyBjaGFuZ2Ugd2luZG93IHNjcm9sbCBwb3NpdGlvbiBkdXJpbmcgdGhlIGZ1bGxzY3JlZW5cblx0XHRcdC8vIHNvIFBob3RvU3dpcGUgdXBkYXRlcyBpdCBqdXN0IGluIGNhc2Vcblx0XHRcdHNldFRpbWVvdXQoZnVuY3Rpb24oKSB7XG5cdFx0XHRcdHBzd3Auc2V0U2Nyb2xsT2Zmc2V0KCAwLCBmcmFtZXdvcmsuZ2V0U2Nyb2xsWSgpICk7XG5cdFx0XHR9LCA1MCk7XG5cdFx0fVxuXHRcdFxuXHRcdC8vIHRvb2dsZSBwc3dwLS1mcyBjbGFzcyBvbiByb290IGVsZW1lbnRcblx0XHRmcmFtZXdvcmtbIChfZnVsbHNjcmVuQVBJLmlzRnVsbHNjcmVlbigpID8gJ2FkZCcgOiAncmVtb3ZlJykgKyAnQ2xhc3MnIF0ocHN3cC50ZW1wbGF0ZSwgJ3Bzd3AtLWZzJyk7XG5cdH07XG5cblx0dWkudXBkYXRlSW5kZXhJbmRpY2F0b3IgPSBmdW5jdGlvbigpIHtcblx0XHRpZihfb3B0aW9ucy5jb3VudGVyRWwpIHtcblx0XHRcdF9pbmRleEluZGljYXRvci5pbm5lckhUTUwgPSAocHN3cC5nZXRDdXJyZW50SW5kZXgoKSsxKSArIFxuXHRcdFx0XHRcdFx0XHRcdFx0XHRfb3B0aW9ucy5pbmRleEluZGljYXRvclNlcCArIFxuXHRcdFx0XHRcdFx0XHRcdFx0XHRfb3B0aW9ucy5nZXROdW1JdGVtc0ZuKCk7XG5cdFx0fVxuXHR9O1xuXHRcblx0dWkub25HbG9iYWxUYXAgPSBmdW5jdGlvbihlKSB7XG5cdFx0ZSA9IGUgfHwgd2luZG93LmV2ZW50O1xuXHRcdHZhciB0YXJnZXQgPSBlLnRhcmdldCB8fCBlLnNyY0VsZW1lbnQ7XG5cblx0XHRpZihfYmxvY2tDb250cm9sc1RhcCkge1xuXHRcdFx0cmV0dXJuO1xuXHRcdH1cblxuXHRcdGlmKGUuZGV0YWlsICYmIGUuZGV0YWlsLnBvaW50ZXJUeXBlID09PSAnbW91c2UnKSB7XG5cblx0XHRcdC8vIGNsb3NlIGdhbGxlcnkgaWYgY2xpY2tlZCBvdXRzaWRlIG9mIHRoZSBpbWFnZVxuXHRcdFx0aWYoX2hhc0Nsb3NlQ2xhc3ModGFyZ2V0KSkge1xuXHRcdFx0XHRwc3dwLmNsb3NlKCk7XG5cdFx0XHRcdHJldHVybjtcblx0XHRcdH1cblxuXHRcdFx0aWYoZnJhbWV3b3JrLmhhc0NsYXNzKHRhcmdldCwgJ3Bzd3BfX2ltZycpKSB7XG5cdFx0XHRcdGlmKHBzd3AuZ2V0Wm9vbUxldmVsKCkgPT09IDEgJiYgcHN3cC5nZXRab29tTGV2ZWwoKSA8PSBwc3dwLmN1cnJJdGVtLmZpdFJhdGlvKSB7XG5cdFx0XHRcdFx0aWYoX29wdGlvbnMuY2xpY2tUb0Nsb3NlTm9uWm9vbWFibGUpIHtcblx0XHRcdFx0XHRcdHBzd3AuY2xvc2UoKTtcblx0XHRcdFx0XHR9XG5cdFx0XHRcdH0gZWxzZSB7XG5cdFx0XHRcdFx0cHN3cC50b2dnbGVEZXNrdG9wWm9vbShlLmRldGFpbC5yZWxlYXNlUG9pbnQpO1xuXHRcdFx0XHR9XG5cdFx0XHR9XG5cdFx0XHRcblx0XHR9IGVsc2Uge1xuXG5cdFx0XHQvLyB0YXAgYW55d2hlcmUgKGV4Y2VwdCBidXR0b25zKSB0byB0b2dnbGUgdmlzaWJpbGl0eSBvZiBjb250cm9sc1xuXHRcdFx0aWYoX29wdGlvbnMudGFwVG9Ub2dnbGVDb250cm9scykge1xuXHRcdFx0XHRpZihfY29udHJvbHNWaXNpYmxlKSB7XG5cdFx0XHRcdFx0dWkuaGlkZUNvbnRyb2xzKCk7XG5cdFx0XHRcdH0gZWxzZSB7XG5cdFx0XHRcdFx0dWkuc2hvd0NvbnRyb2xzKCk7XG5cdFx0XHRcdH1cblx0XHRcdH1cblxuXHRcdFx0Ly8gdGFwIHRvIGNsb3NlIGdhbGxlcnlcblx0XHRcdGlmKF9vcHRpb25zLnRhcFRvQ2xvc2UgJiYgKGZyYW1ld29yay5oYXNDbGFzcyh0YXJnZXQsICdwc3dwX19pbWcnKSB8fCBfaGFzQ2xvc2VDbGFzcyh0YXJnZXQpKSApIHtcblx0XHRcdFx0cHN3cC5jbG9zZSgpO1xuXHRcdFx0XHRyZXR1cm47XG5cdFx0XHR9XG5cdFx0XHRcblx0XHR9XG5cdH07XG5cdHVpLm9uTW91c2VPdmVyID0gZnVuY3Rpb24oZSkge1xuXHRcdGUgPSBlIHx8IHdpbmRvdy5ldmVudDtcblx0XHR2YXIgdGFyZ2V0ID0gZS50YXJnZXQgfHwgZS5zcmNFbGVtZW50O1xuXG5cdFx0Ly8gYWRkIGNsYXNzIHdoZW4gbW91c2UgaXMgb3ZlciBhbiBlbGVtZW50IHRoYXQgc2hvdWxkIGNsb3NlIHRoZSBnYWxsZXJ5XG5cdFx0X3RvZ2dsZVBzd3BDbGFzcyhfY29udHJvbHMsICd1aS0tb3Zlci1jbG9zZScsIF9oYXNDbG9zZUNsYXNzKHRhcmdldCkpO1xuXHR9O1xuXG5cdHVpLmhpZGVDb250cm9scyA9IGZ1bmN0aW9uKCkge1xuXHRcdGZyYW1ld29yay5hZGRDbGFzcyhfY29udHJvbHMsJ3Bzd3BfX3VpLS1oaWRkZW4nKTtcblx0XHRfY29udHJvbHNWaXNpYmxlID0gZmFsc2U7XG5cdH07XG5cblx0dWkuc2hvd0NvbnRyb2xzID0gZnVuY3Rpb24oKSB7XG5cdFx0X2NvbnRyb2xzVmlzaWJsZSA9IHRydWU7XG5cdFx0aWYoIV9vdmVybGF5VUlVcGRhdGVkKSB7XG5cdFx0XHR1aS51cGRhdGUoKTtcblx0XHR9XG5cdFx0ZnJhbWV3b3JrLnJlbW92ZUNsYXNzKF9jb250cm9scywncHN3cF9fdWktLWhpZGRlbicpO1xuXHR9O1xuXG5cdHVpLnN1cHBvcnRzRnVsbHNjcmVlbiA9IGZ1bmN0aW9uKCkge1xuXHRcdHZhciBkID0gZG9jdW1lbnQ7XG5cdFx0cmV0dXJuICEhKGQuZXhpdEZ1bGxzY3JlZW4gfHwgZC5tb3pDYW5jZWxGdWxsU2NyZWVuIHx8IGQud2Via2l0RXhpdEZ1bGxzY3JlZW4gfHwgZC5tc0V4aXRGdWxsc2NyZWVuKTtcblx0fTtcblxuXHR1aS5nZXRGdWxsc2NyZWVuQVBJID0gZnVuY3Rpb24oKSB7XG5cdFx0dmFyIGRFID0gZG9jdW1lbnQuZG9jdW1lbnRFbGVtZW50LFxuXHRcdFx0YXBpLFxuXHRcdFx0dEYgPSAnZnVsbHNjcmVlbmNoYW5nZSc7XG5cblx0XHRpZiAoZEUucmVxdWVzdEZ1bGxzY3JlZW4pIHtcblx0XHRcdGFwaSA9IHtcblx0XHRcdFx0ZW50ZXJLOiAncmVxdWVzdEZ1bGxzY3JlZW4nLFxuXHRcdFx0XHRleGl0SzogJ2V4aXRGdWxsc2NyZWVuJyxcblx0XHRcdFx0ZWxlbWVudEs6ICdmdWxsc2NyZWVuRWxlbWVudCcsXG5cdFx0XHRcdGV2ZW50SzogdEZcblx0XHRcdH07XG5cblx0XHR9IGVsc2UgaWYoZEUubW96UmVxdWVzdEZ1bGxTY3JlZW4gKSB7XG5cdFx0XHRhcGkgPSB7XG5cdFx0XHRcdGVudGVySzogJ21velJlcXVlc3RGdWxsU2NyZWVuJyxcblx0XHRcdFx0ZXhpdEs6ICdtb3pDYW5jZWxGdWxsU2NyZWVuJyxcblx0XHRcdFx0ZWxlbWVudEs6ICdtb3pGdWxsU2NyZWVuRWxlbWVudCcsXG5cdFx0XHRcdGV2ZW50SzogJ21veicgKyB0RlxuXHRcdFx0fTtcblxuXHRcdFx0XG5cblx0XHR9IGVsc2UgaWYoZEUud2Via2l0UmVxdWVzdEZ1bGxzY3JlZW4pIHtcblx0XHRcdGFwaSA9IHtcblx0XHRcdFx0ZW50ZXJLOiAnd2Via2l0UmVxdWVzdEZ1bGxzY3JlZW4nLFxuXHRcdFx0XHRleGl0SzogJ3dlYmtpdEV4aXRGdWxsc2NyZWVuJyxcblx0XHRcdFx0ZWxlbWVudEs6ICd3ZWJraXRGdWxsc2NyZWVuRWxlbWVudCcsXG5cdFx0XHRcdGV2ZW50SzogJ3dlYmtpdCcgKyB0RlxuXHRcdFx0fTtcblxuXHRcdH0gZWxzZSBpZihkRS5tc1JlcXVlc3RGdWxsc2NyZWVuKSB7XG5cdFx0XHRhcGkgPSB7XG5cdFx0XHRcdGVudGVySzogJ21zUmVxdWVzdEZ1bGxzY3JlZW4nLFxuXHRcdFx0XHRleGl0SzogJ21zRXhpdEZ1bGxzY3JlZW4nLFxuXHRcdFx0XHRlbGVtZW50SzogJ21zRnVsbHNjcmVlbkVsZW1lbnQnLFxuXHRcdFx0XHRldmVudEs6ICdNU0Z1bGxzY3JlZW5DaGFuZ2UnXG5cdFx0XHR9O1xuXHRcdH1cblxuXHRcdGlmKGFwaSkge1xuXHRcdFx0YXBpLmVudGVyID0gZnVuY3Rpb24oKSB7IFxuXHRcdFx0XHQvLyBkaXNhYmxlIGNsb3NlLW9uLXNjcm9sbCBpbiBmdWxsc2NyZWVuXG5cdFx0XHRcdF9pbml0YWxDbG9zZU9uU2Nyb2xsVmFsdWUgPSBfb3B0aW9ucy5jbG9zZU9uU2Nyb2xsOyBcblx0XHRcdFx0X29wdGlvbnMuY2xvc2VPblNjcm9sbCA9IGZhbHNlOyBcblxuXHRcdFx0XHRpZih0aGlzLmVudGVySyA9PT0gJ3dlYmtpdFJlcXVlc3RGdWxsc2NyZWVuJykge1xuXHRcdFx0XHRcdHBzd3AudGVtcGxhdGVbdGhpcy5lbnRlcktdKCBFbGVtZW50LkFMTE9XX0tFWUJPQVJEX0lOUFVUICk7XG5cdFx0XHRcdH0gZWxzZSB7XG5cdFx0XHRcdFx0cmV0dXJuIHBzd3AudGVtcGxhdGVbdGhpcy5lbnRlcktdKCk7IFxuXHRcdFx0XHR9XG5cdFx0XHR9O1xuXHRcdFx0YXBpLmV4aXQgPSBmdW5jdGlvbigpIHsgXG5cdFx0XHRcdF9vcHRpb25zLmNsb3NlT25TY3JvbGwgPSBfaW5pdGFsQ2xvc2VPblNjcm9sbFZhbHVlO1xuXG5cdFx0XHRcdHJldHVybiBkb2N1bWVudFt0aGlzLmV4aXRLXSgpOyBcblxuXHRcdFx0fTtcblx0XHRcdGFwaS5pc0Z1bGxzY3JlZW4gPSBmdW5jdGlvbigpIHsgcmV0dXJuIGRvY3VtZW50W3RoaXMuZWxlbWVudEtdOyB9O1xuXHRcdH1cblxuXHRcdHJldHVybiBhcGk7XG5cdH07XG5cblxuXG59O1xucmV0dXJuIFBob3RvU3dpcGVVSV9EZWZhdWx0O1xuXG5cbn0pO1xuIl0sInNvdXJjZVJvb3QiOiIifQ==