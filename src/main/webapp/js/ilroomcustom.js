const prevBtn = document.querySelector('.prev-btn');
const nextBtn = document.querySelector('.next-btn');
const slider = document.querySelector('.slider');
const slides = document.querySelectorAll('.slide');
const slideWidth = slides[0].clientWidth;

let currentIndex = 0;

slides.forEach((slide, index) => {
  slide.style.left = `${index * slideWidth}px`;
});

function slide() {
  if (currentIndex === slides.length - 1) {
    currentIndex = 0;
  } else {
    currentIndex++;
  }

  slider.style.transform = `translateX(-${currentIndex * slideWidth}px)`;
}

prevBtn.addEventListener('click', () => {
  if (currentIndex === 0) {
    currentIndex = slides.length - 1;
  } else {
    currentIndex--;
  }

  slider.style.transform = `translateX(-${currentIndex * slideWidth}px)`;
});

nextBtn.addEventListener('click', slide);