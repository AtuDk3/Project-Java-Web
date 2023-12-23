
        document.addEventListener('DOMContentLoaded', function () {
            const decrementButton = document.getElementById('decrement');
            const incrementButton = document.getElementById('increment');
            const quantityInput = document.getElementById('quantity');

            decrementButton.addEventListener('click', function () {
                decrementQuantity();
            });

            incrementButton.addEventListener('click', function () {
                incrementQuantity();
            });

            function decrementQuantity() {
                let currentQuantity = parseInt(quantityInput.value, 10);
                if (currentQuantity > 1) {
                    quantityInput.value = currentQuantity - 1;
                }
            }

            function incrementQuantity() {
                let currentQuantity = parseInt(quantityInput.value, 10);
                quantityInput.value = currentQuantity + 1;
            }
        });
