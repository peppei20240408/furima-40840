const pay = () => {
  const form = document.getElementById('charge-form')
  form.addEventListener("submit", (e) => {
    const formData = new FormData(form)
    
  });
};

window.addEventListener("turbo:load", pay);