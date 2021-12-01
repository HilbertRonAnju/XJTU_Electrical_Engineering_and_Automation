var CZombies = function(b, a) {
        return (a = function() {}).prototype = {
            name: "Zombies",
            HP: 300,
            Lvl: 1,
            NormalGif: 0,
            AttackGif: 1,
            LostHeadGif: 2,
            LostHeadAttackGif: 3,
            HeadGif: 4,
            DieGif: 5,
            BoomDieGif: 6,
            width: 166,
            height: 144,
            beAttackedPointL: 82,
            beAttackedPointR: 156,
            BreakPoint: 90,
            Ornaments: 0,
            OrnHP: 0,
            OSpeed: 1.6,
            Speed: 1.6,
            AKind: 0,
            beAttacked: 1,
            isAttacking: 0,
            Attack: 100,
            WalkDirection: 0,
            Altitude: 1,
            canSlow: 1,
            canFreeze: 1,
            canSputtering: 1,
            canRaven: 1,
            canSetbody: 1,
            FreeSetbodyTime: "",
            FreeFreezeTime: "",
            FreeSlowTime: "",
            CanPass: function(d, c) {
                return c && c != 2
            },
            GetDY: -10,
            getRaven: function(c) {
                return this.Die(2), 1
            },
            getShadow: function(c) {
                return "left:" + (c.beAttackedPointL - 10) + "px;top:" + (c.height - 22) + "px"
            },
            Init: function(g, j, e, d) {
                var c = 0,
                    h = this,
                    f = [];
                j.AttackedRX = (j.X = (j.ZX = j.AttackedLX = g) - j.beAttackedPointL) + j.beAttackedPointR;
                while (--d) {
                    j.CanPass(d, e[d]) && (f[c++] = d)
                }
                j.ArR = f;
                j.ArHTML = ['<div id="', '" style="position:absolute;visibility:', ";left:", "px;top:", "px;z-index:", '"><img src="' + ShadowPNG + '" style="' + j.getShadow(j) + '"><img style="position:absolute;clip:rect(0,auto,', ",0);top:", 'px" src="' + j.PicArr[j.NormalGif] + '"></div>']
            },
            getHTML: function(k, f, e, j, h, c, d) {
                var g = this.ArHTML;
                return g[0] + k + g[1] + h + g[2] + f + g[3] + e + g[4] + j + g[5] + c + g[6] + d + g[7]
            },
            getVisible: "visible",
            prepareBirth: function(f) {
                var h = this,
                    e = h.ArR,
                    d = e[Math.floor(Math.random() * e.length)],
                    g = GetY(d) + h.GetDY,
                    c = g - h.height,
                    k = 3 * d + 1,
                    j = h.id = "Z_" + Math.random();
                h.R = d;
                h.pixelTop = c;
                h.zIndex = k;
                (h.delayT = f) && (h.FreeSetbodyTime = oSym.Now);
                return h.getHTML(j, h.X, c, k, h.getVisible, "auto", 0)
            },
            CustomBirth: function(j, c, d) {
                var g = this,
                    f = GetY(j) + g.GetDY,
                    h = f - g.height,
                    l = 3 * j + 1,
                    e = g.id = "Z_" + Math.random(),
                    m = g.beAttackedPointL,
                    k = g.beAttackedPointR;
                g.AttackedRX = (g.X = (g.ZX = g.AttackedLX = GetX(c) - (k - m) * 0.5) - m) + k;
                g.R = j;
                g.pixelTop = h;
                g.zIndex = l;
                (g.delayT = d) && (g.FreeSetbodyTime = oSym.Now);
                return g.getHTML(e, g.X, h, l, g.getVisible, 0, g.height + "px")
            },
            BirthCallBack: function(d) {
                var c = d.delayT;
                c && oSym.addTask(c, function(e) {
                    e.FreeSetbodyTime = ""
                }, [d])
            },
            Birth: function() {
                var c = this;
                oZ.add($Z[c.id] = c);
                c.BirthCallBack(c)
            },
            Die: function(d) {
                var e = this,
                    f = e.id,
                    c = $(f);
                !d ? (c.childNodes[1].src = e.PicArr[e.DieGif] + Math.random(), oSym.addTask(250, ClearChild, [c])) : d < 2 ? (c.childNodes[1].src = e.PicArr[e.BoomDieGif] + Math.random(), oSym.addTask(300, ClearChild, [c])) : ClearChild(c);
                e.HP = 0;
                delete $Z[f];
                oP.MonPrgs()
            },
            GoingDieHead: function(e, c, d) {
                oSym.addTask(200, ClearChild, [NewImg(0, c[d.HeadGif] + Math.random(), "left:" + d.AttackedLX + "px;top:" + (d.pixelTop - 20) + "px;z-index:" + d.zIndex, EDAll)])
            },
            GoingDie: function(d) {
                var c = this,
                    e = c.id;
                $(e).childNodes[1].src = d;
                c.GoingDieHead(e, c.PicArr, c);
                c.beAttacked = 0;
                c.FreeFreezeTime = c.FreeSetbodyTime = c.FreeSlowTime = "";
                c.AutoReduceHP(e)
            },
            AutoReduceHP: function(c) {
                oSym.addTask(100, function(e) {
                    var d = $Z[e];
                    d && ((d.HP -= 60) < 1 ? d.Die() : d.AutoReduceHP(e))
                }, [c])
            },
            JudgeAttack: function() {
                var g = this,
                    d = g.ZX,
                    e = g.R + "_",
                    f = GetC(d),
                    h = oGd.$,
                    c;
                (c = g.JudgeLR(g, e, f, d, h) || g.JudgeSR(g, e, f, d, h)) ? c[0](c[1], c[2]): g.isAttacking && (g.isAttacking = 0, $(g.id).childNodes[1].src = g.PicArr[g.NormalGif])
            },
            JudgeLR: function(f, d, e, c, g) {
                return e > 10 || e < 1 ? false : function() {
                    d += --e + "_";
                    var h = 3,
                        k;
                    while (h--) {
                        if ((k = g[d + h]) && k.canEat && k.AttackedRX >= c && k.AttackedLX <= c) {
                            return [f.NormalAttack, f.id, k.id]
                        }
                    }
                }()
            },
            JudgeSR: function(f, d, e, c, g) {
                return e > 9 || e < 1 ? false : function() {
                    d += e + "_";
                    var h = 3,
                        k;
                    while (h--) {
                        if ((k = g[d + h]) && k.canEat && k.AttackedRX >= c && k.AttackedLX <= c) {
                            return [f.NormalAttack, f.id, k.id]
                        }
                    }
                }()
            },
            NormalAttack: function(d, c) {
                var e = $Z[d];
                e && !e.isAttacking && (e.isAttacking = 1, $(d).childNodes[1].src = e.PicArr[e.AttackGif]);
                oSym.addTask(100, function(g, f) {
                    var j = $Z[g],
                        h;
                    j && j.beAttacked && !j.FreeFreezeTime && !j.FreeSetbodyTime && ((h = $P[f]) && h.getHurt(j, j.AKind, !j.FreeSlowTime ? j.Attack : Math.round(j.Attack * 0.5)), j.JudgeAttack())
                }, [d, c])
            }
        }, a
    }(),
    OrnNoneZombies = InheritO(CZombies, {
        getHurt: function(l, a, j, q, c, n, m) {
            var e = this;
            if (!e.beAttacked) {
                m && e.Die(2);
                return
            }
            var f, h, b = e.id,
                k = e.HP,
                d = e.PicArr,
                g = e.isAttacking;
            switch (true) {
                case (k -= j) < 1:
                    e.HP = 0;
                    e.Die(m);
                    return;
                case k < 91:
                    e.HP = k;
                    e.GoingDie(d[[e.LostHeadGif, e.LostHeadAttackGif][g]]);
                    return;
                default:
                    e.HP = k;
                    switch (q) {
                        case 0:
                            break;
                        case -1:
                            e.canSlow && (!e.FreeSlowTime && (e.Speed *= 0.5), oSym.addTask(1000, function(o, s, r) {
                                (r = $Z[o]) && s == r.FreeSlowTime && (r.FreeSlowTime = "", r.Speed = r.OSpeed)
                            }, [b, e.FreeSlowTime = oSym.Now]));
                            break;
                        default:
                            e.FreeSlowTime && (e.FreeSlowTime = "", e.Speed = e.OSpeed);
                            if (e.canSputtering) {
                                f = !a ? oZ.getArZ(e.AttackedLX, e.AttackedLX + 40, e.R) : oZ.getArZ(e.AttackedRX - 40, e.AttackedRX, e.R);
                                for (h = f.length; h--; f[h].canSputtering && f[h].getHurt(1, 0, 13, 0, 0, 0, 0)) {}
                            }
                    }
                    SetAlpha($(b).childNodes[1], 50, 0.5);
                    oSym.addTask(10, function(o) {
                        $Z[o] && SetAlpha($(o).childNodes[1], 100, 1)
                    }, [b])
            }
        }
    }),
    oZombie = InheritO(OrnNoneZombies, {
        EName: "oZombie",
        CName: "领带僵尸",
        PicArr: (function() {
            var a = "images/Zombies/Zombie/";
            return [a + "Zombie.gif", a + "ZombieAttack.gif", a + "ZombieLostHead.gif", a + "ZombieLostHeadAttack.gif", a + "ZombieHead.gif" + $Random, a + "ZombieDie.gif" + $Random, a + "BoomDie.gif" + $Random]
        })(),
        Produce: '普通僵尸<p>韧性：<font color="#FF0000">低</font></p>这种僵尸喜爱脑髓，贪婪而不知足。脑髓，脑髓，脑髓，夜以继日地追求着。老而臭的脑髓？腐烂的脑髓？都没关系。僵尸需要它们。'
    }),
    oFlagZombie = InheritO(oZombie, {
        EName: "oFlagZombie",
        CName: "旗帜僵尸",
        OSpeed: 2.2,
        Speed: 2.2,
        beAttackedPointR: 101,
        Produce: '旗帜僵尸标志着即将来袭的一大堆僵尸"流"。<p>韧性：<font color="#FF0000">低</font></p>毫无疑问，摇旗僵尸喜爱脑髓。但在私下里他也迷恋旗帜。也许是因为旗帜上也画有脑子吧，这很难说。'
    }, {
        PicArr: {
            0: "images/Zombies/FlagZombie/FlagZombie.gif",
            1: "images/Zombies/FlagZombie/FlagZombieAttack.gif",
            2: "images/Zombies/FlagZombie/FlagZombieLostHead.gif",
            3: "images/Zombies/FlagZombie/FlagZombieLostHeadAttack.gif"
        }
    }),
    OrnIZombies = InheritO(CZombies, {
        Ornaments: 1,
        OrnLostNormalGif: 7,
        OrnLostAttackGif: 8,
        getHurt: function(j, a, g, n, c, l, k) {
            var e = this;
            if (!e.beAttacked) {
                k && e.Die(2);
                return
            }
            var b = e.id,
                m = e.OrnHP,
                h = e.HP,
                f = e.isAttacking,
                d = e.PicArr;
            switch (true) {
                case !m:
                    switch (true) {
                        case (h -= g) < 1:
                            e.HP = 0;
                            e.Die(k);
                            return;
                        case h < 91:
                            e.HP = h;
                            e.GoingDie(d[[e.LostHeadGif, e.LostHeadAttackGif][f]]);
                            return
                    }
                    e.HP = h;
                    break;
                case (m -= g) > 0:
                    e.OrnHP = m;
                    break;
                case m < 0:
                    switch (true) {
                        case (h += m) < 1:
                            e.HP = 0;
                            e.Die(k);
                            return;
                        case h < 91:
                            e.HP = h;
                            e.GoingDie(d[[e.LostHeadGif, e.LostHeadAttackGif][f]]);
                            return
                    }
                    e.HP = h;
                default:
                    e.OrnHP = 0;
                    $(b).childNodes[1].src = e.PicArr[[e.NormalGif = e.OrnLostNormalGif, e.AttackGif = e.OrnLostAttackGif][f]]
            }
            switch (n) {
                case 0:
                    break;
                case -1:
                    e.canSlow && (!e.FreeSlowTime && (e.Speed = e.OSpeed * 0.5), oSym.addTask(1000, function(o, r, q) {
                        (q = $Z[o]) && r == q.FreeSlowTime && (q.FreeSlowTime = "", q.Speed = q.OSpeed)
                    }, [b, e.FreeSlowTime = oSym.Now]));
                    break;
                default:
                    e.FreeSlowTime && (e.FreeSlowTime = "", e.Speed = e.OSpeed);
                    if (e.canSputtering) {
                        ar = !a ? oZ.getArZ(e.AttackedLX, e.AttackedLX + 40, e.R) : oZ.getArZ(e.AttackedRX - 40, e.AttackedRX, e.R);
                        for (i = ar.length; i--; ar[i].canSputtering && ar[i].getHurt(1, 0, 13, 0, 0, 0, 0)) {}
                    }
            }
            SetAlpha($(b).childNodes[1], 50, 0.5);
            oSym.addTask(10, function(o) {
                $Z[o] && SetAlpha($(o).childNodes[1], 100, 1)
            }, [b])
        }
    }),
    oConeheadZombie = InheritO(OrnIZombies, {
        EName: "oConeheadZombie",
        CName: "路障僵尸",
        OrnHP: 370,
        Lvl: 2,
        PicArr: (function() {
            var b = "images/Zombies/ConeheadZombie/",
                a = "images/Zombies/Zombie/";
            return [b + "ConeheadZombie.gif", b + "ConeheadZombieAttack.gif", a + "ZombieLostHead.gif", a + "ZombieLostHeadAttack.gif", a + "ZombieHead.gif" + $Random, a + "ZombieDie.gif" + $Random, a + "BoomDie.gif" + $Random, a + "Zombie.gif", a + "ZombieAttack.gif"]
        })(),
        Produce: '他的路障头盔，使他两倍坚韧于普通僵尸。<p>韧性：<font color="#FF0000">中</font></p>和其他僵尸一样，路障头僵尸盲目地向前。但某些事物却使他停下脚步，捡起一个交通路障，并固实在自己的脑袋上。是的，他很喜欢参加聚会。'
    }),
    oBucketheadZombie = InheritO(oConeheadZombie, {
        EName: "oBucketheadZombie",
        CName: "铁桶僵尸",
        OrnHP: 1100,
        Lvl: 3,
        Produce: '他的铁桶头盔，能极大程度的承受伤害。<p>韧性：<font color="#FF0000">高</font><br>弱点：<font color="#FF0000">磁力菇</font></p>铁桶头僵尸经常戴着水桶，在冷漠的世界里显得独一无二。但事实上，他只是忘记了，那铁桶还在他头上而已。'
    }, {
        PicArr: {
            0: "images/Zombies/BucketheadZombie/BucketheadZombie.gif",
            1: "images/Zombies/BucketheadZombie/BucketheadZombieAttack.gif",
            7: "images/Zombies/Zombie/Zombie2.gif"
        }
    }),
    oFootballZombie = InheritO(oConeheadZombie, {
        EName: "oFootballZombie",
        CName: "橄榄球僵尸",
        OrnHP: 1400,
        Lvl: 3,
        width: 154,
        height: 160,
        OSpeed: 3.2,
        Speed: 3.2,
        beAttackedPointL: 20,
        beAttackedPointR: 134,
        Produce: '橄榄球僵尸的表演秀。<p>韧性：<font color="#FF0000">极高</font><br>速度：<font color="#FF0000">快</font><br>弱点：<font color="#FF0000">磁力菇</font></p>在球场上，橄榄球僵尸表现出110%的激情，他进攻防守样样在行。虽然他完全不知道橄榄球是什么。'
    }, {
        PicArr: {
            0: "images/Zombies/FootballZombie/FootballZombie.gif",
            1: "images/Zombies/FootballZombie/FootballZombieAttack.gif",
            7: "images/Zombies/FootballZombie/FootballZombieOrnLost.gif",
            8: "images/Zombies/FootballZombie/FootballZombieOrnLostAttack.gif"
        }
    }),
    oPoleVaultingZombie = InheritO(OrnNoneZombies, {
        EName: "oPoleVaultingZombie",
        CName: "撑杆僵尸",
        HP: 500,
        width: 348,
        height: 218,
        OSpeed: 3.2,
        Speed: 3.2,
        beAttackedPointL: 215,
        beAttackedPointR: 260,
        GetDY: 2,
        Lvl: 2,
        PicArr: (function() {
            var a = "images/Zombies/PoleVaultingZombie/";
            return [a + "PoleVaultingZombie.gif", a + "PoleVaultingZombieAttack.gif", a + "PoleVaultingZombieLostHead.gif", a + "PoleVaultingZombieLostHeadAttack.gif", a + "PoleVaultingZombieHead.gif" + $Random, a + "PoleVaultingZombieDie.gif" + $Random, a + "BoomDie.gif" + $Random, a + "PoleVaultingZombieWalk.gif", a + "PoleVaultingZombieLostHeadWalk.gif", a + "PoleVaultingZombieJump.gif", a + "PoleVaultingZombieJump2.gif"]
        })(),
        Produce: '撑杆僵尸运用标杆高高地跃过障碍物。<p>韧性：<font color="#FF0000">中</font><Br>速度：<font color="#FF0000">快,而后慢(跳跃后)</font><BR>特点：<font color="#FF0000">跃过他所碰到的第一筑植物</font></p>一些僵尸渴望走得更远、得到更多，这也促使他们由普通成为非凡。那就是撑杆僵尸。',
        getShadow: function(a) {
            return "left:" + (a.beAttackedPointL - 20) + "px;top:" + (a.height - 35) + "px"
        },
        getVisible: "hidden",
        GoingDieHead: function(c, a, b) {
            oSym.addTask(200, ClearChild, [NewImg(0, a[b.HeadGif] + Math.random(), "left:" + b.X + "px;top:" + (b.pixelTop - 20) + "px;z-index:" + b.zIndex, EDAll)])
        },
        BirthCallBack: function(b) {
            var a = b.delayT;
            a ? oSym.addTask(a, function(c) {
                c.FreeSetbodyTime = "";
                SetVisible($(c.id))
            }, [b]) : SetVisible($(b.id))
        },
        JudgeAttack: function() {
            var g = this,
                b = g.ZX,
                d = g.R + "_",
                c = GetC(b),
                h = oGd.$,
                f, a, e = b - 74;
            for (f = c - 2; f <= c; f++) {
                if (f > 9 || f < 1) {
                    continue
                }
                for (a = 2; a > -1;
                    (p = h[d + f + "_" + a--]) && p.canEat && p.AttackedRX >= e && p.AttackedLX < b && (a = -1, g.JudgeAttack = CZombies.prototype.JudgeAttack, g.NormalAttack(g.id, p.id))) {}
            }
        },
        getRaven: function(a) {
            return !this.isAttacking && this.NormalAttack(this.id, a), 0
        },
        NormalAttack: function(d, b) {
            var g = $Z[d],
                f = $P[b].AttackedLX,
                a = $(d),
                c = a.firstChild,
                e = a.childNodes[1];
            e.src = "images/Zombies/PoleVaultingZombie/PoleVaultingZombieJump.gif" + $Random + Math.random();
            SetNone(c);
            g.isAttacking = 1;
            g.Altitude = 2;
            oSym.addTask(100, function(l, j, h, k, r) {
                var q = $Z[l],
                    m, n;
                q && ((m = $P[j]) && m.Stature > 0 ? (q.AttackedRX = (q.X = (q.AttackedLX = q.ZX = n = m.AttackedRX) - q.beAttackedPointL) + q.beAttackedPointR, SetStyle(h, {
                    left: q.X + "px"
                }), r.src = "images/Zombies/PoleVaultingZombie/PoleVaultingZombieWalk.gif", SetBlock(k), q.isAttacking = 0, q.Altitude = 1, q.OSpeed = q.Speed = 1.6, q.NormalGif = 7, q.LostHeadGif = 8, q.NormalAttack = CZombies.prototype.NormalAttack, q.getRaven = CZombies.prototype.getRaven) : (q.ZX = q.AttackedLX = (q.X = (q.AttackedRX = f) - q.beAttackedPointR) + q.beAttackedPointL, SetStyle(h, {
                    left: q.X + "px"
                }), r.src = "images/Zombies/PoleVaultingZombie/PoleVaultingZombieJump2.gif" + $Random + Math.random(), SetBlock(k), oSym.addTask(80, function(s, u) {
                    var t = $Z[s];
                    t && (u.src = "images/Zombies/PoleVaultingZombie/PoleVaultingZombieWalk.gif", t.isAttacking = 0, t.Altitude = 1, t.OSpeed = t.Speed = 1.6, t.NormalGif = 7, t.LostHeadGif = 8, t.NormalAttack = CZombies.prototype.NormalAttack, t.getRaven = CZombies.prototype.getRaven)
                }, [l, r])))
            }, [d, b, a, c, e])
        }
    }),
    OrnIIZombies = InheritO(CZombies, {
        Ornaments: 2,
        BreakPoint: 91,
        NormalGif: 0,
        AttackGif: 1,
        LostHeadGif: 2,
        LostHeadAttackGif: 3,
        OrnLostNormalGif: 4,
        OrnLostAttackGif: 5,
        OrnLostHeadNormalGif: 6,
        OrnLostHeadAttackGif: 7,
        HeadGif: 8,
        DieGif: 9,
        BoomDieGif: 10,
        getHurt: function(h, a, e, l, c, k, j) {
            var d = this,
                b = d.id;
            if (!d.beAttacked) {
                j && d.Die(2);
                return
            }
            d.OrnHP ? !h ? (d.OrnHP = Math.max(d.OrnHP - e, 0), d.HP -= e) : h == -1 && !a ? d.OrnHP = Math.max(d.OrnHP - e, 0) : d.HP -= e : d.HP -= e;
            switch (true) {
                case !d.OrnHP:
                    d.HP -= e;
                    break;
                case (d.OrnHP -= e) > 0:
                    break;
                case d.OrnHP < 0:
                    d.HP += d.OrnHP;
                    d.OrnHP = 0;
                default:
                    var g = d.NormalGif = d.OrnLostNormalGif,
                        f = d.AttackGif = d.OrnLostAttackGif;
                    $(b).childNodes[1].src = (!d.isAttacking ? d.PicArr[g] : d.PicArr[f])
            }
            switch (true) {
                case d.HP > d.BreakPoint:
                    switch (l) {
                        case 0:
                            break;
                        case -1:
                            d.canSlow && (!d.FreeSlowTime && (d.Speed *= 0.5), oSym.addTask(1000, function(m, o, n) {
                                (n = $Z[m]) && o == n.FreeSlowTime && (n.FreeSlowTime = "", n.Speed = n.OSpeed)
                            }, [b, d.FreeSlowTime = oSym.Now]));
                            break;
                        default:
                            d.FreeSlowTime && (d.FreeSlowTime = "", d.Speed = d.OSpeed);
                            if (d.canSputtering) {
                                ar = !a ? oZ.getArZ(d.AttackedLX, d.AttackedLX + 40, d.R) : oZ.getArZ(d.AttackedRX - 40, d.AttackedRX, d.R);
                                for (i = ar.length; i--; ar[i].canSputtering && ar[i].getHurt(1, 0, 13, 0, 0, 0, 0)) {}
                            }
                    }
                    SetAlpha($(b).childNodes[1], 50, 0.5);
                    oSym.addTask(10, function(m) {
                        $Z[m] && SetAlpha($(m).childNodes[1], 100, 1)
                    }, [b]);
                    break;
                case d.HP > 0:
                    d.GoingDie();
                    break;
                default:
                    d.Die(j)
            }
        }
    }),
    oNewspaperZombie = InheritO(OrnIIZombies, {
        EName: "oNewspaperZombie",
        CName: "读报僵尸",
        OrnHP: 150,
        Lvl: 2,
        LostPaperGif: 11,
        width: 216,
        height: 164,
        beAttackedPointL: 60,
        beAttackedPointR: 130,
        LostPaperSpeed: 4.8,
        PicArr: (function() {
            var a = "images/Zombies/NewspaperZombie/";
            return [a + "HeadWalk1.gif", a + "HeadAttack1.gif", a + "LostHeadWalk1.gif", a + "LostHeadAttack1.gif", a + "HeadWalk0.gif", a + "HeadAttack0.gif", a + "LostHeadWalk0.gif", a + "LostHeadAttack0.gif", a + "Head.gif" + $Random, a + "Die.gif" + $Random, a + "BoomDie.gif" + $Random, a + "LostNewspaper.gif"]
        })(),
        Produce: '他的报纸只能提供有限的防御。<p>韧性：<font color="#FF0000">低</font><p>报纸韧性：<font color="#FF0000">低</font></p><p>速度：正常，而后快(失去报纸后)</p>读报僵尸，他正痴迷于完成他的数独难题。难怪他这么反常。',
        getShadow: function(a) {
            return "left:75px;top:" + (a.height - 25) + "px"
        },
        GoingDie: function(b) {
            var a = this,
                c = a.id;
            $(c).childNodes[1].src = b;
            oSym.addTask(200, ClearChild, [NewImg(0, a.PicArr[a.HeadGif] + Math.random(), "left:" + a.AttackedLX + "px;top:" + (a.pixelTop - 20) + "px;z-index:" + a.zIndex, EDAll)]);
            a.beAttacked = 0;
            a.FreeFreezeTime = a.FreeSetbodyTime = a.FreeSlowTime = "";
            a.AutoReduceHP(c)
        },
        getHurt: function(j, a, g, n, c, l, k) {
            var e = this;
            if (!e.beAttacked) {
                k && e.Die(2);
                return
            }
            var b = e.id,
                m = e.OrnHP,
                h = e.HP,
                f = e.isAttacking,
                d = e.PicArr;
            if (m) {
                if (!j || n == 1) {
                    switch (true) {
                        case (h = e.HP -= g) < 1:
                            e.Die(k);
                            return;
                        case h < 91:
                            e.GoingDie(d[[e.LostHeadGif, e.LostHeadAttackGif][f]]);
                            return;
                        default:
                            !(e.OrnHP = Math.max(m - g, 0)) && (e.isAttacking = 1, e.FreeSlowTime = "", $(b).childNodes[1].src = d[e.LostPaperGif], oSym.addTask(150, function(s, t, r, q) {
                                s.isAttacking = q, s.Speed = s.OSpeed = s.LostPaperSpeed;
                                $(t).childNodes[1].src = r
                            }, [e, b, d[[e.NormalGif = e.OrnLostNormalGif, e.AttackGif = e.OrnLostAttackGif][f]], f]))
                    }
                } else {
                    if (j == -1 && !a) {
                        !(e.OrnHP = Math.max(m - g, 0)) && (e.isAttacking = 1, $(b).childNodes[1].src = d[e.LostPaperGif], oSym.addTask(150, function(s, t, r, q) {
                            s.isAttacking = q, s.FreeSlowTime = "", s.Speed = s.OSpeed = s.LostPaperSpeed;
                            $(t).childNodes[1].src = r
                        }, [e, b, d[[e.NormalGif = e.OrnLostNormalGif, e.AttackGif = e.OrnLostAttackGif][f]], f]))
                    } else {
                        switch (true) {
                            case (h = e.HP -= g) < 1:
                                e.Die(k);
                                return;
                            case h < 91:
                                e.GoingDie(d[[e.LostHeadGif, e.LostHeadAttackGif][f]]);
                                return
                        }
                    }
                }
            } else {
                switch (true) {
                    case (h = e.HP -= g) < 1:
                        e.Die(k);
                        return;
                    case h < 91:
                        e.GoingDie(d[[e.OrnLostHeadNormalGif, e.OrnLostHeadAttackGif][f]]);
                        return
                }
            }
            switch (n) {
                case 0:
                    break;
                case -1:
                    e.canSlow && (!e.FreeSlowTime && (e.Speed = e.OSpeed * 0.5), oSym.addTask(1000, function(o, r, q) {
                        (q = $Z[o]) && r == q.FreeSlowTime && (q.FreeSlowTime = "", q.Speed = q.OSpeed)
                    }, [b, e.FreeSlowTime = oSym.Now]));
                    break;
                default:
                    e.FreeSlowTime && (e.FreeSlowTime = "", e.Speed = e.OSpeed);
                    if (e.canSputtering) {
                        ar = !a ? oZ.getArZ(e.AttackedLX, e.AttackedLX + 40, e.R) : oZ.getArZ(e.AttackedRX - 40, e.AttackedRX, e.R);
                        for (i = ar.length; i--; ar[i].canSputtering && ar[i].getHurt(1, 0, 13, 0, 0, 0, 0)) {}
                    }
            }
            SetAlpha($(b).childNodes[1], 50, 0.5);
            oSym.addTask(10, function(o) {
                $Z[o] && SetAlpha($(o).childNodes[1], 100, 1)
            }, [b])
        }
    });
