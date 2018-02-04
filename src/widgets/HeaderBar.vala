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
using Ciano.Services;
using Ciano.Utils;
using Valley.Utils;

namespace Ciano.Widgets {

    /**
     * The {@code HeaderBar} class is responsible for displaying top bar. Similar to a horizontal box.
     *
     * @see Gtk.HeaderBar
     * @since 0.1.0
     */
    public class HeaderBar : Gtk.HeaderBar {

        public signal void item_selected ();
        
        public Gtk.MenuButton app_menu;
        public Gtk.Menu       menu;   

        /**
         * Constructs a new {@code HeaderBar} object. Sets the title of the top bar and
         * adds widgets that are displayed.
         *
         * @see Ciano.Configs.Properties
         * @see icon_settings
         */
        public HeaderBar () {
            this.set_title (Constants.PROGRAME_NAME);
            this.show_close_button = true;
            icon_open_output_folder ();
            icon_settings ();
        }

        private void icon_open_output_folder () {
            var output_folder = new Gtk.Button();
            output_folder.set_image (new Gtk.Image.from_icon_name ("folder-saved-search", Gtk.IconSize.LARGE_TOOLBAR));
            output_folder.tooltip_text = (Properties.TEXT_OPEN_OUTPUT_FOLDER);
            
            output_folder.clicked.connect(() => {
                var settings = Ciano.Services.Settings.get_instance ();
                FileUtil.open_folder_file_app(settings.output_folder);                
            });

            this.pack_start (output_folder);
        }

        /**
         * Add gear icon to open settings menu.
         * 
         * @see menu_settings
         * @return {@code void}
         */
        private void icon_settings () {
            this.app_menu = new Gtk.MenuButton();
            this.app_menu.set_image (new Gtk.Image.from_icon_name ("open-menu", Gtk.IconSize.LARGE_TOOLBAR));
            this.app_menu.tooltip_text = (Properties.TEXT_SETTINGS);

            menu_settings();

            this.app_menu.popup = this.menu;
            this.pack_end (this.app_menu);
        }

        /**
         * Creates the settings menu. When the user clicks the preferences option, {@code Gtk.MenuItem} will call
         * the signal "item_selected". The actions of this signal are in the "on_activate_button_preferences" method
         * of the ConverterController;
         *
         * @see Ciano.Controllers.ConverterController;
         * @return {@code void}
         */
        private void menu_settings () {
            var about_item = new Gtk.MenuItem.with_label (Properties.TEXT_PREFERENCES);
            about_item.activate.connect(() => {
                item_selected ();
            });

            this.menu = new Gtk.Menu ();
            this.menu.add (about_item);
            this.menu.show_all ();
        }
    }
}
