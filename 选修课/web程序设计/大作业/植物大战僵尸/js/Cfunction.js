var $User = function() {
        var a = navigator.platform,
            e = navigator.userAgent,
            c = (a == "Win32" || a == "Windows"),
            d = (a == "Mac68K" || a == "MacPPC" || a == "Macintosh"),
            b = (a == "X11" && !c && !d),
            f = c || d || b;
        return {
            Browser: {
                IE: !!(window.attachEvent && !window.opera),
                IE6: !!(window.attachEvent && !window.opera) && !window.XMLHttpRequest,
                Opera: !!window.opera,
                WebKit: e.indexOf("AppleWebKit/") > -1,
                Gecko: e.indexOf("Gecko") > -1 && e.indexOf("KHTML") == -1
            },
            System: {
                Win: c,
                Mac: d,
                Unix: b
            },
            Client: {
                PC: f,
                Mobile: !f
            },
            HTTP: location.protocol.toLowerCase() == "http:" ? 1 : 0,
            AuthorWebsite: location.hostname === "pvz.lonelystar.org"
        }
    }(),
    oSym = {
        Init: function(b, a) {
            this.Now = 0;
            this.Timer = null;
            this.execTask = null;
            this.TQ = [{
                T: 0,
                f: b,
                ar: a || []
            }];
            this.TimeStep = 10;
            this.Start()
        },
        Clear: function() {
            this.TQ.length = 0
        },
        Start: function() {
            (function() {
                try {
                    ++oSym.Now
                } catch (a) {
                    alert("超时退出游戏");
                    location.reload()
                }
                oSym.Timer = setTimeout(arguments.callee, oSym.TimeStep)
            })();
            (function() {
                var d = oSym,
                    a = d.TQ,
                    c = a.length,
                    b, e;
                while (c--) {
                    d.Now >= (b = a[c]).T && ((e = b.f).apply(e, b.ar), d.removeTask(c))
                }
                d.execTask = setTimeout(arguments.callee, oSym.TimeStep)
            })()
        },
        Stop: function() {
            clearTimeout(this.Timer);
            clearTimeout(this.execTask);
            this.Timer = null
        },
        addTask: function(b, c, a) {
            var d = this.TQ;
            d[d.length] = {
                T: this.Now + b,
                f: c,
                ar: a
            };
            return this
        },
        removeTask: function(a) {
            this.TQ.splice(a, 1);
            return this
        }
    },
    ShadowPNG = "images/plantshadow" + ($User.Browser.IE6 ? (document.execCommand("BackgroundImageCache", false, true), "8.gif") : "32.png"),
    innerText = (function() {
        return $User.Browser.IE ? ($Random = "?", function(b, a) {
            b.innerText = a
        }) : ($Random = "#", function(b, a) {
            b.textContent = a
        })
    })(),
    oS = {
        W: 900,
        H: 600,
        C: 9,
        LawnMowerX: 70,
        Lvl: 0,
        GlobalVariables: {},
        LvlVariables: {},
        SelfVariables: [],
        LvlClearFunc: null,
        Init: function(e, g, b, d) {
            var c, a = window;
            if (b != d) {
                for (c in b) {
                    a[c] != d ? (this.GlobalVariables[c] = a[c], a[c] = b[c]) : this.LvlVariables[c] = a[c] = b[c]
                }
            }
            ArCard = [];
            ArPCard = [];
            ArSun = [];
            $Pn = [];
            $Z = [];
            $P = [];
            EDAll = $("dAll");
            EDNewAll = EDAll.cloneNode(true);
            EDNewFlagMeter = $("dFlagMeter").cloneNode(true);
            ESSunNum = $("sSunNum");
            this.LoadAccess = null;
            this.InitLawnMower = null;
            this.StartGame = null;
            this.ChoseCard = this.MPID = "";
            this.PicNum = this.AccessNum = this.MCID = this.Chose = 0;
            this.Monitor = null;
            this.UserDefinedFlagFunc = null;
            for (c in e) {
                this.SelfVariables.push(c);
                this[c] = e[c]
            }!this.PicArr && (this.PicArr = []);
            !this.PName && (this.PName = []);
            !this.ZName && (this.ZName = []);
            !this.backgroundImage && (this.backgroundImage = "images/interface/background1.jpg");
            !this.LF && (this.LF = [0, 1, 1, 1, 1, 1]);
            !this.ZF && (this.ZF = this.LF);
            !this.LargeWaveFlag && (this.LargeWaveFlag = {});
            this.SunNum == d && (this.SunNum = 50);
            this.CanSelectCard == d && (this.CanSelectCard = 1);
            this.DKind == d && (this.DKind = 1);
            this.StaticCard == d && (this.StaticCard = 1);
            !this.StartGameMusic && (this.StartGameMusic = "UraniwaNi.swf");
            (this.Coord || function() {
                oS.R = 5;
                ChosePlantX = function(f) {
                    return Compare(GetC(f), 1, oS.C, GetX)
                };
                ChosePlantY = function(f) {
                    return $SSml(f, [86, 181, 281, 386, 476], [
                        [75, 0],
                        [175, 1],
                        [270, 2],
                        [380, 3],
                        [470, 4],
                        [575, 5]
                    ])
                };
                GetC = function(f) {
                    return $SSml(f, [100, 140, 220, 295, 379, 460, 540, 625, 695, 775, 855, 935], [-1, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11])
                };
                GetR = function(f) {
                    return $SSml(f, [86, 181, 281, 386, 476], [0, 1, 2, 3, 4, 5])
                };
                GetX = function(f) {
                    return $SEql(f, {
                        "-1": 100,
                        0: 140,
                        1: 187,
                        2: 267,
                        3: 347,
                        4: 427,
                        5: 507,
                        6: 587,
                        7: 667,
                        8: 747,
                        9: 827,
                        10: 865,
                        11: 950
                    })
                };
                GetY = function(f) {
                    return $SEql(f, {
                        0: 75,
                        1: 175,
                        2: 270,
                        3: 380,
                        4: 470,
                        5: 575
                    })
                };
                GetY1Y2 = function(f) {
                    return $SEql(f, {
                        0: [0, 85],
                        1: [86, 180],
                        2: [181, 280],
                        3: [281, 385],
                        4: [386, 475],
                        5: [476, 600]
                    })
                };
                !oS.InitLawnMower && (oS.InitLawnMower = function() {
                    var f = 6,
                        h = oGd.$LM;
                    while (--f) {
                        h[f] = 1;
                        NewImg("LawnMower" + f, "images/LawnMower.gif", "left:" + oS.LawnMowerX + "px;top:" + (GetY(f) - 60) + "px;z-index:" + (3 * f + 2), EDAll)
                    }
                })
            })();
            g && oP.Init(g);
            oT.Init(this.R);
            oZ.Init(this.R);
            oGd.Init();
            this.LoadMusic();
            this.LoadProgress()
        },
        LoadProgress: function(r, l, a) {
            SetVisible($("dFlagMeter"));
            SetHidden($("imgGQJC"));
            var p = oS,
                j = [],
                i = p.PicArr,
                k = p.PName,
                s = p.ZName,
                u = 0,
                d = document.createTextNode("正在准备载入游戏素材。。。"),
                t = GetX(11),
                g = oGd.$LF,
                b = oGd.$ZF,
                c = oS.R + 1,
                e = p.LoadImage,
                h = p.CheckImg,
                f = p.InitPn,
                m, q;
            innerText($("sFlagMeterTitleF"), d.data);
            $("dFlagMeterTitleB").insertBefore(d, $("sFlagMeterTitleF"));
            u += (r = k.length);
            while (r--) {
                a = (l = k[r].prototype).PicArr.slice(0);
                j[j.length] = [l.EName, a[l.NormalGif], l.getShadow(l)];
                a.splice(l.NormalGif, 1);
                Array.prototype.push.apply(i, a)
            }
            for (r in oS.LargeWaveFlag) {
                s[s.length] = oFlagZombie;
                break
            }
            r = s.length;
            while (r--) {
                Array.prototype.push.apply(i, (l = (q = s[r]).prototype).PicArr.slice(0));
                l.Init.call(q, t, l, b, c)
            }
            p.PicNum = u += i.length;
            r = i.length;
            while (r--) {
                e(i[r], h)
            }
            r = j.length;
            while (r--) {
                e((m = j[r])[1], f, m)
            }
        },
        InitPn: function(a) {
            var b;
            $Pn[a[0]] = b = NewEle(0, "div", "position:absolute");
            NewImg(0, ShadowPNG, a[2], b);
            NewImg(0, a[1], "", b);
            oS.CheckImg()
        },
        LoadImage: $User.Browser.IE ? function(b, d, c) {
            var a = new Image();
            a.onreadystatechange = function() {
                a.readyState == "complete" && d(c)
            };
            a.onerror = function() {
                a.onreadystatechange = null;
                a.title = b;
                d(c)
            };
            a.src = b
        } : function(b, d, c) {
            var a = new Image();
            a.src = b;
            a.complete ? d(c) : (a.onload = function() {
                a.complete && d(c)
            }, a.onerror = function() {
                a.title = b;
                d(c)
            })
        },
        CheckImg: function(b, a) {
            var c = oS;
            if (c.AccessNum > c.PicNum) {
                return
            }
            b = 139 - c.AccessNum++ * 140 / c.PicNum - 11;
            $("imgFlagHead").style.left = b + "px";
            a = "载入:(" + c.AccessNum + "/" + c.PicNum + ")";
            innerText($("sFlagMeterTitleF"), a);
            $("dFlagMeterTitleB").firstChild.data = a;
            $("imgFlagMeterFull").style.clip = "rect(0,auto,21px," + (b + 11) + "px)";
            if (c.AccessNum == c.PicNum) {
                SetHidden($("dFlagMeterContent"), $("dFlagMeter"));
                SetStyle($("dFlagMeter"), {
                    left: "260px",
                    top: "560px"
                });
                innerText($("sFlagMeterTitleF"), $("dFlagMeterTitleB").firstChild.data = c.LevelName);
                $("imgFlagHead").style.left = "139px";
                $("imgFlagMeterFull").style.clip = "rect(0,auto,auto,157px)";
                (oS.AutoSun = $User.Client.PC && $User.HTTP ? Math.floor(getCookie("JSPVZAutoSun")) : 1) && ($("cAutoSun").checked = true);
                delete c.PicArr;
                delete c.Coord;
                delete c.LF;
                delete c.ZF;
                (c.LoadAccess || function() {
                    NewImg("imgGrowSoil", "images/interface/GrowSoil.png", "display:none;z-index:50", EDAll);
                    NewEle("dTitle", "div", 0, 0, EDAll);
                    innerText(ESSunNum, c.SunNum);
                    SetStyle($("tGround"), {
                        background: "url(" + c.backgroundImage + ") no-repeat",
                        display: "block"
                    });
                    InitPCard();
                    oSym.addTask(100, function() {
                        var d = EDAll.scrollLeft += 25;
                        d < 500 ? oSym.addTask(2, arguments.callee, []) : (DisplayZombie(), SetBlock($("dMenu")), oS.CanSelectCard ? (SetBlock($("dTop"), $("dSelectCard")), SetVisible($("dCardList"))) : (AutoSelectCard(), oSym.addTask(200, LetsGO, [])))
                    }, [])
                })()
            }
        }
    },
    oP = {
        Init: function(b) {
            var a;
            this.NumZombies = 0;
            this.FlagZombies = 0;
            for (a in b) {
                this[a] = b[a]
            }
            this.LAr = this.ArZ.length;
            this.FlagHeadStep = Math.floor(140 / (b.FlagNum - 1))
        },
        SelectFlagZombie: function(d) {
            var h = oP,
                c = [],
                a = 0,
                g = h.ArZ,
                f = oS.LargeWaveFlag[h.FlagZombies],
                e = h.SumToZombie,
                b = !f ? 150 : (f.style.top = "5px", --d, c[a++] = oFlagZombie, 30);
            while (d > 0) {
                d -= (c[a++] = g[Math.floor(Math.random() * $SEql(d, e))]).prototype.Lvl
            }
            h.NumZombies += a;
            h.SetTimeoutZombie(c, b)
        },
        SetTimeoutTomZombie: function(c) {
            var f = [],
                d = [],
                e = 0,
                a = c.length,
                h = oGd.$Tombstones,
                b, g;
            for (b in h) {
                g = b.split("_");
                d[e] = (f[e] = new c[Math.floor(Math.random() * a)]).CustomBirth(g[0], g[1], 100);
                ++e
            }
            oP.NumZombies += e;
            asyncInnerHTML(d.join(""), function(n, l) {
                EDAll.appendChild(n);
                var k = l.length,
                    m, j;
                while (k--) {
                    m = l[k];
                    oSym.addTask(10, function(r, q, i, p) {
                        q = Math.max(q - p, 0);
                        SetStyle(r, {
                            top: q + "px",
                            clip: "rect(0,auto," + (i += p) + "px,0)"
                        });
                        q && oSym.addTask(10, arguments.callee, [r, q, i, p])
                    }, [$(m.id).childNodes[1], j = m.height, 0, j * 0.1]);
                    m.Birth()
                }
            }, f)
        },
        SetTimeoutZombie: function(b, d) {
            var f = [],
                c = [],
                e = delayT = 0,
                a = b.length;
            while (e < a) {
                c[e] = (f[e] = new b[e]).prepareBirth(delayT);
                delayT += d;
                ++e
            }
            asyncInnerHTML(c.join(""), function(j, h) {
                EDAll.appendChild(j);
                var g = h.length;
                while (g--) {
                    h[g].Birth()
                }
            }, f)
        },
        AddZombiesFlag: function(d) {
            var g = oP,
                c = oS.LargeWaveFlag,
                e, b = g.FlagHeadStep,
                a = g.FlagNum;
            SetVisible($("imgGQJC"), $("dFlagMeterContent"));
            for (e in c) {
                Math.floor(e) < a ? SetStyle(c[e], {
                    display: "block",
                    left: (150 - (e - 1) * b) + "px"
                }) : SetBlock(c[e])
            }
            oGd.MoveBullet();
            g.ReadyFlag = 1;
            g.FlagPrgs(d)
        },
        FlagPrgs: function() {
            var f = oP,
                c = f.FlagZombies,
                e = f.FlagToSumNum,
                a = 139 - c * f.FlagHeadStep,
                d = $SSml(c, e.a1, e.a2),
                b;
            f.FlagNum > (c = ++f.FlagZombies) ? ($("imgFlagHead").style.left = a + "px", $("imgFlagMeterFull").style.clip = "rect(0,157px,21px," + (a + 11) + "px)", (b = $SEql(c, f.FlagToMonitor)) && oSym.addTask(1690, function(g) {
                !g[1] && (g[0](), g[1] = 1)
            }, [b]), oSym.addTask(2490, function(g) {
                var h = oP;
                h.ReadyFlag == g++ && (h.ReadyFlag = g, h.FlagPrgs())
            }, [c])) : ($("imgFlagHead").style.left = "-1px", $("imgFlagMeterFull").style.clip = "rect(0,157px,21px,0)");
            f.SelectFlagZombie.call(f, d);
            f.UserDefinedFlagFunc && f.UserDefinedFlagFunc()
        },
        MonPrgs: function() {
            var c = oP,
                b, a = c.FlagZombies;
            !--c.NumZombies && (a < c.FlagNum ? ((b = $SEql(a, c.FlagToMonitor)) && (b[0](), b[1] = 1), c.ReadyFlag = ++a, oSym.addTask(500, c.FlagPrgs, [])) : (c.FlagToEnd(), oSym.Stop()))
        },
        Monitor: function(a, b) {
            a && a.f.apply(a.f, a.ar);
            b && (oP.UserDefinedFlagFunc = b);
            (function() {
                oZ.traversalOf();
                oSym.addTask(10, arguments.callee, [])
            })()
        }
    },
    oGd = {
        Init: function() {
            this.$ = [];
            this.$Crater = [];
            this.$Tombstones = [];
            this.$Torch = [];
            this.$LF = oS.LF;
            this.$ZF = oS.ZF;
            this.$LM = [];
            this.$B = []
        },
        add: function(c, a, b, d) {
            (b = (d = this.$)[a]) && b.Die();
            d[a] = c
        },
        del: function(a) {
            delete this.$[a.R + "_" + a.C + "_" + a.PKind]
        },
        MoveBullet: function() {
            var d = oGd.$B,
                a = d.length,
                c, b = oGd.$Torch;
            while (a--) {
                (c = d[a]).F(c, a, d, b)
            }
            oSym.addTask(1, arguments.callee, [])
        },
        MB1: function(e, j, m, f) {
            var d = e.id,
                k = $(d),
                h = e.Attack,
                a = e.D,
                p, q = e.X,
                c = GetC(q),
                g = e.R,
                n = e.Kind,
                l = e.ChangeC,
                b = oZ.getZ(q, g, a);
            n < 1 && f[g + "_" + c] && l != c && ((e.Kind = ++n) && (h = e.Attack = 40), e.ChangeC = c, k.src = "images/Plants/PB" + n + a + ".gif");
            b && b.Altitude == 1 ? (b.getHurt(-1, a, h, n, 0, 0, 0), m.splice(j, 1), (SetStyle(k, {
                left: e.pixelLeft + 28 + "px"
            })).src = "images/Plants/PeaBulletHit.gif", oSym.addTask(10, ClearChild, [k])) : (e.X += (p = !a ? 5 : -5)) < oS.W && e.X > 100 ? k.style.left = (e.pixelLeft += p) + "px" : (m.splice(j, 1), ClearChild(k))
        },
        MB2: function(d, g, h) {
            var c = d.id,
                j = d.X,
                a = GetC(j),
                f = d.R,
                b = oZ.getZ(j, f, 0),
                e = $(c);
            b && b.Altitude == 1 ? (b.getHurt(-1, 0, 20, 0, 0, 0, 0), h.splice(g, 1), (SetStyle(e, {
                left: d.pixelLeft + 38 + "px"
            })).src = "images/Plants/ShroomBulletHit.gif", oSym.addTask(10, ClearChild, [e])) : (d.X += 5) < oS.W ? e.style.left = (d.pixelLeft += 5) + "px" : (h.splice(g, 1), ClearChild(e))
        },
        MB3: function(g, d, a) {
            var h = g.id,
                b = $(h),
                f = oZ.getZ(g.X, g.R, 0),
                e = g.D,
                c = g.pixelTop;
            if (f && f.Altitude == 1) {
                f.getHurt(-1, 0, 20, 0, 0, 0, 0);
                a.splice(d, 1);
                ClearChild(b)
            } else {
                switch (g.D) {
                    case 4:
                        (g.X -= 5) < 100 ? (a.splice(d, 1), ClearChild(b)) : b.style.left = (g.pixelLeft -= 5) + "px";
                        break;
                    case 6:
                        (c = g.pixelTop -= 5) < -15 ? (a.splice(d, 1), ClearChild(b)) : (b.style.top = c + "px", g.R = GetR(c + 15));
                        break;
                    case 2:
                        (c = g.pixelTop += 5) > 600 ? (a.splice(d, 1), ClearChild(b)) : (b.style.top = c + "px", g.R = GetR(c + 15));
                        break;
                    case 7:
                        (g.X += 4.3) > 900 || (c = g.pixelTop -= 5) < -15 ? (a.splice(d, 1), ClearChild(b)) : (g.R = GetR(c + 15), b.style.left = (g.pixelLeft += 9.6) + "px", b.style.top = c + "px");
                        break;
                    case 1:
                        (g.X += 4.3) > 900 || (c = g.pixelTop += 5) > 600 ? (a.splice(d, 1), ClearChild(b)) : (g.R = GetR(c + 15), b.style.left = (g.pixelLeft += 9.6) + "px", b.style.top = c + "px")
                }
            }
        }
    },
    oZ = {
        Init: function(b) {
            this.$ = [];
            this.$R = [];
            var a;
            for (a = b; a; this.$[a] = [], this.$R[a--] = []) {}
        },
        add: function(b, a) {
            (a = this.$[b.R]).push(b);
            a.sort(function(d, c) {
                return d.AttackedLX - c.AttackedLX
            });
            a.RefreshTime = oSym.Now
        },
        getZ: function(k, b, g) {
            var e = 0,
                m = this.$[b],
                h = this.$R[b],
                j, c, l, f;
            if (!g) {
                f = (j = m).length;
                while (e < f && (c = j[e++]).AttackedLX <= k) {
                    if (c.HP && c.AttackedRX >= k) {
                        return c
                    }
                }
            } else {
                (l = m.RefreshTime) == h.RefreshTime ? j = h : (j = (this.$R[b] = m.slice(0)).sort(function(i, d) {
                    return d.AttackedRX - i.AttackedRX
                })).RefreshTime = l;
                f = j.length;
                while (e < f && (c = j[e++]).AttackedRX >= k) {
                    if (c.HP && c.AttackedLX <= k) {
                        return c
                    }
                }
            }
            return
        },
        getArZ: function(e, d, b) {
            var g = 0,
                l = this.$[b],
                f = [],
                k = 0,
                c, h = l.length,
                j;
            while (g < h && (j = (c = l[g++]).AttackedLX) < d) {
                c.HP && (j > e || c.AttackedRX > e) && (f[k++] = c)
            }
            return f
        },
        moveTo: function(g, f, c) {
            var b = this.$[f],
                a = this.$[c],
                e = b.length,
                d;
            while (e--) {
                (o = b[e]).id == g && (b.splice(e, 1), o.R = c, a.push(o), (a.sort(function(i, h) {
                    return i.AttackedLX - h.AttackedLX
                })).RefreshTime = b.RefreshTime = oSym.Now, e = 0)
            }
        },
        traversalOf: function() {
            var c, a, e = this.$,
                i, k = Refresh = 0,
                j = 1000,
                h, g, b = function(l) {
                    (h = l.AttackedLX) > j && (k = Refresh = 1);
                    j = h
                },
                d = function(l) {
                    Refresh = 1;
                    j = h
                },
                f = e.length;
            (function(n) {
                var m = (i = e[n]).length,
                    l = arguments.callee;
                while (m--) {
                    c = i[m];
                    c.HP && c.ZX < 901 && oT.check(c);
                    !c.HP ? (i.splice(m, 1), d(c)) : !(c.FreeFreezeTime || c.FreeSetbodyTime) ? (c.beAttacked && !c.isAttacking && c.JudgeAttack(), g = c.id, !c.isAttacking ? (a = c.Speed, !c.WalkDirection ? (c.AttackedRX -= a) < 100 ? (GameOver(), oSym.Stop(), m = 0, n = 1) : (c.ZX = c.AttackedLX -= a) < 150 && oGd.$LM[n] ? (i.splice(m, 1), c.Die(2), LawnMowerKill(n), d(c)) : ($(g).style.left = Math.floor(c.X -= a) + "px", b(c)) : (c.AttackedLX += a) > oS.W ? (i.splice(m, 1), c.Die(2), d(c)) : (c.ZX = c.AttackedRX += a, $(g).style.left = Math.ceil(c.X += a) + "px", b(c))) : b(c)) : b(c)
                }
                k ? (k = 0, i.sort(function(q, p) {
                    return q.AttackedLX - p.AttackedLX
                }), i.RefreshTime = oSym.Now) : Refresh && (i.RefreshTime = oSym.Now);
                --n && oSym.addTask(0, l, [n])
            })(e.length - 1)
        }
    },
    oT = {
        Init: function(b) {
            this.$ = [];
            this.$L = [];
            for (var a = b; a;) {
                this.$[a] = [];
                this.$L[a--] = []
            }
        },
        add: function(f, c, g) {
            var e = this.$[f],
                d = c.length,
                b;
            while (d--) {
                b = c[d];
                e.push([b[0], b[1], b[2], g])
            }
            e.sort(function(i, h) {
                return h[1] - i[1]
            });
            e.RefreshTime = new Date
        },
        check: function(b, l, k, e, a, j, c) {
            var h = b.AttackedLX,
                f = b.AttackedRX,
                d = 0,
                g = this.$[c = b.R];
            if (!b.WalkDirection) {
                while (d < g.length && (e = g[d])[1] >= h) {
                    (a = $P[e[3]]).canTrigger && e[0] <= h && a.TriggerCheck(b, e[2], d);
                    ++d
                }
            } else {
                (k = g.RefreshTime) == (j = this.$L[c]).RefreshTime ? l = j : (l = (this.$L[c] = g.slice(0)).sort(function(m, i) {
                    return m[0] - i[0]
                })).RefreshTime = k;
                while (d < l.length && (e = l[d])[0] <= f) {
                    (a = $P[e[3]]).canTrigger && e[1] >= f && a.TriggerCheck(b, e[2], d);
                    ++d
                }
            }
        },
        delP: function(e) {
            var b = e.oTrigger,
                f = e.id,
                d, a, c;
            for (d in b) {
                for (c = (a = this.$[d]).length; c--; a[c][3] == f && a.splice(c, 1)) {}
                a.RefreshTime = new Date
            }
        },
        indexOf: function(j, d) {
            var f = new RegExp(d + ",", "g"),
                h = (j.toString() + ",").replace(f, "┢,").replace(/[^,┢]/g, ""),
                i = 0,
                g = 0,
                b = [];
            for (;
                (g = h.indexOf("┢", g)) > 0; b.push((g++ - i++ - 2) / 3)) {}
            return b
        }
    },
    asyncInnerHTML = function(d, c, a) {
        var b = $n("div"),
            e = document.createDocumentFragment();
        b.innerHTML = d;
        (function(g) {
            var f = arguments.callee;
            g-- ? (e.appendChild(b.firstChild), setTimeout(function() {
                f(g)
            }, 0)) : c(e, a)
        })(b.childNodes.length)
    },
    WhichMouseButton = function(a) {
        a = window.event || a;
        var b = $User.Browser;
        return !b.Gecko ? $SEql(a.button, {
            1: 1,
            0: b.IE ? 2 : 1,
            2: 2,
            "default": 1
        }) : $SEql(a.which, {
            1: 1,
            3: 2,
            "default": 1
        })
    },
    GroundOnmousedown = function(i) {
        i = window.event || i;
        var a = i.clientX,
            k = i.clientY + document.body.scrollTop,
            g = ChosePlantX(a),
            h = ChosePlantY(k),
            d = g[0],
            c = h[0],
            f = h[1],
            b = g[1],
            j = GetAP(a, k, f, b);
        switch (oS.Chose) {
            case 1:
                WhichMouseButton(i) < 2 ? GrowPlant(j[0], d, c, f, b) : CancelPlant();
                break;
            case -1:
                WhichMouseButton(i) < 2 ? ShovelPlant(j) : CancelShovel()
        }
    },
    GetAP = function(a, h, d, c) {
        var f, i = oGd.$,
            e, g = [],
            b;
        for (f = 0; f < 4; g.push(e = i[d + "_" + c + "_" + f++]), e && !(a < e.pixelLeft || a > e.pixelRight || h < e.pixelTop || h > e.pixelBottom) && (b = e)) {}
        return [g, b]
    },
    GroundOnkeydown = function(b) {
        var a;
        if ((a = (b || event).keyCode) == 27) {
            switch (oS.Chose) {
                case 1:
                    CancelPlant();
                    break;
                case -1:
                    CancelShovel()
            }
            return false
        } else {
            !oS.Chose && KeyBoardGrowPlant(a)
        }
    },
    KeyBoardGrowPlant = function(b, a) {
        a = a || 0;
        if (b > 47 && b < 58) {
            switch (a) {
                case 0:
                    ChosePlant({
                        clientX: 450,
                        clientY: 300
                    }, String.fromCharCode(b))
            }
        }
    },
    GroundOnmousemove = function(k) {
        k = window.event || k;
        var d = k.clientX,
            b = k.clientY + document.body.scrollTop,
            m = oS.ChoseCard,
            h = ChosePlantX(d),
            i = ChosePlantY(b),
            f = h[0],
            c = i[0],
            g = i[1],
            a = h[1],
            p = GetAP(d, b, g, a);
        switch (oS.Chose) {
            case 1:
                var n = ArCard[m].PName.prototype;
                SetStyle($("MovePlant"), {
                    left: d - n.width * 0.5 + "px",
                    top: b + 20 - n.height + "px"
                });
                n.CanGrow(p[0], g, a) ? SetStyle($("MovePlantAlpha"), {
                    display: "block",
                    left: f + n.GetDX() + "px",
                    top: c - n.height + n.GetDY(g, a, p[0]) + "px"
                }) : SetNone($("MovePlantAlpha"));
                break;
            case -1:
                var j = p[1],
                    l = j ? j.id : "",
                    q = oS.MPID;
                q != l && (q && SetAlpha($(q).childNodes[1], 100, 1), (oS.MPID = l) && SetAlpha($(l).childNodes[1], 60, 0.6));
                SetStyle($("tShovel"), {
                    left: d - 15 + "px",
                    top: b - 16 + "px"
                })
        }
    },
    ViewProducePlant = function(b) {
        var a = b.prototype;
        $("pHandBookPlant").src = a.PicArr[a.NormalGif];
        $("tdProducePlant").innerHTML = a.Produce;
        innerText($("tdHandBookPlantName"), a.CName);
        innerText($("spSunNum"), a.SunNum);
        innerText($("spCoolTime"), a.coolTime * 0.001 + "秒")
    },
    ViewProduceZombie = function(b) {
        var a = b.prototype;
        $("pHandBookZombie").src = a.PicArr[a.NormalGif];
        $("tdProduceZombie").innerHTML = a.Produce;
        innerText($("tdHandBookZombieName"), a.CName)
    },
    DisplayZombie = function() {
        var c = oP.ArZ.slice(0),
            b = l2 = c.length,
            f, g = $("dZombie"),
            e = [],
            d = [],
            a;
        while (b--) {
            e.push(Math.floor(150 + Math.random() * 444))
        }
        e.sort(function(i, h) {
            return i - h
        });
        while (l2) {
            f = c[a = Math.floor(Math.random() * l2)].prototype;
            c.splice(a, 1);
            d[l2--] = f.getHTML("", Math.floor(50 + Math.random() * 201) - f.width * 0.5, e[l2] - f.height, 1, "visibility", "auto", 0)
        }
        asyncInnerHTML(d.join(""), function(h) {
            g.appendChild(h)
        })
    },
    AutoSelectCard = function() {
        var c = oS.PName,
            b = -1,
            a = c.length;
        while (++b < a) {
            SelectCard(c[b].prototype.EName)
        }
    },
    InitPCard = function() {
        var d = "",
            f, e = oS.PName,
            a = e.length,
            b = 0,
            c;
        while (b < a) {
            f = e[b];
            c = f.prototype;
            ArPCard[EName = c.EName] = {
                Select: 0,
                PName: f
            };
            d += '<span class="span1" id="Card' + EName + '" onmouseout="SetNone($(\'dTitle\'))" onmousemove="ViewCardTitle(\'' + EName + "',event)\" onclick=\"SelectCard('" + EName + '\')"><img src="' + c.PicArr[c.CardGif] + '"><span class="span2">' + c.SunNum + "</span></span>";
            b++ % 6 == 5 && (d += "<br>")
        }
        $("dPCard").innerHTML = d
    },
    ViewCardTitle = function(b, c) {
        c = c || window.event;
        var f = $("dTitle"),
            a = ArPCard[b].PName.prototype;
        f.innerHTML = a.CName + "<br>冷却时间:" + (a.coolTime * 0.001).toFixed(1) + "秒<br>" + a.Tooltip;
        SetStyle(f, {
            left: c.clientX + EDAll.scrollLeft - 3 + "px",
            top: c.clientY + 18 + "px",
            display: "block"
        })
    },
    SelectCard = function(f) {
        var a = $("Card" + f).firstChild,
            i = ArPCard[f],
            c = i.PName.prototype,
            h, e, b, g = $("btnOK");
        if (!i.Select) {
            if (!(ArPCard.SelNum |= 0)) {
                g.disabled = "";
                g.style.color = "#FC6"
            } else {
                if (ArPCard.SelNum > 9) {
                    return
                }
            }++ArPCard.SelNum;
            i.Select = 1;
            oS.StaticCard && (h = NewEle("dCard" + f, "div", 0, {
                onclick: function() {
                    SelectCard(f)
                }
            }, $("dCardList")), NewImg(0, a.src, 0, h), innerText(NewEle("sSunNum" + f, "span", 0, 0, h), c.SunNum), a.src = c.PicArr[c.CardGif + 1])
        } else {
            i.Select = 0;
            !--ArPCard.SelNum && (g.disabled = "disabled", g.style.color = "#888");
            (h = $("dCard" + f)).onclick = null;
            e = h.firstChild;
            b = h.lastChild;
            ClearChild(e, b, h);
            a.src = c.PicArr[c.CardGif]
        }
    },
    ResetSelectCard = function() {
        var a;
        for (a in ArPCard) {
            ArPCard[a].Select && SelectCard(a)
        }
        $("btnOK").disabled = "disalbed";
        $("btnOK").style.color = "#888"
    },
    LetsGO = function() {
        var b = $("dZombie"),
            f = $("dCardList"),
            h = 0,
            l = f.childNodes.length,
            g, j, m, e, k, a, c = $("dBody");
        while (b.hasChildNodes()) {
            b.removeChild(k = b.lastChild);
            k = null
        }
        SetNone(b, $("dSelectCard"));
        $("tGround").style.left = "-115px";
        EDAll.scrollLeft = 0;
        SetStyle($("dTop"), {
            left: "105px",
            top: 0
        });
        f.style.left = 0;
        while (h < l) {
            (function(d) {
                g = (k = f.childNodes[d]).id.substr(5);
                m = (j = ArPCard[g].PName).prototype;
                k.onclick = function(i) {
                    ChosePlant(i, d)
                };
                k.onmouseover = function() {
                    SetBlock($("dTitle"));
                    ViewPlantTitle(oS.MCID = d)
                };
                k.onmouseout = function() {
                    SetNone($("dTitle"))
                };
                (a = k.lastChild).id = "sSunNum" + d;
                innerText(a, m.SunNum);
                k.firstChild.src = m.PicArr[m.CardGif + 1];
                ArCard.push({
                    DID: k.id,
                    CDReady: 0,
                    SunReady: 0,
                    PName: j
                })
            })(h++)
        }
        c.onkeydown = function(d) {
            GroundOnkeydown(d)
        };
        c.onmousedown = function(d) {
            GroundOnmousedown(d)
        };
        c.onmousemove = function(d) {
            GroundOnmousemove(d)
        };
        SetVisible(f);
        (oS.StartGame || function() {
            ClearChild($("oEmbed"));
            NewEle("oEmbed", "embed", "width:0;height:0", {
                src: "music/" + oS.StartGameMusic
            }, EDAll);
            SetVisible($("tdShovel"), $("dFlagMeter"));
            SetBlock($("dTop"));
            oS.InitLawnMower();
            PrepareGrowPlants(function() {
                oP.Monitor(oS.Monitor, oS.UserDefinedFlagFunc);
                BeginCool();
                oS.DKind && AutoProduceSun(25);
                oSym.addTask(1500, function() {
                    oP.AddZombiesFlag();
                    SetVisible($("dFlagMeterContent"))
                }, [])
            })
        })()
    },
    ViewPlantTitle = function(b) {
        var f = $("dTitle"),
            e = ArCard[b],
            c = e.PName.prototype,
            a = c.CName + "<br>冷却时间:" + (c.coolTime * 0.001).toFixed(1) + "秒<br>" + c.Tooltip;
        !e.CDReady && (a += '<br><span style="color:#F00">正在重新装填中...</span>');
        !e.SunReady && (a += '<br><span style="color:#F00">阳光不足!</span>');
        f.innerHTML = a;
        SetStyle(f, {
            top: 60 * b + "px",
            left: "100px"
        })
    },
    BeginCool = function() {
        var b = ArCard.length,
            c, d, a, e;
        while (b--) {
            a = (c = (d = ArCard[b]).PName.prototype).coolTime;
            e = c.SunNum;
            switch (a) {
                case 7500:
                    d.CDReady = 1;
                    e <= oS.SunNum && (d.SunReady = 1, $(d.DID).firstChild.src = c.PicArr[c.CardGif]);
                    break;
                case 30000:
                    DoCoolTimer(b, 20000, 20000);
                    break;
                default:
                    DoCoolTimer(b, 0, 0)
            }
        }
    },
    MonitorCard = function(c) {
        var a = ArCard.length,
            b;
        if (oS.Chose < 1) {
            while (a--) {
                (b = (c = ArCard[a]).PName.prototype).SunNum > oS.SunNum ? (c.SunReady && (c.SunReady = 0), $(c.DID).firstChild.src = b.PicArr[b.CardGif + 1]) : (!c.SunReady && (c.SunReady = 1), c.CDReady && ($(c.DID).firstChild.src = b.PicArr[b.CardGif]))
            }
        } else {
            while (a--) {
                (b = (c = ArCard[a]).PName.prototype).SunNum > oS.SunNum ? c.SunReady && (c.SunReady = 0) : !c.SunReady && (c.SunReady = 1)
            }
        }
        ViewPlantTitle(oS.MCID)
    },
    DoCoolTimer = function(c, b) {
        var a = $(ArCard[c].DID);
        (function(d, g, f, e) {
            d > 0 ? (innerText(f, d), innerText(e, d), oSym.addTask(50, arguments.callee, [(d - 0.5).toFixed(1), g, f, e])) : (ClearChild(f, e), ArCard[g].CDReady = 1, MonitorCard())
        })(b * 0.001, c, NewEle("dCD1" + c, "span", "position:absolute;left:22px;top:22px;font-size:18px;font-weight:500;font-family:Verdana;color:#000", "", a), NewEle("dCD2" + c, "span", "position:absolute;left:20px;top:20px;font-size:18px;font-weight:500;font-family:Verdana;color:#FF0", "", a))
    },
    ChosePlant = function(a, f) {
        var h = ArCard[oS.ChoseCard = f];
        if (!(h.CDReady && h.SunReady)) {
            return
        }
        var g = (a = a || event).clientX,
            e = a.clientY + document.body.scrollTop,
            d = h.PName.prototype,
            c = ArCard.length,
            b;
        oS.Chose = 1;
        EditImg((EditImg($Pn[d.EName].childNodes[1].cloneNode(false), "MovePlant", "", {
            left: g - d.width * 0.5 + "px",
            top: e + 20 - d.height + "px",
            zIndex: 254
        }, EDAll)).cloneNode(false), "MovePlantAlpha", "", {
            display: "none",
            filter: "alpha(opacity=40)",
            opacity: 0.4,
            zIndex: 30
        }, EDAll);
        while (c--) {
            $((b = ArCard[c]).DID).firstChild.src = (d = b.PName.prototype).PicArr[d.CardGif + 1]
        }
        SetNone($("dTitle"))
    },
    CancelPlant = function() {
        ClearChild($("MovePlant"), $("MovePlantAlpha"));
        oS.Chose = 0;
        MonitorCard()
    },
    ShovelPlant = function(a) {
        var b = a[0],
            c = a[1];
        c && (c.PKind || !(b[1] || b[2])) && (c.Die(), oS.MPID = "");
        CancelShovel()
    },
    CancelShovel = function(a) {
        var b = oS.MPID;
        ClearChild($("tShovel"));
        oS.Chose = 0;
        SetBlock($("imgShovel"));
        b && SetAlpha($(b).childNodes[1], 100, 1)
    },
    ChoseShovel = function(a) {
        WhichMouseButton(a) < 2 && (SetNone($("imgShovel")), NewImg("tShovel", "images/interface/Shovel.png", "left:" + (a.clientX - 10) + "px;top:" + (a.clientY + document.body.scrollTop - 17) + "px;z-index:1", EDAll), oS.Chose = -1, StopBubble(a))
    },
    StopBubble = function(a) {
        window.event ? event.cancelBubble = true : a.stopPropagation()
    },
    GrowPlant = function(i, c, b, d, a) {
        var g = oS.ChoseCard,
            e = ArCard[g],
            f = e.PName,
            h = f.prototype;
        h.CanGrow(i, d, a) && ((new f).Birth(c, b, d, a, i), innerText(ESSunNum, oS.SunNum -= h.SunNum), $(e.DID).firstChild.src = h.PicArr[h.CardGif + 1], e.CDReady = 0, DoCoolTimer(g, h.coolTime), SetStyle($("imgGrowSoil"), {
            left: c - 30 + "px",
            top: b - 40 + "px",
            zIndex: 3 * d,
            display: "block"
        }), oSym.addTask(20, SetNone, [$("imgGrowSoil")]));
        CancelPlant()
    },
    AutoProduceSun = function(a) {
        AppearSun(GetX(Math.floor(1 + Math.random() * oS.C)), GetY(Math.floor(1 + Math.random() * oS.R)), a, 1);
        oSym.addTask(Math.floor(9 + Math.random() * 3) * 100, AutoProduceSun, [a])
    },
    AppearSun = function(h, f, e, a) {
        var b, d, g = "Sun" + Math.random(),
            c = "cursor:pointer;z-index:25;filter:alpha(opacity=80);opacity:0.8;left:" + h + "px;";
        switch (e) {
            case 25:
                c += "width:78px;height:78px";
                b = 39;
                break;
            case 15:
                c += "width:46px;height:46px";
                b = 23;
                break;
            default:
                c += "width:100px;height:100px";
                b = 55
        }
        a ? (d = 0, oSym.addTask(10, MoveDropSun, [g, f])) : (d = f - b - 20, c += ";top:" + d + "px", oSym.addTask(800, DisappearSun, [g]));
        ArSun[g] = {
            id: g,
            N: e,
            C: 1,
            left: h,
            top: d
        };
        NewImg(g, "images/Sun.gif", c, EDAll, {
            onclick: function() {
                ClickSun(this.id)
            }
        });
        oS.AutoSun && oSym.addTask(100, ClickSun, [g])
    },
    MoveDropSun = function(c, b) {
        var a = ArSun[c];
        a && a.C && (a.top < b - 53 ? ($(c).style.top = (a.top += 3) + "px", oSym.addTask(5, MoveDropSun, [c, b])) : oSym.addTask(800, DisappearSun, [c]))
    },
    DisappearSun = function(b) {
        var a = ArSun[b];
        a && a.C && (delete ArSun[b], ClearChild($(b)))
    },
    ClickSun = function(c) {
        var a = ArSun[c],
            b = oS.SunNum;
        a && a.C && (a.C = 0, innerText(ESSunNum, oS.SunNum = Math.min(b + a.N, 9990)), oSym.addTask(0, MoveClickSun, [c]).addTask(0, MonitorCard, []))
    },
    MoveClickSun = function(b) {
        var a = 15,
            c = ArSun[b],
            e = 85,
            i = -20,
            d = c.left,
            h = c.top,
            g = Math.round((d - e) / a),
            f = Math.round((h - i) / a);
        (function(k, l, n, s, m, r, j, q, p) {
            (m -= q) > n ? (SetStyle($(k), {
                left: m + "px",
                top: (r -= p) + "px"
            }), oSym.addTask(j, arguments.callee, [k, l, n, s, m, r, j += 0.3, q, p])) : (SetStyle($(k), {
                left: n + "px",
                top: s + "px"
            }), delete ArSun[k], oSym.addTask(20, ClearChild, [$(k)]))
        })(b, c, e, i, d, h, 1, g, f)
    },
    AutoClickSun = function() {
        var a, b;
        for (b in ArSun) {
            ArSun[b].C && ClickSun(b)
        }
    },
    ShowLargeWave = function(a) {
        NewImg("LargeWave", "images/LargeWave.gif", "left:71px;top:249px;width:858px;height:102px;z-index:50", EDAll);
        oSym.addTask(4, function(b, c, d) {
            SetStyle($("LargeWave"), {
                width: (b -= 57.2) + "px",
                height: (c -= 6.8) + "px",
                left: 500 - b * 0.5 + "px",
                top: 300 - c * 0.5 + "px"
            });
            b > 286 ? oSym.addTask(4, arguments.callee, [b, c, d]) : d()
        }, [858, 102, a || function() {
            oSym.addTask(460, ClearChild, [$("LargeWave")])
        }])
    },
    ShowFinalWave = function() {
        var a = function(b) {
            NewImg("FinalWave", "images/FinalWave.gif", "left:122px;top:194px;width:756px;height:213px;z-index:50", EDAll);
            oSym.addTask(4, function(c, e, d) {
                SetStyle($("FinalWave"), {
                    width: (c -= 50.4) + "px",
                    height: (e -= 14.2) + "px",
                    left: 500 - c * 0.5 + "px",
                    top: 300 - e * 0.5 + "px"
                });
                c > 252 ? oSym.addTask(4, arguments.callee, [c, e, d]) : oSym.addTask(d, ClearChild, [$("FinalWave")])
            }, [756, 213, b])
        };
        (oP.FlagNum in oS.LargeWaveFlag) ? ShowLargeWave(function() {
            oSym.addTask(460, function() {
                ClearChild($("LargeWave"));
                oSym.addTask(100, a, [150])
            }, [])
        }): a(500)
    },
    LawnMowerKill = function(b) {
        var e = "LawnMower" + b,
            c = $(e),
            d = oS.LawnMowerX,
            a = oS.W;
        oGd.$LM[b] = 0;
        (function() {
            var g = oZ.getArZ(d, d + 50, b),
                f = g.length;
            while (f--) {
                g[f].Die(2)
            }(d += 10) > a ? ClearChild(c) : (c.style.left = d + "px", oSym.addTask(1, arguments.callee, []))
        })()
    },
    GameOver = function() {
        NewImg("iGameOver", "images/ZombiesWon.png", "width:900px;height:600px;z-index:255", EDAll, {
            onclick: function() {
                SelectModal(oS.Lvl)
            }
        })
    },
    PrepareGrowPlants = function(a) {
        NewImg("PrepareGrow", "images/PrepareGrowPlants.gif" + $Random + Math.random(), "z-index:50;left:" + (oS.W * 0.5 - 77) + "px;top:" + (oS.H * 0.5 - 54) + "px", EDAll);
        oSym.addTask(250, function(b) {
            ClearChild($("PrepareGrow"));
            b()
        }, [a])
    },
    CustomPlants = function(b, a, c) {
        (new ArCard[b].PName).Birth(GetX(c), GetY(a), a, c, [])
    };
CheckAutoSun = function(a) {
    var b = a.checked ? 1 : 0;
    b != oS.AutoSun && (addCookie("JSPVZAutoSun", oS.AutoSun = b), b && AutoClickSun())
}, GetNewCard = function(a, b, c) {
    oSym.Clear();
    (SetStyle(a, {
        left: "350px",
        top: "131px",
        width: "200px",
        height: "120px",
        cursor: "default"
    })).onclick = null;
    NewEle("DivA", "div", "width:900px;height:600px;background:#FFF;z-index:255", 0, EDAll);
    oSym.Init(function(d, e) {
        ++d < 100 ? (SetAlpha(e, d, d * 0.01), oSym.addTask(1, arguments.callee, [d, e])) : function() {
            SetHidden(EDAll, $("dTop"));
            var f = b.prototype;
            $("iNewPlantCard").src = f.PicArr[f.NormalGif];
            $("iNewPlantCard").style.marginTop = 180 - f.height + "px";
            innerText($("dNewPlantName"), f.CName);
            $("dNewPlantTooltip").innerHTML = f.Tooltip;
            $("btnNextLevel").onclick = function() {
                c == 10 && (c = 0, alert("还没做好，敬请期待！"));
                SelectModal(c)
            };
            SetStyle($("dNewPlant"), {
                display: "block",
                zIndex: 255
            });
            oSym.Stop()
        }()
    }, [0, $("DivA")])
}, getCookie = function(b) {
    var d = document.cookie,
        e = d.split(";"),
        c = e.length,
        a;
    while (c--) {
        if ((a = e[c].split("="))[0].replace(" ", "") == b) {
            return a[1]
        }
    }
    return 0
}, addCookie = function(a, c, d) {
    var b = a + "=" + escape(c);
    document.cookie = b
}, deleteCookie = function(a) {
    document.cookie = a + "=0;"
}, WordUTF8 = '<div id="dLogo" style="position:absolute;width:900px;height:600px;background:#000 url(images/Logo.jpg) no-repeat;z-index:1"><span style="position:absolute;line-height:1.5;left:349px;top:10px;width:524px;text-align:right;font-size:15pt; font-family:&#x9ED1;&#x4F53;;color:#F60; top:32px">&#x6B22;&#x8FCE;&#x6765;&#x5230;<span style="font-family:Verdana">LonelyStar</span>&#x7684;<span style="font-family:Verdana">JavaScript</span>&#x7248;&#x690D;&#x7269;&#x5927;&#x6218;&#x50F5;&#x5C38;<br>&#x5728;&#x7EBF;&#x7F51;&#x5740; <span style="font-family:Verdana">http://pvz.lonelystar.org/</span><br><b>&#x7A0B;&#x5E8F;&#x7684;&#x5F00;&#x53D1;&#x76EE;&#x7684;&#x662F;&#x4E3A;&#x4E86;&#x5B66;&#x4E60;&#xFF0C;&#x6240;&#x6709;&#x7248;&#x6743;&#x5F52;PopCap&#x6240;&#x6709;</b></span><div id="LogoWord" style="position:absolute;color:#FF0;top:510px;width:100%;height:90px"><span style="position:absolute;font-size:15pt;width:321px;height:69px; font-family:&#x9ED1;&#x4F53;;line-height:69px; left:60px; top:10px;cursor:pointer;background:url(images/interface/LogoLine.png) no-repeat center -5px;text-align:center" onclick="SetBlock($(\'dSurface\'),$(\'iSurfaceBackground\'))">&#x70B9;&#x51FB;&#x5F00;&#x59CB;<span style="font-size:15pt; font-family:Verdana;color:#FF0;cursor:pointer;">JavaScript</span>&#x7248;&#x3002;&#x3002;&#x3002;</span><span style="position:absolute;font-size:11pt;left:407px;top:29px;line-height:1.5;font-weight:bold"><span style="cursor:pointer;" onclick="SetBlock($(\'dProcess\'))">&#x70B9;&#x51FB;&#x67E5;&#x770B;&#x66F4;&#x65B0;&#x8FDB;&#x5EA6;&#x5217;&#x8868;!<span id="sTime"></span></span><br><a target="_blank" style="cursor:pointer;color:#FF0;" href="http://www.mycodes.net">&#x70B9;&#x51FB;&#x8FD9;&#x91CC;&#x5230;&#x7F51;&#x7AD9;&#x7559;&#x8A00;&#x677F;&#x7559;&#x8A00;&#xFF0C;&#x8C22;&#x8C22;&#x3002;(&#x65E0;&#x9700;&#x6CE8;&#x518C;&#x767B;&#x9646;)</a></span></div></div>', SelectModal = function(g) {
    var b = oS.GlobalVariables,
        c = oS.LvlVariables,
        e = oS.SelfVariables,
        a = window,
        d;
    for (d in b) {
        a[d] = b[d]
    }
    for (d in c) {
        a[d] = null
    }
    for (d = e.length; d--; delete oS[e[d]]) {}
    oS.LvlClearFunc && oS.LvlClearFunc();
    oS.GlobalVariables = {};
    oS.LvlVariables = {};
    oS.SelfVariables.length = 0;
    HiddenLevel();
    HiddenMiniGame();
    SetHidden($("dCardList"));
    SetNone($("dSurface"), $("iSurfaceBackground"), $("tGround"), $("dSelectCard"), $("dTop"), $("dMenu"), $("dHandBook"), $("dNewPlant"), $("dProcess"));
    ClearChild($("dFlagMeterTitleB").firstChild);
    EDAll = $("dBody").replaceChild(EDNewAll, EDAll);
    $("dBody").replaceChild(EDNewFlagMeter, $("dFlagMeter"));
    LoadLvl(g)
}, LoadLvl = function(b, a) {
    (b = b || 0) && oSym.Now == a && (b = 0);
    oSym.Timer && oSym.Stop();
    oSym.Init(function(d) {
        var c = $("JSPVZ");
        c && ClearChild(c);
        NewEle("JSPVZ", "script", "", {
            src: "level/" + (oS.Lvl = d) + ".js",
            type: "text/javascript"
        }, document.getElementsByTagName("head").item(0))
    }, [b])
}, AppearTombstones = function(j, d, h) {
    var l = oGd.$Tombstones,
        g = [],
        f = oS.R + 1,
        b, c = 0,
        k, a, e;
    while (--f) {
        e = d;
        while (e >= j) {
            !l[f + "_" + e] && (g[c++] = [f, e--])
        }
    }
    while (h--) {
        k = g[e = Math.floor(Math.random() * g.length)];
        l[(f = k[0]) + "_" + (b = k[1])] = 1;
        g.splice(e, 1);
        a = NewEle("Tombstones_" + Math.random(), "div", "position:absolute;width:86px;height:91px;left:" + (GetX(b) - 43) + "px;top:" + (GetY(f) - 91) + "px", 0, EDAll);
        f = Math.floor(Math.random() * 4);
        b = Math.floor(Math.random() * 3);
        NewEle("", "div", "background-position:-" + 86 * b + "px -" + 91 * f + "px", {
            className: "Tom1"
        }, a);
        NewEle("", "div", "background-position:-" + 86 * b + "px -" + 91 * f + "px", {
            className: "Tom2"
        }, a)
    }
}, PauseGame = function(b) {
    var a = oSym;
    a.Timer ? (a.Stop(), innerText(b, "回到游戏"), $("dMenu1").onclick = null) : (a.Start(), innerText(b, "暂停游戏"), $("dMenu1").onclick = ClickMenu)
}, ClickMenu = function() {
    oSym.Timer && (oSym.Stop(), SetBlock($("dSurface")), ShowOptions())
}, OptionsMenuDown = function(b, a) {
    b.className = "OptionsMenuButtonDown";
    a.style.lineHeight = "102px"
}, OptionsMenuUP = function(b, a) {
    b.className = "OptionsMenuButton";
    a.style.lineHeight = "100px"
}, ShowLevel = function() {
    SetBlock($("dSurfaceBack"), $("dOptionsMenuback"), $("dSelectLevel"), $("dTitleSmallContainer"))
}, HiddenLevel = function() {
    SetNone($("dSurfaceBack"), $("dOptionsMenuback"), $("dSelectLevel"), $("dTitleSmallContainer"))
}, ShowMiniGame = function() {
    SetBlock($("dSurfaceBack"), $("dOptionsMenuback"), $("dSelectLevel"), $("dMiniSmallContainer"))
}, HiddenMiniGame = function() {
    SetNone($("dSurfaceBack"), $("dOptionsMenuback"), $("dSelectLevel"), $("dMiniSmallContainer"))
}, ShowOptions = function() {
    SetBlock($("dSurfaceBack"), $("dOptionsMenuback"), $("dOptionsMenu"))
}, HiddenOptions = function() {
    SetNone($("dSurfaceBack"), $("dOptionsMenuback"), $("dOptionsMenu"));
    oS.Lvl && (SetNone($("dSurface")), PauseGame($("dMenu0")))
}, ShowHelp = function() {
    SetBlock($("dSurfaceBack"), $("dHelp"))
}, HiddenHelp = function() {
    SetNone($("dSurfaceBack"), $("dHelp"))
}, LoadProProcess = function() {
    var a = $("JSProcess");
    $User.Browser.IE ? a.onreadystatechange = function() {
        a.readyState == "loaded" && ClearChild(a)
    } : a.onload = function() {
        ClearChild(a)
    };
    a.onerror = function() {
        ClearChild(this)
    };
    a.src = "http://demo.mycodes.net/youxi/jspvz/Process.js"
}, $ = function(a) {
    return document.getElementById(a)
}, $n = function(a) {
    return document.createElement(a)
}, ClearChild = function() {
    var a = arguments.length,
        c;
    while (a--) {
        try {
            c = arguments[a];
            c.parentNode.removeChild(c);
            c = null
        } catch (b) {}
    }
}, SetBlock = function() {
    var a = arguments.length;
    while (a--) {
        arguments[a].style.display = "block"
    }
}, SetNone = function() {
    var a = arguments.length;
    while (a--) {
        arguments[a].style.display = "none"
    }
}, SetHidden = function() {
    var a = arguments.length;
    while (a--) {
        arguments[a].style.visibility = "hidden"
    }
}, SetVisible = function() {
    var a = arguments.length;
    while (a--) {
        arguments[a].style.visibility = "visible"
    }
}, SetAlpha = function(c, b, a) {
    c.style.filter = "alpha(opacity=" + b + ")";
    c.style.opacity = a
}, SetStyle = function(d, b) {
    var c = d.style,
        a;
    for (a in b) {
        c[a] = b[a]
    }
    return d
}, NewImg = function(f, e, b, c, d) {
    var a = $n("img");
    a.src = e;
    b && (a.style.cssText = b);
    if (d) {
        for (v in d) {
            a[v] = d[v]
        }
    }
    f && (a.id = f);
    c && c.appendChild(a);
    return a
}, EditImg = function(e, f, c, b, a) {
    f && (e.id = f);
    c && (e.src = c);
    b && SetStyle(e, b);
    a && a.appendChild(e);
    return e
}, NewEle = function(h, b, d, a, e, f, g, c) {
    g = $n(b);
    h && (g.id = h);
    d && (g.style.cssText = d);
    if (a) {
        for (c in a) {
            g[c] = a[c]
        }
    }
    if (f) {
        for (c in f) {
            g.setAttribute(c, f[c])
        }
    }
    e && e.appendChild(g);
    return g
}, EditEle = function(g, f, a, e, b, c) {
    if (f) {
        for (c in f) {
            g.setAttribute(c, f[c])
        }
    }
    a && SetStyle(g, a);
    if (b) {
        for (c in b) {
            g[c] = b[c]
        }
    }
    e && e.appendChild(g);
    return g
}, NewO = function(b, a) {
    return (a = function() {}).prototype = b, a
}, SetPrototype = function(d, c, a) {
    a = d.prototype;
    for (var b in c) {
        a[b] = c[b]
    }
}, InheritO = function(d, i, c, g, b, h, f, e, a) {
    var g = function() {};
    g.prototype = new d;
    i && SetPrototype(g, i);
    if (c) {
        a = g.prototype;
        for (f in c) {
            b = a[f].slice(0);
            h = c[f];
            for (e in h) {
                b[e] = h[e]
            }
            g.prototype[f] = b
        }
    }
    return g
}, Compare = function(e, b, a, c, d) {
    return d = e < b ? b : e > a ? a : e, c ? [c(d), d] : [d]
}, $Switch = function(h, d, c, a, g, b, e) {
    b = 0;
    g = d.length;
    e = c;
    while (b < g) {
        if (e(h, d[b])) {
            break
        }++b
    }
    return a[b]
}, $SEql = function(d, c, a, b) {
    return (a = c[d]) != b ? a : c["default"]
};
$SSml = function(d, c, a) {
    var b = 0;
    LX = c.length;
    while (b < LX) {
        if (d < c[b]) {
            break
        }++b
    }
    return a[b]
}, $SGrt = function(d, c, a) {
    var b = 0;
    LX = c.length;
    while (b < LX) {
        if (d > c[b]) {
            break
        }++b
    }
    return a[b]
}, ImgSpriter = function(h, c, e, f, g) {
    var b = e[f],
        d = b[2],
        a = $(h);
    a && (a.style.backgroundPosition = b[0], oSym.addTask(b[1] * 0.1, function(j) {
        j > -1 ? ImgSpriter(h, c, e, j, g) : g(h, c)
    }, [d]))
};
