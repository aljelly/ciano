/*
 * Copyright (c) 2017 Robert San <robertsanseries@gmail.com>
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * General Public License for more details.
 *
 * You should have received a copy of the GNU General Public
 * License along with this program; if not, write to the
 * Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
 * Boston, MA 02110-1301 USA
 */

using Ciano.Configs;
using Ciano.Views;
using Ciano.Utils;
using Ciano.Widgets;

namespace Ciano.Views {

    /**
     * The {@code Settings} class is responsible for defining all 
     * the texts that are displayed in the application and must be translated.
     *
     * @see Gtk.Grid
     * @since 0.1.0
     */
    public class ApplicationView : Ciano.Widgets.ApplicationWindow {

        //private Gtk.ApplicationWindow    app;
        //public Widgets.HeaderBar headerbar;
       // public SourceListSidebar         source_list;
       // public ListConversion            list_conversion;

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
        public ApplicationView (Gtk.Application application) {
            base (application);

            var headerbar = new Widgets.HeaderBar ();
            headerbar.icon_document_open_clicked.connect (() => { stdout.printf("foi"); });
            headerbar.icon_output_folder_clicked.connect (() => { stdout.printf("foi"); });
            headerbar.icon_start_clicked.connect         (() => { stdout.printf("foi"); });
            headerbar.icon_settings_clicked.connect      (() => { stdout.printf("foi"); });
            headerbar.icon_information_clicked.connect   (() => { stdout.printf("foi"); });
            headerbar.set_visible_icons(true);
            this.set_titlebar (headerbar);

            var stack = new Gtk.Stack ();
            stack.transition_type = Gtk.StackTransitionType.SLIDE_LEFT_RIGHT;
            stack.get_style_context ().add_class (Gtk.STYLE_CLASS_VIEW);

            var welcome = new Granite.Widgets.Welcome (
                _("Convert some files"),
                _("Drag and drop files or open them to begin conversion.")
            );

            welcome.margin_start = 6;
            welcome.margin_end = 6;

            var document_open_index = welcome.append (
                "document-open", 
                _("Open"), 
                _("Browse to open a single file")
            );

            var open_menu_index = welcome.append (
                "open-menu", 
                _("Load from Downloads"), 
                _("Load files from your Downloads folder")
            );

            var dialog_information_index = welcome.append (
                "dialog-information", 
                _("Load from Downloads"), 
                _("Load files from your Downloads folder")
            );

            stack.add_named (welcome, "WELCOME_VIEW_ID");
            this.add (stack);

            /*var grid = new Gtk.Grid ();
            this.source_list = new SourceListSidebar ();
            var frame = new Gtk.Frame (null);
            frame.add (this.source_list);
            frame.width_request = 185;

            this.list_conversion = new ListConversion ();
            
            var paned = new Gtk.Paned (Gtk.Orientation.HORIZONTAL);
            paned.pack1 (frame, false, false);
            paned.pack2 (list_conversion, true, false);
            grid.add (paned);*/
            //this.show_all();
        }
    }
}