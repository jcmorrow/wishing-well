module.exports = {
  entry: "./app/assets/javascripts/components",
  output:
  {
    path: "./app/assets/javascripts/",
    filename: "components.js",
  },
  resolve:
  {
    extensions: [".es6", ".jsx", "", ".js"],
  },
  module: {
    loaders: [
      {
        test: /\.es6|\.jsx$/,
        exclude: /node_modules/,
        loader: "babel",
        query:
        {
          presets: ["es2015", "react"]
        }
      }
    ],
  },
}
