exports.handler = async function(event, context) {
    x=1;
    return {
        statusCode: 200,
        body: JSON.stringify(process.env)
    };
}

