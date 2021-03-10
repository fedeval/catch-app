const sendFriendRequest = () => {
  const addButton = document.getElementById('add');
  const pendingButton = document.getElementById('pending');

  if (!addButton) return;

  addButton.addEventListener('click', function(event) {
    addButton.classList.add('hidden');
    pendingButton.classList.remove('hidden');
  });
}

const emojiRain = () => {
  const badges = document.querySelectorAll('.badge-button');
  if (badges.length === 0) return;

  badges.forEach(function(badge) {
    badge.addEventListener('click', function(event) {
      const emoji = badge.value;
      const circles = [];
      const divToBeAnimated = document.getElementById('animate');
      let counter = 0

      for (var i = 0; i < 20; i++) {
        addCircle(i * 200, [-100, 200], emoji);
      }

      animate();

      function addCircle(delay, range, color) {
        setTimeout(function() {
          var c = new Circle(range[0] + Math.random() * range[1], 80 + Math.random() * 4, color, {
            x: -0.15 + Math.random() * 0.3,
            y: 1 + Math.random() * 1
          }, range, divToBeAnimated);
          circles.push(c);
        }, delay);
      }

      function Circle(x, y, c, v, range, div) {
        var _this = this;
        this.x = x;
        this.y = y;
        this.color = c;
        this.v = v;
        this.range = range;
        this.element = document.createElement('span');
        /*this.element.style.display = 'block';*/
        this.element.style.opacity = 0;
        this.element.style.position = 'absolute';
        this.element.style.fontSize = '26px';
        this.element.style.color = 'hsl('+(Math.random()*360|0)+',80%,50%)';
        this.element.innerHTML = c;
        this.element.classList.add('rain');
        div.appendChild(this.element);

        this.update = function() {
          if (_this.y > 800) {
            _this.y = 80 + Math.random() * 4;
            _this.x = _this.range[0] + Math.random() * _this.range[1];
          }
          _this.y += _this.v.y;
          _this.x += _this.v.x;
          this.element.style.opacity = 1;
          this.element.style.transform = 'translate3d(' + _this.x + 'px, ' + _this.y + 'px, 0px)';
          this.element.style.webkitTransform = 'translate3d(' + _this.x + 'px, ' + _this.y + 'px, 0px)';
          this.element.style.mozTransform = 'translate3d(' + _this.x + 'px, ' + _this.y + 'px, 0px)';
        };
      }

      function animate() {
        console.log('I run')
        for (var i in circles) {
          circles[i].update();
        }
        if (counter === 300) {
          const rain = document.querySelectorAll('.rain')
          rain.forEach(function(raindrop) {
            raindrop.classList.add('hidden');
          })
          return;
        } else {
          requestAnimationFrame(animate);
          counter++;
        }
      }
    });
  });

};


export { sendFriendRequest, emojiRain };