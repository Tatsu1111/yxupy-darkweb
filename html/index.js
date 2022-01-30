$(function () {
    function display(bool) {
        if (bool) {
            $("#container").show();
        } else {
            $("#container").hide();
        }
    }

    display(false)

    window.addEventListener('message', function(event) {
        var item = event.data;
        if (item.type === "ui") {
            if (item.status == true) {
                display(true)
            } else {
                display(false)
            }
        }
    })
    // if the person uses the escape key, it will exit the resource
    document.onkeyup = function (data) {
        if (data.which == 27) {
            $.post('https://yxupy-darkweb/close', JSON.stringify({}));
            return
        }
    };
    $("#exit").click(function () {
        $.post('https://yxupy-darkweb/close', JSON.stringify({}));
        return
    })

    $("#order").click(function () {
        $.post('https://yxupy-darkweb/DarkwebOrder', JSON.stringify({}));
        return
    })  

        // if there are no errors from above, we can send the data back to the original callback and hanndle it from there
        $.post('https://yxupy-darkweb/:main', JSON.stringify({

        }));
        return;
    })


let $wrap = document.querySelector('.wrap'),
$opts = document.querySelectorAll('.bar a');

Array.prototype.forEach.call($opts, (el, i) => {
el.addEventListener('click', function (event) {
    $wrap.setAttribute('data-pos', i);			  
});
});

let count = 0,
$btns = document.querySelectorAll('.btn'),
$cart = document.querySelector('.cart');

Array.prototype.forEach.call($btns, (el, i) => {
el.addEventListener('click', function (event) {
    $cart.classList.add('add');
    $cart.querySelector('span').innerText = ++count;
    setTimeout(() => {
        $cart.classList.remove('add');
    }, 1500);			  
});
});

$('button.cooldown').click(function(){
    var btn = $(this);
    btn.prop('disabled', true);
    setTimeout(function(){
      btn.prop('disabled', false);
    },1800000); //Cooldown Timer In MILISECONDS//
  });


  function startTime() {
    const today = new Date();
    let h = today.getHours();
    let m = today.getMinutes();
    let s = today.getSeconds();
    m = checkTime(m);
    s = checkTime(s);
    document.getElementById('txt').innerHTML =  h + ":" + m + ":" + s;
    setTimeout(startTime, 1000);
  }
  
  function checkTime(i) {
    if (i < 10) {i = "0" + i};  // add zero in front of numbers < 10
    return i;
  }
