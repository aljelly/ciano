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
         * 
         */
        private Window _window;

        /**
         * Constructs a new {@code Application} object and create default output folder if it does not exist.
         *
         * @see Ciano.Configs.Constants
         */
        public Application () {
            Object (
                application_id: Constants.ID,
                flags: ApplicationFlags.FLAGS_NONE
            );
        }


        /**
         * Create the window of this application through the class {@code Window} and show it. If user clicks
         * <quit> or press <control + q> the window will be destroyed.
         * 
         * @return {@code void}
         */
        public override void activate () {
            if (this._window == null) {
                this._window = new Window (this);
                this.add_window (this._window);
                this._window.show ();
            }

            var quit_action = new SimpleAction ("quit", null);
            quit_action.activate.connect (() => {
                if (this._window != null) {
                    this._window.destroy ();
                }
            });

            this.add_action (quit_action);
            this.add_accelerator ("<Control>q", "app.quit", null);
        }
    }
}