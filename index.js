exports.handler = (event, context, callback) => {
    console.log("Received event {}", JSON.stringify(event));
    console.log("Received context {}", JSON.stringify(context));
    const message = {
        'id': 'hogehoge'
    };
    callback(null, message);
};

