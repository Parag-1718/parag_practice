
const box = document.getElementById('hidden1');

function handleRadioClick() {
  if (document.getElementById('planYes').checked) {
    box.style.display = 'block';
  } else {
    box.style.display = 'none';
  }
}

const radioButtons = document.querySelectorAll('input[name="radiobutton1"]');
radioButtons.forEach(radio => {
  radio.addEventListener('click', handleRadioClick);
});
