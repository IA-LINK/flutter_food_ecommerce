const mongoose = require('mongoose');

const productSchema = new mongoose.Schema({
  title: String,
  description: String,
  price: Number,
  category: String,
  imageUrl: String,
  rating: {type: Number, default: 0},
  stock: {type: Number, default: 1},
  createdAt: {type: Date, default: Date.now}
});

module.exports = mongoose.model('Product', productSchema);
