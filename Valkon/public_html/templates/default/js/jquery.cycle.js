/*
 * jQuery Cycle Plugin
 * Examples and documentation at: http://malsup.com/jquery/cycle/
 * Copyright (c) 2007-2008 M. Alsup
 * Version: 2.34 (26-JAN-2009)
 * Dual licensed under the MIT and GPL licenses:
 * http://www.opensource.org/licenses/mit-license.php
 * http://www.gnu.org/licenses/gpl.html
 */
;(function(F) {
    var A = "2.34";
    if (F.support == undefined) {
        F.support = {opacity: !(F.browser.msie && /MSIE 6.0/.test(navigator.userAgent))}
    }
    function C() {
        if (window.console && window.console.log) {
            window.console.log("[cycle] " + Array.prototype.join.call(arguments, ""))
        }
    }
    F.fn.cycle = function(I) {
        if (this.length == 0) {
            C("terminating; zero elements found by selector" + (F.isReady ? "" : " (DOM not ready)"));
            return this
        }
        var J = arguments[1];
        return this.each(function() {
            if (this.cycleStop == undefined) {
                this.cycleStop = 0
            }
            if (I === undefined || I === null) {
                I = {}
            }
            if (I.constructor == String) {
                switch (I) {
                    case"stop":
                        this.cycleStop++;
                        if (this.cycleTimeout) {
                            clearTimeout(this.cycleTimeout)
                        }
                        this.cycleTimeout = 0;
                        F(this).removeData("cycle.opts");
                        return;
                    case"pause":
                        this.cyclePause = 1;
                        return;
                    case"resume":
                        this.cyclePause = 0;
                        if (J === true) {
                            I = F(this).data("cycle.opts");
                            if (!I) {
                                C("options not found, can not resume");
                                return
                            }
                            if (this.cycleTimeout) {
                                clearTimeout(this.cycleTimeout);
                                this.cycleTimeout = 0
                            }
                            D(I.elements, I, 1, 1)
                        }
                        return;
                    default:
                        I = {fx: I}
                    }
            } else {
                if (I.constructor == Number) {
                    var R = I;
                    I = F(this).data("cycle.opts");
                    if (!I) {
                        C("options not found, can not advance slide");
                        return
                    }
                    if (R < 0 || R >= I.elements.length) {
                        C("invalid slide index: " + R);
                        return
                    }
                    I.nextSlide = R;
                    if (this.cycleTimeout) {
                        clearTimeout(this.cycleTimeout);
                        this.cycleTimeout = 0
                    }
                    D(I.elements, I, 1, R >= I.currSlide);
                    return
                }
            }
            if (this.cycleTimeout) {
                clearTimeout(this.cycleTimeout)
            }
            this.cycleTimeout = 0;
            this.cyclePause = 0;
            var W = F(this);
            var S = I.slideExpr ? F(I.slideExpr, this) : W.children();
            var N = S.get();
            if (N.length < 2) {
                C("terminating; too few slides: " + N.length);
                return
            }
            var K = F.extend({}, F.fn.cycle.defaults, I || {}, F.metadata ? W.metadata() : F.meta ? W.data() : {});
            if (K.autostop) {
                K.countdown = K.autostopCount || N.length
            }
            W.data("cycle.opts", K);
            K.container = this;
            K.stopCount = this.cycleStop;
            K.elements = N;
            K.before = K.before ? [K.before] : [];
            K.after = K.after ? [K.after] : [];
            K.after.unshift(function() {
                K.busy = 0
            });
            if (K.continuous) {
                K.after.push(function() {
                    D(N, K, 0, !K.rev)
                })
            }
            if (!F.support.opacity && K.cleartype && !K.cleartypeNoBg) {
                B(S)
            }
            var Y = this.className;
            K.width = parseInt((Y.match(/w:(\d+)/) || [])[1]) || K.width;
            K.height = parseInt((Y.match(/h:(\d+)/) || [])[1]) || K.height;
            K.timeout = parseInt((Y.match(/t:(\d+)/) || [])[1]) || K.timeout;
            if (W.css("position") == "static") {
                W.css("position", "relative")
            }
            if (K.width) {
                W.width(K.width)
            }
            if (K.height && K.height != "auto") {
                W.height(K.height)
            }
            if (K.startingSlide) {
                K.startingSlide = parseInt(K.startingSlide)
            }
            if (K.random) {
                K.randomMap = [];
                for (var O = 0; O < N.length; O++) {
                    K.randomMap.push(O)
                }
                K.randomMap.sort(function(c, Z) {
                    return Math.random() - 0.5
                });
                K.randomIndex = 0;
                K.startingSlide = K.randomMap[0]
            } else {
                if (K.startingSlide >= N.length) {
                    K.startingSlide = 0
                }
            }
            var Q = K.startingSlide || 0;
            S.css({position: "absolute", top: 0, left: 0}).hide().each(function(Z) {
                var a = Q ? Z >= Q ? N.length - (Z - Q) : Q - Z : N.length - Z;
                F(this).css("z-index", a)
            });
            F(N[Q]).css("opacity", 1).show();
            if (F.browser.msie) {
                N[Q].style.removeAttribute("filter")
            }
            if (K.fit && K.width) {
                S.width(K.width)
            }
            if (K.fit && K.height && K.height != "auto") {
                S.height(K.height)
            }
            if (K.containerResize) {
                var T = 0, M = 0;
                for (var O = 0; O < N.length; O++) {
                    var L = F(N[O]), V = L.outerWidth(), P = L.outerHeight();
                    T = V > T ? V : T;
                    M = P > M ? P : M
                }
                W.css({width: T + "px", height: M + "px"})
            }
            if (K.pause) {
                W.hover(function() {
                    this.cyclePause++
                }, function() {
                    this.cyclePause--
                })
            }
            var X = F.fn.cycle.transitions[K.fx];
            if (F.isFunction(X)) {
                X(W, S, K)
            } else {
                if (K.fx != "custom") {
                    C("unknown transition: " + K.fx)
                }
            }
            S.each(function() {
                var Z = F(this);
                this.cycleH = (K.fit && K.height) ? K.height : Z.height();
                this.cycleW = (K.fit && K.width) ? K.width : Z.width()
            });
            K.cssBefore = K.cssBefore || {};
            K.animIn = K.animIn || {};
            K.animOut = K.animOut || {};
            S.not(":eq(" + Q + ")").css(K.cssBefore);
            if (K.cssFirst) {
                F(S[Q]).css(K.cssFirst)
            }
            if (K.timeout) {
                K.timeout = parseInt(K.timeout);
                if (K.speed.constructor == String) {
                    K.speed = F.fx.speeds[K.speed] || parseInt(K.speed)
                }
                if (!K.sync) {
                    K.speed = K.speed / 2
                }
                while ((K.timeout - K.speed) < 250) {
                    K.timeout += K.speed
                }
            }
            if (K.easing) {
                K.easeIn = K.easeOut = K.easing
            }
            if (!K.speedIn) {
                K.speedIn = K.speed
            }
            if (!K.speedOut) {
                K.speedOut = K.speed
            }
            K.slideCount = N.length;
            K.currSlide = Q;
            if (K.random) {
                K.nextSlide = K.currSlide;
                if (++K.randomIndex == N.length) {
                    K.randomIndex = 0
                }
                K.nextSlide = K.randomMap[K.randomIndex]
            } else {
                K.nextSlide = K.startingSlide >= (N.length - 1) ? 0 : K.startingSlide + 1
            }
            var U = S[Q];
            if (K.before.length) {
                K.before[0].apply(U, [U, U, K, true])
            }
            if (K.after.length > 1) {
                K.after[1].apply(U, [U, U, K, true])
            }
            if (K.click && !K.next) {
                K.next = K.click
            }
            if (K.next) {
                F(K.next).bind("click", function() {
                    return E(N, K, K.rev ? -1 : 1)
                })
            }
            if (K.prev) {
                F(K.prev).bind("click", function() {
                    return E(N, K, K.rev ? 1 : -1)
                })
            }
            if (K.pager) {
                H(N, K)
            }
            K.addSlide = function(a, b) {
                var Z = F(a), c = Z[0];
                if (!K.autostopCount) {
                    K.countdown++
                }
                N[b ? "unshift" : "push"](c);
                if (K.els) {
                    K.els[b ? "unshift" : "push"](c)
                }
                K.slideCount = N.length;
                Z.css("position", "absolute");
                Z[b ? "prependTo" : "appendTo"](W);
                if (b) {
                    K.currSlide++;
                    K.nextSlide++
                }
                if (!F.support.opacity && K.cleartype && !K.cleartypeNoBg) {
                    B(Z)
                }
                if (K.fit && K.width) {
                    Z.width(K.width)
                }
                if (K.fit && K.height && K.height != "auto") {
                    S.height(K.height)
                }
                c.cycleH = (K.fit && K.height) ? K.height : Z.height();
                c.cycleW = (K.fit && K.width) ? K.width : Z.width();
                Z.css(K.cssBefore);
                if (K.pager) {
                    F.fn.cycle.createPagerAnchor(N.length - 1, c, F(K.pager), N, K)
                }
                if (typeof K.onAddSlide == "function") {
                    K.onAddSlide(Z)
                }
            };
            if (K.timeout || K.continuous) {
                this.cycleTimeout = setTimeout(function() {
                    D(N, K, 0, !K.rev)
                }, K.continuous ? 10 : K.timeout + (K.delay || 0))
            }
        })
    };
    function D(N, I, M, O) {
        if (I.busy) {
            return
        }
        var L = I.container, Q = N[I.currSlide], P = N[I.nextSlide];
        if (L.cycleStop != I.stopCount || L.cycleTimeout === 0 && !M) {
            return
        }
        if (!M && !L.cyclePause && ((I.autostop && (--I.countdown <= 0)) || (I.nowrap && !I.random && I.nextSlide < I.currSlide))) {
            if (I.end) {
                I.end(I)
            }
            return
        }
        if (M || !L.cyclePause) {
            if (I.before.length) {
                F.each(I.before, function(R, S) {
                    if (L.cycleStop != I.stopCount) {
                        return
                    }
                    S.apply(P, [Q, P, I, O])
                })
            }
            var J = function() {
                if (F.browser.msie && I.cleartype) {
                    this.style.removeAttribute("filter")
                }
                F.each(I.after, function(R, S) {
                    if (L.cycleStop != I.stopCount) {
                        return
                    }
                    S.apply(P, [Q, P, I, O])
                })
            };
            if (I.nextSlide != I.currSlide) {
                I.busy = 1;
                if (I.fxFn) {
                    I.fxFn(Q, P, I, J, O)
                } else {
                    if (F.isFunction(F.fn.cycle[I.fx])) {
                        F.fn.cycle[I.fx](Q, P, I, J)
                    } else {
                        F.fn.cycle.custom(Q, P, I, J, M && I.fastOnEvent)
                    }
                }
            }
            if (I.random) {
                I.currSlide = I.nextSlide;
                if (++I.randomIndex == N.length) {
                    I.randomIndex = 0
                }
                I.nextSlide = I.randomMap[I.randomIndex]
            } else {
                var K = (I.nextSlide + 1) == N.length;
                I.nextSlide = K ? 0 : I.nextSlide + 1;
                I.currSlide = K ? N.length - 1 : I.nextSlide - 1
            }
            if (I.pager) {
                F.fn.cycle.updateActivePagerLink(I.pager, I.currSlide)
            }
        }
        if (I.timeout && !I.continuous) {
            L.cycleTimeout = setTimeout(function() {
                D(N, I, 0, !I.rev)
            }, G(Q, P, I, O))
        } else {
            if (I.continuous && L.cyclePause) {
                L.cycleTimeout = setTimeout(function() {
                    D(N, I, 0, !I.rev)
                }, 10)
            }
        }
    }
    F.fn.cycle.updateActivePagerLink = function(I, J) {
        F(I).find("a").removeClass("activeSlide").filter("a:eq(" + J + ")").addClass("activeSlide")
    };
    function G(M, K, L, J) {
        if (L.timeoutFn) {
            var I = L.timeoutFn(M, K, L, J);
            if (I !== false) {
                return I
            }
        }
        return L.timeout
    }
    function E(I, J, M) {
        var L = J.container, K = L.cycleTimeout;
        if (K) {
            clearTimeout(K);
            L.cycleTimeout = 0
        }
        if (J.random && M < 0) {
            J.randomIndex--;
            if (--J.randomIndex == -2) {
                J.randomIndex = I.length - 2
            } else {
                if (J.randomIndex == -1) {
                    J.randomIndex = I.length - 1
                }
            }
            J.nextSlide = J.randomMap[J.randomIndex]
        } else {
            if (J.random) {
                if (++J.randomIndex == I.length) {
                    J.randomIndex = 0
                }
                J.nextSlide = J.randomMap[J.randomIndex]
            } else {
                J.nextSlide = J.currSlide + M;
                if (J.nextSlide < 0) {
                    if (J.nowrap) {
                        return false
                    }
                    J.nextSlide = I.length - 1
                } else {
                    if (J.nextSlide >= I.length) {
                        if (J.nowrap) {
                            return false
                        }
                        J.nextSlide = 0
                    }
                }
            }
        }
        if (J.prevNextClick && typeof J.prevNextClick == "function") {
            J.prevNextClick(M > 0, J.nextSlide, I[J.nextSlide])
        }
        D(I, J, 1, M >= 0);
        return false
    }
    function H(J, K) {
        var I = F(K.pager);
        F.each(J, function(L, M) {
            F.fn.cycle.createPagerAnchor(L, M, I, J, K)
        });
        F.fn.cycle.updateActivePagerLink(K.pager, K.startingSlide)
    }
    F.fn.cycle.createPagerAnchor = function(L, M, J, K, N) {
        var I = (typeof N.pagerAnchorBuilder == "function") ? N.pagerAnchorBuilder(L, M) : '<a href="#">' + (L + 1) + "</a>";
        if (!I) {
            return
        }
        var O = F(I);
        if (O.parents("body").length == 0) {
            O.appendTo(J)
        }
        O.bind(N.pagerEvent, function() {
            N.nextSlide = L;
            var Q = N.container, P = Q.cycleTimeout;
            if (P) {
                clearTimeout(P);
                Q.cycleTimeout = 0
            }
            if (typeof N.pagerClick == "function") {
                N.pagerClick(N.nextSlide, K[N.nextSlide])
            }
            D(K, N, 1, N.currSlide < L);
            return false
        });
        if (N.pauseOnPagerHover) {
            O.hover(function() {
                N.container.cyclePause++
            }, function() {
                N.container.cyclePause--
            })
        }
    };
    function B(K) {
        function J(L) {
            var L = parseInt(L).toString(16);
            return L.length < 2 ? "0" + L : L
        }
        function I(N) {
            for (; N && N.nodeName.toLowerCase() != "html"; N = N.parentNode) {
                var L = F.css(N, "background-color");
                if (L.indexOf("rgb") >= 0) {
                    var M = L.match(/\d+/g);
                    return"#" + J(M[0]) + J(M[1]) + J(M[2])
                }
                if (L && L != "transparent") {
                    return L
                }
            }
            return"#ffffff"
        }
        K.each(function() {
            F(this).css("background-color", I(this))
        })
    }
    F.fn.cycle.custom = function(T, N, I, K, J) {
        var S = F(T), O = F(N);
        O.css(I.cssBefore);
        var L = J ? 1 : I.speedIn;
        var R = J ? 1 : I.speedOut;
        var M = J ? null : I.easeIn;
        var Q = J ? null : I.easeOut;
        var P = function() {
            O.animate(I.animIn, L, M, K)
        };
        S.animate(I.animOut, R, Q, function() {
            if (I.cssAfter) {
                S.css(I.cssAfter)
            }
            if (!I.sync) {
                P()
            }
        });
        if (I.sync) {
            P()
        }
    };
    F.fn.cycle.transitions = {fade: function(J, K, I) {
            K.not(":eq(" + I.startingSlide + ")").css("opacity", 0);
            I.before.push(function() {
                F(this).show()
            });
            I.animIn = {opacity: 1};
            I.animOut = {opacity: 0};
            I.cssBefore = {opacity: 0};
            I.cssAfter = {display: "none"};
            I.onAddSlide = function(L) {
                L.hide()
            }
        }};
    F.fn.cycle.ver = function() {
        return A
    };
    F.fn.cycle.defaults = {
        fx: "fade", 
                timeout: 4000, 
                timeoutFn: null, 
                continuous: 0, 
                speed: 1000, 
                speedIn: null, 
                speedOut: null, 
                next: null, 
                prev: null, 
                prevNextClick: 'click', 
                pager: null, 
                pagerClick: null, 
                pagerEvent: "click", 
                pagerAnchorBuilder: null, 
                before: null, 
                after: null, 
                end: null, 
                easing: null, 
                easeIn: null, 
                easeOut: null, 
                shuffle: null, 
                animIn: null, 
                animOut: null, 
                cssBefore: null, 
                cssAfter: null, 
                fxFn: null, 
                height: "auto", 
                startingSlide: 0, 
                sync: 1, 
                random: 0, 
                fit: 0, 
                containerResize: 1, 
                pause: 0, 
                pauseOnPagerHover: 0, 
                autostop: 0, 
                autostopCount: 0, 
                delay: 0, 
                slideExpr: null, 
                cleartype: 0, 
                nowrap: 0, 
                fastOnEvent: 0
    }
})(jQuery);

