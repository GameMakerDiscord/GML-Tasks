//  This bootstrapper was written by @jujuadams for the GameMakerDiscord GitHub organisation.
//  MIT License (c) @jujuadams 2018
//  contact@jujuadams.com
//  For version information, see __config_bootstrapper().

#region -- Intent --
//  
//  This bootstrapper enables packages to be smoothly imported into a project without users writing any code.
//  This is for the benefit of extensions/importing tools as much as developers. Packages will often have
//  dependencies and this framework ensures packages are initialised in the correct order. This bootstrapper
//  supports packages of varying degrees of complexity - from straight-forward libraries to entire subsystems
//  operating in the background of a project.
//  
#endregion

#region -- Usage --
//  
//  1) Create a blank room with no instances at the top of the Rooms section of the Resources pane.
//     (Once all packages have finished initialising, the bootstrapper will move to the second room.)
//  2) Import the bootstrapper scripts, and the oBootstrapper object.
//  3) Import package that you'd like to use. Configure them as required. Ensure you import dependencies.
//  4) Hit F5. If the package makers have done their job, the packages will load without errors.
//  5) Have fun building a game using the tools you've imported!
//  
#endregion

#region -- Making A Package --
//  
//  For a package to interface fully with the bootstrapper, five things must happen:
//     
//     1) The package must use gml_pragma( "global", ... ) to execute a boot script;
//     2) The boot script must only define variables essential to the package's operation;
//     3) If further processing is needed, the boot script may queue a script or create a job instance;
//     4) The package must declare when the entire initialisation process for that package has finished.
//  
//  Step 1)
//  gml_pragma( "global", ... ), or "global pragma" for short, is a new functionality introduced in GMS2.
//  It allows for code to be executed before the game fully boots - we call this the "boot script".
//  The global pragma command means code is run before the first room. This is useful because it means a
//  script can be executed without writing any code at all; unfortunately, the order of execution for
//  global pragma scripts isn't explicit and is liable to change depending on various factors. By using
//  the bootstrapper's script queue, complex packages can defer initialisation steps to later frames.
//  
//  Step 2)
//  So that packages can depend on each other and so that the bootstrapper is robust, we ask that
//  developers use the their boot script (see Step 1) for the bare minimum initialisation of a package.
//  Anything that needs to be done after bare minimum initialisation should be done in another phase/script.
//  
//  Step 3)
//  The bootstrapper uses "bootstrapper_queue()" for queuing additional code for execution. This queue is
//  last-in-first-out and so a script that has been queued will not necessarily be executed immediately.
//  Use bootstrapper_check_dependencies() if a script meed tp knows when its dependencies have finished
//  initialising. This script checks if dependencies are in the project, and returns true if all dependencies
//  have initialised. It is possible to have quite complex package initialisation flows. A minority of
//  packages may need to have their finished state un-set if new data needs to be processed etc.
//  "bootstrapper_package_unfinish()" is provided to un-set a package's finished state.
//  
//  Step 4)
//  The script "bootstrapper_package_finish()" is used to indicate a package has finished loading.
//  All packages must use this script to state that they've finished initialising, even if they're extremely
//  simple. This includes packages that don't require any explicit initialisation of variables
//  e.g. a script library still needs to follow these four steps otherwise other packages can't know the library
//       has been installed at all!
//  Once the bootstrapper has finished, it'll use room_goto() to move to the second room in the resource tree.
//  
#endregion

#region -- Recommendations For Packages --
//  
//  # Display the author, license, and contact details in a __readme script.
//    Put the name of your package in the __readme script. Indicate your dependencies here too.
//  
//  # Changing your package name once a package has been released is a very bad idea.
//  
//  # Prefix macros/enums, global variables, and scripts with your package name (or an unambiguous abbreviation).
//    If you're using macros, please put them in a __config script so they're easy to find.
//    If your package has any other assets (sprites etc.) make sure they use consistent package naming too.
//  
//  # Add in lots of informative and clear error messages to help with debugging. Document your code.
//    Use @param and @desc. Write clear comments, even if you never expect anyone to need them.
//  
//  # Use __ double underscores before scripts that are intended to be "private" and not accessed by the developer.
//    This avoids clogging up the namespace and makes dealing with autocomplete for pleasant for everyone.
//  
//  # Please use this style guide:
//    https://github.com/GameMakerDiscord/gists/blob/master/coding-standard-for-packages
//    Publicly hosted packages on the GitHub will be refused if they do not meet this standard.
// 
//  # Try to use the phase system as much as possible. It'll generally lead to neater code.
//    Include a default: case in your phase switch statement. This helps to catch bugs.
//  
#endregion