<?php

declare(strict_types=1);

/*
 * This file is part of the TYPO3 CMS project.
 *
 * It is free software; you can redistribute it and/or modify it under
 * the terms of the GNU General Public License, either version 2
 * of the License, or any later version.
 *
 * For the full copyright and license information, please read the
 * LICENSE.txt file that was distributed with this source code.
 *
 * The TYPO3 project - inspiring people to share!
 */

namespace Zang\BzaMain\XClass;

/**
 * General type=input element for TCA Type=Slug with some additional value.
 */
class InputSlugElement extends \Wazum\Sluggi\Backend\Form\InputSlugElement
{
    /**
     * Provide backwards compatibility with TYPO3 v10 to Sluggi v9.
     * This should be removed once Sluggi has a version for TYPO3 10.
     * @return mixed|string
     */
    public function getPrefix() {
        return $this->data['customData'][$this->data['fieldName']]['slugPrefix'] ?? '';
    }
}
