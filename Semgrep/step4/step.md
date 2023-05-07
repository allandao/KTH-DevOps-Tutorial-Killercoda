
> Semgreps rules come from patterns that we can write. Patterns are also helpful for us to find code that we may be interested in. It reminds us of Regex rules or attempting to use grep, but not as clunky! A series of patterns, when combined, can lead to rules. Rules, if based on known issues and vulnerabilties, become things we want to intentionally highlight as to call attention for fixing to reduce security risk. Finally, a combination of rules makes a ruleset, which is a set of security concerns for some given programming language.


### Semgrep Patterns
We'll give you an example of using the semgrep cli to find patterns you are interested in. This will help you understand the building blocks of Semgrep.

First, create a new file in juice-shop:

`cd /root/`{{exec}}

`touch test.js`{{exec}}

Paste the following code in test.js, the file you created:
```javascript
console.log("Testing. 1 2 3.")
console.log("Hello")
console.log("KTH")
console.log("DevOps")
console.log("world")
console.log(".")
```

Now, let's run a sample pattern:

`semgrep --pattern "console.log("...")" --lang javascript "/root/test.js"`{{exec}}

Notice that we specify the PATH/TO/SRC at the end of the command. This is optional, but we add this as we don't want to be overwhelemed by the matches we are bound to find with the code we downloaded earlier.

To be less verbose with our flags:
`semgrep -e "console.log("...")" -l javascript "/root/test.js"`{{exec}}

Another example:

`semgrep -e "if (...) ..." -l javascript "/root/test.js"`{{exec}}

The piece of text you have identified within the if statement found is what we think to be the best GitHub repo around. Hint: it is hex code...

### Semgrep Documentation

Now we suggest you to experiment further! For more information on patterns, find out more here: 
https://semgrep.dev/docs/writing-rules/pattern-syntax/
https://semgrep.dev/docs/writing-rules/pattern-examples/

For more information about rules, which are helpful for ensuring our patterns are no longer one time use via a command, check out these links:
https://semgrep.dev/docs/writing-rules/generic-pattern-matching/
https://semgrep.dev/docs/writing-rules/rule-syntax/

### Conclusion

Great! We hope you've enjoyed this concise tutorial on Semgrep and seen how easy it is to use. The goal of Semgrep is to be lightweight and based in the command line so you can easily use it without context switching and thus be more efficient. In addition, it inherently was built as an efficient and thus quick tool, meaning shorter runtime times and thus shorter pipeline runs. No more excuses regarding insecure code as a DevOps engineer!
