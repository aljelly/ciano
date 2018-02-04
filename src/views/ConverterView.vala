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
using Ciano.Widgets;
using Ciano.Utils;

namespace Ciano.Views {

    /**
     * The {@code Settings} class is responsible for defining all 
     * the texts that are displayed in the application and must be translated.
     *
     * @see Gtk.Grid
     * @since 0.1.0
     */
    public class ConverterView : Gtk.Grid {

        private Gtk.ApplicationWindow    app;
        public HeaderBar                 headerbar;
        public SourceListSidebar         source_list;
        public ListConversion            list_conversion;

        /**
         * Constructs a new {@code ConverterView} object responsible for putting
         * together the main structure of the application: header bar, list of options
         * on the left and list of conversions on the right.
         *
         * @see Ciano.Widgets.HeaderBar
         * @see Ciano.Widgets.SourceListSidebar
         * @see Ciano.Widgets.ListConversion
         * @param {@code Gtk.ApplicationWindow} app
         */
        public ConverterView (Gtk.ApplicationWindow app) {
            this.app = app;
            this.app.set_default_size (1050, 700);
            this.app.set_size_request (1050, 700);
            this.app.deletable = true;
            this.app.resizable = true;
            this.app.get_style_context ().add_class ("window-background-color");

            this.headerbar = new HeaderBar ();
            this.app.set_titlebar (this.headerbar);

            this.source_list = new SourceListSidebar ();
            var frame = new Gtk.Frame (null);
            frame.add (this.source_list);
            frame.width_request = 185;

            this.list_conversion = new ListConversion ();
            
            var paned = new Gtk.Paned (Gtk.Orientation.HORIZONTAL);
            paned.pack1 (frame, false, false);
            paned.pack2 (list_conversion, true, false);
            this.add (paned);
        }
    }
}