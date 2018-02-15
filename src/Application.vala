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

namespace Ciano {

    /**
     * The {@code Application} class is a foundation for all granite-based applications.
     *
     * @author  Robert San <robertsanseries@gmail.com>
     * @see     Granite.Application
     * @since   v0.1.0
     */
    public class Application : Granite.Application {

        /**
         * Variable responsible for the main window.
         * @version v0.2.0
         */
        private ApplicationView _window;

        /**
         * Constructs a new {@code Application} object and create default output folder if it does not exist.
         *
         * @see Ciano.Configs.Constants
         * @version v0.2.0
         */
        public Application () {
            Object (               
                // Unique identifier of the application.
                application_id: Constants.ID,

                // Sed to define the behaviour of a GLib.Application.
                flags: GLib.ApplicationFlags.FLAGS_NONE // (default)
            );

            // Name of the application.
            this.program_name = Constants.PROGRAM_NAME;

            // The compiled binary name.
            this.exec_name = Constants.ID;

            // The launcher to be associated with this application.
            this.app_launcher = Constants.ID;

            // Version of the application.
            this.build_version = Constants.VERSION;
        }

        /**
         * Create the window of this application through the class {@code Window} and show it. If user clicks
         * <quit> or press <control + q> the window will be destroyed.
         *
         * @return {@code void}
         * @see Ciano.Window
         * @version v0.2.0
         */
        public override void activate () {
            if (this._window == null) {
                this._window = new ApplicationView (this);
                this.add_window (this._window);
                this._window.show_all ();
            }

            // Creates action to destroy the main application window when the user clicks close.
            var quit_action = new SimpleAction ("quit", null);
            quit_action.activate.connect (() => {
                if (this._window != null) {
                    this._window.destroy ();
                }
            });

            // Adds the created action the application.
            this.add_action (quit_action);

            // Sets the specified key combination for the created action to be enabled.
            this.add_accelerator ("<Control>q", "app.quit", null);
        }
    }
}