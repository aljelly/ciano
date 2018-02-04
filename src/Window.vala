/*
 * MIT License
 *
 * Copyright (c) 2018 Valley Framework
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 */

using Ciano.Configs;
using Ciano.Controllers;
using Ciano.Views;

namespace Ciano {

    /**
     * Class responsible for creating the u window and will contain contain other widgets. 
     * allowing the user to manipulate the window (resize it, move it, close it, ...).
     *
     * @see Gtk.ApplicationWindow
     * @since 0.1.0
     */
    public class Window : Gtk.ApplicationWindow {
         
        /**
         * Constructs a new {@code Window} object.
         *
         * @see Ciano.Configs.Constants
         * @see style_provider
         * @see build
         */
        public Window (Gtk.Application app) {
            Object (
                application: app,
                icon_name: Constants.APP_ICON,
                deletable: true,
                resizable: true
            );

            var settings = Ciano.Services.Settings.get_instance ();
            int x = settings.window_x;
            int y = settings.window_y;

            if (x != -1 && y != -1) {
                move (x, y);
            }

            style_provider ();
            build (app);
        }

        /**
         * Load the application's CSS.
         *
         * @see Ciano.Configs.Constants
         * @return {@code void}
         */
        private void style_provider () {
            var css_provider = new Gtk.CssProvider ();
            css_provider.load_from_resource (Constants.URL_CSS);
            
            Gtk.StyleContext.add_provider_for_screen (
                Gdk.Screen.get_default (),
                css_provider,
                Gtk.STYLE_PROVIDER_PRIORITY_APPLICATION
            );
        }

        /**
         * Load classes for application building.
         *
         * @see Ciano.Controllers.ConverterController
         * @see Ciano.Views.ConverterView
         * @return {@code void}
         */
        private void build (Gtk.Application app) {
            var converter_view = new ConverterView (this);
            new ConverterController (this, app, converter_view);

            this.add (converter_view);
            this.show_all ();
        }
    }
}