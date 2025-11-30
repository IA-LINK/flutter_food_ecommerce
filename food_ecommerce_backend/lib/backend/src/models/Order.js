const mongoose = require('mongoose');

const orderSchema = new mongoose.Schema({
  user: {type: mongoose.Schema.Types.ObjectId, ref: 'User'},
  items: [
    {
      product: { type: mongoose.Schema.Types.ObjectId, ref: 'Product' },
      name: String,
      price: Number,
      quantity: Number
    }
  ],
  shippingAddress: Object,
  paymentMethod: String,
  paymentResult: Object,
  subtotal: Number,
  shippingFee: Number,
  total: Number,
  status: {type: String, default: 'Pending'},
  createdAt: {type: Date, default: Date.now}
});

module.exports = mongoose.model('Order', orderSchema);
