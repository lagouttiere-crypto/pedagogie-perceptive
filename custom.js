document.addEventListener('DOMContentLoaded', function() {
  // Trouve tous les éléments surlignés
  const marked = document.querySelectorAll('.mark-concept, .mark-link');
  
  marked.forEach(function(mark, index) {
    // Trouve la note marginale suivante
    const margin = findNextMargin(mark);
    if (!margin) return;
    
    // Au survol du texte surligné
    mark.addEventListener('mouseenter', function() {
      margin.style.opacity = '1';
    });
    
    mark.addEventListener('mouseleave', function() {
      margin.style.opacity = '0.35';
    });
    
    // Au survol de la note marginale
    margin.addEventListener('mouseenter', function() {
      margin.style.opacity = '1';
      mark.style.background = mark.classList.contains('mark-concept') 
        ? 'rgb(80 57 150 / 40%)' 
        : 'rgba(80, 160, 120, 0.4)';
    });
    
    margin.addEventListener('mouseleave', function() {
      margin.style.opacity = '0.35';
      mark.style.background = mark.classList.contains('mark-concept')
        ? 'rgb(80 57 150 / 21%)'
        : 'rgba(80, 160, 120, 0.2)';
    });
  });
  
  function findNextMargin(element) {
    let next = element.parentElement;
    while (next) {
      const margin = next.nextElementSibling;
      if (margin && margin.classList.contains('column-margin')) {
        return margin;
      }
      next = next.parentElement;
    }
    return null;
  }
});
