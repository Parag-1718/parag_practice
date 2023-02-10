<script>

// JavaScript program to generate all possible
// valid IP addresses from given string

// Function checks whether IP digits
// are valid or not.
function is_valid(ip)
{
	// Splitting by "."
	let ips = new Array();
	let ex = "";
	for (let i = 0; i < ip.length; i++) {
		if (ip[i] == '.') {
			ips.push(ex);
			ex = "";
		}
		else {
			ex = ex + ip[i];
		}
	}
	ips.push(ex);

	// Checking for the corner cases

	for(let i = 0; i < ips.length; i++) {
		
		if (ips[i].length > 3
			|| parseInt(ips[i]) < 0
			|| parseInt(ips[i]) > 255)
			return 0;

		if (ips[i].length > 1
			&& parseInt(ips[i]) == 0)
			return 0;

		if (ips[i].length > 1
			&& parseInt(ips[i]) != 0
			&& ips[i][0] == '0')
			return 0;
	}
	return 1;
}

// Function converts string to IP address
function convert(ip)
{
	let l = ip.length;

	// Check for string size
	if (l > 12 || l < 4) {
		document.write("Not Valid IP Address");
	}

	let check = ip;
	let ans = new Array();

	// Generating different combinations.
	for (let i = 1; i < l - 2; i++) {
		for (let j = i + 1; j < l - 1; j++) {
			for (let k = j + 1; k < l; k++) {
				check = check.substring(0, k) + "."
						+ check.substring(k,check.length);
				check
					= check.substring(0, j) + "."
					+ check.substring(j,check.length);
				check
					= check.substring(0, i) + "."
					+ check.substring(i,check.length);

				// Check for the validity of combination
				if (is_valid(check)) {
					ans.push(check);
					document.write(check,"</br>");
				}
				check = ip;
			}
		}
	}
}

// Driver code

	let A = "25525511135";
	let B = "25505011535";

	convert(A);
	convert(B);

	
// This code is contributed by shinjanpatra


</script>
