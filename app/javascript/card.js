const pay = () => {
  const payjp = Payjp('pk_test_33f0aa05565dedc566d1363e')
  const elements = payjp.elements();
  const numberElement = elements.create('cardNumber');
  const expiryElement = elements.create('cardExpiry');
  const cvcElement = elements.create('cardCvc');

  numberElement.mount('#number-form');
  expiryElement.mount('#expiry-form');
  cvcElement.mount('#cvc-form');

  const form = document.getElementById('charge-form')
  form.addEventListener("submit", (e) => {
    e.preventDefault();  // フォームのデフォルトの送信を防ぐ
    payjp.createToken(numberElement).then(function (response) {
      if (response.error) {
      } else {
        const token = response.id;
        console.log(response)
        debugger;
      }
    });
  });
};

window.addEventListener("turbo:load", pay);