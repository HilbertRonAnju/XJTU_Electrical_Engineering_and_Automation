var left = document.getElementById('left');
var right = document.getElementById('right');
var one = document.getElementById('one');
var kind = document.getElementById('kind');
var two = document.getElementById('two');
var span = two.getElementsByTagName('span');

var numlist=['1', '2', '3', '4', '5'];
var nor = ['ne', 'wo', 'hree', 'our', 'ive'];
//生成随机数
function num() {
    var a = Math.floor(Math.random() * 5);
    return a;
}

//生产一个随机数序列，含五个随机数的数组
function random() {
    var five = [];
    while (five.length < 5) {
        var rand = num();
        if (five.indexOf(rand) == -1) {
            five.push(rand);
        }
    }
    return five;
}

//显示测试所需要用到的两种文字及玩家得分状况与所剩时间
function showTest(){
    forjudge = Math.floor(Math.random() * 6);
    var k = Math.floor(Math.random() * 5);
    GoVar = k;
    one.innerHTML = numlist[k];
    var order = random();
    for (var f = 0; f < span.length; f ++){
        span[f].innerHTML = numlist[order[f]];
        span[f].index = order[f];
    }
}

showTest();
kind.innerHTML = forjudge;
var score = 0;
var t = 20;
right.innerHTML = '分数:' + score;
left.innerHTML = '时间:' + t + 's';
var play = false;

//分数更新
for (f = 0; f < span.length; f++) {
    span[f].onclick = function() {
        if (forjudge % 2 == 0){//此时玩家的判断是正确的
            kind.innerHTML = forjudge;
            if(GoVar == this.index && t != 0){
                score++;//得一分
                play = true;
                right.innerHTML = '分数:' + score;
                showTest();//得分后及时显示得分信息
            }
            else if(GoVar != this.index && play){
                t--;
                left.innerHTML = '时间:' + t + 's';//时间会随着游戏进行而减少
                if (t <= 0) {
                    clearInterval(time);
                    play = false;
                }
            }
            else{}
        }
        else{//此时玩家的判断是正确的
            kind.innerHTML = forjudge;
            if(this.id == nor[GoVar] && t != 0){
                score++;
                play = true;
                right.innerHTML = '分数:' + score;
                showTest();
            }
            else if(this.id != nor[GoVar] && play){
                t--;
                left.innerHTML = '时间:' + t + 's';//时间会随着游戏进行而减少
                if (t <= 0) {
                    clearInterval(time);
                    play = false;
                }
            }
            else{}
        }
    };
}

//倒计时
time = setInterval(function() {
    if (play) {
        t--;
        left.innerHTML = '时间:' + t + 's';
        if (t <= 0) {
            clearInterval(time);
            play = false;
            alert('Game  Over');
        }
    }
}, 2000);
