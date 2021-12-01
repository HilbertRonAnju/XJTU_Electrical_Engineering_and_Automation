var CPlants = NewO({
        name: "Plants",
        HP: 300,
        PKind: 1,
        beAttackedPointL: 20,
        NormalGif: 2,
        CardGif: 0,
        canEat: 1,
        zIndex: 0,
        coolTime: 0,
        canTrigger: 1,
        Stature: 0,
        Sleep: 0,
        CanGrow: function(c, b, d) {
            var a = b + "_" + d;
            return oGd.$LF[b] == 1 ? !(d < 1 || d > 9 || oGd.$Crater[a] || oGd.$Tombstones[a] || c[1]) : c[0] && !c[1]
        },
        getHurt: function(d, b, a) {
            var c = this;
            !(b % 3) ? (c.HP -= a) < 1 && c.Die(): c.Die(1)
        },
        GetDY: function(b, c, a) {
            return a[0] ? -21 : -15
        },
        GetDX: function() {
            return -Math.floor(this.width * 0.5)
        },
        GetDBottom: function() {
            return this.height
        },
        Birth: function(d, c, h, a, l) {
            var e = this,
                k = d + e.GetDX(),
                i = c + e.GetDY(h, a, l),
                g = i - e.height,
                b = e.id = "P_" + Math.random(),
                j = e.zIndex += 3 * h,
                f = $Pn[e.EName].cloneNode(true);
            e.pixelLeft = k;
            e.pixelRight = k + e.width;
            e.pixelTop = g;
            e.pixelBottom = g + e.GetDBottom();
            e.opacity = 1;
            e.InitTrigger(e, b, e.R = h, e.C = a, e.AttackedLX = k + e.beAttackedPointL, e.AttackedRX = k + e.beAttackedPointR);
            $P[b] = e;
            e.BirthStyle(e, b, f, {
                left: k + "px",
                top: g + "px",
                zIndex: j
            });
            oGd.add(e, h + "_" + a + "_" + e.PKind);
            e.PrivateBirth(e)
        },
        getShadow: function(a) {
            return "left:" + (a.width * 0.5 - 48) + "px;top:" + (a.height - 22) + "px"
        },
        BirthStyle: function(c, d, b, a) {
            EditEle(b, {
                id: d
            }, a, EDAll)
        },
        PrivateBirth: function(a) {},
        getTriggerRange: function(a, b, c) {
            return [
                [b, oS.W, 0]
            ]
        },
        getTriggerR: function(a) {
            return [a, a]
        },
        InitTrigger: function(c, b, f, a, h, g) {
            var j = {},
                i = c.getTriggerR(f),
                e = i[0],
                d = i[1];
            do {
                oT.add(e, j[e] = c.getTriggerRange(e, h, g), b)
            } while (e++ != d);
            c.oTrigger = j
        },
        TriggerCheck: function(b, a) {
            this.AttackCheck2(b) && (this.canTrigger = 0, this.CheckLoop(b.id, a))
        },
        CheckLoop: function(b, c) {
            var a = this.id;
            this.NormalAttack(b);
            oSym.addTask(140, function(e, f, h) {
                var g;
                (g = $P[e]) && g.AttackCheck1(f, h)
            }, [a, b, c])
        },
        AttackCheck1: function(g, f) {
            var b = this,
                c = b.oTrigger,
                a = $Z[g],
                h, e, k, j;
            if (a && (h = c[a.R])) {
                k = a.ZX;
                e = h.length;
                while (e--) {
                    j = h[e];
                    if (j[0] <= k && j[1] >= k && b.AttackCheck2(a)) {
                        b.CheckLoop(g, j[2]);
                        return
                    }
                }
            }
            b.canTrigger = 1
        },
        AttackCheck2: function(a) {
            return a.Altitude > 0
        },
        PrivateDie: function(a) {},
        Die: function(a) {
            var b = this,
                c = b.id;
            b.oTrigger && oT.delP(b);
            b.HP = 0;
            delete $P[c];
            delete oGd.$[b.R + "_" + b.C + "_" + b.PKind];
            !a && ClearChild($(c));
            b.PrivateDie(b)
        }
    }),
    oStarfruit = InheritO(CPlants, {
        EName: "oStarfruit",
        CName: "杨桃",
        width: 77,
        height: 70,
        beAttackedPointR: 57,
        SunNum: 0,
        PicArr: ["images/Card/Plants/Starfruit.png", "images/Card/Plants/StarfruitG.png", "images/Plants/Starfruit/Starfruit.gif", "images/Plants/Starfruit/Star.gif"],
        Tooltip: "向五个方向发射小杨桃",
        Produce: '杨桃可以向五个方向发射小杨桃。<p>伤害：<font color="#FF0000">中等</font><br>范围：<font color="#FF0000">五个方向</font></p>杨桃：“嘿，哥们，有一天我去看牙医，他说我有四个牙洞。我一数，我就只有一颗牙齿！一颗牙齿长了四个牙洞？怎么会这样啊？”',
        GetDY: function(b, c, a) {
            return a[0] ? -17 : -10
        },
        PrivateBirth: function(d) {
            var c = d.pixelLeft + 38,
                b = c - 15,
                a = d.pixelTop + 15;
            d.BulletClass = NewO({
                X: c,
                R: d.R,
                pixelLeft: b,
                pixelTop: a,
                F: oGd.MB3
            });
            d.BulletEle = NewImg(0, "images/Plants/Starfruit/Star.gif", "left:" + b + "px;top:" + a + "px;z-index:" + (d.zIndex + 2))
        },
        PrivateDie: function(a) {
            a.BulletEle = null
        },
        NormalAttack: function() {
            var g = this,
                d, b = oGd.$B,
                e = 5,
                h, a = [1, 2, 4, 6, 7],
                f = g.BulletClass,
                c = g.BulletEle;
            while (e--) {
                (function(j) {
                    h = (d = new f).id = "StarB" + Math.random();
                    d.D = a[j];
                    EditEle(c.cloneNode(false), {
                        id: h
                    }, 0, EDAll);
                    b.push(d);
                    oSym.addTask(15, function(k) {
                        var i = $(k);
                        i && SetBlock(i)
                    }, [h])
                })(e)
            }
        }
    }),
    oPeashooter = InheritO(CPlants, {
        EName: "oPeashooter",
        CName: "豌豆射手",
        width: 71,
        height: 71,
        beAttackedPointR: 51,
        SunNum: 0,
        BKind: 0,
        PicArr: ["images/Card/Plants/Peashooter.png", "images/Card/Plants/PeashooterG.png", "images/Plants/Peashooter/Peashooter.gif", "images/Plants/PB00.gif", "images/Plants/PeaBulletHit.gif"],
        Tooltip: "向敌人射出豌豆",
        Produce: '豌豆射手，你的第一道防线。它们通过发射豌豆来攻击僵尸。<p>伤害：<font color="#FF0000">中等</font></p>一棵植物，怎么能如此快地生长，并发射如此多的豌豆呢？豌豆射手：“努力工作，风险自己，再加上一份阳光，高纤维和氧化碳均衡搭配，这种健康早餐让一切成为可能。”',
        PrivateBirth: function(c) {
            var b = c.AttackedLX,
                a = b - 40;
            c.BulletClass = NewO({
                X: b,
                R: c.R,
                D: 0,
                Attack: 20,
                Kind: c.BKind,
                ChangeC: 0,
                pixelLeft: a,
                F: oGd.MB1
            });
            c.BulletEle = NewImg(0, c.PicArr[3], "left:" + a + "px;top:" + (c.pixelTop + 3) + "px;display:none;z-index:" + (c.zIndex + 2))
        },
        PrivateDie: function(a) {
            a.BulletEle = null
        },
        NormalAttack: function() {
            var b = this,
                a = new b.BulletClass,
                c = a.id = "PB" + Math.random();
            EditEle(b.BulletEle.cloneNode(false), {
                id: c
            }, 0, EDAll);
            oGd.$B.push(a);
            oSym.addTask(15, function(e) {
                var d = $(e);
                d && SetBlock(d)
            }, [c])
        }
    }),
    oSnowPea = InheritO(oPeashooter, {
        EName: "oSnowPea",
        CName: "寒冰射手",
        SunNum: 0,
        BKind: -1,
        PicArr: ["images/Card/Plants/SnowPea.png", "images/Card/Plants/SnowPeaG.png", "images/Plants/SnowPea/SnowPea.gif", "images/Plants/PB-10.gif", "images/Plants/PeaBulletHit.gif"],
        Tooltip: "寒冰射手可造成伤害, 同时又有减速效果",
        Produce: '寒冰射手会发射寒冰豌豆来攻击敌人，并具有减速效果。<p>伤害：<font color="#FF0000">中等，带有减速效果</font></p>人们经常告诉寒冰射手他是多么“冷酷”，或者告诫他要“冷静”。他们叫他要“保持镇静”。寒冰射手只是转转他的眼睛。其实他都听见了。'
    }),
    oRepeater = InheritO(oPeashooter, {
        EName: "oRepeater",
        CName: "双发射手",
        width: 73,
        height: 71,
        beAttackedPointR: 53,
        SunNum: 0,
        PicArr: ["images/Card/Plants/Repeater.png", "images/Card/Plants/RepeaterG.png", "images/Plants/Repeater/Repeater.gif", "images/Plants/PB00.gif", "images/Plants/PeaBulletHit.gif"],
        Tooltip: "一次发射两颗豌豆",
        Produce: '双发射手可以一次发射两颗豌豆<p>伤害：<font color="#FF0000">中等(每颗)</font><br>发射速度：<font color="#FF0000">两倍</font></p>双发射手很凶悍，他是在街头混大的。他不在乎任何人的看法，无论是植物还是僵尸，他打出豌豆，是为了让别人离他远点。其实呢，双发射手一直暗暗地渴望着爱情。',
        NormalAttack: function(b, f) {
            var c = this,
                e = c.id,
                a = new c.BulletClass,
                d = a.id = "PB" + Math.random(),
                f;
            EditEle(c.BulletEle.cloneNode(false), {
                id: d
            }, 0, EDAll);
            oGd.$B.push(a);
            oSym.addTask(15, function(h) {
                var g = $(h);
                g && SetBlock(g)
            }, [d]);
            f ? ++f : f = 1;
            f < 2 && oSym.addTask(15, function(j, g, i) {
                var h;
                (h = $P[j]) && h.NormalAttack(g, i)
            }, [e, b, f])
        }
    }),
    oThreepeater = InheritO(oPeashooter, {
        EName: "oThreepeater",
        CName: "三线射手",
        width: 73,
        height: 80,
        beAttackedPointR: 53,
        SunNum: 0,
        PicArr: ["images/Card/Plants/Threepeater.png", "images/Card/Plants/ThreepeaterG.png", "images/Plants/Threepeater/Threepeater.gif", "images/Plants/PB00.gif", "images/Plants/PeaBulletHit.gif"],
        Tooltip: "一次射出三行的豌豆",
        Produce: '三线射手可以在三条线上同时射出豌豆。<p>伤害：<font color="#FF0000">普通(每颗)</font><br>范围：<font color="#FF0000">三线</font></p>三线射手喜欢读书，下棋和在公园里呆坐。他也喜欢演出，特别是现代爵士乐。“我正在寻找我生命中的另一半，”他说。三线射手最爱的数字是5。',
        getTriggerR: function(a) {
            return [a > 2 ? a - 1 : 1, a < oS.R ? a + 1 : a]
        },
        PrivateBirth: function(f) {
            var e = f.AttackedLX,
                d = e - 40,
                a, c = f.oTrigger,
                b;
            f.BulletClass = [];
            f.BulletEle = [];
            for (b in c) {
                f.BulletClass.push(NewO({
                    X: e,
                    R: b,
                    D: 0,
                    Attack: 20,
                    Kind: 0,
                    ChangeC: 0,
                    pixelLeft: d,
                    F: oGd.MB1
                }));
                f.BulletEle.push(NewImg(0, "images/Plants/PB00.gif", "left:" + d + "px;top:" + (GetY(b) - 50) + "px;display:none;z-index:" + (3 * b + 2)))
            }
        },
        PrivateDie: function(a) {
            a.BulletEle.length = 0
        },
        NormalAttack: function() {
            var e = this,
                d = e.BulletClass,
                c = e.BulletEle,
                b, f, a = d.length;
            while (a--) {
                b = new d[a];
                oSym.addTask(15, function(h) {
                    var g = $(h);
                    g && SetBlock(g)
                }, [f = b.id = "PB" + Math.random()]);
                EditEle(c[a].cloneNode(false), {
                    id: f
                }, 0, EDAll);
                oGd.$B.push(b)
            }
        }
    }),
    oGatlingPea = InheritO(oPeashooter, {
        EName: "oGatlingPea",
        CName: "加特林",
        width: 88,
        height: 84,
        beAttackedPointR: 68,
        SunNum: 0,
        coolTime: 0,
        PicArr: ["images/Card/Plants/GatlingPea.png", "images/Card/Plants/GatlingPeaG.png", "images/Plants/GatlingPea/GatlingPea.gif", "images/Plants/PB00.gif", "images/Plants/PeaBulletHit.gif"],
        Tooltip: "一次发射四颗豌豆<br>(需要双发射手)",
        Produce: '加特林可以一次发射四颗豌豆<p>伤害：<font color="#FF0000">中等(每颗)</font><br>发射速度：<font color="#FF0000">四倍<br>只能种在双发射手上</font></p>当加特林宣布他要参军的时候，他的父母很为他担心，他们异口同声地对他说：“亲爱的，但这太危险了。”加特林拒绝让步，“生活本就危险，”他这样回答着，此时他的眼睛里，正闪烁着钢铁般的信念。',
        PrivateBirth: function(c) {
            var b = c.AttackedLX,
                a = b - 40;
            c.BulletClass = NewO({
                X: b,
                R: c.R,
                D: 0,
                Attack: 20,
                Kind: c.BKind,
                ChangeC: 0,
                pixelLeft: a,
                F: oGd.MB1
            });
            c.BulletEle = NewImg(0, c.PicArr[3], "left:" + a + "px;top:" + (c.pixelTop + 8) + "px;display:none;z-index:" + (c.zIndex + 2))
        },
        CanGrow: function(b, a, d) {
            var c = b[1];
            return c && c.EName == "oRepeater"
        },
        NormalAttack: function(b, f) {
            var c = this,
                e = c.id,
                a = new c.BulletClass,
                d = a.id = "PB" + Math.random(),
                f;
            EditEle(c.BulletEle.cloneNode(false), {
                id: d
            }, 0, EDAll);
            oGd.$B.push(a);
            oSym.addTask(15, function(h) {
                var g = $(h);
                g && SetBlock(g)
            }, [d]);
            f ? ++f : f = 1;
            f < 4 && oSym.addTask(15, function(j, g, i) {
                var h;
                (h = $P[j]) && h.NormalAttack(g, i)
            }, [e, b, f])
        }
    }),
    oSplitPea = InheritO(oPeashooter, {
        EName: "oSplitPea",
        CName: "分裂射手",
        width: 92,
        height: 72,
        beAttackedPointR: 72,
        SunNum: 0,
        PicArr: ["images/Card/Plants/SplitPea.png", "images/Card/Plants/SplitPeaG.png", "images/Plants/SplitPea/SplitPea.gif", "images/Plants/PB00.gif", "images/Plants/PB01.gif", "images/Plants/PeaBulletHit.gif"],
        Tooltip: "前后双向发射豌豆",
        Produce: '分裂射手，可以向前后两个方向发射豌豆。<p>伤害：<font color="#FF0000">中等</font><br>范围：<font color="#FF0000">前面和后面</font><br>发射速度：<font color="#FF0000">前面为正常速度，后面为两倍速度</font></p>分裂射手：“没错，我就是双子座。我知道，这的确很令人惊奇。不过，有两个头，或者实际上，长着一个头和一个类似头的东西，在背上，对我这条线上的防守帮助很大。',
        GetDX: function() {
            return -55
        },
        getTriggerRange: function(a, b, c) {
            return [
                [100, b + 25, 1],
                [b + 26, oS.W, 0]
            ]
        },
        PrivateBirth: function(f) {
            var c = f.R,
                a = 0,
                g, d = [f.AttackedLX, f.AttackedRX],
                e = [d[0] - 40, d[1] - 16],
                b = "px;top:" + (f.pixelTop + 3) + "px;display:none;z-index:" + f.zIndex + 2;
            f.BulletClass = [];
            f.BulletEle = [];
            f.aTri = [0, 0];
            while (a < 2) {
                f.BulletClass[a] = NewO({
                    X: d[a],
                    pixelLeft: g = e[a],
                    R: c,
                    D: a,
                    Attack: 20,
                    Kind: 0,
                    ChangeC: 0,
                    F: oGd.MB1
                });
                f.BulletEle[a] = NewImg(0, f.PicArr[++a + 2], "left:" + g + b)
            }
        },
        PrivateDie: function(a) {
            a.BulletEle.length = 0
        },
        TriggerCheck: function(b, a) {
            if (this.aTri[a]) {
                return
            }
            if (this.AttackCheck2(b)) {
                ++this.aTri[a];
                this.aTri[0] && this.aTri[1] && (this.canTrigger = 0);
                this.CheckLoop(b.id, a)
            }
        },
        AttackCheck1: function(b, f) {
            var e = this,
                c = $Z[b],
                a;
            if (c && (c.R == e.R)) {
                a = c.ZX > e.AttackedLX + 25 ? 0 : 1;
                f == a ? (e.AttackCheck2(c) ? e.CheckLoop(b, f) : --e.aTri[f]) : (++e.aTri[a], --e.aTri[f])
            } else {
                --e.aTri[f]
            }
            e.canTrigger = e.aTri[0] && e.aTri[1] ? 0 : 1
        },
        CheckLoop: function(a, b) {
            this.NormalAttack(b);
            oSym.addTask(140, function(c, e, g) {
                var f;
                (f = $P[c]) && f.AttackCheck1(e, g)
            }, [this.id, a, b])
        },
        NormalAttack: function(d, f) {
            var c = this,
                a = c.id,
                b = new c.BulletClass[d],
                e = b.id = "PB" + Math.random();
            oGd.$B.push(b);
            EditEle(c.BulletEle[d].cloneNode(false), {
                id: e
            }, 0, EDAll);
            oSym.addTask(15, function(h) {
                var g = $(h);
                g && SetBlock(g)
            }, [e]);
            d && !f && oSym.addTask(15, function(g) {
                var h = $P[g];
                h && h.NormalAttack(1, 1)
            }, [a])
        }
    }),
    oSunFlower = InheritO(CPlants, {
        EName: "oSunFlower",
        CName: "向日葵",
        width: 73,
        height: 74,
        beAttackedPointR: 53,
        SunNum: 0,
        PicArr: ["images/Card/Plants/SunFlower.png", "images/Card/Plants/SunFlowerG.png", "images/Plants/SunFlower/SunFlower.gif"],
        Tooltip: "提供你额外的阳光",
        Produce: '向日葵，为你生产额外阳光的经济作物。尝试尽可能多种植吧！<p>阳光产量：<font color="#FF0000">中等</font></p>向日葵情不自禁地和着节拍起舞。是什么节拍呢？嗨，是大地自己用来提神的爵士节拍，这种频率的节拍，只有向日葵才能听到。',
        PrivateBirth: function(a) {
            oSym.addTask(600, function(d, c, b) {
                $P[d] && (AppearSun(Math.floor(c + Math.random() * 41), b, 25, 0), oSym.addTask(2400, arguments.callee, [d, c, b]))
            }, [a.id, GetX(a.C) - 40, GetY(a.R)])
        },
        InitTrigger: function() {}
    }),
    oTwinSunflower = InheritO(oSunFlower, {
        EName: "oTwinSunflower",
        CName: "双子向日葵",
        width: 83,
        height: 84,
        beAttackedPointR: 63,
        SunNum: 150,
        coolTime: 0,
        PicArr: ["images/Card/Plants/TwinSunflower.png", "images/Card/Plants/TwinSunflowerG.png", "images/Plants/TwinSunflower/TwinSunflower.gif"],
        Tooltip: "一次提供两倍于向日葵的阳光量<br>(需要向日葵)",
        Produce: '双子向日葵的阳光产量是普通向日葵的两倍。<p>阳光产量：<font color="#FF0000">双倍<br>只能种在普通向日葵上</font></p>这是一个疯狂的夜晚，禁忌的科学技术，让双子向日葵来到了这个世界。电闪雷鸣，狂风怒吼，都在表示着这个世界对他的拒绝。但是一切都无济于事，双子向日葵他却仍然活着！',
        CanGrow: function(b, a, d) {
            var c = b[1];
            return c && c.EName == "oSunFlower"
        },
        PrivateBirth: function(a) {
            var b = GetX(a.C);
            oSym.addTask(600, function(f, d, c, e) {
                $P[f] && (AppearSun(d, e, 25, 0), AppearSun(c, e, 25, 0), oSym.addTask(2400, arguments.callee, [f, d, c, e]))
            }, [a.id, b - 10, b + 10, GetY(a.R)])
        }
    }),
    oPumpkinHead = InheritO(CPlants, {
        EName: "oPumpkinHead",
        CName: "南瓜头",
        width: 97,
        height: 67,
        beAttackedPointL: 15,
        beAttackedPointR: 82,
        SunNum: 125,
        PKind: 2,
        HP: 4000,
        coolTime: 0,
        zIndex: 1,
        PicArr: ["images/Card/Plants/PumpkinHead.png", "images/Card/Plants/PumpkinHeadG.png", "images/Plants/PumpkinHead/PumpkinHead.gif", "images/Plants/PumpkinHead/PumpkinHead1.gif", "images/Plants/PumpkinHead/PumpkinHead2.gif", "images/Plants/PumpkinHead/pumpkin_damage1.gif", "images/Plants/PumpkinHead/pumpkin_damage2.gif", "images/Plants/PumpkinHead/Pumpkin_back.gif"],
        Tooltip: "能保护种在里面的植物",
        Produce: '南瓜头，可以用他的外壳保护其他植物。<p>韧性：<font color="#FF0000">高</font><br>特点：<font color="#FF0000">可以种在其他植物上</font></p>南瓜头最近都没收到，关于他表哥刃菲尔德的消息。很明显，刃菲尔德是个大明星，是一种……叫什么运动来着……的体育明星？佩格跳跳球大师？南瓜头反正搞不懂是什么运动，他只想做好他自己的工作。',
        CanGrow: function(c, b, d) {
            var a = b + "_" + d;
            return c[2] ? 1 : oGd.$LF[b] == 1 ? !(d < 1 || d > 9 || oGd.$Crater[a] || oGd.$Tombstones[a]) : c[0]
        },
        GetDY: function(b, c, a) {
            return a[0] ? -12 : -5
        },
        HurtStatus: 0,
        getHurt: function(e, c, b) {
            var d = this,
                f = d.id,
                a = $(f);
            switch (true) {
                case c && c < 3:
                    d.Die(1);
                    break;
                case (d.HP -= b) < 1:
                    d.Die();
                    break;
                case d.HP < 1334:
                    d.HurtStatus < 2 && (d.HurtStatus = 2, a.childNodes[1].src = "images/Plants/PumpkinHead/pumpkin_damage2.gif");
                    break;
                case d.HP < 2667:
                    d.HurtStatus < 1 && (d.HurtStatus = 1, a.childNodes[1].src = "images/Plants/PumpkinHead/pumpkin_damage1.gif", $(f + "_2").src = "images/Plants/PumpkinHead/Pumpkin_back.gif")
            }
        },
        InitTrigger: function() {},
        BirthStyle: function(c, d, b, a) {
            b.childNodes[1].src = "images/Plants/PumpkinHead/PumpkinHead1.gif";
            EditEle(b, {
                id: d
            }, a, EDAll);
            NewImg(d + "_2", "images/Plants/PumpkinHead/PumpkinHead2.gif", "left:" + c.pixelLeft + "px;top:" + c.pixelTop + "px;z-index:" + (c.zIndex - 2), EDAll)
        },
        PrivateDie: function(a) {
            ClearChild($(a.id + "_2"))
        }
    }),
    oFlowerPot = InheritO(CPlants, {
        EName: "oFlowerPot",
        CName: "花盆",
        width: 72,
        height: 68,
        beAttackedPointR: 52,
        SunNum: 25,
        PicArr: ["images/Card/Plants/FlowerPot.png", "images/Card/Plants/FlowerPotG.png", "images/Plants/FlowerPot/FlowerPot.gif"],
        PKind: 0,
        Stature: -1,
        GetDY: function(b, c, a) {
            return 6
        },
        CanGrow: function(e, d, f) {
            var c = d + "_" + f,
                b = oGd.$LF[d],
                a = f < 1 || f > 9;
            return b % 2 ? b < 3 ? !(a || e[1] || e[2] || e[0] || oGd.$Crater[c] || oGd.$Tombstones[c]) : !(a || e[0] || oGd.$Crater[c]) : 0
        },
        Tooltip: "可以让植物栽种在屋顶上",
        Produce: '花盆可以让你在屋顶上种植植物。<p>特点：<font color="#FF0000">允许你在屋顶上种植</font></p>“我是一个让植物栽种的花盆，但我也是一棵植物。是不是很意外？',
        InitTrigger: function() {}
    }),
    oLilyPad = InheritO(oFlowerPot, {
        EName: "oLilyPad",
        CName: "睡莲",
        width: 79,
        height: 58,
        beAttackedPointR: 59,
        PicArr: ["images/Card/Plants/LilyPad.png", "images/Card/Plants/LilyPadG.png", "images/Plants/LilyPad/LilyPad.gif"],
        CanGrow: function(c, b, d) {
            var a = b + "_" + d;
            return !(d < 1 || d > 9 || oGd.$LF[b] - 2 || c[0] || oGd.$Crater[a])
        },
        Tooltip: "使你能够将非水生植物种在上面",
        Produce: '睡莲可以让你种植非水生植物在它上面。<p>特点：<font color="#FF0000">非水生植物可以种植在它上面<br>必须种植在水面</font></p>睡莲从不抱怨，它也从来不想知道发生了什么事。在它身上种植物，它也不会说什么。难道，它有什么惊奇想法或者可怕的秘密？没人知道。睡莲把这些都埋藏在心底。'
    }),
    oPotatoMine = InheritO(CPlants, {
        EName: "oPotatoMine",
        CName: "土豆雷",
        width: 75,
        height: 55,
        beAttackedPointR: 55,
        SunNum: 0,
        coolTime: 0,
        Stature: -1,
        CanGrow: function(d, c, e) {
            var b = c + "_" + e,
                a = oGd.$LF[c];
            return a % 2 ? a < 3 ? !(e < 1 || e > 9 || d[1] || oGd.$Crater[b] || oGd.$Tombstones[b]) : d[0] && !d[1] : 0
        },
        PicArr: ["images/Card/Plants/PotatoMine.png", "images/Card/Plants/PotatoMineG.png", "images/Plants/PotatoMine/PotatoMine.gif", "images/Plants/PotatoMine/PotatoMineNotReady.gif", "images/Plants/PotatoMine/PotatoMine_mashed.gif", "images/Plants/PotatoMine/ExplosionSpudow.gif"],
        Tooltip: "敌人接触后爆炸<br>需要时间安放",
        Produce: '土豆雷具有强大的威力，但是他们需要点时间来武装自己。你应把他们种在僵尸前进的路上，当他们一被接触就会发生爆炸。<p>伤害：<font color="FF0000">巨大</font><br>范围：<font color="#FF0000">一个小区域内的所有僵尸</font><br>使用方法：<font color="#FF0000">单独使用，需要一定准备时间才能起作用。</font></p>一些人说土豆雷很懒，因为他总是把所有事情留到最后。土豆雷才没空理他们，他正忙着考虑他的投资战略呢。',
        Status: 0,
        canTrigger: 0,
        BirthStyle: function(c, d, b, a) {
            b.childNodes[1].src = "images/Plants/PotatoMine/PotatoMineNotReady.gif";
            EditEle(b, {
                id: d
            }, a, EDAll)
        },
        PrivateBirth: function(a) {
            oSym.addTask(1500, function(c) {
                var b = $P[c];
                b && ($(c).childNodes[1].src = "images/Plants/PotatoMine/PotatoMine.gif", b.Status = 1, b.canTrigger = 1, b.getHurt = function(g, e, d) {
                    var f = this;
                    e > 2 ? (f.HP -= d) < 1 && f.Die() : f.NormalAttack(f.pixelLeft, f.pixelLeft + f.width, f.R)
                })
            }, [a.id])
        },
        getTriggerRange: function(a, b, c) {
            return [
                [b, c, 0]
            ]
        },
        TriggerCheck: function(e, c) {
            var a = this.R,
                b = this.C;
            e.beAttacked && e.Altitude < 2 && !oGd.$[a + "_" + b + "_2"] && this.NormalAttack(this.pixelLeft, this.pixelLeft + this.width, this.R)
        },
        NormalAttack: function(k, j, f) {
            var h = this,
                b = h.id,
                d = $(b),
                c = oZ.getArZ(k, j, f),
                g = c.length,
                a, l = h.pixelLeft,
                e = h.pixelTop;
            while (g--) {
                (a = c[g]).Altitude < 2 && a.getHurt(0, 0, 1800, 0, 0, 0, 2)
            }
            h.Die(1);
            EditEle(d.childNodes[1], {
                src: "images/Plants/PotatoMine/PotatoMine_mashed.gif"
            }, {
                width: "132px",
                height: "93px",
                left: "-40px",
                top: "-20px"
            });
            NewImg(0, "images/Plants/PotatoMine/ExplosionSpudow.gif", "left:-90px;top:-40px", d);
            oSym.addTask(200, function(i) {
                ClearChild(i.lastChild);
                oSym.addTask(100, ClearChild, [i])
            }, [d])
        }
    }),
    oTorchwood = InheritO(CPlants, {
        EName: "oTorchwood",
        CName: "火炬树桩",
        width: 73,
        height: 83,
        beAttackedPointR: 53,
        SunNum: 0,
        PicArr: ["images/Card/Plants/Torchwood.png", "images/Card/Plants/TorchwoodG.png", "images/Plants/Torchwood/Torchwood.gif", "images/Plants/PB00.gif", "images/Plants/PB01.gif", "images/Plants/PB10.gif", "images/Plants/PB11.gif", "images/Plants/Torchwood/SputteringFire.gif"],
        Tooltip: "通过火炬树桩的豌豆将变为火球",
        Produce: '火炬树桩可以把穿过他的豌豆变成火球，可以造成两倍伤害。<p>特点：<font color="#FF0000">让穿过他的火球造成两倍伤害。火球也会对附近僵尸造成溅射伤害</font></p>每个人都喜欢并敬重火炬树桩。他们喜欢他的诚实和坚贞的友谊，以及增强豌豆伤害的能力。但他也有自己的秘密：他不识字！',
        PrivateBirth: function(a) {
            oGd.$Torch[a.R + "_" + a.C] = 1
        },
        InitTrigger: function() {},
        PrivateDie: function(a) {
            delete oGd.$Torch[a.R + "_" + a.C]
        }
    }),
    oWallNut = InheritO(CPlants, {
        EName: "oWallNut",
        CName: "坚果墙",
        width: 65,
        height: 73,
        beAttackedPointR: 45,
        SunNum: 0,
        HP: 4000,
        coolTime: 0,
        PicArr: ["images/Card/Plants/WallNut.png", "images/Card/Plants/WallNutG.png", "images/Plants/WallNut/WallNut.gif", "images/Plants/WallNut/Wallnut_cracked1.gif", "images/Plants/WallNut/Wallnut_cracked2.gif"],
        Tooltip: "阻碍僵尸前进, 并保护你其他的植物",
        Produce: '坚果墙拥有足以让你用来保护其它植物的坚硬外壳。<p>韧性：<font color="FF0000">高</font></p>坚果墙：“人们想知道，经常被僵尸啃的感觉怎样？他们不知道，我有限的感官，只能让我感到一种麻麻的感觉，像是，令人放松的背部按摩。”',
        CanGrow: function(c, b, e) {
            var a = b + "_" + e,
                d = c[1];
            return d && d.EName == "oWallNut" ? 1 : oGd.$LF[b] == 1 ? !(e < 1 || e > 9 || oGd.$Crater[a] || oGd.$Tombstones[a] || d) : c[0] && !d
        },
        InitTrigger: function() {},
        HurtStatus: 0,
        getHurt: function(e, b, a) {
            var c = this,
                d = $(c.id).childNodes[1];
            !(b % 3) ? (c.HP -= a) < 1 ? c.Die() : c.HP < 1334 ? c.HurtStatus < 2 && (c.HurtStatus = 2, d.src = "images/Plants/WallNut/Wallnut_cracked2.gif") : c.HP < 2667 && c.HurtStatus < 1 && (c.HurtStatus = 1, d.src = "images/Plants/WallNut/Wallnut_cracked1.gif"): c.Die(1)
        }
    }),
    oTallNut = InheritO(oWallNut, {
        EName: "oTallNut",
        CName: "高坚果",
        width: 83,
        height: 119,
        beAttackedPointR: 63,
        SunNum: 0,
        HP: 8000,
        PicArr: ["images/Card/Plants/TallNut.png", "images/Card/Plants/TallNutG.png", "images/Plants/TallNut/TallNut.gif", "images/Plants/TallNut/TallnutCracked1.gif", "images/Plants/TallNut/TallnutCracked2.gif"],
        Tooltip: "不会被跳过的坚实壁垒",
        Produce: '高坚果是重型壁垒植物，而且不会被跨过。<p>韧性：<font color="#FF0000">非常高</font><br>特殊：<font color="#FF0000">不会被跨过或越过</font></p>人们想知道，坚果墙和高坚果是否在竞争。高坚果以男中音的声调大声笑了。“我们之间怎么会存在竞争关系？我们是哥们儿。你知道坚果墙为我做了什么吗……”高坚果的声音越来越小，他狡黠地笑着。”',
        CanGrow: function(c, b, e) {
            var a = b + "_" + e,
                d = c[1];
            return d && d.EName == "oTallNut" ? 1 : oGd.$LF[b] == 1 ? !(e < 1 || e > 9 || oGd.$Crater[a] || oGd.$Tombstones[a] || d) : c[0] && !d
        },
        Stature: 1,
        getHurt: function(e, b, a) {
            var c = this,
                d = $(c.id).childNodes[1];
            !(b % 3) ? (c.HP -= a) < 1 ? c.Die() : c.HP < 2667 ? c.HurtStatus < 2 && (c.HurtStatus = 2, d.src = "images/Plants/TallNut/TallnutCracked2.gif") : c.HP < 5333 && c.HurtStatus < 1 && (c.HurtStatus = 1, d.src = "images/Plants/TallNut/TallnutCracked1.gif"): c.Die(1)
        }
    }),
    oCherryBomb = InheritO(CPlants, {
        EName: "oCherryBomb",
        CName: "樱桃炸弹",
        width: 112,
        height: 81,
        beAttackedPointR: 92,
        SunNum: 0,
        coolTime: 0,
        PicArr: ["images/Card/Plants/CherryBomb.png", "images/Card/Plants/CherryBombG.png", "images/Plants/CherryBomb/CherryBomb.gif", "images/Plants/CherryBomb/Boom.gif"],
        Tooltip: "炸掉一定区域内的所有僵尸",
        Produce: '樱桃炸弹，能炸掉一定区域内所有僵尸。他们一种下就会立刻引爆。所以请把他们种在僵尸们的身边。<p>伤害：<font color="#FF0000">巨大</font><br>范围：<font color="#FF0000">一个中等区域内的所有僵尸</font><br>使用方法：<font color="#FF0000">单独使用，立即爆炸</font></p>“我要‘爆’开了。”樱桃一号说。“不，我们是要‘炸’开了！”它哥哥樱桃二号说。经过激烈的商议之后，他们才统一“爆炸这个说法。”',
        InitTrigger: function() {},
        getHurt: function() {},
        PrivateBirth: function(a) {
            oSym.addTask(63, function(b) {
                var c = $P[b];
                if (c) {
                    var f = $(b),
                        j = c.R,
                        g = j > 2 ? j - 1 : 1,
                        e = j < oS.R ? j + 1 : oS.R,
                        l = c.pixelLeft - 80,
                        k = c.pixelLeft + 160,
                        d, h;
                    do {
                        h = (d = oZ.getArZ(l, k, g)).length;
                        while (h--) {
                            d[h].getHurt(0, 0, 1800, 0, 0, 0, 1)
                        }
                    } while (g++ < e);
                    c.Die(1);
                    EditEle(f.childNodes[1], {
                        src: "images/Plants/CherryBomb/Boom.gif"
                    }, {
                        width: "213px",
                        height: "160px",
                        left: "-50px",
                        top: "-30px"
                    });
                    oSym.addTask(65, ClearChild, [f])
                }
            }, [a.id])
        }
    }),
    oJalapeno = InheritO(oCherryBomb, {
        EName: "oJalapeno",
        CName: "火爆辣椒",
        width: 68,
        height: 89,
        beAttackedPointR: 48,
        PicArr: ["images/Card/Plants/Jalapeno.png", "images/Card/Plants/JalapenoG.png", "images/Plants/Jalapeno/Jalapeno.gif", "images/Plants/Jalapeno/JalapenoAttack.gif"],
        Tooltip: "消灭整行的敌人",
        Produce: '火爆辣椒可以摧毁一整条线上的敌人。<p>伤害：<font color="#FF0000">极高</font><br>范围：<font color="#FF0000">整条线上的僵尸</font><br>用法：<font color="#FF0000">单独使用，立即生效</font></p>“嘎嘎嘎嘎嘎嘎嘎！！！”火爆辣椒说。他现在不会爆炸，还不到时候，不过快了，喔~，快了快了，快来了。他知道，他感受到了，他一生都是在等待这个时刻！',
        PrivateBirth: function(a) {
            oSym.addTask(72, function(g) {
                var f = $P[g];
                if (f) {
                    var b = $(g),
                        e = f.R,
                        c = oZ.getArZ(100, oS.W, e),
                        d = c.length;
                    while (d--) {
                        c[d].getHurt(0, 0, 1800, 0, 0, 0, 1)
                    }
                    f.Die(1);
                    EditEle(b.childNodes[1], {
                        src: "images/Plants/Jalapeno/JalapenoAttack.gif"
                    }, {
                        left: 120 - f.pixelLeft + "px",
                        top: "-42px"
                    });
                    oSym.addTask(135, ClearChild, [b])
                }
            }, [a.id])
        }
    }),
    oSpikeweed = InheritO(CPlants, {
        EName: "oSpikeweed",
        CName: "地刺",
        width: 85,
        height: 35,
        beAttackedPointL: 10,
        beAttackedPointR: 75,
        SunNum: 0,
        Stature: -1,
        canEat: 0,
        PicArr: ["images/Card/Plants/Spikeweed.png", "images/Card/Plants/SpikeweedG.png", "images/Plants/Spikeweed/Spikeweed.gif"],
        Attack: 20,
        ArZ: {},
        Tooltip: "扎破轮胎, 也能伤害走在上面的僵尸",
        Produce: '地刺可以扎破轮胎，并对踩到他的僵尸造成伤害<p>伤害：<font color="#FF0000">普通</font><br>范围：<font color="#FF0000">所有踩到他的僵尸</font><br>特点：<font color="#FF0000">不会被僵尸吃掉</font></p>地刺痴迷冰球，他买了包厢的季票。他一直关注着他喜欢的球员，他也始终如一的在赛后清理冰球场。但只有一个问题：他害怕冰球。',
        CanGrow: function(c, b, d) {
            var a = b + "_" + d;
            return !(d < 1 || d > 9 || oGd.$LF[b] - 1 || c[1] || c[0] || oGd.$Crater[a] || oGd.$Tombstones[a])
        },
        getHurt: function(d, b, a) {
            var c = this;
            !(b % 3) ? (c.HP -= a) < 1 && c.Die(): b < 2 ? (d.getHurt(1, 0, 20, 0, 0, 0, 0), c.Die(1)) : (d.HP = d.BreakPoint, d.GoingDie(), c.Die())
        },
        NormalAttack: function(b, a) {
            $Z[b].getHurt(1, 0, this.Attack, 0, 0, 0, 0)
        },
        GetDY: function(b, c, a) {
            return -2
        },
        getTriggerRange: function(a, b, c) {
            return [
                [this.pixelLeft, this.pixelLeft + this.width, 0]
            ]
        },
        TriggerCheck: function(i, h) {
            var c = i.id,
                g = this.ArZ,
                a, b, e, f;
            !g[c] && (a = i.AttackedLX, b = i.AttackedRX, e = this.AttackedLX, f = this.AttackedRX, a <= f && a >= e || b <= f && b >= e || a <= e && b >= f) && this.AttackCheck2(i) && (g[c] = 1, this.NormalAttack(c), oSym.addTask(100, function(d, j) {
                var k = $P[d];
                k && delete k.ArZ[j]
            }, [this.id, c]))
        },
        AttackCheck2: function(a) {
            return a.Altitude == 1 && a.beAttacked
        }
    }),
    oSpikerock = InheritO(oSpikeweed, {
        EName: "oSpikerock",
        CName: "地刺王",
        width: 84,
        height: 43,
        beAttackedPointL: 10,
        beAttackedPointR: 74,
        SunNum: 0,
        coolTime: 0,
        PicArr: ["images/Card/Plants/Spikerock.png", "images/Card/Plants/SpikerockG.png", "images/Plants/Spikerock/Spikerock.gif"],
        Attack: 40,
        Tooltip: "能扎破多个轮胎, 并伤害经过上面的僵尸<br>(需要地刺)",
        Produce: '地刺王可以扎破多个轮胎，并对踩到他的僵尸造成伤害。<p><font color="#FF0000">必须种植在地刺上</font></p>地刺王刚刚从欧洲旅行回来。他玩的很高兴，也认识了很多有趣的人。这些都真的拓展了他的视野——他从来不知道，他们建造了这么大的博物馆，有这么多的画作。这对他来说太惊奇了。',
        CanGrow: function(b, a, d) {
            var c = b[1];
            return c && c.EName == "oSpikeweed"
        },
        GetDY: function(b, c, a) {
            return 0
        },
        getHurt: function(c, b, a) {
            switch (b) {
                case 2:
                    c.HP = c.BreakPoint;
                    c.GoingDie();
                    break;
                case 1:
                    c.getHurt(1, 0, 40, 0, 0, 0, 0)
            }(this.HP -= a) < 1 && this.Die()
        }
    }),
    oGarlic = InheritO(CPlants, {
        EName: "oGarlic",
        CName: "大蒜",
        width: 60,
        height: 59,
        beAttackedPointR: 40,
        SunNum: 0,
        HP: 400,
        PicArr: ["images/Card/Plants/Garlic.png", "images/Card/Plants/GarlicG.png", "images/Plants/Garlic/Garlic.gif", "images/Plants/Garlic/Garlic_body2.gif", "images/Plants/Garlic/Garlic_body3.gif"],
        Tooltip: "将僵尸赶到其它的横行",
        Produce: '大蒜可以让僵尸改变前进的路线。<p>范围：<font color="#FF0000">近距离接触</font><br>特点：<font color="#FF0000">改变僵尸的前进路线</font></p>路线转向，这不仅仅是大蒜的专业，更是他的热情所在。他在布鲁塞尔大学里，获得了转向学的博士学位。他能把路线向量和反击阵列，讲上一整天。他甚至会把家里的东西，推到街上去。不知道为啥，他老婆还可以忍受这些。',
        CanGrow: function(c, b, e) {
            var a = b + "_" + e,
                d = c[1];
            return d && d.EName == "oGarlic" ? 1 : oGd.$LF[b] == 1 ? !(e < 1 || e > 9 || oGd.$Crater[a] || oGd.$Tombstones[a] || d) : c[0] && !d
        },
        InitTrigger: function() {},
        HurtStatus: 0,
        getHurt: function(e, b, a) {
            var c = this,
                d = $(c.id).childNodes[1];
            !(b % 3) ? (c.HP -= 20) < 1 ? c.Die() : (c.ChangeR(c, e), c.HP < 134 ? c.HurtStatus < 2 && (c.HurtStatus = 2, d.src = "images/Plants/Garlic/Garlic_body3.gif") : c.HP < 267 && c.HurtStatus < 1 && (c.HurtStatus = 1, d.src = "images/Plants/Garlic/Garlic_body2.gif")): c.Die(1)
        },
        ChangeR: function(f, a) {
            var d = f.R,
                c = [],
                k = d - 1,
                h, g = a.id,
                i = -1,
                b = $(g),
                j = b.childNodes[1],
                e = oGd.$LF;
            a.CanPass(k, e[k]) && (c[++i] = k);
            a.CanPass(k += 2, e[k]) && (c[++i] = k);
            c.length ? (h = !a.WalkDirection ? -5 : 5, a.ZX += h, a.AttackedLX += h, a.AttackedRX += h, SetStyle(b, {
                left: (a.X += h) + "px",
                top: (a.pixelTop = GetY(k = c[Math.floor(Math.random() * c.length)]) - a.height) + "px",
                zIndex: a.zIndex = 3 * k + 1
            }), j.src = a.PicArr[a.NormalGif], oZ.moveTo(g, d, k)) : j.src = a.PicArr[a.NormalGif];
            a.isAttacking = 0
        }
    }),
    oSquash = InheritO(CPlants, {
        EName: "oSquash",
        CName: "窝瓜",
        width: 100,
        height: 226,
        beAttackedPointR: 67,
        SunNum: 0,
        coolTime: 0,
        PicArr: ["images/Card/Plants/Squash.png", "images/Card/Plants/SquashG.png", "images/Plants/Squash/Squash.gif", "images/Plants/Squash/SquashAttack.gif"],
        Tooltip: "压扁接近的僵尸",
        Produce: '窝瓜会压扁第一个接近它的僵尸。<p>伤害：<font color="#FF0000">极高</font><br>范围：<font color="#FF0000">短，覆盖所有它压到的僵尸。</font><br>用法：<font color="#FF0000">单独使用</font></p>“我准备好了！”窝瓜大吼道，“干吧！！算我一份！没人比我厉害！我就是你要的人！来啊！等啥啊？要的就是这个！”',
        GetDY: function(b, c, a) {
            return a[0] ? -21 : -10
        },
        canTrigger: 0,
        PrivateBirth: function(a) {
            oSym.addTask(100, function(c) {
                var b = $P[c];
                b && (b.canTrigger = 1)
            }, [a.id])
        },
        getHurt: function(d, b, a) {
            var c = this;
            b - 3 ? c.NormalAttack(d) : (c.HP -= a) < 1 && c.Die()
        },
        getTriggerRange: function(a, b, c) {
            return [
                [b - 50, c + 70, 0]
            ]
        },
        TriggerCheck: function(c, b, a) {
            c.beAttacked && c.Altitude > -1 && c.Altitude < 2 && (oT.$[this.R].splice(a, 1), this.NormalAttack(c))
        },
        NormalAttack: function(d) {
            var c = this,
                a = $(c.id),
                b = d.ZX + d.Speed * 4 * (!d.WalkDirection ? -1 : 1) - 50;
            a.childNodes[1].src = "images/Plants/Squash/SquashAttack.gif";
            SetStyle(a, {
                left: b + "px"
            });
            c.Die(1);
            oSym.addTask(45, function(e, k, l, h) {
                var f = oZ.getArZ(k, l, h),
                    g = f.length,
                    j;
                while (g--) {
                    (j = f[g]).Altitude > -1 && j.Altitude < 3 && j.getHurt(0, 0, 1800, 0, 0, 0, 2)
                }
                oSym.addTask(185, ClearChild, [e])
            }, [a, b, b + 100, c.R])
        }
    }),
    oChomper = InheritO(CPlants, {
        EName: "oChomper",
        CName: "大嘴花",
        width: 130,
        height: 114,
        beAttackedPointR: 70,
        SunNum: 0,
        PicArr: ["images/Card/Plants/Chomper.png", "images/Card/Plants/ChomperG.png", "images/Plants/Chomper/Chomper.gif", "images/Plants/Chomper/ChomperAttack.gif", "images/Plants/Chomper/ChomperDigest.gif"],
        Tooltip: "能一口气吞下一只僵尸, 但处于咀嚼状态中十分脆弱",
        Produce: '大嘴花可以一口吞掉一整只僵尸，但是他们消化僵尸的时候很脆弱。<p>伤害：<font color="#FF0000">巨大</font><br>范围：<font color="#FF0000">非常近</font><br>特点：<font color="#FF0000">消化时间很长</font></p>大嘴花几乎可以去“恐怖小店”，来表演它的绝技了，不过他的经纪人压榨了他太多的钱，所以他没去成。尽管如此，大嘴花没有怨言，只说了句这只是交易的一部分。',
        GetDX: function() {
            return -40
        },
        getShadow: function(a) {
            return "top:" + (a.height - 22) + "px"
        },
        getTriggerRange: function(a, b, c) {
            return [
                [this.pixelLeft, c + 80, 0]
            ]
        },
        TriggerCheck: function(a) {
            this.AttackCheck2(a) && (this.canTrigger = 0, this.NormalAttack(this.id, a.id))
        },
        AttackCheck2: function(a) {
            return a.Altitude == 1 && a.beAttacked
        },
        NormalAttack: function(a, b) {
            $(a).childNodes[1].src = "images/Plants/Chomper/ChomperAttack.gif" + $Random + Math.random();
            oSym.addTask(70, function(c, d) {
                var e;
                $P[c] && ((e = $Z[d]) && e.beAttacked ? oSym.addTask(18, function(f) {
                    var g = $P[f];
                    g && ($(f).childNodes[1].src = e.getRaven(f) ? (oSym.addTask(4200, function(h) {
                        var i = $P[h];
                        i && (i.canTrigger = 1, $(h).childNodes[1].src = "images/Plants/Chomper/Chomper.gif")
                    }, [f]), "images/Plants/Chomper/ChomperDigest.gif") : (g.canTrigger = 1, "images/Plants/Chomper/Chomper.gif"))
                }, [c]) : oSym.addTask(18, function(f) {
                    var g = $P[f];
                    g && (g.canTrigger = 1, $(f).childNodes[1].src = "images/Plants/Chomper/Chomper.gif")
                }, [c]))
            }, [a, b])
        }
    }),
    oFumeShroom = InheritO(CPlants, {
        EName: "oFumeShroom",
        CName: "大喷菇",
        width: 100,
        height: 88,
        beAttackedPointR: 80,
        SunNum: 0,
        SleepGif: 3,
        PicArr: ["images/Card/Plants/FumeShroom.png", "images/Card/Plants/FumeShroomG.png", "images/Plants/FumeShroom/FumeShroom.gif", "images/Plants/FumeShroom/FumeShroomSleep.gif", "images/Plants/FumeShroom/FumeShroomAttack.gif", "images/Plants/FumeShroom/FumeShroomBullet.gif"],
        Tooltip: "喷射可以穿过门板的气液",
        Produce: '大喷菇喷出的臭气可以穿透铁丝网门。<p>伤害：<font color="#FF0000">普通，可穿透铁丝网门</font><br>范围：<font color="#FF0000">臭气中的所有僵尸<br>白天睡觉</font></p>“我以前那份没前途的工作，是为一个面包房生产酵母孢，”大喷菇说。“然后小喷菇，上帝保佑它，告诉了我这个喷杀僵尸的机会。现在我真觉得自己完全不同了。”',
        GetDY: function(b, c, a) {
            return a[0] ? -18 : -10
        },
        GetDX: function() {
            return -45
        },
        BirthStyle: function(c, d, b, a) {
            oS.DKind && (c.canTrigger = 0, c.Sleep = 1, b.childNodes[1].src = c.PicArr[c.SleepGif]);
            EditEle(b, {
                id: d
            }, a, EDAll)
        },
        PrivateBirth: function(b) {
            var a = b.id;
            NewEle(a + "_Bullet", "div", "position:absolute;display:none;width:343px;height:62px;left:" + b.AttackedRX + "px;top:" + (b.pixelTop + 5) + "px;background:url(images/Plants/FumeShroom/FumeShroomBullet.gif);z-index:" + (b.zIndex + 1), 0, EDAll)
        },
        PrivateDie: function(a) {
            ClearChild($(a.id + "_Bullet"))
        },
        getTriggerRange: function(a, b, c) {
            return [
                [b, Math.min(c + 330, 900), 0]
            ]
        },
        NormalAttack: function() {
            var f = this,
                d = oZ.getArZ(f.AttackedLX, Math.min(f.AttackedRX + 330, 900), f.R),
                e = d.length,
                g, c = f.id,
                b = $(c),
                a = c + "_Bullet";
            while (e--) {
                (g = d[e]).Altitude < 2 && g.getHurt(0, 0, 20, 0, 0, 0, 0)
            }
            b.childNodes[1].src = "images/Plants/FumeShroom/FumeShroomAttack.gif";
            SetBlock($(a));
            ImgSpriter(a, c, [
                ["0 0", 90, 1],
                ["0 -62px", 90, 2],
                ["0 -124px", 90, 3],
                ["0 -186px", 90, 4],
                ["0 -248px", 90, 5],
                ["0 -310px", 90, 6],
                ["0 -372px", 90, 7],
                ["0 -434px", 90, -1]
            ], 0, function(i, j) {
                var h = $(j);
                $P[j] && (h.childNodes[1].src = "images/Plants/FumeShroom/FumeShroom.gif");
                SetNone($(i))
            })
        }
    }),
    oCoffeeBean = InheritO(CPlants, {
        EName: "oCoffeeBean",
        CName: "咖啡豆",
        width: 39,
        height: 97,
        beAttackedPointL: 10,
        beAttackedPointR: 29,
        SunNum: 0,
        PKind: 3,
        canEat: 0,
        PicArr: ["images/Card/Plants/CoffeeBean.png", "images/Card/Plants/CoffeeBeanG.png", "images/Plants/CoffeeBean/CoffeeBean.gif", "images/Plants/CoffeeBean/CoffeeBeanEat.gif"],
        Tooltip: "唤醒在白天里睡觉的蘑菇类植物",
        Produce: '咖啡豆，可以唤醒睡眠中的蘑菇们。<p>使用方法：<font color="#FF0000">单独使用，立即生效</font><br>特点：<font color="#FF0000">可以种在其他植物上，用来唤醒蘑菇们</font></p>咖啡豆：“嘿，伙计们！嘿，怎么回事？是谁？嘿！你瞧见那个东西没？什么东西？哇！是狮子！”嗯，咖啡豆确定，这样可以让自己很兴奋。',
        InitTrigger: function() {},
        GetDBottom: function() {
            return 49
        },
        GetDY: function() {
            return -30
        },
        CanGrow: function(a, b) {
            return (b = a[1]) && b.Sleep && !a[3]
        },
        BirthStyle: function(c, d, b, a) {
            b.childNodes[1].src = "images/Plants/CoffeeBean/CoffeeBeanEat.gif" + $Random + Math.random();
            EditEle(b, {
                id: d
            }, a, EDAll)
        },
        PrivateBirth: function(a) {
            oSym.addTask(240, function(c) {
                var d = oGd.$[c],
                    b;
                d && (b = d.WakeUP, (!b ? ($(d.id).childNodes[1].src = d.PicArr[d.NormalGif], d.canTrigger = 1, d.Sleep = 0) : b(d)));
                a.Die()
            }, [a.R + "_" + a.C + "_1"])
        }
    }),
    oGloomShroom = InheritO(oFumeShroom, {
        EName: "oGloomShroom",
        CName: "曾哥",
        width: 88,
        height: 83,
        beAttackedPointR: 68,
        SunNum: 0,
        coolTime: 0,
        PicArr: ["images/Card/Plants/GloomShroom.png", "images/Card/Plants/GloomShroomG.png", "images/Plants/GloomShroom/GloomShroom.gif", "images/Plants/GloomShroom/GloomShroomSleep.gif", "images/Plants/GloomShroom/GloomShroomAttack.gif", "images/Plants/GloomShroom/GloomShroomBullet.gif"],
        Tooltip: "围绕自身释放大量绵羊音<br>(需要大喷菇)",
        Produce: '伪娘终结者，喜欢围绕自身释放大量绵羊音<p><font color="#FF0000">必须种植在大喷菇上</font></p>起初人们一直非议他，后来曾哥用自己独特的绵羊音横扫了宇宙拆迁办，全世界都拜倒在他的脚下。“听说有个节目叫‘快男’？”曾哥说，“没有我在他们真应该感到羞愧。”他于是决定明年去看看。',
        CanGrow: function(b, a, d) {
            var c = b[1];
            return c && c.EName == "oFumeShroom"
        },
        BirthStyle: function(c, d, b, a) {
            oGd.$[c.R + "_" + c.C + "_1"].Sleep && (c.canTrigger = 0, c.Sleep = 1, b.childNodes[1].src = c.PicArr[3]);
            EditEle(b, {
                id: d
            }, a, EDAll)
        },
        GetDX: CPlants.prototype.GetDX,
        PrivateBirth: function(b) {
            var a = b.id;
            NewEle(a + "_Bullet", "div", "position:absolute;display:none;width:210px;height:200px;left:" + (b.pixelLeft - 60) + "px;top:" + (b.pixelTop - 65) + "px;background:url(images/Plants/GloomShroom/GloomShroomBullet.gif);z-index:" + (b.zIndex + 1), 0, EDAll)
        },
        PrivateDie: function(a) {
            ClearChild($(a.id + "_Bullet"))
        },
        getTriggerRange: function(c, d, e) {
            var f = GetX(this.C),
                b = this.MinX = f - 120,
                a = this.MaxX = f + 120;
            return [
                [b, a, 0]
            ]
        },
        getTriggerR: function(c) {
            var b = this.MinR = c > 2 ? c - 1 : 1,
                a = this.MaxR = c < oS.R ? c + 1 : c;
            return [b, a]
        },
        NormalAttack: function() {
            var k = this,
                g, f = k.MaxR,
                c = k.MinX,
                b = k.MaxX,
                e, h, a, j = k.id,
                d = $(j),
                l = j + "_Bullet";
            for (g = k.MinR; g <= f; g++) {
                e = oZ.getArZ(c, b, g);
                for (h = e.length; h--;
                    (a = e[h]).Altitude < 2 && a.getHurt(0, 0, 80, 0, 0, 0, 0)) {}
            }
            d.childNodes[1].src = "images/Plants/GloomShroom/GloomShroomAttack.gif";
            SetBlock($(l));
            ImgSpriter(l, j, [
                ["0 0", 90, 1],
                ["0 -200px", 90, 2],
                ["0 -400px", 90, 3],
                ["0 -600px", 90, 4],
                ["0 -800px", 90, 5],
                ["0 -1000px", 90, 6],
                ["0 -1200px", 90, 7],
                ["0 -1400px", 90, 8],
                ["0 -1600px", 90, 9],
                ["0 -1800px", 90, 10],
                ["0 -2000px", 90, 11],
                ["0 -2200px", 90, -1]
            ], 0, function(m, n) {
                var i = $(n);
                $P[n] && (i.childNodes[1].src = "images/Plants/GloomShroom/GloomShroom.gif");
                SetNone($(m))
            })
        }
    }),
    oPuffShroom = InheritO(oFumeShroom, {
        EName: "oPuffShroom",
        CName: "小喷菇",
        width: 40,
        height: 66,
        beAttackedPointL: 15,
        beAttackedPointR: 25,
        SunNum: 0,
        Stature: -1,
        PicArr: ["images/Card/Plants/PuffShroom.png", "images/Card/Plants/PuffShroomG.png", "images/Plants/PuffShroom/PuffShroom.gif", "images/Plants/PuffShroom/PuffShroomSleep.gif", "images/Plants/ShroomBullet.gif", "images/Plants/ShroomBulletHit.gif"],
        Tooltip: "向敌人发射短程孢子",
        Produce: '小喷菇是免费的，不过射程很近。<p>伤害：<font color="#FF0000">中等</font><br>范围：<font color="#FF0000">近<br>白天要睡觉</font></p>小喷菇：“我也是最近才知道僵尸的存在，和很多蘑菇一样，我只是把他们想象成童话和电影里的怪物。不过这次的经历已经让我大开眼界了。',
        GetDX: CPlants.prototype.GetDX,
        getTriggerRange: function(a, b, c) {
            return [
                [b, Math.min(c + 250, 900), 0]
            ]
        },
        PrivateBirth: function(c) {
            var b = c.AttackedLX,
                a = b - 46;
            c.BulletClass = NewO({
                X: b,
                R: c.R,
                pixelLeft: a,
                F: oGd.MB2
            });
            c.BulletEle = NewImg(0, "images/Plants/ShroomBullet.gif", "left:" + a + "px;top:" + (c.pixelTop + 40) + "px;display:none;z-index:" + (c.zIndex + 2))
        },
        PrivateDie: function(a) {
            a.BulletEle = null
        },
        NormalAttack: function() {
            var b = this,
                a = new b.BulletClass,
                c = a.id = "PSB" + Math.random();
            EditEle(b.BulletEle.cloneNode(false), {
                id: c
            }, 0, EDAll);
            oGd.$B.push(a);
            oSym.addTask(15, function(e) {
                var d = $(e);
                d && SetBlock(d)
            }, [c])
        }
    }),
    oScaredyShroom = InheritO(oFumeShroom, {
        EName: "oScaredyShroom",
        CName: "胆小菇",
        width: 57,
        height: 81,
        beAttackedPointR: 37,
        SunNum: 0,
        Cry: 0,
        ArZ: [],
        Attacking: 0,
        PicArr: ["images/Card/Plants/ScaredyShroom.png", "images/Card/Plants/ScaredyShroomG.png", "images/Plants/ScaredyShroom/ScaredyShroom.gif", "images/Plants/ScaredyShroom/ScaredyShroomSleep.gif", "images/Plants/ScaredyShroom/ScaredyShroomCry.gif", "images/Plants/ShroomBullet.gif", "images/Plants/ShroomBulletHit.gif"],
        Tooltip: "远程射手, 但敌人靠近时会蜷缩不动",
        Produce: '胆小菇是一种远程射手，敌人接近后会躲起来。<p>伤害：<font color="#FF0000">普通</font><br>特点：<font color="#FF0000">敌人接近后就停止攻击<br>白天睡觉</font></p>“谁在那？”胆小菇低声说，声音细微难辨。“走开！我不想见任何人。除非……除非你是马戏团的人。”',
        GetDX: CPlants.prototype.GetDX,
        getTriggerRange: CPlants.prototype.getTriggerRange,
        getTriggerR: function(c) {
            var b = this.MinR = c > 2 ? c - 1 : 1,
                a = this.MaxR = c < oS.R ? c + 1 : c;
            return [b, a]
        },
        TriggerCheck: function(e, c) {
            var b = this,
                a = b.id;
            Math.abs(e.ZX - b.MX) < 121 && e.beAttacked ? (b.ArZ.push(e.id), !b.Cry && (b.Cry = 1, $(a).childNodes[1].src = "images/Plants/ScaredyShroom/ScaredyShroomCry.gif", b.CryCheck(a))) : (!b.Cry && !b.Attacking && e.Altitude > 0 && e.Altitude < 3 && b.NormalAttack())
        },
        PrivateBirth: function(c) {
            var b = c.AttackedLX,
                a = b - 46;
            c.BulletClass = NewO({
                X: b,
                R: c.R,
                pixelLeft: a,
                F: oGd.MB2
            });
            c.BulletEle = NewImg(0, "images/Plants/ShroomBullet.gif", "left:" + a + "px;top:" + (c.pixelTop + 35) + "px;display:none;z-index:" + (c.zIndex + 2));
            c.MX = b + 9
        },
        PrivateDie: function(a) {
            a.BulletEle = null
        },
        NormalAttack: function() {
            var c = this,
                a = c.id,
                b = new c.BulletClass,
                d = b.id = "SSB" + Math.random();
            EditEle(c.BulletEle.cloneNode(false), {
                id: d
            }, 0, EDAll);
            oGd.$B.push(b);
            c.Attacking = 1;
            oSym.addTask(10, function(g, e) {
                var f = $(g);
                f && SetBlock(f);
                oSym.addTask(130, function(h) {
                    var i = $P[h];
                    i && (i.Attacking = 0)
                }, [e])
            }, [d, a])
        },
        CryCheck: function(a) {
            oSym.addTask(140, function(b) {
                var d = $P[b],
                    c, f, e;
                if (d) {
                    c = (f = d.ArZ).length;
                    while (c--) {
                        (!(e = $Z[f[c]]) || Math.abs(e.ZX - d.MX) > 120) && f.splice(c, 1)
                    }
                    f.length ? d.CryCheck(b) : (d.Cry = 0, $(b).childNodes[1].src = "images/Plants/ScaredyShroom/ScaredyShroom.gif")
                }
            }, [a])
        }
    }),
    oSunShroom = InheritO(oFumeShroom, {
        EName: "oSunShroom",
        CName: "阳光菇",
        width: 59,
        height: 61,
        beAttackedPointL: 15,
        beAttackedPointR: 44,
        SunNum: 0,
        Stature: -1,
        Status: 0,
        PicArr: ["images/Card/Plants/SunShroom.png", "images/Card/Plants/SunShroomG.png", "images/Plants/SunShroom/SunShroom2.gif", "images/Plants/SunShroom/SunShroomSleep.gif", "images/Plants/SunShroom/SunShroom.gif"],
        Tooltip: "开始提供少量的阳光, 一段时间后提供正常量的阳光",
        Produce: '阳光菇开始提供少量阳光，稍后提供正常数量阳光。<p>生产阳光：<font color="#FF0000">开始低，之后正常<br>白天睡觉</font></p>阳光菇讨厌阳光。恨到当它内部产生点阳光时，就尽可能快的吐出来。它就是不能忍受这个。对它来说，阳光令人厌恶。',
        GetDX: CPlants.prototype.GetDX,
        GetDY: CPlants.prototype.GetDY,
        InitTrigger: function() {},
        PrivateDie: function(a) {},
        PrivateBirth: function() {},
        BirthStyle: function(c, d, b, a) {
            oS.DKind ? (c.canTrigger = 0, c.Sleep = 1, b.childNodes[1].src = "images/Plants/SunShroom/SunShroomSleep.gif") : (oSym.addTask(600, function(h, g, f) {
                var e = $P[h];
                e && e.ProduceSun(e, g, f)
            }, [d, GetX(c.C) - 40, GetY(c.R)]), oSym.addTask(12000, function(f) {
                var e = $P[f];
                e && (e.Sleep = 0, $(f).childNodes[1].src = "images/Plants/SunShroom/SunShroom.gif", e.Status = 1)
            }, [d]));
            EditEle(b, {
                id: d
            }, a, EDAll)
        },
        ProduceSun: function(a, c, b) {
            AppearSun(Math.floor(c + Math.random() * 41), b, !a.Status ? 15 : 25, 0), oSym.addTask(2400, function(g, f, e) {
                var d = $P[g];
                d && d.ProduceSun(d, f, e)
            }, [a.id, c, b])
        },
        WakeUP: function(a) {
            var b = a.id;
            a.ProduceSun(a, GetX(a.C) - 40, GetY(a.R));
            $(b).childNodes[1].src = "images/Plants/SunShroom/SunShroom2.gif";
            a.Sleep = 0;
            oSym.addTask(12000, function(d) {
                var c = $P[d];
                c && ($(d).childNodes[1].src = "images/Plants/SunShroom/SunShroom.gif", c.Status = 1)
            }, [b])
        }
    });
