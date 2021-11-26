const modeling = require('@jscad/modeling');

exports.intersect3 = a => b => modeling.booleans.intersect(a, b);
exports.subtract3 = a => b => modeling.booleans.subtract(a, b);
