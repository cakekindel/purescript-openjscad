const modeling = require('@jscad/modeling');

exports.translate2Raw = t => g => modeling.transforms.translate(t, g);
exports.translate3Raw = t => g => modeling.transforms.translate(t, g);

exports.scale2Raw = t => g => modeling.transforms.scale(t, g);
exports.scale3Raw = t => g => modeling.transforms.scale(t, g);
