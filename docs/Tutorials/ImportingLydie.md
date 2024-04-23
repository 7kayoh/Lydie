# Importing Lydie

When integrating Lydie as a variable within your code, it yields a structured dictionary in the Lua programming language. The dictionary structure is as follows:
```lua title="Lydie.luau"
{
    Components = require(script.Components),
    Modules = require(script.Modules),
}
```

- `Components`: This key accesses a dictionary containing a comprehensive collection of UI components accessible within Lydie. These components are categorized based on their functionality, distinguishing between interactive elements and window decorations.
- `Modules`: This key provides access to another dictionary housing the modules packaged with Lydie. These modules play a pivotal role in constructing the various components available within Lydie's interface.