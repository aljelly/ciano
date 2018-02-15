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
using Ciano.Utils;
using Valley.Utils;

namespace Ciano.Widgets {

    /**
     * The {@code HeaderBar} class is responsible for displaying top bar. Similar to a horizontal box.
     *
     * @see Gtk.HeaderBar
     * @since v0.1.0
     */
    public class HeaderBar : Gtk.HeaderBar {

        /**
         * 
         */
        public signal void icon_document_open_clicked ();
        public signal void icon_output_folder_clicked ();
        public signal void icon_start_clicked ();
        public signal void icon_information_clicked ();
        public signal void icon_settings_clicked ();

        private Gtk.Button _document_open;
        private Gtk.Button _output_folder;
        private Gtk.Button _start;
        private Gtk.Button _information;
        private Gtk.MenuButton _settings;
        
        /**
         * Constructs a new {@code HeaderBar} object. Sets the title of the top bar and
         * adds widgets that are displayed.
         *
         * @see Ciano.Configs.Properties
         * @see icon_settings
         */
        public HeaderBar () {
            //
            this.set_title (Constants.PROGRAM_NAME);
            this.show_close_button = true;

            // 
            this.icon_document_open ();

            //
            this.icon_output_folder ();

            //
            this.icon_start ();

            //
            this.icon_settings ();

            //
            this.icon_information ();
        }

        /**
         * [icon_open_output_folder description]
         * 
         * @return {[type]} [description]
         */
        private void icon_document_open () {
            this._document_open = new Gtk.Button ();
            this._document_open.set_image (new Gtk.Image.from_icon_name ("document-open", Gtk.IconSize.LARGE_TOOLBAR));
            this._document_open.tooltip_text = (Properties.TEXT_OPEN_OUTPUT_FOLDER);
            this._document_open.clicked.connect (() => { icon_document_open_clicked (); });
            
            this.pack_start (this._document_open);
        }

        /**
         * [icon_output_folder description]
         * 
         * @return {[type]} [description]
         */
        private void icon_output_folder () {
            this._output_folder = new Gtk.Button ();
            this._output_folder.set_image (new Gtk.Image.from_icon_name ("folder-saved-search", Gtk.IconSize.LARGE_TOOLBAR));
            this._output_folder.tooltip_text = (Properties.TEXT_OPEN_OUTPUT_FOLDER);
            this._output_folder.clicked.connect (() => { icon_output_folder_clicked (); });
            
            this.pack_start (this._output_folder);
        }

        /**
         * [icon_start description]
         * 
         * @return {[type]} [description]
         */
        private void icon_start () {
            this._start = new Gtk.Button ();
            this._start.set_image (new Gtk.Image.from_icon_name ("media-playback-start", Gtk.IconSize.LARGE_TOOLBAR));
            this._start.tooltip_text = (Properties.TEXT_OPEN_OUTPUT_FOLDER);
            this._start.clicked.connect (() => { icon_start_clicked (); });
            
            this.pack_start (this._start);
        }

        /**
         * Add gear icon to open settings menu.
         *
         * Creates the settings menu. When the user clicks the preferences option, {@code Gtk.MenuItem} will call
         * the signal "item_selected". The actions of this signal are in the "on_activate_button_preferences" method
         * of the ConverterController;
         * 
         * @see menu_settings
         * @return {@code void}
         */
        private void icon_settings () {
            var item_preferences = new Gtk.MenuItem.with_label (Properties.TEXT_PREFERENCES);
            item_preferences.activate.connect(() => { icon_settings_clicked (); });
            
            var menu = new Gtk.Menu ();
            menu.add (item_preferences);
            menu.show_all ();

            this._settings = new Gtk.MenuButton();
            this._settings.set_image (new Gtk.Image.from_icon_name ("open-menu", Gtk.IconSize.LARGE_TOOLBAR));
            this._settings.tooltip_text = (Properties.TEXT_SETTINGS);
            this._settings.popup = menu;
            
            this.pack_end (this._settings);
        }

        /**
         * [icon_start description]
         * 
         * @return {[type]} [description]
         */
        private void icon_information () {
            this._information = new Gtk.Button ();
            this._information.set_image (new Gtk.Image.from_icon_name ("dialog-information", Gtk.IconSize.LARGE_TOOLBAR));
            this._information.tooltip_text = (Properties.TEXT_OPEN_OUTPUT_FOLDER);
            this._information.clicked.connect (() => { icon_information_clicked (); });
            
            this.pack_end (this._information);
        }

        /**
         * [set_visible_icons description]
         * @param {Boolean} bool visible [description]
         */
        public void set_visible_icons (bool visible) {
            WidgetUtil.set_visible (this._document_open, visible);
            WidgetUtil.set_visible (this._output_folder, visible);
            WidgetUtil.set_visible (this._start, visible);
            WidgetUtil.set_visible (this._information, visible);
            WidgetUtil.set_visible (this._settings, visible);
        }
    }
}
