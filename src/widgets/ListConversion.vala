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
using Ciano.Utils;

namespace Ciano.Widgets {

    /**
     * The {@code ListConversion} class is responsible for displaying list of items that
     * are being converted or have been converted   
     *
     * @see Gtk.Grid
     * @since 0.1.0
     */
    public class ListConversion : Gtk.Grid {
        
        public Gtk.Stack               stack;
        public Gtk.ListBox             list_box;
        public Granite.Widgets.Welcome welcome;

        // Responsible for the amount of item in the ListBox
        public int item_quantity = 0;

        /**
         * Constructs a new {@code ListConversion} object displaying the list of items being converted/converted
         * or welcome view in {@code Gtk.Stack}.
         *
         * @see Ciano.Configs.Constants
         * @see Ciano.Configs.Properties
         * @see Granite.Widgets.Welcome
         */
        public ListConversion () {
            this.stack = new Gtk.Stack ();
            this.stack.transition_type = Gtk.StackTransitionType.CROSSFADE;

            this.welcome = new Granite.Widgets.Welcome (
              Properties.TEXT_EMPTY_CONVERTING_LIST,
              Properties.TEXT_SELECT_OPTION_TO_CONVERT
            );

            this.list_box = new Gtk.ListBox ();
            this.list_box.expand = true;

            this.stack.add_named (this.welcome, Constants.WELCOME_VIEW);
            this.stack.add_named (this.list_box, Constants.LIST_BOX_VIEW);

            var scrolled = new Gtk.ScrolledWindow (null, null);
            scrolled.hscrollbar_policy = Gtk.PolicyType.EXTERNAL;
            scrolled.add (this.stack);

           this.add (scrolled);
        }
    }
}