
> Semgreps rules come from patterns that we can write. Patterns are also helpful for us to find code that we may be interested in. It reminds us of Regex rules or attempting to use grep, but not as clunky! A series of patterns, when combined, can lead to rules. Rules, if based on known issues and vulnerabilties, become things we want to intentionally highlight as to call attention for fixing to reduce security risk. Finally, a combination of rules makes a ruleset, which is a set of security concerns for some given programming language.


### Semgrep Patterns
We'll give you an example of using the semgrep cli to find patterns you are interested in. This will help you understand the building blocks of Semgrep.

First, let's create a new file:

`cd /root/`{{exec}}

Create a file named test.js:

`touch test.js`{{exec}}

Paste the following code into test.js, the file you created:

```javascript
console.log("Testing. 1 2 3.")
console.log("Hello")
console.log("KTH")
console.log("DevOps")
console.log("world")
console.log(".")

let a = 1;
let b = a;
if (a == b) {
	console.log("68747470733a2f2f6769746875622e636f6d2f4b54482f6465766f70732d636f75727365");
}
````

Now, let's run a sample pattern:

`semgrep --pattern "console.log("...")" --lang javascript "/root/test.js"`{{exec}}

Notice that we specify the PATH/TO/SRC at the end of the command. This is optional, but we add this as we don't want to be overwhelemed by the matches we are bound to find with the code we downloaded earlier.

To be less verbose with our flags:

`semgrep -e "console.log("...")" -l javascript "/root/test.js"`{{exec}}

Another example:

`semgrep -e "if (...) ..." -l javascript "/root/test.js"`{{exec}}

Above, we have two examples using ellipses (...). We can think of ellipses as a wildcard, or for general matching of permutations valid pieces of text, from strings to assignments to methods calls. It is impacted by indentation and also depth in certain patterns, and in some cases each ellipse can only typically show up to 10 concurrent matches (10 lines) that match. For example, in the if statement above, we use ellipses to match the general form of an if statement and return the whole if statement, with its contents. If the if statement is too long, then the message `[hid X additional lines, adjust with --max-lines-per-finding]` will appear.

### Easter Egg

The piece of text you have identified within the if statement is what we think to be the coolest GitHub repo around. Hint: it is hex code...

### Semgrep Documentation

Now we suggest you to experiment and read further! For more information on patterns, see here: 

https://semgrep.dev/docs/writing-rules/pattern-syntax/

https://semgrep.dev/docs/writing-rules/pattern-examples/

For more information about rules, which are helpful for ensuring our patterns are no longer one time use via a command, check out these links:

https://semgrep.dev/docs/writing-rules/generic-pattern-matching/

https://semgrep.dev/docs/writing-rules/rule-syntax/
