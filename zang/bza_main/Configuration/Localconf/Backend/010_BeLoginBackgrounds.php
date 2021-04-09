<?php
/***************************************************************
 *  Copyright notice
 *
 *  (c) 2019 Roberto Presedo <etienne.bertrand.zang@gmail.com.ch>
 *  All rights reserved
 *
 *  This script is part of the TYPO3 project. The TYPO3 project is
 *  free software; you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation; either version 3 of the License, or
 *  (at your option) any later version.
 *
 *  The GNU General Public License can be found at
 *  http://www.gnu.org/copyleft/gpl.html.
 *
 *  This script is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  This copyright notice MUST APPEAR in all copies of the script!
 ***************************************************************/

use TYPO3\CMS\Core\Configuration\ExtensionConfiguration;
use TYPO3\CMS\Core\Core\Environment;
use TYPO3\CMS\Core\Utility\GeneralUtility;

/**
 * Class BeLoginBackgrounds
 * This extension allows an administrator to create a list of images
 * and use them, randomly, as a background image for the Backend login form
 */

class BeLoginBackgrounds
{
    /**
     * Extension name
     */
    const extensionName = 'bza_main';

    /**
     * @var null|ExtensionConfiguration
     */
    static public $extensionConfiguration = null;

    /**
     *
     */
    static public function execute()
    {
        /**
         * Random background image if config is set
         */
        if (self::getExtensionConfiguration()['loginBackgroundRandom']) {
            $GLOBALS['TYPO3_CONF_VARS']['EXTENSIONS']['backend']['loginBackgroundImage'] = self::getBackgroundImage();
        }
    }


    /**
     * Checks if images are available in the backgrounds folder.
     * If yes, a random image is returned.
     * If no, the default background image is returned.
     */
    static public function getBackgroundImage()
    {
        // Looking for images in the folder
        $imagesDir = Environment::getPublicPath() . '/uploads/' . BeLoginBackgrounds::extensionName . '/Backend/Backgrounds/';
        // If the folder does not exits, it's created
        if (!file_exists($imagesDir)) {
            GeneralUtility::mkdir_deep($imagesDir);
        }
        $images = glob($imagesDir . '*.{jpg,jpeg,png,gif}', GLOB_BRACE);

        if (count($images)) {
            // We found images in the folder, so we pick one
            $image = $images[array_rand($images)];
        } else {
            // No image was found in folder, so we use the default image
            $image = self::getDefaultImage();
        }

        $image = str_replace(Environment::getPublicPath(), '', $image);

        // An image has been found, so we return that image
        if ($image) {
            return GeneralUtility::getIndpEnv('TYPO3_REQUEST_HOST') . '/'.  $image;
        }
        return '';
    }


    /**
     * Return the path to the default background image
     * @return bool|string
     */
    static public function getDefaultImage()
    {
        $return = false;
        $defaultImage = $GLOBALS['TYPO3_CONF_VARS']['EXTENSIONS']['backend']['loginBackgroundImage'];

        if (GeneralUtility::getFileAbsFileName($defaultImage)) {
            $return = GeneralUtility::getFileAbsFileName($defaultImage);
        } elseif (is_file($defaultImage)) {
            $return = $defaultImage;

        } elseif (is_file(Environment::getPublicPath() . $defaultImage)) {
            $return = Environment::getPublicPath() . $defaultImage;
        }
        return $return;
    }


    /**
     * Get the current extension configuration
     * @return ExtensionConfiguration
     */
    static public function getExtensionConfiguration()
    {
        if (is_null(self::$extensionConfiguration)) {
            // We check where to store the projects
            $extensionConfiguration = GeneralUtility::makeInstance(ExtensionConfiguration::class);
            self::$extensionConfiguration = $extensionConfiguration->get(BeLoginBackgrounds::extensionName);
        }
        return self::$extensionConfiguration;
    }


}

/***************
 * Backend Styling
 */
if (TYPO3_MODE == 'BE') {
    BeLoginBackgrounds::execute();
}
