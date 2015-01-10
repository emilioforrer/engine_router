**EngineRoutes**
===================

When you create a `Rails Engine`, that will be used as **core** and will have multiple engine extensions (like for example [spree](https://spreecommerce.com/)) you may encounter some issues when an engine extension tries to add routes to your core engine like **routes are begin loaded twice**. 

Here is where **engine_routes** can help you, it's a very simple gem that adds a layer between the engine extension routes and your core gem and making sure that **routes are never loaded twice**.

----------


**Installation**
------------



Add this line to your engine's gemspec:

```
s.add_dependency "engine_router"
```

Then in your engine's file **`require`** the gem and  call **`acts_as_engine_router`**

```
require "engine_router"
module Example
  class Engine < ::Rails::Engine
    isolate_namespace Example
    engine_name 'example'
    acts_as_engine_router
  end
end
```

----------

Instructions
-------------
----------

## **Core Engine**

Let's assume that your core engine it's name `Example`. Normally when you add routes in your core `Rails Engine` you do this.


```

# config/routes.rb
Example::Engine.routes.draw do
  # Add the routes of you core engine here
end

```

Now once you have installed `engine_router` gem, replace the **`routes`** method for **`engine_routes`**, like this

```

# config/routes.rb
Example::Engine.engine_routes.draw do
  # Add the routes of you core engine here
end

```

## **Extension Engine**

Let's assume that you created an engine named `ExampleShop` that will work as an extension of `Example`. First of all require  the `example` engine.

```
require "example"
module ExampleShop
  class Engine < ::Rails::Engine
    engine_name 'example_shop'
  end
end
```


To add more routes to `Example` engine, nomally you will do this in the **ExampleShop** route file.

```
# config/routes.rb
Example::Engine.routes.prepend do
  # Add the routes that will extend  Example Engine
end

```

Replace  replace the **`routes`** method for **`engine_routes`**, like this


```
# config/routes.rb
Example::Engine.engine_routes.prepend do
  # Add the routes that will extend  Example Engine
end

```

> **Note:** engine_routes have 2 method to work with routes, **append** and **prepend**

## **Special Thank's**


This gem was based on the routes system implemented by the [spree_gem](https://github.com/spree/spree), so thank's to all the spree comunity for making that fantastic gem!.

----------

## **Copyright**

Copyright (c) 2015 Emilio Forrer. See LICENSE.txt for further details.
