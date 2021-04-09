(window["webpackJsonp"] = window["webpackJsonp"] || []).push([[2],{

/***/ "../../public/typo3conf/ext/bootstrap_package/Resources/Public/JavaScript/Src/bootstrap.lightbox.js":
/*!**********************************************************************************************************************************!*\
  !*** /Users/bertrandzang/home/mdlm/public/typo3conf/ext/bootstrap_package/Resources/Public/JavaScript/Src/bootstrap.lightbox.js ***!
  \**********************************************************************************************************************************/
/*! no static exports found */
/***/ (function(module, exports) {

$(function () {
  /**
   * Add PhotoSwipe template to dom if lightbox elements exist.
   */
  if ($('a.lightbox').length > 0) {
    var photoswipeTemplate = '\
            <div class="pswp" tabindex="-1" role="dialog" aria-hidden="true">\
                <div class="pswp__bg"></div>\
                <div class="pswp__scroll-wrap">\
                    <div class="pswp__container">\
                        <div class="pswp__item"></div>\
                        <div class="pswp__item"></div>\
                        <div class="pswp__item"></div>\
                    </div>\
                    <div class="pswp__ui pswp__ui--hidden">\
                        <div class="pswp__top-bar">\
                            <div class="pswp__counter"></div>\
                            <button class="pswp__button pswp__button--close" title="Close (Esc)"></button>\
                            <button class="pswp__button pswp__button--share" title="Share"></button>\
                            <button class="pswp__button pswp__button--fs" title="Toggle fullscreen"></button>\
                            <button class="pswp__button pswp__button--zoom" title="Zoom in/out"></button>\
                            <div class="pswp__preloader">\
                                <div class="pswp__preloader__icn">\
                                    <div class="pswp__preloader__cut">\
                                        <div class="pswp__preloader__donut"></div>\
                                    </div>\
                                </div>\
                            </div>\
                        </div>\
                        <div class="pswp__share-modal pswp__share-modal--hidden pswp__single-tap">\
                            <div class="pswp__share-tooltip"></div> \
                        </div>\
                        <button class="pswp__button pswp__button--arrow--left" title="Previous (arrow left)"></button>\
                        <button class="pswp__button pswp__button--arrow--right" title="Next (arrow right)"></button>\
                        <div class="pswp__caption">\
                            <div class="pswp__caption__center"></div>\
                        </div>\
                    </div>\
                </div>\
            </div>';
    $('body').append(photoswipeTemplate);
  }
  /**
   * Open PhotoSwipe
   */


  var openPhotoSwipe = function openPhotoSwipe(pid, gid) {
    var photoswipeContainer = document.querySelectorAll('.pswp')[0];
    var items = [];
    $('a.lightbox[rel=' + gid + ']').each(function () {
      var caption = '';

      if ($(this).data('lightbox-caption')) {
        caption = $(this).data('lightbox-caption');
      } else {
        caption = $(this).next('figcaption').text();
      }

      var title = $(this).attr("title");

      if (!title && caption) {
        title = '--none--';
      }

      items.push({
        src: $(this).attr('href'),
        title: title,
        w: $(this).data('lightbox-width'),
        h: $(this).data('lightbox-height'),
        caption: caption.replace(/(?:\r\n|\r|\n)/g, '<br />'),
        pid: $(this).index('a.lightbox[rel=' + gid + ']')
      });
    });
    var options = {
      index: pid,
      addCaptionHTMLFn: function addCaptionHTMLFn(item, captionEl) {
        captionEl.children[0].innerHTML = '';

        if (item.title && item.title !== '--none--') {
          captionEl.children[0].innerHTML += '<div class="pswp__caption__title">' + item.title + '</div>';
        }

        if (item.caption) {
          captionEl.children[0].innerHTML += '<div class="pswp__caption__subtitle">' + item.caption + '</div>';
        }

        return true;
      },
      spacing: 0.12,
      loop: true,
      bgOpacity: 1,
      closeOnScroll: true,
      history: true,
      galleryUID: gid,
      galleryPIDs: true,
      closeEl: true,
      captionEl: true,
      fullscreenEl: true,
      zoomEl: true,
      shareEl: false,
      counterEl: true,
      arrowEl: true,
      preloaderEl: true
    };

    if (items.length > 0) {
      var gallery = new PhotoSwipe(photoswipeContainer, PhotoSwipeUI_Default, items, options);
      gallery.init();
    }
  };
  /**
   * Get PhotoSwipe params from url hash and open gallery
   */


  var getPhotoSwipeParamsFromHash = function getPhotoSwipeParamsFromHash() {
    var hash = window.location.hash.substring(1),
        params = {};

    if (hash.length < 5) {
      return params;
    }

    var vars = hash.split('&');

    for (var i = 0; i < vars.length; i++) {
      if (!vars[i]) {
        continue;
      }

      var pair = vars[i].split('=');

      if (pair.length < 2) {
        continue;
      }

      params[pair[0]] = pair[1];
    }

    return params;
  };

  var photoSwipeHashData = getPhotoSwipeParamsFromHash();

  if (photoSwipeHashData.pid && photoSwipeHashData.gid) {
    openPhotoSwipe(parseInt(photoSwipeHashData.pid), photoSwipeHashData.gid);
  }
  /**
   * Register listener
   */


  $('a.lightbox').on('click', function (e) {
    e.preventDefault();
    var gid = $(this).attr('rel');
    var pid = $(this).index('a.lightbox[rel=' + gid + ']');
    openPhotoSwipe(pid, gid);
  });
});

/***/ })

}]);
//# sourceMappingURL=data:application/json;charset=utf-8;base64,eyJ2ZXJzaW9uIjozLCJzb3VyY2VzIjpbIndlYnBhY2s6Ly8vL1VzZXJzL2JlcnRyYW5kemFuZy9ob21lL21kbG0vcHVibGljL3R5cG8zY29uZi9leHQvYm9vdHN0cmFwX3BhY2thZ2UvUmVzb3VyY2VzL1B1YmxpYy9KYXZhU2NyaXB0L1NyYy9ib290c3RyYXAubGlnaHRib3guanMiXSwibmFtZXMiOlsiJCIsImxlbmd0aCIsInBob3Rvc3dpcGVUZW1wbGF0ZSIsImFwcGVuZCIsIm9wZW5QaG90b1N3aXBlIiwicGlkIiwiZ2lkIiwicGhvdG9zd2lwZUNvbnRhaW5lciIsImRvY3VtZW50IiwicXVlcnlTZWxlY3RvckFsbCIsIml0ZW1zIiwiZWFjaCIsImNhcHRpb24iLCJkYXRhIiwibmV4dCIsInRleHQiLCJ0aXRsZSIsImF0dHIiLCJwdXNoIiwic3JjIiwidyIsImgiLCJyZXBsYWNlIiwiaW5kZXgiLCJvcHRpb25zIiwiYWRkQ2FwdGlvbkhUTUxGbiIsIml0ZW0iLCJjYXB0aW9uRWwiLCJjaGlsZHJlbiIsImlubmVySFRNTCIsInNwYWNpbmciLCJsb29wIiwiYmdPcGFjaXR5IiwiY2xvc2VPblNjcm9sbCIsImhpc3RvcnkiLCJnYWxsZXJ5VUlEIiwiZ2FsbGVyeVBJRHMiLCJjbG9zZUVsIiwiZnVsbHNjcmVlbkVsIiwiem9vbUVsIiwic2hhcmVFbCIsImNvdW50ZXJFbCIsImFycm93RWwiLCJwcmVsb2FkZXJFbCIsImdhbGxlcnkiLCJQaG90b1N3aXBlIiwiUGhvdG9Td2lwZVVJX0RlZmF1bHQiLCJpbml0IiwiZ2V0UGhvdG9Td2lwZVBhcmFtc0Zyb21IYXNoIiwiaGFzaCIsIndpbmRvdyIsImxvY2F0aW9uIiwic3Vic3RyaW5nIiwicGFyYW1zIiwidmFycyIsInNwbGl0IiwiaSIsInBhaXIiLCJwaG90b1N3aXBlSGFzaERhdGEiLCJwYXJzZUludCIsIm9uIiwiZSIsInByZXZlbnREZWZhdWx0Il0sIm1hcHBpbmdzIjoiOzs7Ozs7Ozs7QUFBQUEsQ0FBQyxDQUFDLFlBQVk7QUFFVjtBQUNKO0FBQ0E7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cyIsInNvdXJjZXNDb250ZW50IjpbIiQoZnVuY3Rpb24gKCkge1xuXG4gICAgLyoqXG4gICAgICogQWRkIFBob3RvU3dpcGUgdGVtcGxhdGUgdG8gZG9tIGlmIGxpZ2h0Ym94IGVsZW1lbnRzIGV4aXN0LlxuICAgICAqL1xuICAgIGlmICgkKCdhLmxpZ2h0Ym94JykubGVuZ3RoID4gMCkge1xuICAgICAgICB2YXIgcGhvdG9zd2lwZVRlbXBsYXRlID0gJ1xcXG4gICAgICAgICAgICA8ZGl2IGNsYXNzPVwicHN3cFwiIHRhYmluZGV4PVwiLTFcIiByb2xlPVwiZGlhbG9nXCIgYXJpYS1oaWRkZW49XCJ0cnVlXCI+XFxcbiAgICAgICAgICAgICAgICA8ZGl2IGNsYXNzPVwicHN3cF9fYmdcIj48L2Rpdj5cXFxuICAgICAgICAgICAgICAgIDxkaXYgY2xhc3M9XCJwc3dwX19zY3JvbGwtd3JhcFwiPlxcXG4gICAgICAgICAgICAgICAgICAgIDxkaXYgY2xhc3M9XCJwc3dwX19jb250YWluZXJcIj5cXFxuICAgICAgICAgICAgICAgICAgICAgICAgPGRpdiBjbGFzcz1cInBzd3BfX2l0ZW1cIj48L2Rpdj5cXFxuICAgICAgICAgICAgICAgICAgICAgICAgPGRpdiBjbGFzcz1cInBzd3BfX2l0ZW1cIj48L2Rpdj5cXFxuICAgICAgICAgICAgICAgICAgICAgICAgPGRpdiBjbGFzcz1cInBzd3BfX2l0ZW1cIj48L2Rpdj5cXFxuICAgICAgICAgICAgICAgICAgICA8L2Rpdj5cXFxuICAgICAgICAgICAgICAgICAgICA8ZGl2IGNsYXNzPVwicHN3cF9fdWkgcHN3cF9fdWktLWhpZGRlblwiPlxcXG4gICAgICAgICAgICAgICAgICAgICAgICA8ZGl2IGNsYXNzPVwicHN3cF9fdG9wLWJhclwiPlxcXG4gICAgICAgICAgICAgICAgICAgICAgICAgICAgPGRpdiBjbGFzcz1cInBzd3BfX2NvdW50ZXJcIj48L2Rpdj5cXFxuICAgICAgICAgICAgICAgICAgICAgICAgICAgIDxidXR0b24gY2xhc3M9XCJwc3dwX19idXR0b24gcHN3cF9fYnV0dG9uLS1jbG9zZVwiIHRpdGxlPVwiQ2xvc2UgKEVzYylcIj48L2J1dHRvbj5cXFxuICAgICAgICAgICAgICAgICAgICAgICAgICAgIDxidXR0b24gY2xhc3M9XCJwc3dwX19idXR0b24gcHN3cF9fYnV0dG9uLS1zaGFyZVwiIHRpdGxlPVwiU2hhcmVcIj48L2J1dHRvbj5cXFxuICAgICAgICAgICAgICAgICAgICAgICAgICAgIDxidXR0b24gY2xhc3M9XCJwc3dwX19idXR0b24gcHN3cF9fYnV0dG9uLS1mc1wiIHRpdGxlPVwiVG9nZ2xlIGZ1bGxzY3JlZW5cIj48L2J1dHRvbj5cXFxuICAgICAgICAgICAgICAgICAgICAgICAgICAgIDxidXR0b24gY2xhc3M9XCJwc3dwX19idXR0b24gcHN3cF9fYnV0dG9uLS16b29tXCIgdGl0bGU9XCJab29tIGluL291dFwiPjwvYnV0dG9uPlxcXG4gICAgICAgICAgICAgICAgICAgICAgICAgICAgPGRpdiBjbGFzcz1cInBzd3BfX3ByZWxvYWRlclwiPlxcXG4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDxkaXYgY2xhc3M9XCJwc3dwX19wcmVsb2FkZXJfX2ljblwiPlxcXG4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8ZGl2IGNsYXNzPVwicHN3cF9fcHJlbG9hZGVyX19jdXRcIj5cXFxuICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDxkaXYgY2xhc3M9XCJwc3dwX19wcmVsb2FkZXJfX2RvbnV0XCI+PC9kaXY+XFxcbiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDwvZGl2PlxcXG4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDwvZGl2PlxcXG4gICAgICAgICAgICAgICAgICAgICAgICAgICAgPC9kaXY+XFxcbiAgICAgICAgICAgICAgICAgICAgICAgIDwvZGl2PlxcXG4gICAgICAgICAgICAgICAgICAgICAgICA8ZGl2IGNsYXNzPVwicHN3cF9fc2hhcmUtbW9kYWwgcHN3cF9fc2hhcmUtbW9kYWwtLWhpZGRlbiBwc3dwX19zaW5nbGUtdGFwXCI+XFxcbiAgICAgICAgICAgICAgICAgICAgICAgICAgICA8ZGl2IGNsYXNzPVwicHN3cF9fc2hhcmUtdG9vbHRpcFwiPjwvZGl2PiBcXFxuICAgICAgICAgICAgICAgICAgICAgICAgPC9kaXY+XFxcbiAgICAgICAgICAgICAgICAgICAgICAgIDxidXR0b24gY2xhc3M9XCJwc3dwX19idXR0b24gcHN3cF9fYnV0dG9uLS1hcnJvdy0tbGVmdFwiIHRpdGxlPVwiUHJldmlvdXMgKGFycm93IGxlZnQpXCI+PC9idXR0b24+XFxcbiAgICAgICAgICAgICAgICAgICAgICAgIDxidXR0b24gY2xhc3M9XCJwc3dwX19idXR0b24gcHN3cF9fYnV0dG9uLS1hcnJvdy0tcmlnaHRcIiB0aXRsZT1cIk5leHQgKGFycm93IHJpZ2h0KVwiPjwvYnV0dG9uPlxcXG4gICAgICAgICAgICAgICAgICAgICAgICA8ZGl2IGNsYXNzPVwicHN3cF9fY2FwdGlvblwiPlxcXG4gICAgICAgICAgICAgICAgICAgICAgICAgICAgPGRpdiBjbGFzcz1cInBzd3BfX2NhcHRpb25fX2NlbnRlclwiPjwvZGl2PlxcXG4gICAgICAgICAgICAgICAgICAgICAgICA8L2Rpdj5cXFxuICAgICAgICAgICAgICAgICAgICA8L2Rpdj5cXFxuICAgICAgICAgICAgICAgIDwvZGl2PlxcXG4gICAgICAgICAgICA8L2Rpdj4nO1xuICAgICAgICAkKCdib2R5JykuYXBwZW5kKHBob3Rvc3dpcGVUZW1wbGF0ZSk7XG4gICAgfVxuXG4gICAgLyoqXG4gICAgICogT3BlbiBQaG90b1N3aXBlXG4gICAgICovXG4gICAgdmFyIG9wZW5QaG90b1N3aXBlID0gZnVuY3Rpb24ocGlkLCBnaWQpIHtcbiAgICAgICAgdmFyIHBob3Rvc3dpcGVDb250YWluZXIgPSBkb2N1bWVudC5xdWVyeVNlbGVjdG9yQWxsKCcucHN3cCcpWzBdO1xuICAgICAgICB2YXIgaXRlbXMgPSBbXTtcblxuICAgICAgICAkKCdhLmxpZ2h0Ym94W3JlbD0nICsgZ2lkICsgJ10nKS5lYWNoKGZ1bmN0aW9uKCl7XG4gICAgICAgICAgICB2YXIgY2FwdGlvbiA9ICcnO1xuICAgICAgICAgICAgaWYoJCh0aGlzKS5kYXRhKCdsaWdodGJveC1jYXB0aW9uJykpIHtcbiAgICAgICAgICAgICAgICBjYXB0aW9uID0gJCh0aGlzKS5kYXRhKCdsaWdodGJveC1jYXB0aW9uJyk7XG4gICAgICAgICAgICB9IGVsc2Uge1xuICAgICAgICAgICAgICAgIGNhcHRpb24gPSAkKHRoaXMpLm5leHQoJ2ZpZ2NhcHRpb24nKS50ZXh0KCk7XG4gICAgICAgICAgICB9XG4gICAgICAgICAgICB2YXIgdGl0bGUgPSAkKHRoaXMpLmF0dHIoXCJ0aXRsZVwiKTtcbiAgICAgICAgICAgIGlmKCF0aXRsZSAmJiBjYXB0aW9uKSB7XG4gICAgICAgICAgICAgICAgdGl0bGUgPSAnLS1ub25lLS0nXG4gICAgICAgICAgICB9XG4gICAgICAgICAgICBpdGVtcy5wdXNoKHtcbiAgICAgICAgICAgICAgICBzcmM6ICQodGhpcykuYXR0cignaHJlZicpLFxuICAgICAgICAgICAgICAgIHRpdGxlOiB0aXRsZSxcbiAgICAgICAgICAgICAgICB3OiAkKHRoaXMpLmRhdGEoJ2xpZ2h0Ym94LXdpZHRoJyksXG4gICAgICAgICAgICAgICAgaDogJCh0aGlzKS5kYXRhKCdsaWdodGJveC1oZWlnaHQnKSxcbiAgICAgICAgICAgICAgICBjYXB0aW9uOiBjYXB0aW9uLnJlcGxhY2UoLyg/OlxcclxcbnxcXHJ8XFxuKS9nLCAnPGJyIC8+JyksXG4gICAgICAgICAgICAgICAgcGlkOiAkKHRoaXMpLmluZGV4KCdhLmxpZ2h0Ym94W3JlbD0nICsgZ2lkICsgJ10nKSxcbiAgICAgICAgICAgIH0pO1xuICAgICAgICB9KTtcbiAgICAgICAgdmFyIG9wdGlvbnMgPSB7XG4gICAgICAgICAgICBpbmRleDogcGlkLFxuICAgICAgICAgICAgYWRkQ2FwdGlvbkhUTUxGbjogZnVuY3Rpb24oaXRlbSwgY2FwdGlvbkVsKSB7XG4gICAgICAgICAgICAgICAgY2FwdGlvbkVsLmNoaWxkcmVuWzBdLmlubmVySFRNTCA9ICcnO1xuICAgICAgICAgICAgICAgIGlmKGl0ZW0udGl0bGUgJiYgaXRlbS50aXRsZSAhPT0gJy0tbm9uZS0tJykge1xuICAgICAgICAgICAgICAgICAgICBjYXB0aW9uRWwuY2hpbGRyZW5bMF0uaW5uZXJIVE1MICs9ICc8ZGl2IGNsYXNzPVwicHN3cF9fY2FwdGlvbl9fdGl0bGVcIj4nICsgaXRlbS50aXRsZSArICc8L2Rpdj4nO1xuICAgICAgICAgICAgICAgIH1cbiAgICAgICAgICAgICAgICBpZihpdGVtLmNhcHRpb24pIHtcbiAgICAgICAgICAgICAgICAgICAgY2FwdGlvbkVsLmNoaWxkcmVuWzBdLmlubmVySFRNTCArPSAnPGRpdiBjbGFzcz1cInBzd3BfX2NhcHRpb25fX3N1YnRpdGxlXCI+JyArIGl0ZW0uY2FwdGlvbiArICc8L2Rpdj4nO1xuICAgICAgICAgICAgICAgIH1cbiAgICAgICAgICAgICAgICByZXR1cm4gdHJ1ZTtcbiAgICAgICAgICAgIH0sXG4gICAgICAgICAgICBzcGFjaW5nOiAgICAgICAgMC4xMixcbiAgICAgICAgICAgIGxvb3A6ICAgICAgICAgICB0cnVlLFxuICAgICAgICAgICAgYmdPcGFjaXR5OiAgICAgIDEsXG4gICAgICAgICAgICBjbG9zZU9uU2Nyb2xsOiAgdHJ1ZSxcbiAgICAgICAgICAgIGhpc3Rvcnk6ICAgICAgICB0cnVlLFxuICAgICAgICAgICAgZ2FsbGVyeVVJRDogICAgIGdpZCxcbiAgICAgICAgICAgIGdhbGxlcnlQSURzOiAgICB0cnVlLFxuICAgICAgICAgICAgY2xvc2VFbDogICAgICAgIHRydWUsXG4gICAgICAgICAgICBjYXB0aW9uRWw6ICAgICAgdHJ1ZSxcbiAgICAgICAgICAgIGZ1bGxzY3JlZW5FbDogICB0cnVlLFxuICAgICAgICAgICAgem9vbUVsOiAgICAgICAgIHRydWUsXG4gICAgICAgICAgICBzaGFyZUVsOiAgICAgICAgZmFsc2UsXG4gICAgICAgICAgICBjb3VudGVyRWw6ICAgICAgdHJ1ZSxcbiAgICAgICAgICAgIGFycm93RWw6ICAgICAgICB0cnVlLFxuICAgICAgICAgICAgcHJlbG9hZGVyRWw6ICAgIHRydWUsXG4gICAgICAgIH07XG4gICAgICAgIGlmKGl0ZW1zLmxlbmd0aCA+IDApIHtcbiAgICAgICAgICAgIHZhciBnYWxsZXJ5ID0gbmV3IFBob3RvU3dpcGUoIHBob3Rvc3dpcGVDb250YWluZXIsIFBob3RvU3dpcGVVSV9EZWZhdWx0LCBpdGVtcywgb3B0aW9ucyk7XG4gICAgICAgICAgICBnYWxsZXJ5LmluaXQoKTtcbiAgICAgICAgfVxuICAgIH1cblxuICAgIC8qKlxuICAgICAqIEdldCBQaG90b1N3aXBlIHBhcmFtcyBmcm9tIHVybCBoYXNoIGFuZCBvcGVuIGdhbGxlcnlcbiAgICAgKi9cbiAgICB2YXIgZ2V0UGhvdG9Td2lwZVBhcmFtc0Zyb21IYXNoID0gZnVuY3Rpb24oKSB7XG4gICAgICAgIHZhciBoYXNoID0gd2luZG93LmxvY2F0aW9uLmhhc2guc3Vic3RyaW5nKDEpLFxuICAgICAgICBwYXJhbXMgPSB7fTtcbiAgICAgICAgaWYoaGFzaC5sZW5ndGggPCA1KSB7XG4gICAgICAgICAgICByZXR1cm4gcGFyYW1zO1xuICAgICAgICB9XG4gICAgICAgIHZhciB2YXJzID0gaGFzaC5zcGxpdCgnJicpO1xuICAgICAgICBmb3IgKHZhciBpID0gMDsgaSA8IHZhcnMubGVuZ3RoOyBpKyspIHtcbiAgICAgICAgICAgIGlmKCF2YXJzW2ldKSB7XG4gICAgICAgICAgICAgICAgY29udGludWU7XG4gICAgICAgICAgICB9XG4gICAgICAgICAgICB2YXIgcGFpciA9IHZhcnNbaV0uc3BsaXQoJz0nKTtcbiAgICAgICAgICAgIGlmKHBhaXIubGVuZ3RoIDwgMikge1xuICAgICAgICAgICAgICAgIGNvbnRpbnVlO1xuICAgICAgICAgICAgfVxuICAgICAgICAgICAgcGFyYW1zW3BhaXJbMF1dID0gcGFpclsxXTtcbiAgICAgICAgfVxuICAgICAgICByZXR1cm4gcGFyYW1zO1xuICAgIH07XG4gICAgdmFyIHBob3RvU3dpcGVIYXNoRGF0YSA9IGdldFBob3RvU3dpcGVQYXJhbXNGcm9tSGFzaCgpO1xuICAgIGlmKHBob3RvU3dpcGVIYXNoRGF0YS5waWQgJiYgcGhvdG9Td2lwZUhhc2hEYXRhLmdpZCkge1xuICAgICAgICBvcGVuUGhvdG9Td2lwZSggcGFyc2VJbnQocGhvdG9Td2lwZUhhc2hEYXRhLnBpZCkgLCBwaG90b1N3aXBlSGFzaERhdGEuZ2lkKTtcbiAgICB9XG5cbiAgICAvKipcbiAgICAgKiBSZWdpc3RlciBsaXN0ZW5lclxuICAgICAqL1xuICAgICQoJ2EubGlnaHRib3gnKS5vbignY2xpY2snLGZ1bmN0aW9uKGUpe1xuICAgICAgICBlLnByZXZlbnREZWZhdWx0KCk7XG4gICAgICAgIHZhciBnaWQgPSAkKHRoaXMpLmF0dHIoJ3JlbCcpO1xuICAgICAgICB2YXIgcGlkID0gJCh0aGlzKS5pbmRleCgnYS5saWdodGJveFtyZWw9JyArIGdpZCArICddJyk7XG4gICAgICAgIG9wZW5QaG90b1N3aXBlKHBpZCwgZ2lkKTtcbiAgICB9KTtcblxufSk7XG4iXSwic291cmNlUm9vdCI6IiJ9