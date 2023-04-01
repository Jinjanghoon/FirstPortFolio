const nav = document.querySelector('nav');
const body = document.querySelector('body');

window.addEventListener('scroll', function() {
  if (window.pageYOffset > 0) {
    nav.classList.add('scrolled');
    body.classList.add('scrolled');
  } else {
    nav.classList.remove('scrolled');
    body.classList.remove('scrolled');
  }
});
