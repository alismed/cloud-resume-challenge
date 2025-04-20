async function get_visitors() {
    // Fetch the visitor count from the API
    // and update the HTML element with the ID "visitors"
    // with the visitor count
    try {
        let response = await fetch('https://5aiwvdajsh.execute-api.us-east-1.amazonaws.com/visitors_count', {
            method: 'GET',
        });
        let data = await response.json()
        document.getElementById("visitors").innerHTML = data['count'];
        console.log(data);
        return data;
    } catch (err) {
        console.error(err);
    }
}

get_visitors();