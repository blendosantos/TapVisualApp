const bool isProduction = bool.fromEnvironment('dart.vm.product');

const devConfig = {
  'urlAPI' : 'https://tapvisualdev.herokuapp.com/v1/graphql',
  'public_key' : ''
};

const productionConfig = {
  'urlAPI' : 'https://tapvisualdev.herokuapp.com/v1/graphql',
  'public_key' : ''
};

final environment = isProduction ? productionConfig : devConfig;