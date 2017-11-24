function initUpdateFooterOnScroll() {
  const footer = document.querySelector('.footer');
  window.addEventListener('scroll', () => {
    if (window.scrollY <= 100) {
      footer.classList.add('footer-hide');
    } else {
      footer.classList.remove('footer-hide');
    }
  });
}

export { initUpdateFooterOnScroll };
